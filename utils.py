from __future__ import division

import numpy as np
import tensorflow.compat.v1 as tf
tf.compat.v1.disable_eager_execution()
from PIL import Image
import cv2
from PIL import Image, ImageEnhance
import argparse



def diff_noise_batch(batch_sigma, batch_size):
    batch_noise = np.zeros((batch_sigma.shape[0], batch_size, batch_size, 3))
    for i in range(len(batch_sigma)):
        batch_noise[i, :, :, :] = batch_sigma[i] / 255 * np.random.randn(1, batch_size, batch_size, 3)
    return batch_noise


def data_augmentation(image, mode):
    if mode == 0:
        # original
        return image
    elif mode == 1:
        # flip up and down
        return np.flipud(image)
    elif mode == 2:
        # rotate counterwise 90 degree
        return np.rot90(image)
    elif mode == 3:
        # rotate 90 degree and flip up and down
        image = np.rot90(image)
        return np.flipud(image)
    elif mode == 4:
        # rotate 180 degree
        return np.rot90(image, k=2)
    elif mode == 5:
        # rotate 180 degree and flip
        image = np.rot90(image, k=2)
        return np.flipud(image)
    elif mode == 6:
        # rotate 270 degree
        return np.rot90(image, k=3)
    elif mode == 7:
        # rotate 270 degree and flip
        image = np.rot90(image, k=3)
        return np.flipud(image)


def load_images(filelist):
    if not isinstance(filelist, list):
        im = Image.open(filelist).convert('L')
        return np.array(im).reshape(1, im.size[1], im.size[0], 1)

    data = []

    for file in filelist:
        im = Image.open(file).convert('L')
        data.append(np.array(im).reshape(1, im.size[1], im.size[0], 1))
    return data


def load_images_RGB(filelist):
    if not isinstance(filelist, list):
        im = Image.open(filelist).convert('RGB')
        return np.array(im).reshape(1, im.size[1], im.size[0], 3)

    data = []

    for file in filelist:
        im = Image.open(file).convert('RGB')
        data.append(np.array(im).reshape(1, im.size[1], im.size[0], 3))
    return data


def load_images_rgbmagnify(filelist, ratio_standard):
    """
    :param ratio_standard:  线性放大系数 0-255
    :param img:  rgb格式图片 0-255 float32
    :return: img_magnify:  线性增强后的rgb格式图
    """

    if not isinstance(filelist, list):
        img = Image.open(filelist).convert('RGB')
        img = np.array(img).reshape(1, img.size[1], img.size[0], 3)
        img_nz = (img != 0)

        # n = np.sum(np.sum(img_nz, axis=0),axis=0)
        mean_c = np.sum(np.sum(img, axis=0), axis=0) / np.sum(np.sum(img_nz, axis=0), axis=0)
        ratio = ratio_standard / (np.max(mean_c))
        img_magnify = img * ratio

        # img_magnify = img_magnify/max(img_magnify)*255

        img_magnify = np.clip(img_magnify, 0, 255)
        return img_magnify

    data = []

    for file in filelist:
        img = Image.open(file).convert('RGB')
        img = np.array(img).reshape(1, img.size[1], img.size[0], 3)
        img_nz = (img != 0)

        # n = np.sum(np.sum(img_nz, axis=0),axis=0)
        mean_c = np.sum(np.sum(img, axis=0), axis=0) / np.sum(np.sum(img_nz, axis=0), axis=0)
        ratio = ratio_standard / (np.max(mean_c))
        img_magnify = img * ratio

        # img_magnify = img_magnify/max(img_magnify)*255

        img_magnify = np.clip(img_magnify, 0, 255)

        data.append(img_magnify)
    return data



def load_images_RGB_test(filelist):
    print("original\n")
    if not isinstance(filelist, list):
        im = Image.open(filelist).convert('RGB')
        return np.array(im).reshape(1, im.size[1], im.size[0], 3)

    data = []

    for file in filelist:
        im = Image.open(file).convert('RGB')

        data.append(np.array(im).reshape(1, im.size[1], im.size[0], 3))
    return data



def save_images(filepath, ground_truth, noisy_image=None, clean_image=None):
    ground_truth = np.squeeze(ground_truth)
    noisy_image = np.squeeze(noisy_image)
    clean_image = np.squeeze(clean_image)
    if not clean_image.any():
        cat_image = ground_truth
    else:
        cat_image = np.concatenate([ground_truth, noisy_image, clean_image], axis=1)

    im = Image.fromarray(cat_image.astype('uint8')).convert('L')
    im.save(filepath, 'png')


def save_images_RGB(filepath, ground_truth, noisy_image=None, clean_image=None):
    ground_truth = np.squeeze(ground_truth)
    noisy_image = np.squeeze(noisy_image)
    clean_image = np.squeeze(clean_image)
    if not clean_image.any():
        cat_image = ground_truth
    else:
        cat_image = np.concatenate([ground_truth, noisy_image, clean_image], axis=1)
    im = Image.fromarray(cat_image.astype('uint8')).convert('RGB')
    im.save(filepath, 'png')


def save_images1(filepath, ground_truth, noisy_image=None, clean_image=None):
    print(np.shape(ground_truth), np.shape(noisy_image), np.shape(clean_image))
    ground_truth = np.squeeze(ground_truth)
    noisy_image = np.squeeze(noisy_image)
    clean_image = np.squeeze(clean_image)


def cal_psnr(im1, im2):
    mse = ((im1.astype(np.float) - im2.astype(np.float)) ** 2).mean()
    psnr = 10 * np.log10(255 ** 2 / mse)
    return psnr


def tf_psnr(im1, im2):
    mse = tf.losses.mean_squared_error(lables=im2 * 255.0, predictions=im1 * 255.0)
    return 10 * (tf.log(255.0 ** 2 / mse) / tf.log(10.0))
































