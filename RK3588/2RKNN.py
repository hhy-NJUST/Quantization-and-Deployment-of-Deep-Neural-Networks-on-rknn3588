import numpy as np

import re
import math
import random
import cv2

from rknn.api import RKNN
# input shape nhwc
INPUT_SIZE_H = 270
INPUT_SIZE_W = 480
PB_FILE = './model/CDnCNN_deBN.pb'
RKNN_MODEL_PATH = './model/CDnCNN_deBN_qat.rknn'
IMG_PATH = './011.bmp'
INPUTS = ['noisy_image']
OUTPUTS = ['CDnCNN/output']


if __name__ == '__main__':

    # Create RKNN object
    rknn = RKNN(verbose=True)

    # Pre-process config
    print('--> Config model')
    rknn.config(mean_values=[0, 0, 0],
                std_values=[255, 255, 255],
                target_platform='rk3588')
    print('done')

    # Load model
    print('--> Loading model')
    ret = rknn.load_tensorflow(tf_pb=PB_FILE,
                               inputs=INPUTS,
                               outputs=OUTPUTS,
                               input_size_list=[[1, INPUT_SIZE_H, INPUT_SIZE_W, 3]])
    if ret != 0:
        print('Load model failed!')
        exit(ret)
    print('done')

    # Build Model
    print('--> Building model')
    # ret = rknn.build(do_quantization=False)
    ret = rknn.build(do_quantization=True, dataset='./dataset.txt')
    if ret != 0:
        print('Build model failed!')
        exit(ret)
    print('done')

    # Export rknn model
    print('--> Export rknn model')
    ret = rknn.export_rknn(RKNN_MODEL_PATH)
    if ret != 0:
        print('Export rknn model failed!')
        exit(ret)
    print('done')


    # Set inputs
    img = cv2.imread(IMG_PATH)
    img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
    img = cv2.resize(img, (INPUT_SIZE_W, INPUT_SIZE_H), interpolation=cv2.INTER_CUBIC)

    # Init runtime environment
    print('--> Init runtime environment')
    ret = rknn.init_runtime()
    if ret != 0:
        print('Init runtime environment failed!')
        exit(ret)
    print('done')

    # Inference
    print('--> Running model')
    outputs = rknn.inference(inputs=[img])
    np.save('./test_result/011_qatresult.jpg', outputs[0])

    print('done')

    rknn.release()

