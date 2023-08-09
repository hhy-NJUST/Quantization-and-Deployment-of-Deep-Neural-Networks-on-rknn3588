import matplotlib.pyplot as plt
import numpy as np
from glob import glob
import natsort
import os


# scr_path = './data/test_final/test2/0000_final_qat.jpg.npy'
scr_set = 'test1_mag'
save_path = './data/test_final/test1_mag_jpg/'


test_files = natsort.natsorted(glob('./data/test_final/{}/*.npy'.format(scr_set)))
for idx in range(len(test_files)):
    image = np.load(test_files[idx])
    image = image.squeeze(0)

    fig = plt.figure()
    ax = fig.add_subplot(1, 1, 1)
    ax.axes.get_xaxis().set_visible(False)
    ax.axes.get_yaxis().set_visible(False)
    ax.set_frame_on(False)
    plt.imshow(image)
    img_name, img_ext = os.path.splitext(os.path.basename(test_files[idx]))
    plt.savefig(os.path.join(save_path, 'final_qat_%s' % img_name), bbox_inches='tight',pad_inches=0.0)
    plt.close('all')  # 避免内存泄漏