from __future__ import print_function
from __future__ import division
import time
import os.path
# import random
import tensorflow.compat.v1 as tf

tf.compat.v1.disable_eager_execution()
from utils import *



# architecture
def CDnCNN_B(input, output_channels=3):
    with tf.variable_scope('block1'):
        output = tf.layers.conv2d(input, 64, 3, padding='same', activation=tf.nn.relu)
    for layers in range(2, 9 + 1):
        with tf.variable_scope('block%d' % layers):
            output = tf.layers.conv2d(output, 64, 3, padding='same', name='conv%d' % layers, use_bias=False)
            output = tf.nn.relu(output)
            # output = tf.nn.relu(tf.layers.batch_normalization(output, training=is_training, name='bn%d' % layers))
    with tf.variable_scope('block10'):
        output = tf.layers.conv2d(output, output_channels, 3, padding='same')

    out = tf.identity(input-output , name='output')
    return out #residual learning


class denoiser(object):
    def __init__(self, sess, ckpt_dir, sample_dir, log_dir):
        self.sess = sess
        self.ckpt_dir = ckpt_dir
        self.sample_dir = sample_dir
        self.log_dir = log_dir

        if not os.path.exists(self.sample_dir):
            os.makedirs(self.sample_dir)

        # build model
        # placeholder for clean images batch
        self.X = tf.placeholder(tf.float32, [None, None, None, 3], name='clean_image')
        self.Y = tf.placeholder(tf.float32, [None, None, None, 3], name='noisy_image')

        batch = tf.to_float(tf.shape(self.X)[0])  # size of the minibatch

        img_shape = tf.shape(self.X)[1:]  # e.g. (50,50,3)

        # forward propagation
        with tf.variable_scope('CDnCNN'):
            self.Y_ = CDnCNN_B(self.Y)
            # saver = tf.train.Saver()
            # saver.save(sess, './model_CDnCNN/')

        # cost function
        self.loss = (1.0 / batch) * tf.nn.l2_loss(self.Y_ - self.X)

        self.lr = tf.placeholder(tf.float32, name='learning_rate')
        self.eva_psnr = tf.placeholder(tf.float32, name='eva_psnr')

        # optimizer
        optimizer = tf.train.AdamOptimizer(self.lr, name='AdamOptimizer')

        # for batchnorm
        update_ops = tf.get_collection(tf.GraphKeys.UPDATE_OPS)
        with tf.control_dependencies(update_ops):
            self.train_op = optimizer.minimize(self.loss)

        # checkpoint saver
        self.saver = tf.train.Saver()

        init = tf.global_variables_initializer()
        self.sess.run(init)
        print("[*] Initialize model successfully...")

    # function to evaluate the performance after each epoch
    def evaluate(self, ratio, test_clean_files, test_noisy_files, iter_num, summary_merged, summary_writer):

        psnr_sum = 0
        # print("[*] " + 'noise level: ' + str(self.sigma) + " start testing...")

        for idx in range(len(test_clean_files)):
            # clean_image = load_images_RGB(test_clean_files[idx]).astype(np.float32) / 255.0
            # noisy_image = load_images_RGB(test_noisy_files[idx]).astype(np.float32) / 255.0
            clean_image = load_images_rgbmagnify(test_clean_files[idx], ratio).astype(np.float32) / 255.0
            noisy_image = load_images_rgbmagnify(test_noisy_files[idx], ratio).astype(np.float32) / 255.0

            output_clean_image = self.sess.run(self.Y_, feed_dict={self.X: clean_image, self.Y: noisy_image})

            groundtruth = np.clip(255 * clean_image, 0, 255).astype('uint8')
            noisyimage = np.clip(255 * noisy_image, 0, 255).astype('uint8')
            outputimage = np.clip(255 * output_clean_image, 0, 255).astype('uint8')
            # calculate PSNR
            psnr = cal_psnr(groundtruth, outputimage)
            psnr_sum += psnr

            img_name, img_ext = os.path.splitext(os.path.basename(test_clean_files[idx]))
            print("%s PSNR: %.2f" % (os.path.basename(test_clean_files[idx]), psnr))
            save_images_RGB(os.path.join(self.sample_dir, 'denoised_%s_%d.png' % (img_name, iter_num)), groundtruth,
                            noisyimage, outputimage)

        avg_psnr = psnr_sum / len(test_clean_files)

        print("--- Validation Dataset --- Average PSNR %.2f ---" % avg_psnr)

        psnr_summary = self.sess.run(summary_merged, feed_dict={self.eva_psnr: avg_psnr})
        summary_writer.add_summary(psnr_summary, iter_num)

    def train(self, ratio, data_path1, data_path2, eval_gt_files, eval_files, batch_size, epoch, lr):
        # assert the data range is in [0,1]
        data = np.load('./data/clean_pats_rgb.npy', mmap_mode='r')
        data_noise = np.load('./data/noise_pats_rgb.npy', mmap_mode='r')
        print("DATA RANGE:")
        print(np.amax(data_noise))
        print(np.amin(data_noise))
        print("DATA_GT RANGE:")
        print(np.amax(data))
        print(np.amin(data))
        numData = np.shape(data)[0]
        numBatch = int(numData / batch_size)

        # load the pretrained model
        load_model_status, global_step = self.load(self.ckpt_dir)
        if load_model_status:
            iter_num = global_step
            start_epoch = (global_step) // numBatch
            start_step = (global_step) % numBatch
            print("[*] Model restore success!")
        else:
            iter_num = 0
            start_epoch = 0
            start_step = 0
            print("[*] Not find pretrained model!")
        # make summary
        tf.summary.scalar('loss', self.loss)
        tf.summary.scalar('lr', self.lr)
        writer = tf.summary.FileWriter(self.log_dir + "/", self.sess.graph)
        merged = tf.summary.merge_all()
        summary_psnr = tf.summary.scalar('eva_psnr', self.eva_psnr)

        print("[*] Start training, with start epoch %d start iter %d : " % (start_epoch, iter_num))
        start_time = time.time()
        self.evaluate(ratio, eval_gt_files, eval_files,iter_num, summary_merged=summary_psnr, summary_writer=writer)

        tf.get_default_graph().finalize()  # making sure that the graph is fixed at this point

        # training loop
        for epoch in range(start_epoch, epoch):
            print("Model: %s" % (self.ckpt_dir))
            print("Learning rate: {}".format(lr[epoch]))
            rand_inds = np.random.choice(numData, numData, replace=False)

            # generating sigma values in range [0, 55]
            # sigma_vector = np.random.uniform(0, 150.0, data.shape[0]).astype('float32')  # 训练噪声等级
            # sigma_vector = np.random.uniform(0, 250.0, data.shape[0]).astype('float32')  # 训练噪声等级
            # sigma_vector = np.random.uniform(0, 350.0, data.shape[0]).astype('float32')  # 训练噪声等级
            # sigma_vector = np.random.uniform(0, 450.0, data.shape[0]).astype('float32')  # 训练噪声等级
            for batch_id in range(0, numBatch):
                # taking a random batch from the shuffled indexes
                batch_rand_inds = rand_inds[batch_id * batch_size:(batch_id + 1) * batch_size]
                # noisy=[150,250,350,450]
                # batch_sigma = sigma_vector[batch_rand_inds]
                # batch_sigma = random.choice(noisy)
                batch_images = data[batch_rand_inds]
                batch_noise_images = data_noise[batch_rand_inds]

                feed_dict = {self.X: batch_images, self.Y: batch_noise_images, self.lr: lr[epoch]}

                self.sess.run(self.train_op, feed_dict=feed_dict)

                if (iter_num) % 100 == 0:
                    feed_dict2 = {self.X: batch_images, self.Y: batch_noise_images, self.lr: lr[epoch]}
                    loss, summary = self.sess.run([self.loss, merged], feed_dict=feed_dict2)
                    print("Epoch: [%2d] [%4d/%4d] time: %4.4f"
                          % (epoch + 1, batch_id + 1, numBatch, time.time() - start_time))
                    print("TRAIN, loss: %.6f" % (loss))
                    print("\n")
                    writer.add_summary(summary, iter_num)

                iter_num += 1
            self.evaluate(ratio, eval_gt_files, eval_files, iter_num, summary_merged=summary_psnr, summary_writer=writer)
            self.save(iter_num, self.ckpt_dir)
            # self.save_core(self.ckpt_dir)
        print("[*] Finish training.")

    def save(self, iter_num, ckpt_dir, model_name='CDnCNN-B-tensorflow'):
        checkpoint_dir = ckpt_dir
        if not os.path.exists(checkpoint_dir):
            os.makedirs(checkpoint_dir)
        print("[*] Saving model...")
        self.saver.save(self.sess,
                        os.path.join(checkpoint_dir, model_name),
                        global_step=iter_num)

    def load(self, checkpoint_dir):
        print("[*] Reading checkpoint...")
        ckpt = tf.train.get_checkpoint_state(checkpoint_dir)
        if ckpt and ckpt.model_checkpoint_path:
            full_path = tf.train.latest_checkpoint(checkpoint_dir)
            global_step = int(full_path.split('/')[-1].split('-')[-1])
            self.saver.restore(self.sess, full_path)
            return True, global_step
        else:
            return False, 0

    def test(self, test_files, test_gt_files, save_dir, ratio):
        """Test CDnCNN"""
        # init variables
        tf.initialize_all_variables().run()

        if not os.path.exists(save_dir):
            os.makedirs(save_dir)

        load_model_status, global_step = self.load(self.ckpt_dir)
        assert load_model_status == True, '[!] Load weights FAILED...'
        print("[*] Load weights SUCCESS...")

        psnr_sum = 0
        tt = []
        for idx in range(len(test_files)):
            clean_image = load_images_rgbmagnify(test_gt_files[idx], ratio).astype(np.float32) / 255.0
            noisy_image = load_images_rgbmagnify(test_files[idx], ratio).astype(np.float32) / 255.0
            t = time.time()
            output_clean_image = self.sess.run(self.Y_, feed_dict={self.X: clean_image, self.Y:noisy_image})
            tot = time.time() - t
            tt.append(tot)
            print("time=%.3f" % (tot))
            groundtruth = np.clip(255 * clean_image, 0, 255).astype('uint8')
            noisyimage = np.clip(255 * noisy_image, 0, 255).astype('uint8')
            outputimage = np.clip(255 * output_clean_image, 0, 255).astype('uint8')
            # calculate PSNR
            psnr = cal_psnr(groundtruth, outputimage)

            psnr_sum += psnr

            img_name, img_ext = os.path.splitext(os.path.basename(test_files[idx]))
            print("%s PSNR: %.2f" % (os.path.basename(test_files[idx]), psnr))

            # save_images_RGB(os.path.join(save_dir, 'noisy%s.png' % img_name), noisyimage)
            save_images_RGB(os.path.join(save_dir, 'denoised%s.png' % img_name), outputimage)

        avg_psnr = psnr_sum / len(test_files)

        print("--- Test set ---- Average PSNR %.2f ---" % avg_psnr)
        tt_m = np.mean(tt)
        print("average time=%.3f" % tt_m)
