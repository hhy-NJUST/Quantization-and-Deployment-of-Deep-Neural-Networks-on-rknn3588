import os
import argparse
from glob import glob
from PIL import Image
import PIL
import random
from utils import *
import cv2

DATA_AUG_TIMES = 1  # transform a sample to a different sample for DATA_AUG_TIMES times

parser = argparse.ArgumentParser(description='')
parser.add_argument('--src_dir', dest='src_dir', default='./data/train_2/input', help='dir of data')
parser.add_argument('--src_gt_dir', dest='src_gt_dir', default='./data/train_2/gt', help='dir of data_gt')
parser.add_argument('--save_dir', dest='save_dir', default='./data', help='dir of patches')
parser.add_argument('--patch_size', dest='pat_size', type=int, default=50, help='patch size')
parser.add_argument('--stride', dest='stride', type=int, default=20, help='stride')
parser.add_argument('--step', dest='step', type=int, default=0, help='step')
parser.add_argument('--batch_size', dest='bat_size', type=int, default=128, help='batch size')
args = parser.parse_args()

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
    return img_magnify

def generate_patches(isDebug=False):
    global DATA_AUG_TIMES
    count = 0
    filepaths = glob(args.src_dir + '/*.bmp')
    filepaths_gt = glob(args.src_gt_dir + '/*.bmp')

    print("number of training data %d" % len(filepaths))

    scales = [1, 0.9, 0.8, 0.7]

    # calculate the number of patches
    for i in range(len(filepaths)):
        img = Image.open(filepaths[i]).convert('RGB')  # convert RGB to gray
        # img = img.astype(np.int32)

        for s in range(len(scales)):
            newsize = (int(img.size[0] * scales[s]), int(img.size[1] * scales[s]))
            img_s = img.resize(newsize, resample=PIL.Image.BICUBIC)  # do not change the original img
            im_h, im_w = img_s.size
            for x in range(0 + args.step, (im_h - args.pat_size), args.stride):
                for y in range(0 + args.step, (im_w - args.pat_size), args.stride):
                    count += 1
    origin_patch_num = count * DATA_AUG_TIMES

    if origin_patch_num % args.bat_size != 0:
        numPatches = int((origin_patch_num / args.bat_size + 1) * args.bat_size)
    else:
        numPatches = origin_patch_num
    print("total patches = %d , batch size = %d, total batches = %d" % (
    numPatches, args.bat_size, numPatches / args.bat_size))

    # data matrix 4-D
    inputs = np.zeros((numPatches, args.pat_size, args.pat_size, 3), dtype="uint8")
    inputs_gt = np.zeros((numPatches, args.pat_size, args.pat_size, 3), dtype="uint8")

    count = 0
    ratio_standard = 45
    # generate patches
    for i in range(len(filepaths)):
        img = Image.open(filepaths[i]).convert('RGB')
        img2 = Image.open(filepaths_gt[i]).convert('RGB')

        for s in range(len(scales)):
            newsize = (int(img.size[0] * scales[s]), int(img.size[1] * scales[s]))
            # print newsize
            img_s = img.resize(newsize, resample=PIL.Image.BICUBIC)
            img_gt = img2.resize(newsize, resample=PIL.Image.BICUBIC)

            img_s = np.array(img_s)  # extend one dimension
            img_gt = np.array(img_gt)

            img_s = rgbmagnify(ratio_standard, img_s)
            img_gt = rgbmagnify(ratio_standard, img_gt)


            for j in range(DATA_AUG_TIMES):
                im_h, im_w, _ = img_s.shape
                for x in range(0 + args.step, im_h - args.pat_size, args.stride):
                    for y in range(0 + args.step, im_w - args.pat_size, args.stride):
                        mode = random.randint(0, 7)
                        inputs[count, :, :, :] = data_augmentation(img_s[x:x + args.pat_size, y:y + args.pat_size, :], \
                                                                   mode)
                        inputs_gt[count, :, :, :] = data_augmentation(img_gt[x:x + args.pat_size, y:y + args.pat_size, :], \
                                                                   mode)

                        count += 1
    # pad the batch
    if count < numPatches:
        to_pad = numPatches - count
        inputs[-to_pad:, :, :, :] = inputs[:to_pad, :, :, :]
        inputs_gt[-to_pad:, :, :, :] = inputs_gt[:to_pad, :, :, :]

    if not os.path.exists(args.save_dir):
        os.mkdir(args.save_dir)

    # the pixel value range is '0-1'(float32)
    inputs = inputs.astype(np.float32) / 255.0
    inputs_gt = inputs_gt.astype(np.float32) / 255.0

    np.save(os.path.join(args.save_dir, "noise_pats_rgb"), inputs)
    np.save(os.path.join(args.save_dir, "clean_pats_rgb"), inputs_gt)
    print("size of inputs tensor = " + str(inputs.shape))
    print("size of inputs_gt tensor = " + str(inputs_gt.shape))


if __name__ == '__main__':
    generate_patches()
