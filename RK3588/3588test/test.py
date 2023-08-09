import cv2
import numpy as np
import platform
from rknnlite.api import RKNNLite
import time



INPUT_SIZE_H = 270
INPUT_SIZE_W = 480

RK3588_RKNN_MODEL = './model/CDnCNN_deBN_qat.rknn'



if __name__ == '__main__':

    host_name = 'RK3588'
    rknn_model = RK3588_RKNN_MODEL
    rknn_lite = RKNNLite()

    # load RKNN model
    print('--> Load RKNN model')
    ret = rknn_lite.load_rknn(rknn_model)
    if ret != 0:
        print('Load RKNN model failed')
        exit(ret)
    print('done')

    ori_img = cv2.imread('./011.bmp')
    img = cv2.cvtColor(ori_img, cv2.COLOR_BGR2RGB)
    img = cv2.resize(img, (INPUT_SIZE_W, INPUT_SIZE_H), interpolation=cv2.INTER_CUBIC)

    # init runtime environment
    print('--> Init runtime environment')
    # run on RK356x/RK3588 with Debian OS, do not need specify target.
    if host_name == 'RK3588':
        ret = rknn_lite.init_runtime(core_mask=RKNNLite.NPU_CORE_0)
    else:
        ret = rknn_lite.init_runtime()
    if ret != 0:
        print('Init runtime environment failed')
        exit(ret)
    print('done')

    # Inference
    print('--> Running model')

    start = time.time()
    outputs = rknn_lite.inference(inputs=[img])
    end = time.time()

    np.save('./test_result/011_final_qat.jpg', outputs[0])
    print('done')
    print("time = %.3f" % (end - start))
    rknn_lite.release()
