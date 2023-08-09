# Quantization-and-Deployment-of-Deep-Neural-Networks-on-rknn3588
CDnCNN_EASY:        The referenced network training code.


Network training：

  CDnCNN/model.py

  CDnCNN/utils.py

  CDnCNN/main.py

  CDnCNN/generate_patches_rgb.py  


RK3588/2RKNN.py:        .pbmodel format convert to.rknn model format.

RK3588/vis_NPY.py:        View the image in npy format after inference.

freeze.py:        .cpkt model format convert to.pb model format.

RK3588/3588test/test.py：        Test Single image.

RK3588/3588test/test_1.py：        Test multiple images.

RK3588/3588test/test_2.py：        Add image linear enhancement preprocessing steps than test_1.py, the rest are the same.
