# uniform content loss + adaptive threshold + per_class_input + recursive G
# improvement upon cqf37
from __future__ import division

import os, time
os.environ["CUDA_VISIBLE_DEVICES"] = "0"
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'
import tensorflow.compat.v1 as tf
tf.compat.v1.disable_eager_execution()
import scipy.misc
import tf_slim as slim
#import tflearn
#from tensorflow.contrib.slim import dropout
import numpy as np
#import rawpy
import glob
import matplotlib.image as xianshi
from PIL import Image
from tensorflow.keras import Model, layers
import math
# from paddle_msssim import ssim, ms_ssim, SSIM, MS_SSIM
# from lmsssim import *
import rawpy
import cv2


input_dir = 'D:/DnCNN/0704/input/'
gt_dir = 'D:/DnCNN/0704/gt/'
checkpoint_dir = 'D:/DnCNN/0704/models/'
result_dir = 'D:/DnCNN/0704/results/'

# get train IDs
#train_fns = glob.glob(gt_dir + '0*.bmp')
train_fns = glob.glob(gt_dir + '*.bmp')
train_ids = [int(os.path.basename(train_fn).split('.')[0]) for train_fn in train_fns]

ps = 512 # patch size for training
save_freq = 200
ratio = 45
save_model = 1000

# DEBUG = 0
# if DEBUG == 1:
#     save_freq = 2
#     train_ids = train_ids[0:5]


def lrelu(x):
    return tf.maximum(x * 0.2, x)

def rgbmagnify(ratio_standard, img):
    """
    :param ratio_standard:  线性放大系数 0-255
    :param img:  rgb格式图片 0-255 float32
    :return: img_magnify:  线性增强后的rgb格式图
    """
    img_nz = (img != 0)

    # n = np.sum(np.sum(img_nz, axis=0),axis=0)
    mean_c = np.sum(np.sum(img, axis=0), axis=0) / np.sum(np.sum(img_nz, axis=0), axis=0)
    ratio = ratio_standard / (np.max(mean_c))
    img_magnify = img * ratio

    # img_magnify = img_magnify/max(img_magnify)*255

    img_magnify = np.clip(img_magnify, 0, 255)
    return img_magnify/255

def CDnCNN_B(input, is_training=True, output_channels=3):
    with tf.variable_scope('block1'):
        output = tf.layers.conv2d(input, 64, 3, padding='same', activation=tf.nn.relu)
    for layers in range(2, 9 + 1):
        with tf.variable_scope('block%d' % layers):
            output = tf.layers.conv2d(output, 64, 3, padding='same', name='conv%d' % layers, use_bias=False)
            output = tf.nn.relu(tf.layers.batch_normalization(output, training=is_training, name='bn%d' % layers))
    with tf.variable_scope('block20'):
        output = tf.layers.conv2d(output, output_channels, 3, padding='same')
        #output = slim.conv2d(output, 12, [1, 1], rate=1, activation_fn=None, scope='g_conv12')
        #output = tf.depth_to_space(output, 2)
    return input-output #residual learning


config = tf.ConfigProto()
config.gpu_options.allow_growth = True
sess = tf.Session(config=config)

# gpu_options=tf.GPUOptions(per_process_gpu_memory_fraction=0.5)
# config=tf.ConfigProto(gpu_options=gpu_options)
# sess = tf.Session(config=config)
#sess = tf.Session()
#in_image = tf.placeholder(tf.float32, [None, None, None, 12])#4
in_image = tf.placeholder(tf.float32, [None, None, None, 3])#DCNDNN
gt_image = tf.placeholder(tf.float32, [None, None, None, 3])
#is_training = tf.placeholder(tf.bool, name='is_training')
#out_image = network(in_image)
out_image = CDnCNN_B(in_image)

#G_loss = tf.reduce_mean(tf.abs(out_image - gt_image))
G_loss = tf.reduce_mean(tf.square(out_image - gt_image))
#G_loss = 1 - tf.image.ssim(gt_image, out_image, 255)
#G_loss = 1 - tf.reduce_mean(tf.image.ssim_multiscale(gt_image, out_image, 255))
#G_loss = tf_ms_ssim_l1_loss(gt_image, out_image)
#G_loss = (1 - tf.reduce_mean(tf.image.ssim_multiscale(gt_image, out_image, 255)))*0.1+tf.reduce_mean(tf.square(out_image - gt_image))*0.9

t_vars = tf.trainable_variables()


lr = tf.placeholder(tf.float32)
G_opt = tf.train.AdamOptimizer(learning_rate=lr).minimize(G_loss)

saver = tf.train.Saver()
sess.run(tf.global_variables_initializer())
ckpt = tf.train.get_checkpoint_state(checkpoint_dir)
if ckpt:
    print('loaded ' + ckpt.model_checkpoint_path)
    saver.restore(sess, ckpt.model_checkpoint_path)

# Raw data takes long time to load. Keep them in memory after loaded.
gt_images = [None] * len(train_ids)#6000
input_images = [None] * len(train_ids)#{}
# input_images['300'] = [None] * len(train_ids)
# input_images['250'] = [None] * len(train_ids)
# input_images['100'] = [None] * len(train_ids)

g_loss = np.zeros((5000, 1))

allfolders = glob.glob(result_dir + '*')
lastepoch = 0
for folder in allfolders:
    lastepoch = np.maximum(lastepoch, int(folder[-4:]))

#train_loss = []
learning_rate = 0.0001
for epoch in range(lastepoch, 6001):
    if os.path.isdir(result_dir + '%04d' % epoch):
        continue
    cnt = 0
    # if epoch > 2000:
    #     learning_rate = 0.00001
    if epoch > 1500:
        learning_rate = 5e-5
    if epoch > 2000:
        learning_rate = 1e-5
    if epoch > 2500:
        learning_rate = 5e-6
    if epoch > 3000:
        learning_rate = 1e-6
    if epoch > 3500:
        learning_rate = 5e-7
    for ind in np.random.permutation(len(train_fns)):
        # get the path from image id
        train_id = train_ids[ind]
        #in_files = glob.glob(input_dir + '%05d_00*.raw' % train_id)
        in_files = os.path.join(input_dir , '%03d.bmp' % train_id)#glob.glob(input_dir + '%03d.bmp' % train_id)
        # in_path = in_files[np.random.random_integers(0, len(in_files) - 1)]
        # in_fn = os.path.basename(in_path)

        #gt_files = glob.glob(gt_dir + '%05d_00*.bmp' % train_id)
        gt_files = os.path.join(gt_dir , '%03d.bmp' % train_id)#glob.glob(gt_dir + '%03d.bmp' % train_id)
        # gt_path = gt_files[0]
        # gt_fn = os.path.basename(gt_path)
        #in_exposure = float(in_fn[9:-5])
        #gt_exposure = float(gt_fn[9:-5])
        num = 100

        st = time.time()
        cnt += 1

        if input_images[ind] is None:
            # rows = 1080  # 图像的行数[str(num)[0:3]]
            # cols = 1440  # 图像的列数
            # #channels = 4  # 图像的通道数，灰度图为1
            # # 利用numpy的fromfile函数读取raw文件，并指定数据格式
            # raw =  np.fromfile(in_path,dtype='uint16')
            # # 利用numpy中array的reshape函数将读取到的数据进行重新排列。
            # raw = raw.reshape(rows, cols)

            img = cv2.imread(in_files)
            img = np.array(img)

            # 将数据类型转换为float类型
            img = img.astype(np.float32)
            img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
            img = rgbmagnify(ratio, img)
            #img = (img - np.min(img)) / (np.max(img) - np.min(img)) * 255

            ##归一化+标准化
            # img = cv2.normalize(img, None, 0.0, 1.0, cv2.NORM_MINMAX)
            # img = (img - np.mean(img)) / np.std(img)


            #img = cv2.medianBlur(img, 5)
            # img = img.astype(np.float16) / 65535 * 255
            # # l=img
            # img = np.maximum(img, 0) / 255
            #raw = scipy.misc.imread(in_path)
            #input_images[str(num)[0:3]][ind] = np.expand_dims(pack_img(img), axis=0)#unet
            input_images[ind] = np.expand_dims(img, axis=0)#CDnCNN[str(num)[0:3]]

            #input_images[str(num)[0:3]][ind] = (input_images[str(num)[0:3]][ind]).astype(np.float16)/65535 * 255
            #input_images[str(num)[0:3]][ind] = np.expand_dims(raw, axis=0)
            #m = np.expand_dims(img, axis=0)
            #l=np.expand_dims(pack_img(img), axis=0)
            # gt_img = rawpy.imread(gt_path)
            # im = gt_img.postprocess(use_camera_wb=True, half_size=True, no_auto_bright=True, output_bps=16)
            # gt_images[ind] = np.expand_dims(np.float32(im / 65535.0), axis=0)
            #gt_img = scipy.misc.imread(gt_path, mode="RGB")
            gt_img = cv2.imread(gt_files)
            gt_img = np.array(gt_img)

            # 将数据类型转换为float类型
            gt_img = gt_img.astype(np.float32)
            gt_img = cv2.cvtColor(gt_img, cv2.COLOR_BGR2RGB)
            #gt_img = scipy.misc.imread(gt_path,mode="RGB")
            #gt_img = (gt_img - np.min(gt_img)) / (np.max(gt_img) - np.min(gt_img)) * 255

            ##归一化+标准化
            # gt_img = cv2.normalize(gt_img, None, 0.0, 1.0, cv2.NORM_MINMAX)
            # gt_img = (gt_img - np.mean(gt_img)) / np.std(gt_img)


            n=rgbmagnify(ratio, gt_img)
            #im = gt_raw.postprocess(use_camera_wb=True, half_size=False, no_auto_bright=True, output_bps=16)
            gt_images[ind] = np.expand_dims(n, axis=0)
            #gt_images[ind] = np.expand_dims(np.float16(n / 255.0), axis=0)
            m = gt_images[ind]
        # crop
        H = input_images[ind].shape[1]#[str(num)[0:3]]
        W = input_images[ind].shape[2]#[str(num)[0:3]]

        xx = np.random.randint(0, W - ps)
        yy = np.random.randint(0, H - ps)
        input_patch = input_images[ind][:, yy:yy + ps, xx:xx + ps, :]#[str(num)[0:3]]
        gt_patch = gt_images[ind][:, yy :yy  + ps , xx :xx  + ps, :]#DCnDnn
        #gt_patch = gt_images[ind][:, yy*2:yy*2 + ps*2, xx*2:xx*2 + ps*2, :]
        if np.random.randint(2, size=1)[0] == 1:  # random flip
            input_patch = np.flip(input_patch, axis=1)
            gt_patch = np.flip(gt_patch, axis=1)
        if np.random.randint(2, size=1)[0] == 1:
            input_patch = np.flip(input_patch, axis=2)
            gt_patch = np.flip(gt_patch, axis=2)
        if np.random.randint(2, size=1)[0] == 1:  # random transpose
            input_patch = np.transpose(input_patch, (0, 2, 1, 3))
            gt_patch = np.transpose(gt_patch, (0, 2, 1, 3))
        # gt_patch = gt_images[ind]
        # input_patch = input_images[str(num)[0:3]][ind]
        #input_patch = np.minimum(input_patch, 1.0)

        _, G_current, output = sess.run([G_opt, G_loss, out_image],
                                        feed_dict={in_image: input_patch, gt_image: gt_patch, lr: learning_rate})

        # train_loss.append(np.mean(g_loss[np.where(g_loss)]).item())
        # with open("F:/train_loss.txt", 'w') as train_los:
        #     train_los.write(str(train_loss))


        #output = np.minimum(np.maximum(output, 0), 1)
        g_loss[ind] = G_current

        print("%d %d Loss=%.5f Time=%.3f Average loss:%.5f" % (epoch, cnt, g_loss[ind], time.time() - st, np.mean(g_loss[np.where(g_loss)])))

        if epoch % save_freq == 0:
            if not os.path.isdir(result_dir + '%04d' % epoch):
                os.makedirs(result_dir + '%04d' % epoch)

            temp = np.concatenate((gt_patch[0, :, :, :], output[0, :, :, :]), axis=1)
            # temp = np.concatenate((input_patch[0, :, :, :], output[0, :, :, :]), axis=1)
            temp = np.clip(temp,0,1)
            temp = (temp*255).astype('uint8')
            Image.fromarray(temp).convert('RGB').save(result_dir + '%04d/%05dtrain_%d.jpg' % (epoch, train_id,num))
            # scipy.misc.toimage(temp , high=255, low=0, cmin=None, cmax=None).save(
            #     result_dir + '%04d/%05dtrain_%d.jpg' % (epoch, train_id,num))


    if epoch % save_model == 0:
        saver.save(sess, checkpoint_dir + '%04d/model.ckpt' % epoch)
        saver.save(sess, checkpoint_dir + 'model.ckpt')

print("average loss=%.5f" % np.mean(g_loss[np.where(g_loss)]) )
