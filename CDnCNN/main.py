from __future__ import print_function
from __future__ import division
import argparse
from glob import glob
import natsort
import tensorflow.compat.v1 as tf
tf.disable_v2_behavior()

import utils
from model import denoiser
from utils import *
import os
import warnings
warnings.filterwarnings("ignore")

parser = argparse.ArgumentParser(description='')
parser.add_argument('--epoch', dest='epoch', type=int, default=50, help='the number of epoch while training.')
parser.add_argument('--batch_size', dest='batch_size', type=int, default=128, help='the number of batch size while training.')
parser.add_argument('--lr', dest='lr', type=float, default=0.0001, help='initial learning rate for sgd.')

parser.add_argument('--clean_data', dest='clean_data', default='./data/input_down', help='training clean data path.')
parser.add_argument('--noisy_data', dest='noisy_data', default='./data/gt', help='training noisy data path.')
parser.add_argument('--checkpoint_dir', dest='ckpt_dir', default='./checkpoint2/', help='models are saved here.')
parser.add_argument('--sample_dir', dest='sample_dir', default='./samples/sample2', help='sample are saved here')
parser.add_argument('--log_dir', dest='log_dir', default='./logs/log2', help='tensorboard logs are saved here')
parser.add_argument('--test_dir', dest='test_dir', default='./sample_test/', help='test sample are saved here')
parser.add_argument('--eval_set', dest='eval_set', default='1', help='dataset for eval in training')
parser.add_argument('--eval_gt_set', dest='eval_gt_set', default='1_gt', help='dataset for eval in training')
parser.add_argument('--test_set', dest='test_set', default='test1', help='dataset for testing')
parser.add_argument('--test_gt_set', dest='test_gt_set', default='test1', help='dataset for testing')

parser.add_argument('--gpu', dest='gpu', default='0', help='which gpu to use')
parser.add_argument('--phase', dest='phase', default='test', help='train or test')
parser.add_argument('--use_gpu', dest='use_gpu', type=int, default=1, help='gpu flag, 1 for GPU and 0 for CPU')

parser.add_argument('--ratio', dest='ratio', type=int, default=45, help='the ratio of magnify')

args = parser.parse_args()


def main(_):
    if not os.path.exists(args.ckpt_dir):
        os.makedirs(args.ckpt_dir)

    lr = args.lr * np.ones([args.epoch])
    lr[30:] = lr[0] / 10.0
    lr[40:] = lr[0] / 20.0

        # lr[40:] = lr[0] / 10.0
        # lr[50:] = lr[0] / 20.0

    if args.use_gpu:
        print("GPU\n")
        gpu_options = tf.GPUOptions(per_process_gpu_memory_fraction=0.9)
        with tf.Session(config=tf.ConfigProto(gpu_options=gpu_options)) as sess:
            model = denoiser(sess,  ckpt_dir=args.ckpt_dir, sample_dir=args.sample_dir, log_dir=args.log_dir)
            if args.phase == 'train':
                eval_files = natsort.natsorted(glob('./data/eval/{}/*.bmp'.format(args.eval_set)))
                eval_gt_files = natsort.natsorted(glob('./data/eval/{}/*.bmp'.format(args.eval_gt_set)))
                model.train(args.ratio, args.clean_data, args.noisy_data, eval_gt_files, eval_files, batch_size=args.batch_size, epoch=args.epoch, lr=lr)

            elif args.phase == 'test':
                print('testing on {} dataset'.format(args.test_set))
                test_files = natsort.natsorted(glob('./data/test/{}/*.bmp'.format(args.test_set)))
                test_gt_files = natsort.natsorted(glob('./data/test/{}/*.bmp'.format(args.test_gt_set)))
                model.test(test_files, test_gt_files, args.test_dir, args.ratio)

            else:
                print("[!]Unknown phase")
                exit(0)

    else:
        print("GPU is recommended.")
        exit(0)

if __name__ == '__main__':
    os.environ['CUDA_VISIBLE_DEVICES']=str(args.gpu)
    tf.app.run()