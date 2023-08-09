# uniform content loss + adaptive threshold + per_class_input + recursive G
# improvement upon cqf37


from __future__ import division
import os, time
os.environ["CUDA_VISIBLE_DEVICES"] = "0"
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'
import tensorflow.compat.v1 as tf
tf.compat.v1.disable_eager_execution()
import tf_slim as slim
import numpy as np
#import rawpy
import glob
import scipy.misc
from tensorflow.keras import Model, layers
import math
import cv2
import argparse

parser = argparse.ArgumentParser(description='')
parser.add_argument('--downsampling', dest='downsampling', type=int, default=0, help='1 for downsampling and 0 for Original')
args = parser.parse_args()

#input_dir = 'E:/denoising cmos/test/test/100/'
#gt_dir = 'E:/denoising cmos/test/test/100/'
input_dir = 'D:/DnCNN/test/test_add4/test1/'
gt_dir = 'D:/DnCNN/test/test_add4/test1/'
checkpoint_dir = 'D:/DnCNN/0704_2/models/'
result_dir = 'D:/DnCNN/0704_2/test results/test1'

# get test IDs
test_fns = glob.glob(gt_dir + '/*.bmp')
test_ids = [os.path.basename(test_fn).split('.')[0] for test_fn in test_fns]

# DEBUG = 0
# if DEBUG == 1:
#     save_freq = 2
#     test_ids = test_ids[0:5]
ratio = 45


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
        # output = slim.conv2d(output, 12, [1, 1], rate=1, activation_fn=None, scope='g_conv12')
        # output = tf.depth_to_space(output, 2)
    return input-output #residual learning




def downsampling(filelist,args):
    if args.downsampling:
        print("downsampling\n")
        imh = cv2.imread(filelist)
        img_shape = imh.shape
        H = img_shape[0]
        W = img_shape[1]
        #imh = Image.open(filelist).convert('RGB')
        imh = cv2.cvtColor(imh,cv2.COLOR_BGR2RGB)
        img = cv2.resize(imh,(W//2, H//2))
        im = np.array(img).reshape(H//2, W//2, 3)
        return im#下采样
    else:
        print("original\n")
        img = cv2.imread(filelist)
        img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)

        # img = cv2.normalize(img.astype('float'), None, 0.0, 1.0, cv2.NORM_MINMAX)
        # img = (img - np.mean(img)) / np.std(img)
        return img



sess = tf.Session()

in_image = tf.placeholder(tf.float32, [None, None, None, 3])
gt_image = tf.placeholder(tf.float32, [None, None, None, 3])
#out_image = network(in_image)

out_image = CDnCNN_B(in_image)
saver = tf.train.Saver()
sess.run(tf.global_variables_initializer())
ckpt = tf.train.get_checkpoint_state(checkpoint_dir)

if ckpt:
    print('loaded ' + ckpt.model_checkpoint_path)
    saver.restore(sess, ckpt.model_checkpoint_path)

if not os.path.isdir(result_dir + 'final/'):
    os.makedirs(result_dir + 'final/')
tt = []
for test_id in test_ids:
    # test the first image in each sequence
    in_files = glob.glob(input_dir + test_id + '.bmp')
    for k in range(len(in_files)):
        in_path = in_files[k]
        in_fn = os.path.basename(in_path)

        gt_files = glob.glob(gt_dir + test_id + '.bmp')
        gt_path = gt_files[0]
        gt_fn = os.path.basename(gt_path)

        #num = 100

        img = downsampling(in_path,args)
        raw = rgbmagnify(ratio, img)
       # raw = img

        input_full = np.expand_dims(raw, axis=0)#CDnCNN


        gt_raw = cv2.imread(gt_path)
        gt_raw = cv2.cvtColor(gt_raw, cv2.COLOR_BGR2RGB)


        # gt_raw = cv2.normalize(gt_raw.astype('float'), None, 0.0, 1.0, cv2.NORM_MINMAX)
        # gt_raw = (gt_raw - np.mean(gt_raw)) / np.std(gt_raw)

        # n = gt_raw
        n = rgbmagnify(ratio, gt_raw)
        #im = gt_raw.postprocess(use_camera_wb=True, half_size=False, no_auto_bright=True, output_bps=16)
        gt_full = np.expand_dims(n, axis=0)

        #input_full = np.minimum(input_full, 1.0)
        t = time.time()

        output = sess.run(out_image, feed_dict={in_image: input_full})



        tot = time.time() - t


        output = output[0, :, :, :]
        # print(np.max(output))
        # output = (output).astype('uint8')
        output = np.minimum(np.maximum(output, 0), 1)
        output = (output*255).astype('uint8')

        tt.append(tot)
        print("Load=%s time=%.3f"%(in_fn, tot))

        output_save = cv2.cvtColor(output,cv2.COLOR_RGB2BGR)


        cv2.imwrite(result_dir + 'final/%04d.png' % int(test_id),output_save)

        # scipy.misc.toimage(output, high=255, low=0, cmin=None, cmax=None).save(
        #     result_dir + 'final/%04d.png' % (test_id))

tt_m=np.mean(tt)
print("average=%.3f" % tt_m)