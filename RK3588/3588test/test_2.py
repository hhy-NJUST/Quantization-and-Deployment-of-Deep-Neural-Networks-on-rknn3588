import cv2
import numpy as np
import platform
from rknnlite.api import RKNNLite
import time
import natsort
from glob import glob

INPUT_SIZE_H = 270
INPUT_SIZE_W = 480
ratio = 45

RK3588_RKNN_MODEL = './model/CDnCNN_deBN_qat.rknn'
test_set = 'test1'
save_dir = './data/test_result/test1_mag/'

def rgbmagnify(ratio_standard, img):
    img_nz = (img != 0)
    mean_c = np.sum(np.sum(img, axis=0), axis=0) / np.sum(np.sum(img_nz, axis=0), axis=0)
    ratio = ratio_standard / (np.max(mean_c))
    img_magnify = img * ratio
    img_magnify = np.clip(img_magnify, 0, 255)
    img_magnify = img_magnify.astype('uint8')
    return img_magnify 

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
    tt = []
    # test_files : [path1, path2, ...]
    test_files = natsort.natsorted(glob('./data/test/{}/*.bmp'.format(test_set)))
    for idx in range(len(test_files)):
        print("idx = %04d " %  int(idx))
        print("test_file = " + test_files[idx])
        ori_img = cv2.imread(test_files[idx])
        img = cv2.cvtColor(ori_img, cv2.COLOR_BGR2RGB)
        img = cv2.resize(img, (INPUT_SIZE_W, INPUT_SIZE_H), interpolation=cv2.INTER_CUBIC)
        img = rgbmagnify(ratio, img)

        t = time.time()

        outputs = rknn_lite.inference(inputs=[img])

        tot = time.time() - t
        tt.append(tot)
        output = outputs[0]
        output = np.minimum(np.maximum(output, 0), 1)
        output = (output*255).astype('uint8')

        result_path = save_dir + '%04d_final_qat.jpg' % int(idx)
        # cv2.imwrite(result_path, output)
        np.save(result_path, output)

    tt_m = np.mean(tt)
    print("average time = %.3f" % tt_m)
    print('done')
    # print("time = %.3f" % (end - start))
    rknn_lite.release()
