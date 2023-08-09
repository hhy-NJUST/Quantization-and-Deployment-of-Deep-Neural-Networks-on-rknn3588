node {
  name: "clean_image"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: -1
        }
        dim {
          size: -1
        }
        dim {
          size: -1
        }
        dim {
          size: 3
        }
      }
    }
  }
}
node {
  name: "noisy_image"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: -1
        }
        dim {
          size: -1
        }
        dim {
          size: -1
        }
        dim {
          size: 3
        }
      }
    }
  }
}
node {
  name: "Shape"
  op: "Shape"
  input: "clean_image"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "strided_slice"
  op: "StridedSlice"
  input: "Shape"
  input: "strided_slice/stack"
  input: "strided_slice/stack_1"
  input: "strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "ToFloat"
  op: "Cast"
  input: "strided_slice"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "Shape_1"
  op: "Shape"
  input: "clean_image"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "strided_slice_1/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "strided_slice_1/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "strided_slice_1/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "strided_slice_1"
  op: "StridedSlice"
  input: "Shape_1"
  input: "strided_slice_1/stack"
  input: "strided_slice_1/stack_1"
  input: "strided_slice_1/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 1
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 0
    }
  }
}
node {
  name: "CDnCNN/block1/conv2d/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\003\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "CDnCNN/block1/conv2d/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.09975093603134155
      }
    }
  }
}
node {
  name: "CDnCNN/block1/conv2d/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.09975093603134155
      }
    }
  }
}
node {
  name: "CDnCNN/block1/conv2d/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "CDnCNN/block1/conv2d/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "CDnCNN/block1/conv2d/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "CDnCNN/block1/conv2d/kernel/Initializer/random_uniform/max"
  input: "CDnCNN/block1/conv2d/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block1/conv2d/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "CDnCNN/block1/conv2d/kernel/Initializer/random_uniform/RandomUniform"
  input: "CDnCNN/block1/conv2d/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block1/conv2d/kernel/Initializer/random_uniform"
  op: "Add"
  input: "CDnCNN/block1/conv2d/kernel/Initializer/random_uniform/mul"
  input: "CDnCNN/block1/conv2d/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block1/conv2d/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "CDnCNN/block1/conv2d/kernel/Assign"
  op: "Assign"
  input: "CDnCNN/block1/conv2d/kernel"
  input: "CDnCNN/block1/conv2d/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "CDnCNN/block1/conv2d/kernel/read"
  op: "Identity"
  input: "CDnCNN/block1/conv2d/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block1/conv2d/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "CDnCNN/block1/conv2d/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "CDnCNN/block1/conv2d/bias/Assign"
  op: "Assign"
  input: "CDnCNN/block1/conv2d/bias"
  input: "CDnCNN/block1/conv2d/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "CDnCNN/block1/conv2d/bias/read"
  op: "Identity"
  input: "CDnCNN/block1/conv2d/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/bias"
      }
    }
  }
}
node {
  name: "CDnCNN/block1/conv2d/Conv2D"
  op: "Conv2D"
  input: "noisy_image"
  input: "CDnCNN/block1/conv2d/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "CDnCNN/block1/conv2d/BiasAdd"
  op: "BiasAdd"
  input: "CDnCNN/block1/conv2d/Conv2D"
  input: "CDnCNN/block1/conv2d/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "CDnCNN/block1/conv2d/Relu"
  op: "Relu"
  input: "CDnCNN/block1/conv2d/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "CDnCNN/block2/conv2/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block2/conv2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "CDnCNN/block2/conv2/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block2/conv2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.07216878235340118
      }
    }
  }
}
node {
  name: "CDnCNN/block2/conv2/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block2/conv2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.07216878235340118
      }
    }
  }
}
node {
  name: "CDnCNN/block2/conv2/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "CDnCNN/block2/conv2/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block2/conv2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "CDnCNN/block2/conv2/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "CDnCNN/block2/conv2/kernel/Initializer/random_uniform/max"
  input: "CDnCNN/block2/conv2/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block2/conv2/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block2/conv2/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "CDnCNN/block2/conv2/kernel/Initializer/random_uniform/RandomUniform"
  input: "CDnCNN/block2/conv2/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block2/conv2/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block2/conv2/kernel/Initializer/random_uniform"
  op: "Add"
  input: "CDnCNN/block2/conv2/kernel/Initializer/random_uniform/mul"
  input: "CDnCNN/block2/conv2/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block2/conv2/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block2/conv2/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block2/conv2/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "CDnCNN/block2/conv2/kernel/Assign"
  op: "Assign"
  input: "CDnCNN/block2/conv2/kernel"
  input: "CDnCNN/block2/conv2/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block2/conv2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "CDnCNN/block2/conv2/kernel/read"
  op: "Identity"
  input: "CDnCNN/block2/conv2/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block2/conv2/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block2/conv2/Conv2D"
  op: "Conv2D"
  input: "CDnCNN/block1/conv2d/Relu"
  input: "CDnCNN/block2/conv2/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "CDnCNN/block2/Relu"
  op: "Relu"
  input: "CDnCNN/block2/conv2/Conv2D"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "CDnCNN/block3/conv3/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block3/conv3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "CDnCNN/block3/conv3/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block3/conv3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.07216878235340118
      }
    }
  }
}
node {
  name: "CDnCNN/block3/conv3/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block3/conv3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.07216878235340118
      }
    }
  }
}
node {
  name: "CDnCNN/block3/conv3/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "CDnCNN/block3/conv3/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block3/conv3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "CDnCNN/block3/conv3/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "CDnCNN/block3/conv3/kernel/Initializer/random_uniform/max"
  input: "CDnCNN/block3/conv3/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block3/conv3/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block3/conv3/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "CDnCNN/block3/conv3/kernel/Initializer/random_uniform/RandomUniform"
  input: "CDnCNN/block3/conv3/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block3/conv3/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block3/conv3/kernel/Initializer/random_uniform"
  op: "Add"
  input: "CDnCNN/block3/conv3/kernel/Initializer/random_uniform/mul"
  input: "CDnCNN/block3/conv3/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block3/conv3/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block3/conv3/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block3/conv3/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "CDnCNN/block3/conv3/kernel/Assign"
  op: "Assign"
  input: "CDnCNN/block3/conv3/kernel"
  input: "CDnCNN/block3/conv3/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block3/conv3/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "CDnCNN/block3/conv3/kernel/read"
  op: "Identity"
  input: "CDnCNN/block3/conv3/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block3/conv3/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block3/conv3/Conv2D"
  op: "Conv2D"
  input: "CDnCNN/block2/Relu"
  input: "CDnCNN/block3/conv3/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "CDnCNN/block3/Relu"
  op: "Relu"
  input: "CDnCNN/block3/conv3/Conv2D"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "CDnCNN/block4/conv4/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block4/conv4/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "CDnCNN/block4/conv4/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block4/conv4/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.07216878235340118
      }
    }
  }
}
node {
  name: "CDnCNN/block4/conv4/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block4/conv4/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.07216878235340118
      }
    }
  }
}
node {
  name: "CDnCNN/block4/conv4/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "CDnCNN/block4/conv4/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block4/conv4/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "CDnCNN/block4/conv4/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "CDnCNN/block4/conv4/kernel/Initializer/random_uniform/max"
  input: "CDnCNN/block4/conv4/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block4/conv4/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block4/conv4/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "CDnCNN/block4/conv4/kernel/Initializer/random_uniform/RandomUniform"
  input: "CDnCNN/block4/conv4/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block4/conv4/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block4/conv4/kernel/Initializer/random_uniform"
  op: "Add"
  input: "CDnCNN/block4/conv4/kernel/Initializer/random_uniform/mul"
  input: "CDnCNN/block4/conv4/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block4/conv4/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block4/conv4/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block4/conv4/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "CDnCNN/block4/conv4/kernel/Assign"
  op: "Assign"
  input: "CDnCNN/block4/conv4/kernel"
  input: "CDnCNN/block4/conv4/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block4/conv4/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "CDnCNN/block4/conv4/kernel/read"
  op: "Identity"
  input: "CDnCNN/block4/conv4/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block4/conv4/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block4/conv4/Conv2D"
  op: "Conv2D"
  input: "CDnCNN/block3/Relu"
  input: "CDnCNN/block4/conv4/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "CDnCNN/block4/Relu"
  op: "Relu"
  input: "CDnCNN/block4/conv4/Conv2D"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "CDnCNN/block5/conv5/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block5/conv5/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "CDnCNN/block5/conv5/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block5/conv5/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.07216878235340118
      }
    }
  }
}
node {
  name: "CDnCNN/block5/conv5/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block5/conv5/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.07216878235340118
      }
    }
  }
}
node {
  name: "CDnCNN/block5/conv5/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "CDnCNN/block5/conv5/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block5/conv5/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "CDnCNN/block5/conv5/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "CDnCNN/block5/conv5/kernel/Initializer/random_uniform/max"
  input: "CDnCNN/block5/conv5/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block5/conv5/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block5/conv5/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "CDnCNN/block5/conv5/kernel/Initializer/random_uniform/RandomUniform"
  input: "CDnCNN/block5/conv5/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block5/conv5/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block5/conv5/kernel/Initializer/random_uniform"
  op: "Add"
  input: "CDnCNN/block5/conv5/kernel/Initializer/random_uniform/mul"
  input: "CDnCNN/block5/conv5/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block5/conv5/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block5/conv5/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block5/conv5/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "CDnCNN/block5/conv5/kernel/Assign"
  op: "Assign"
  input: "CDnCNN/block5/conv5/kernel"
  input: "CDnCNN/block5/conv5/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block5/conv5/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "CDnCNN/block5/conv5/kernel/read"
  op: "Identity"
  input: "CDnCNN/block5/conv5/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block5/conv5/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block5/conv5/Conv2D"
  op: "Conv2D"
  input: "CDnCNN/block4/Relu"
  input: "CDnCNN/block5/conv5/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "CDnCNN/block5/Relu"
  op: "Relu"
  input: "CDnCNN/block5/conv5/Conv2D"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "CDnCNN/block6/conv6/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block6/conv6/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "CDnCNN/block6/conv6/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block6/conv6/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.07216878235340118
      }
    }
  }
}
node {
  name: "CDnCNN/block6/conv6/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block6/conv6/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.07216878235340118
      }
    }
  }
}
node {
  name: "CDnCNN/block6/conv6/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "CDnCNN/block6/conv6/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block6/conv6/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "CDnCNN/block6/conv6/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "CDnCNN/block6/conv6/kernel/Initializer/random_uniform/max"
  input: "CDnCNN/block6/conv6/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block6/conv6/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block6/conv6/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "CDnCNN/block6/conv6/kernel/Initializer/random_uniform/RandomUniform"
  input: "CDnCNN/block6/conv6/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block6/conv6/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block6/conv6/kernel/Initializer/random_uniform"
  op: "Add"
  input: "CDnCNN/block6/conv6/kernel/Initializer/random_uniform/mul"
  input: "CDnCNN/block6/conv6/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block6/conv6/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block6/conv6/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block6/conv6/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "CDnCNN/block6/conv6/kernel/Assign"
  op: "Assign"
  input: "CDnCNN/block6/conv6/kernel"
  input: "CDnCNN/block6/conv6/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block6/conv6/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "CDnCNN/block6/conv6/kernel/read"
  op: "Identity"
  input: "CDnCNN/block6/conv6/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block6/conv6/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block6/conv6/Conv2D"
  op: "Conv2D"
  input: "CDnCNN/block5/Relu"
  input: "CDnCNN/block6/conv6/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "CDnCNN/block6/Relu"
  op: "Relu"
  input: "CDnCNN/block6/conv6/Conv2D"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "CDnCNN/block7/conv7/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block7/conv7/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "CDnCNN/block7/conv7/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block7/conv7/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.07216878235340118
      }
    }
  }
}
node {
  name: "CDnCNN/block7/conv7/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block7/conv7/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.07216878235340118
      }
    }
  }
}
node {
  name: "CDnCNN/block7/conv7/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "CDnCNN/block7/conv7/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block7/conv7/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "CDnCNN/block7/conv7/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "CDnCNN/block7/conv7/kernel/Initializer/random_uniform/max"
  input: "CDnCNN/block7/conv7/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block7/conv7/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block7/conv7/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "CDnCNN/block7/conv7/kernel/Initializer/random_uniform/RandomUniform"
  input: "CDnCNN/block7/conv7/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block7/conv7/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block7/conv7/kernel/Initializer/random_uniform"
  op: "Add"
  input: "CDnCNN/block7/conv7/kernel/Initializer/random_uniform/mul"
  input: "CDnCNN/block7/conv7/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block7/conv7/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block7/conv7/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block7/conv7/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "CDnCNN/block7/conv7/kernel/Assign"
  op: "Assign"
  input: "CDnCNN/block7/conv7/kernel"
  input: "CDnCNN/block7/conv7/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block7/conv7/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "CDnCNN/block7/conv7/kernel/read"
  op: "Identity"
  input: "CDnCNN/block7/conv7/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block7/conv7/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block7/conv7/Conv2D"
  op: "Conv2D"
  input: "CDnCNN/block6/Relu"
  input: "CDnCNN/block7/conv7/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "CDnCNN/block7/Relu"
  op: "Relu"
  input: "CDnCNN/block7/conv7/Conv2D"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "CDnCNN/block8/conv8/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block8/conv8/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "CDnCNN/block8/conv8/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block8/conv8/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.07216878235340118
      }
    }
  }
}
node {
  name: "CDnCNN/block8/conv8/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block8/conv8/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.07216878235340118
      }
    }
  }
}
node {
  name: "CDnCNN/block8/conv8/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "CDnCNN/block8/conv8/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block8/conv8/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "CDnCNN/block8/conv8/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "CDnCNN/block8/conv8/kernel/Initializer/random_uniform/max"
  input: "CDnCNN/block8/conv8/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block8/conv8/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block8/conv8/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "CDnCNN/block8/conv8/kernel/Initializer/random_uniform/RandomUniform"
  input: "CDnCNN/block8/conv8/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block8/conv8/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block8/conv8/kernel/Initializer/random_uniform"
  op: "Add"
  input: "CDnCNN/block8/conv8/kernel/Initializer/random_uniform/mul"
  input: "CDnCNN/block8/conv8/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block8/conv8/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block8/conv8/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block8/conv8/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "CDnCNN/block8/conv8/kernel/Assign"
  op: "Assign"
  input: "CDnCNN/block8/conv8/kernel"
  input: "CDnCNN/block8/conv8/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block8/conv8/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "CDnCNN/block8/conv8/kernel/read"
  op: "Identity"
  input: "CDnCNN/block8/conv8/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block8/conv8/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block8/conv8/Conv2D"
  op: "Conv2D"
  input: "CDnCNN/block7/Relu"
  input: "CDnCNN/block8/conv8/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "CDnCNN/block8/Relu"
  op: "Relu"
  input: "CDnCNN/block8/conv8/Conv2D"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "CDnCNN/block9/conv9/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block9/conv9/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "CDnCNN/block9/conv9/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block9/conv9/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.07216878235340118
      }
    }
  }
}
node {
  name: "CDnCNN/block9/conv9/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block9/conv9/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.07216878235340118
      }
    }
  }
}
node {
  name: "CDnCNN/block9/conv9/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "CDnCNN/block9/conv9/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block9/conv9/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "CDnCNN/block9/conv9/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "CDnCNN/block9/conv9/kernel/Initializer/random_uniform/max"
  input: "CDnCNN/block9/conv9/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block9/conv9/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block9/conv9/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "CDnCNN/block9/conv9/kernel/Initializer/random_uniform/RandomUniform"
  input: "CDnCNN/block9/conv9/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block9/conv9/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block9/conv9/kernel/Initializer/random_uniform"
  op: "Add"
  input: "CDnCNN/block9/conv9/kernel/Initializer/random_uniform/mul"
  input: "CDnCNN/block9/conv9/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block9/conv9/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block9/conv9/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block9/conv9/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "CDnCNN/block9/conv9/kernel/Assign"
  op: "Assign"
  input: "CDnCNN/block9/conv9/kernel"
  input: "CDnCNN/block9/conv9/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block9/conv9/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "CDnCNN/block9/conv9/kernel/read"
  op: "Identity"
  input: "CDnCNN/block9/conv9/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block9/conv9/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block9/conv9/Conv2D"
  op: "Conv2D"
  input: "CDnCNN/block8/Relu"
  input: "CDnCNN/block9/conv9/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "CDnCNN/block9/Relu"
  op: "Relu"
  input: "CDnCNN/block9/conv9/Conv2D"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "CDnCNN/block10/conv2d/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block10/conv2d/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\003\000\000\000"
      }
    }
  }
}
node {
  name: "CDnCNN/block10/conv2d/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block10/conv2d/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.09975093603134155
      }
    }
  }
}
node {
  name: "CDnCNN/block10/conv2d/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block10/conv2d/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.09975093603134155
      }
    }
  }
}
node {
  name: "CDnCNN/block10/conv2d/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "CDnCNN/block10/conv2d/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block10/conv2d/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "CDnCNN/block10/conv2d/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "CDnCNN/block10/conv2d/kernel/Initializer/random_uniform/max"
  input: "CDnCNN/block10/conv2d/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block10/conv2d/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block10/conv2d/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "CDnCNN/block10/conv2d/kernel/Initializer/random_uniform/RandomUniform"
  input: "CDnCNN/block10/conv2d/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block10/conv2d/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block10/conv2d/kernel/Initializer/random_uniform"
  op: "Add"
  input: "CDnCNN/block10/conv2d/kernel/Initializer/random_uniform/mul"
  input: "CDnCNN/block10/conv2d/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block10/conv2d/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block10/conv2d/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block10/conv2d/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 3
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "CDnCNN/block10/conv2d/kernel/Assign"
  op: "Assign"
  input: "CDnCNN/block10/conv2d/kernel"
  input: "CDnCNN/block10/conv2d/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block10/conv2d/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "CDnCNN/block10/conv2d/kernel/read"
  op: "Identity"
  input: "CDnCNN/block10/conv2d/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block10/conv2d/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block10/conv2d/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block10/conv2d/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "CDnCNN/block10/conv2d/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block10/conv2d/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "CDnCNN/block10/conv2d/bias/Assign"
  op: "Assign"
  input: "CDnCNN/block10/conv2d/bias"
  input: "CDnCNN/block10/conv2d/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block10/conv2d/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "CDnCNN/block10/conv2d/bias/read"
  op: "Identity"
  input: "CDnCNN/block10/conv2d/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block10/conv2d/bias"
      }
    }
  }
}
node {
  name: "CDnCNN/block10/conv2d/Conv2D"
  op: "Conv2D"
  input: "CDnCNN/block9/Relu"
  input: "CDnCNN/block10/conv2d/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "CDnCNN/block10/conv2d/BiasAdd"
  op: "BiasAdd"
  input: "CDnCNN/block10/conv2d/Conv2D"
  input: "CDnCNN/block10/conv2d/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "CDnCNN/sub"
  op: "Sub"
  input: "noisy_image"
  input: "CDnCNN/block10/conv2d/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "CDnCNN/output"
  op: "Identity"
  input: "CDnCNN/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "truediv/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "truediv"
  op: "RealDiv"
  input: "truediv/x"
  input: "ToFloat"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "sub"
  op: "Sub"
  input: "CDnCNN/output"
  input: "clean_image"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "L2Loss"
  op: "L2Loss"
  input: "sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mul"
  op: "Mul"
  input: "truediv"
  input: "L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "learning_rate"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        unknown_rank: true
      }
    }
  }
}
node {
  name: "eva_psnr"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        unknown_rank: true
      }
    }
  }
}
node {
  name: "gradients/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/grad_ys_0/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "gradients/grad_ys_0"
  op: "Fill"
  input: "gradients/Shape"
  input: "gradients/grad_ys_0/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/mul_grad/Mul"
  op: "Mul"
  input: "gradients/grad_ys_0"
  input: "L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_grad/Mul_1"
  op: "Mul"
  input: "gradients/grad_ys_0"
  input: "truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/mul_grad/Mul"
  input: "^gradients/mul_grad/Mul_1"
}
node {
  name: "gradients/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/mul_grad/Mul"
  input: "^gradients/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_grad/Mul"
      }
    }
  }
}
node {
  name: "gradients/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/mul_grad/Mul_1"
  input: "^gradients/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/mul_grad/Mul_1"
      }
    }
  }
}
node {
  name: "gradients/L2Loss_grad/mul"
  op: "Mul"
  input: "sub"
  input: "gradients/mul_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/sub_grad/Shape"
  op: "Shape"
  input: "CDnCNN/output"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/sub_grad/Shape_1"
  op: "Shape"
  input: "clean_image"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/sub_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/sub_grad/Shape"
  input: "gradients/sub_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/sub_grad/Sum"
  op: "Sum"
  input: "gradients/L2Loss_grad/mul"
  input: "gradients/sub_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/sub_grad/Reshape"
  op: "Reshape"
  input: "gradients/sub_grad/Sum"
  input: "gradients/sub_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/sub_grad/Neg"
  op: "Neg"
  input: "gradients/L2Loss_grad/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/sub_grad/Sum_1"
  op: "Sum"
  input: "gradients/sub_grad/Neg"
  input: "gradients/sub_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/sub_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/sub_grad/Sum_1"
  input: "gradients/sub_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/sub_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/sub_grad/Reshape"
  input: "^gradients/sub_grad/Reshape_1"
}
node {
  name: "gradients/sub_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/sub_grad/Reshape"
  input: "^gradients/sub_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/sub_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/sub_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/sub_grad/Reshape_1"
  input: "^gradients/sub_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/sub_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/CDnCNN/sub_grad/Shape"
  op: "Shape"
  input: "noisy_image"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/CDnCNN/sub_grad/Shape_1"
  op: "Shape"
  input: "CDnCNN/block10/conv2d/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/CDnCNN/sub_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/CDnCNN/sub_grad/Shape"
  input: "gradients/CDnCNN/sub_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/CDnCNN/sub_grad/Sum"
  op: "Sum"
  input: "gradients/sub_grad/tuple/control_dependency"
  input: "gradients/CDnCNN/sub_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/CDnCNN/sub_grad/Reshape"
  op: "Reshape"
  input: "gradients/CDnCNN/sub_grad/Sum"
  input: "gradients/CDnCNN/sub_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/CDnCNN/sub_grad/Neg"
  op: "Neg"
  input: "gradients/sub_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/CDnCNN/sub_grad/Sum_1"
  op: "Sum"
  input: "gradients/CDnCNN/sub_grad/Neg"
  input: "gradients/CDnCNN/sub_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/CDnCNN/sub_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/CDnCNN/sub_grad/Sum_1"
  input: "gradients/CDnCNN/sub_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/CDnCNN/sub_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/CDnCNN/sub_grad/Reshape"
  input: "^gradients/CDnCNN/sub_grad/Reshape_1"
}
node {
  name: "gradients/CDnCNN/sub_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/CDnCNN/sub_grad/Reshape"
  input: "^gradients/CDnCNN/sub_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/CDnCNN/sub_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/CDnCNN/sub_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/CDnCNN/sub_grad/Reshape_1"
  input: "^gradients/CDnCNN/sub_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/CDnCNN/sub_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/CDnCNN/block10/conv2d/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "gradients/CDnCNN/sub_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "gradients/CDnCNN/block10/conv2d/BiasAdd_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/CDnCNN/block10/conv2d/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/CDnCNN/sub_grad/tuple/control_dependency_1"
}
node {
  name: "gradients/CDnCNN/block10/conv2d/BiasAdd_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/CDnCNN/sub_grad/tuple/control_dependency_1"
  input: "^gradients/CDnCNN/block10/conv2d/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/CDnCNN/sub_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/CDnCNN/block10/conv2d/BiasAdd_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/CDnCNN/block10/conv2d/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/CDnCNN/block10/conv2d/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/CDnCNN/block10/conv2d/BiasAdd_grad/BiasAddGrad"
      }
    }
  }
}
node {
  name: "gradients/CDnCNN/block10/conv2d/Conv2D_grad/ShapeN"
  op: "ShapeN"
  input: "CDnCNN/block9/Relu"
  input: "CDnCNN/block10/conv2d/kernel/read"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/CDnCNN/block10/conv2d/Conv2D_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/CDnCNN/block10/conv2d/Conv2D_grad/ShapeN"
  input: "CDnCNN/block10/conv2d/kernel/read"
  input: "gradients/CDnCNN/block10/conv2d/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/CDnCNN/block10/conv2d/Conv2D_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "CDnCNN/block9/Relu"
  input: "gradients/CDnCNN/block10/conv2d/Conv2D_grad/ShapeN:1"
  input: "gradients/CDnCNN/block10/conv2d/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/CDnCNN/block10/conv2d/Conv2D_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/CDnCNN/block10/conv2d/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/CDnCNN/block10/conv2d/Conv2D_grad/Conv2DBackpropInput"
}
node {
  name: "gradients/CDnCNN/block10/conv2d/Conv2D_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/CDnCNN/block10/conv2d/Conv2D_grad/Conv2DBackpropInput"
  input: "^gradients/CDnCNN/block10/conv2d/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/CDnCNN/block10/conv2d/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/CDnCNN/block10/conv2d/Conv2D_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/CDnCNN/block10/conv2d/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/CDnCNN/block10/conv2d/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/CDnCNN/block10/conv2d/Conv2D_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/CDnCNN/block9/Relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "gradients/CDnCNN/block10/conv2d/Conv2D_grad/tuple/control_dependency"
  input: "CDnCNN/block9/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/CDnCNN/block9/conv9/Conv2D_grad/ShapeN"
  op: "ShapeN"
  input: "CDnCNN/block8/Relu"
  input: "CDnCNN/block9/conv9/kernel/read"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/CDnCNN/block9/conv9/Conv2D_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/CDnCNN/block9/conv9/Conv2D_grad/ShapeN"
  input: "CDnCNN/block9/conv9/kernel/read"
  input: "gradients/CDnCNN/block9/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/CDnCNN/block9/conv9/Conv2D_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "CDnCNN/block8/Relu"
  input: "gradients/CDnCNN/block9/conv9/Conv2D_grad/ShapeN:1"
  input: "gradients/CDnCNN/block9/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/CDnCNN/block9/conv9/Conv2D_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/CDnCNN/block9/conv9/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/CDnCNN/block9/conv9/Conv2D_grad/Conv2DBackpropInput"
}
node {
  name: "gradients/CDnCNN/block9/conv9/Conv2D_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/CDnCNN/block9/conv9/Conv2D_grad/Conv2DBackpropInput"
  input: "^gradients/CDnCNN/block9/conv9/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/CDnCNN/block9/conv9/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/CDnCNN/block9/conv9/Conv2D_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/CDnCNN/block9/conv9/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/CDnCNN/block9/conv9/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/CDnCNN/block9/conv9/Conv2D_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/CDnCNN/block8/Relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "gradients/CDnCNN/block9/conv9/Conv2D_grad/tuple/control_dependency"
  input: "CDnCNN/block8/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/CDnCNN/block8/conv8/Conv2D_grad/ShapeN"
  op: "ShapeN"
  input: "CDnCNN/block7/Relu"
  input: "CDnCNN/block8/conv8/kernel/read"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/CDnCNN/block8/conv8/Conv2D_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/CDnCNN/block8/conv8/Conv2D_grad/ShapeN"
  input: "CDnCNN/block8/conv8/kernel/read"
  input: "gradients/CDnCNN/block8/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/CDnCNN/block8/conv8/Conv2D_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "CDnCNN/block7/Relu"
  input: "gradients/CDnCNN/block8/conv8/Conv2D_grad/ShapeN:1"
  input: "gradients/CDnCNN/block8/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/CDnCNN/block8/conv8/Conv2D_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/CDnCNN/block8/conv8/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/CDnCNN/block8/conv8/Conv2D_grad/Conv2DBackpropInput"
}
node {
  name: "gradients/CDnCNN/block8/conv8/Conv2D_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/CDnCNN/block8/conv8/Conv2D_grad/Conv2DBackpropInput"
  input: "^gradients/CDnCNN/block8/conv8/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/CDnCNN/block8/conv8/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/CDnCNN/block8/conv8/Conv2D_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/CDnCNN/block8/conv8/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/CDnCNN/block8/conv8/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/CDnCNN/block8/conv8/Conv2D_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/CDnCNN/block7/Relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "gradients/CDnCNN/block8/conv8/Conv2D_grad/tuple/control_dependency"
  input: "CDnCNN/block7/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/CDnCNN/block7/conv7/Conv2D_grad/ShapeN"
  op: "ShapeN"
  input: "CDnCNN/block6/Relu"
  input: "CDnCNN/block7/conv7/kernel/read"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/CDnCNN/block7/conv7/Conv2D_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/CDnCNN/block7/conv7/Conv2D_grad/ShapeN"
  input: "CDnCNN/block7/conv7/kernel/read"
  input: "gradients/CDnCNN/block7/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/CDnCNN/block7/conv7/Conv2D_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "CDnCNN/block6/Relu"
  input: "gradients/CDnCNN/block7/conv7/Conv2D_grad/ShapeN:1"
  input: "gradients/CDnCNN/block7/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/CDnCNN/block7/conv7/Conv2D_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/CDnCNN/block7/conv7/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/CDnCNN/block7/conv7/Conv2D_grad/Conv2DBackpropInput"
}
node {
  name: "gradients/CDnCNN/block7/conv7/Conv2D_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/CDnCNN/block7/conv7/Conv2D_grad/Conv2DBackpropInput"
  input: "^gradients/CDnCNN/block7/conv7/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/CDnCNN/block7/conv7/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/CDnCNN/block7/conv7/Conv2D_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/CDnCNN/block7/conv7/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/CDnCNN/block7/conv7/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/CDnCNN/block7/conv7/Conv2D_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/CDnCNN/block6/Relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "gradients/CDnCNN/block7/conv7/Conv2D_grad/tuple/control_dependency"
  input: "CDnCNN/block6/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/CDnCNN/block6/conv6/Conv2D_grad/ShapeN"
  op: "ShapeN"
  input: "CDnCNN/block5/Relu"
  input: "CDnCNN/block6/conv6/kernel/read"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/CDnCNN/block6/conv6/Conv2D_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/CDnCNN/block6/conv6/Conv2D_grad/ShapeN"
  input: "CDnCNN/block6/conv6/kernel/read"
  input: "gradients/CDnCNN/block6/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/CDnCNN/block6/conv6/Conv2D_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "CDnCNN/block5/Relu"
  input: "gradients/CDnCNN/block6/conv6/Conv2D_grad/ShapeN:1"
  input: "gradients/CDnCNN/block6/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/CDnCNN/block6/conv6/Conv2D_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/CDnCNN/block6/conv6/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/CDnCNN/block6/conv6/Conv2D_grad/Conv2DBackpropInput"
}
node {
  name: "gradients/CDnCNN/block6/conv6/Conv2D_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/CDnCNN/block6/conv6/Conv2D_grad/Conv2DBackpropInput"
  input: "^gradients/CDnCNN/block6/conv6/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/CDnCNN/block6/conv6/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/CDnCNN/block6/conv6/Conv2D_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/CDnCNN/block6/conv6/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/CDnCNN/block6/conv6/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/CDnCNN/block6/conv6/Conv2D_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/CDnCNN/block5/Relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "gradients/CDnCNN/block6/conv6/Conv2D_grad/tuple/control_dependency"
  input: "CDnCNN/block5/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/CDnCNN/block5/conv5/Conv2D_grad/ShapeN"
  op: "ShapeN"
  input: "CDnCNN/block4/Relu"
  input: "CDnCNN/block5/conv5/kernel/read"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/CDnCNN/block5/conv5/Conv2D_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/CDnCNN/block5/conv5/Conv2D_grad/ShapeN"
  input: "CDnCNN/block5/conv5/kernel/read"
  input: "gradients/CDnCNN/block5/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/CDnCNN/block5/conv5/Conv2D_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "CDnCNN/block4/Relu"
  input: "gradients/CDnCNN/block5/conv5/Conv2D_grad/ShapeN:1"
  input: "gradients/CDnCNN/block5/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/CDnCNN/block5/conv5/Conv2D_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/CDnCNN/block5/conv5/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/CDnCNN/block5/conv5/Conv2D_grad/Conv2DBackpropInput"
}
node {
  name: "gradients/CDnCNN/block5/conv5/Conv2D_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/CDnCNN/block5/conv5/Conv2D_grad/Conv2DBackpropInput"
  input: "^gradients/CDnCNN/block5/conv5/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/CDnCNN/block5/conv5/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/CDnCNN/block5/conv5/Conv2D_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/CDnCNN/block5/conv5/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/CDnCNN/block5/conv5/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/CDnCNN/block5/conv5/Conv2D_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/CDnCNN/block4/Relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "gradients/CDnCNN/block5/conv5/Conv2D_grad/tuple/control_dependency"
  input: "CDnCNN/block4/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/CDnCNN/block4/conv4/Conv2D_grad/ShapeN"
  op: "ShapeN"
  input: "CDnCNN/block3/Relu"
  input: "CDnCNN/block4/conv4/kernel/read"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/CDnCNN/block4/conv4/Conv2D_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/CDnCNN/block4/conv4/Conv2D_grad/ShapeN"
  input: "CDnCNN/block4/conv4/kernel/read"
  input: "gradients/CDnCNN/block4/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/CDnCNN/block4/conv4/Conv2D_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "CDnCNN/block3/Relu"
  input: "gradients/CDnCNN/block4/conv4/Conv2D_grad/ShapeN:1"
  input: "gradients/CDnCNN/block4/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/CDnCNN/block4/conv4/Conv2D_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/CDnCNN/block4/conv4/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/CDnCNN/block4/conv4/Conv2D_grad/Conv2DBackpropInput"
}
node {
  name: "gradients/CDnCNN/block4/conv4/Conv2D_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/CDnCNN/block4/conv4/Conv2D_grad/Conv2DBackpropInput"
  input: "^gradients/CDnCNN/block4/conv4/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/CDnCNN/block4/conv4/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/CDnCNN/block4/conv4/Conv2D_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/CDnCNN/block4/conv4/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/CDnCNN/block4/conv4/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/CDnCNN/block4/conv4/Conv2D_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/CDnCNN/block3/Relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "gradients/CDnCNN/block4/conv4/Conv2D_grad/tuple/control_dependency"
  input: "CDnCNN/block3/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/CDnCNN/block3/conv3/Conv2D_grad/ShapeN"
  op: "ShapeN"
  input: "CDnCNN/block2/Relu"
  input: "CDnCNN/block3/conv3/kernel/read"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/CDnCNN/block3/conv3/Conv2D_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/CDnCNN/block3/conv3/Conv2D_grad/ShapeN"
  input: "CDnCNN/block3/conv3/kernel/read"
  input: "gradients/CDnCNN/block3/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/CDnCNN/block3/conv3/Conv2D_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "CDnCNN/block2/Relu"
  input: "gradients/CDnCNN/block3/conv3/Conv2D_grad/ShapeN:1"
  input: "gradients/CDnCNN/block3/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/CDnCNN/block3/conv3/Conv2D_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/CDnCNN/block3/conv3/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/CDnCNN/block3/conv3/Conv2D_grad/Conv2DBackpropInput"
}
node {
  name: "gradients/CDnCNN/block3/conv3/Conv2D_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/CDnCNN/block3/conv3/Conv2D_grad/Conv2DBackpropInput"
  input: "^gradients/CDnCNN/block3/conv3/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/CDnCNN/block3/conv3/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/CDnCNN/block3/conv3/Conv2D_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/CDnCNN/block3/conv3/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/CDnCNN/block3/conv3/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/CDnCNN/block3/conv3/Conv2D_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/CDnCNN/block2/Relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "gradients/CDnCNN/block3/conv3/Conv2D_grad/tuple/control_dependency"
  input: "CDnCNN/block2/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/CDnCNN/block2/conv2/Conv2D_grad/ShapeN"
  op: "ShapeN"
  input: "CDnCNN/block1/conv2d/Relu"
  input: "CDnCNN/block2/conv2/kernel/read"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/CDnCNN/block2/conv2/Conv2D_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/CDnCNN/block2/conv2/Conv2D_grad/ShapeN"
  input: "CDnCNN/block2/conv2/kernel/read"
  input: "gradients/CDnCNN/block2/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/CDnCNN/block2/conv2/Conv2D_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "CDnCNN/block1/conv2d/Relu"
  input: "gradients/CDnCNN/block2/conv2/Conv2D_grad/ShapeN:1"
  input: "gradients/CDnCNN/block2/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/CDnCNN/block2/conv2/Conv2D_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/CDnCNN/block2/conv2/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/CDnCNN/block2/conv2/Conv2D_grad/Conv2DBackpropInput"
}
node {
  name: "gradients/CDnCNN/block2/conv2/Conv2D_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/CDnCNN/block2/conv2/Conv2D_grad/Conv2DBackpropInput"
  input: "^gradients/CDnCNN/block2/conv2/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/CDnCNN/block2/conv2/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/CDnCNN/block2/conv2/Conv2D_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/CDnCNN/block2/conv2/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/CDnCNN/block2/conv2/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/CDnCNN/block2/conv2/Conv2D_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "gradients/CDnCNN/block1/conv2d/Relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "gradients/CDnCNN/block2/conv2/Conv2D_grad/tuple/control_dependency"
  input: "CDnCNN/block1/conv2d/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/CDnCNN/block1/conv2d/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "gradients/CDnCNN/block1/conv2d/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "gradients/CDnCNN/block1/conv2d/BiasAdd_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/CDnCNN/block1/conv2d/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/CDnCNN/block1/conv2d/Relu_grad/ReluGrad"
}
node {
  name: "gradients/CDnCNN/block1/conv2d/BiasAdd_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/CDnCNN/block1/conv2d/Relu_grad/ReluGrad"
  input: "^gradients/CDnCNN/block1/conv2d/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/CDnCNN/block1/conv2d/Relu_grad/ReluGrad"
      }
    }
  }
}
node {
  name: "gradients/CDnCNN/block1/conv2d/BiasAdd_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/CDnCNN/block1/conv2d/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/CDnCNN/block1/conv2d/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/CDnCNN/block1/conv2d/BiasAdd_grad/BiasAddGrad"
      }
    }
  }
}
node {
  name: "gradients/CDnCNN/block1/conv2d/Conv2D_grad/ShapeN"
  op: "ShapeN"
  input: "noisy_image"
  input: "CDnCNN/block1/conv2d/kernel/read"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/CDnCNN/block1/conv2d/Conv2D_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "gradients/CDnCNN/block1/conv2d/Conv2D_grad/ShapeN"
  input: "CDnCNN/block1/conv2d/kernel/read"
  input: "gradients/CDnCNN/block1/conv2d/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/CDnCNN/block1/conv2d/Conv2D_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "noisy_image"
  input: "gradients/CDnCNN/block1/conv2d/Conv2D_grad/ShapeN:1"
  input: "gradients/CDnCNN/block1/conv2d/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/CDnCNN/block1/conv2d/Conv2D_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/CDnCNN/block1/conv2d/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/CDnCNN/block1/conv2d/Conv2D_grad/Conv2DBackpropInput"
}
node {
  name: "gradients/CDnCNN/block1/conv2d/Conv2D_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/CDnCNN/block1/conv2d/Conv2D_grad/Conv2DBackpropInput"
  input: "^gradients/CDnCNN/block1/conv2d/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/CDnCNN/block1/conv2d/Conv2D_grad/Conv2DBackpropInput"
      }
    }
  }
}
node {
  name: "gradients/CDnCNN/block1/conv2d/Conv2D_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/CDnCNN/block1/conv2d/Conv2D_grad/Conv2DBackpropFilter"
  input: "^gradients/CDnCNN/block1/conv2d/Conv2D_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/CDnCNN/block1/conv2d/Conv2D_grad/Conv2DBackpropFilter"
      }
    }
  }
}
node {
  name: "beta1_power/initial_value"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.8999999761581421
      }
    }
  }
}
node {
  name: "beta1_power"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "beta1_power/Assign"
  op: "Assign"
  input: "beta1_power"
  input: "beta1_power/initial_value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "beta1_power/read"
  op: "Identity"
  input: "beta1_power"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/bias"
      }
    }
  }
}
node {
  name: "beta2_power/initial_value"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "beta2_power"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "beta2_power/Assign"
  op: "Assign"
  input: "beta2_power"
  input: "beta2_power/initial_value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "beta2_power/read"
  op: "Identity"
  input: "beta2_power"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/bias"
      }
    }
  }
}
node {
  name: "CDnCNN/block1/conv2d/kernel/AdamOptimizer/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\003\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "CDnCNN/block1/conv2d/kernel/AdamOptimizer/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "CDnCNN/block1/conv2d/kernel/AdamOptimizer/Initializer/zeros"
  op: "Fill"
  input: "CDnCNN/block1/conv2d/kernel/AdamOptimizer/Initializer/zeros/shape_as_tensor"
  input: "CDnCNN/block1/conv2d/kernel/AdamOptimizer/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/kernel"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "CDnCNN/block1/conv2d/kernel/AdamOptimizer"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "CDnCNN/block1/conv2d/kernel/AdamOptimizer/Assign"
  op: "Assign"
  input: "CDnCNN/block1/conv2d/kernel/AdamOptimizer"
  input: "CDnCNN/block1/conv2d/kernel/AdamOptimizer/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "CDnCNN/block1/conv2d/kernel/AdamOptimizer/read"
  op: "Identity"
  input: "CDnCNN/block1/conv2d/kernel/AdamOptimizer"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block1/conv2d/kernel/AdamOptimizer_1/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\003\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "CDnCNN/block1/conv2d/kernel/AdamOptimizer_1/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "CDnCNN/block1/conv2d/kernel/AdamOptimizer_1/Initializer/zeros"
  op: "Fill"
  input: "CDnCNN/block1/conv2d/kernel/AdamOptimizer_1/Initializer/zeros/shape_as_tensor"
  input: "CDnCNN/block1/conv2d/kernel/AdamOptimizer_1/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/kernel"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "CDnCNN/block1/conv2d/kernel/AdamOptimizer_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "CDnCNN/block1/conv2d/kernel/AdamOptimizer_1/Assign"
  op: "Assign"
  input: "CDnCNN/block1/conv2d/kernel/AdamOptimizer_1"
  input: "CDnCNN/block1/conv2d/kernel/AdamOptimizer_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "CDnCNN/block1/conv2d/kernel/AdamOptimizer_1/read"
  op: "Identity"
  input: "CDnCNN/block1/conv2d/kernel/AdamOptimizer_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block1/conv2d/bias/AdamOptimizer/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "CDnCNN/block1/conv2d/bias/AdamOptimizer"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "CDnCNN/block1/conv2d/bias/AdamOptimizer/Assign"
  op: "Assign"
  input: "CDnCNN/block1/conv2d/bias/AdamOptimizer"
  input: "CDnCNN/block1/conv2d/bias/AdamOptimizer/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "CDnCNN/block1/conv2d/bias/AdamOptimizer/read"
  op: "Identity"
  input: "CDnCNN/block1/conv2d/bias/AdamOptimizer"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/bias"
      }
    }
  }
}
node {
  name: "CDnCNN/block1/conv2d/bias/AdamOptimizer_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "CDnCNN/block1/conv2d/bias/AdamOptimizer_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "CDnCNN/block1/conv2d/bias/AdamOptimizer_1/Assign"
  op: "Assign"
  input: "CDnCNN/block1/conv2d/bias/AdamOptimizer_1"
  input: "CDnCNN/block1/conv2d/bias/AdamOptimizer_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "CDnCNN/block1/conv2d/bias/AdamOptimizer_1/read"
  op: "Identity"
  input: "CDnCNN/block1/conv2d/bias/AdamOptimizer_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/bias"
      }
    }
  }
}
node {
  name: "CDnCNN/block2/conv2/kernel/AdamOptimizer/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block2/conv2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "CDnCNN/block2/conv2/kernel/AdamOptimizer/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block2/conv2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "CDnCNN/block2/conv2/kernel/AdamOptimizer/Initializer/zeros"
  op: "Fill"
  input: "CDnCNN/block2/conv2/kernel/AdamOptimizer/Initializer/zeros/shape_as_tensor"
  input: "CDnCNN/block2/conv2/kernel/AdamOptimizer/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block2/conv2/kernel"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "CDnCNN/block2/conv2/kernel/AdamOptimizer"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block2/conv2/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "CDnCNN/block2/conv2/kernel/AdamOptimizer/Assign"
  op: "Assign"
  input: "CDnCNN/block2/conv2/kernel/AdamOptimizer"
  input: "CDnCNN/block2/conv2/kernel/AdamOptimizer/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block2/conv2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "CDnCNN/block2/conv2/kernel/AdamOptimizer/read"
  op: "Identity"
  input: "CDnCNN/block2/conv2/kernel/AdamOptimizer"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block2/conv2/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block2/conv2/kernel/AdamOptimizer_1/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block2/conv2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "CDnCNN/block2/conv2/kernel/AdamOptimizer_1/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block2/conv2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "CDnCNN/block2/conv2/kernel/AdamOptimizer_1/Initializer/zeros"
  op: "Fill"
  input: "CDnCNN/block2/conv2/kernel/AdamOptimizer_1/Initializer/zeros/shape_as_tensor"
  input: "CDnCNN/block2/conv2/kernel/AdamOptimizer_1/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block2/conv2/kernel"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "CDnCNN/block2/conv2/kernel/AdamOptimizer_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block2/conv2/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "CDnCNN/block2/conv2/kernel/AdamOptimizer_1/Assign"
  op: "Assign"
  input: "CDnCNN/block2/conv2/kernel/AdamOptimizer_1"
  input: "CDnCNN/block2/conv2/kernel/AdamOptimizer_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block2/conv2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "CDnCNN/block2/conv2/kernel/AdamOptimizer_1/read"
  op: "Identity"
  input: "CDnCNN/block2/conv2/kernel/AdamOptimizer_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block2/conv2/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block3/conv3/kernel/AdamOptimizer/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block3/conv3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "CDnCNN/block3/conv3/kernel/AdamOptimizer/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block3/conv3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "CDnCNN/block3/conv3/kernel/AdamOptimizer/Initializer/zeros"
  op: "Fill"
  input: "CDnCNN/block3/conv3/kernel/AdamOptimizer/Initializer/zeros/shape_as_tensor"
  input: "CDnCNN/block3/conv3/kernel/AdamOptimizer/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block3/conv3/kernel"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "CDnCNN/block3/conv3/kernel/AdamOptimizer"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block3/conv3/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "CDnCNN/block3/conv3/kernel/AdamOptimizer/Assign"
  op: "Assign"
  input: "CDnCNN/block3/conv3/kernel/AdamOptimizer"
  input: "CDnCNN/block3/conv3/kernel/AdamOptimizer/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block3/conv3/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "CDnCNN/block3/conv3/kernel/AdamOptimizer/read"
  op: "Identity"
  input: "CDnCNN/block3/conv3/kernel/AdamOptimizer"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block3/conv3/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block3/conv3/kernel/AdamOptimizer_1/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block3/conv3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "CDnCNN/block3/conv3/kernel/AdamOptimizer_1/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block3/conv3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "CDnCNN/block3/conv3/kernel/AdamOptimizer_1/Initializer/zeros"
  op: "Fill"
  input: "CDnCNN/block3/conv3/kernel/AdamOptimizer_1/Initializer/zeros/shape_as_tensor"
  input: "CDnCNN/block3/conv3/kernel/AdamOptimizer_1/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block3/conv3/kernel"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "CDnCNN/block3/conv3/kernel/AdamOptimizer_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block3/conv3/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "CDnCNN/block3/conv3/kernel/AdamOptimizer_1/Assign"
  op: "Assign"
  input: "CDnCNN/block3/conv3/kernel/AdamOptimizer_1"
  input: "CDnCNN/block3/conv3/kernel/AdamOptimizer_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block3/conv3/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "CDnCNN/block3/conv3/kernel/AdamOptimizer_1/read"
  op: "Identity"
  input: "CDnCNN/block3/conv3/kernel/AdamOptimizer_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block3/conv3/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block4/conv4/kernel/AdamOptimizer/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block4/conv4/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "CDnCNN/block4/conv4/kernel/AdamOptimizer/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block4/conv4/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "CDnCNN/block4/conv4/kernel/AdamOptimizer/Initializer/zeros"
  op: "Fill"
  input: "CDnCNN/block4/conv4/kernel/AdamOptimizer/Initializer/zeros/shape_as_tensor"
  input: "CDnCNN/block4/conv4/kernel/AdamOptimizer/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block4/conv4/kernel"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "CDnCNN/block4/conv4/kernel/AdamOptimizer"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block4/conv4/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "CDnCNN/block4/conv4/kernel/AdamOptimizer/Assign"
  op: "Assign"
  input: "CDnCNN/block4/conv4/kernel/AdamOptimizer"
  input: "CDnCNN/block4/conv4/kernel/AdamOptimizer/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block4/conv4/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "CDnCNN/block4/conv4/kernel/AdamOptimizer/read"
  op: "Identity"
  input: "CDnCNN/block4/conv4/kernel/AdamOptimizer"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block4/conv4/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block4/conv4/kernel/AdamOptimizer_1/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block4/conv4/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "CDnCNN/block4/conv4/kernel/AdamOptimizer_1/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block4/conv4/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "CDnCNN/block4/conv4/kernel/AdamOptimizer_1/Initializer/zeros"
  op: "Fill"
  input: "CDnCNN/block4/conv4/kernel/AdamOptimizer_1/Initializer/zeros/shape_as_tensor"
  input: "CDnCNN/block4/conv4/kernel/AdamOptimizer_1/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block4/conv4/kernel"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "CDnCNN/block4/conv4/kernel/AdamOptimizer_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block4/conv4/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "CDnCNN/block4/conv4/kernel/AdamOptimizer_1/Assign"
  op: "Assign"
  input: "CDnCNN/block4/conv4/kernel/AdamOptimizer_1"
  input: "CDnCNN/block4/conv4/kernel/AdamOptimizer_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block4/conv4/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "CDnCNN/block4/conv4/kernel/AdamOptimizer_1/read"
  op: "Identity"
  input: "CDnCNN/block4/conv4/kernel/AdamOptimizer_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block4/conv4/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block5/conv5/kernel/AdamOptimizer/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block5/conv5/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "CDnCNN/block5/conv5/kernel/AdamOptimizer/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block5/conv5/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "CDnCNN/block5/conv5/kernel/AdamOptimizer/Initializer/zeros"
  op: "Fill"
  input: "CDnCNN/block5/conv5/kernel/AdamOptimizer/Initializer/zeros/shape_as_tensor"
  input: "CDnCNN/block5/conv5/kernel/AdamOptimizer/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block5/conv5/kernel"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "CDnCNN/block5/conv5/kernel/AdamOptimizer"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block5/conv5/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "CDnCNN/block5/conv5/kernel/AdamOptimizer/Assign"
  op: "Assign"
  input: "CDnCNN/block5/conv5/kernel/AdamOptimizer"
  input: "CDnCNN/block5/conv5/kernel/AdamOptimizer/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block5/conv5/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "CDnCNN/block5/conv5/kernel/AdamOptimizer/read"
  op: "Identity"
  input: "CDnCNN/block5/conv5/kernel/AdamOptimizer"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block5/conv5/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block5/conv5/kernel/AdamOptimizer_1/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block5/conv5/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "CDnCNN/block5/conv5/kernel/AdamOptimizer_1/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block5/conv5/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "CDnCNN/block5/conv5/kernel/AdamOptimizer_1/Initializer/zeros"
  op: "Fill"
  input: "CDnCNN/block5/conv5/kernel/AdamOptimizer_1/Initializer/zeros/shape_as_tensor"
  input: "CDnCNN/block5/conv5/kernel/AdamOptimizer_1/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block5/conv5/kernel"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "CDnCNN/block5/conv5/kernel/AdamOptimizer_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block5/conv5/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "CDnCNN/block5/conv5/kernel/AdamOptimizer_1/Assign"
  op: "Assign"
  input: "CDnCNN/block5/conv5/kernel/AdamOptimizer_1"
  input: "CDnCNN/block5/conv5/kernel/AdamOptimizer_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block5/conv5/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "CDnCNN/block5/conv5/kernel/AdamOptimizer_1/read"
  op: "Identity"
  input: "CDnCNN/block5/conv5/kernel/AdamOptimizer_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block5/conv5/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block6/conv6/kernel/AdamOptimizer/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block6/conv6/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "CDnCNN/block6/conv6/kernel/AdamOptimizer/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block6/conv6/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "CDnCNN/block6/conv6/kernel/AdamOptimizer/Initializer/zeros"
  op: "Fill"
  input: "CDnCNN/block6/conv6/kernel/AdamOptimizer/Initializer/zeros/shape_as_tensor"
  input: "CDnCNN/block6/conv6/kernel/AdamOptimizer/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block6/conv6/kernel"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "CDnCNN/block6/conv6/kernel/AdamOptimizer"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block6/conv6/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "CDnCNN/block6/conv6/kernel/AdamOptimizer/Assign"
  op: "Assign"
  input: "CDnCNN/block6/conv6/kernel/AdamOptimizer"
  input: "CDnCNN/block6/conv6/kernel/AdamOptimizer/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block6/conv6/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "CDnCNN/block6/conv6/kernel/AdamOptimizer/read"
  op: "Identity"
  input: "CDnCNN/block6/conv6/kernel/AdamOptimizer"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block6/conv6/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block6/conv6/kernel/AdamOptimizer_1/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block6/conv6/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "CDnCNN/block6/conv6/kernel/AdamOptimizer_1/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block6/conv6/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "CDnCNN/block6/conv6/kernel/AdamOptimizer_1/Initializer/zeros"
  op: "Fill"
  input: "CDnCNN/block6/conv6/kernel/AdamOptimizer_1/Initializer/zeros/shape_as_tensor"
  input: "CDnCNN/block6/conv6/kernel/AdamOptimizer_1/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block6/conv6/kernel"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "CDnCNN/block6/conv6/kernel/AdamOptimizer_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block6/conv6/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "CDnCNN/block6/conv6/kernel/AdamOptimizer_1/Assign"
  op: "Assign"
  input: "CDnCNN/block6/conv6/kernel/AdamOptimizer_1"
  input: "CDnCNN/block6/conv6/kernel/AdamOptimizer_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block6/conv6/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "CDnCNN/block6/conv6/kernel/AdamOptimizer_1/read"
  op: "Identity"
  input: "CDnCNN/block6/conv6/kernel/AdamOptimizer_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block6/conv6/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block7/conv7/kernel/AdamOptimizer/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block7/conv7/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "CDnCNN/block7/conv7/kernel/AdamOptimizer/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block7/conv7/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "CDnCNN/block7/conv7/kernel/AdamOptimizer/Initializer/zeros"
  op: "Fill"
  input: "CDnCNN/block7/conv7/kernel/AdamOptimizer/Initializer/zeros/shape_as_tensor"
  input: "CDnCNN/block7/conv7/kernel/AdamOptimizer/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block7/conv7/kernel"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "CDnCNN/block7/conv7/kernel/AdamOptimizer"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block7/conv7/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "CDnCNN/block7/conv7/kernel/AdamOptimizer/Assign"
  op: "Assign"
  input: "CDnCNN/block7/conv7/kernel/AdamOptimizer"
  input: "CDnCNN/block7/conv7/kernel/AdamOptimizer/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block7/conv7/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "CDnCNN/block7/conv7/kernel/AdamOptimizer/read"
  op: "Identity"
  input: "CDnCNN/block7/conv7/kernel/AdamOptimizer"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block7/conv7/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block7/conv7/kernel/AdamOptimizer_1/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block7/conv7/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "CDnCNN/block7/conv7/kernel/AdamOptimizer_1/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block7/conv7/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "CDnCNN/block7/conv7/kernel/AdamOptimizer_1/Initializer/zeros"
  op: "Fill"
  input: "CDnCNN/block7/conv7/kernel/AdamOptimizer_1/Initializer/zeros/shape_as_tensor"
  input: "CDnCNN/block7/conv7/kernel/AdamOptimizer_1/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block7/conv7/kernel"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "CDnCNN/block7/conv7/kernel/AdamOptimizer_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block7/conv7/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "CDnCNN/block7/conv7/kernel/AdamOptimizer_1/Assign"
  op: "Assign"
  input: "CDnCNN/block7/conv7/kernel/AdamOptimizer_1"
  input: "CDnCNN/block7/conv7/kernel/AdamOptimizer_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block7/conv7/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "CDnCNN/block7/conv7/kernel/AdamOptimizer_1/read"
  op: "Identity"
  input: "CDnCNN/block7/conv7/kernel/AdamOptimizer_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block7/conv7/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block8/conv8/kernel/AdamOptimizer/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block8/conv8/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "CDnCNN/block8/conv8/kernel/AdamOptimizer/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block8/conv8/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "CDnCNN/block8/conv8/kernel/AdamOptimizer/Initializer/zeros"
  op: "Fill"
  input: "CDnCNN/block8/conv8/kernel/AdamOptimizer/Initializer/zeros/shape_as_tensor"
  input: "CDnCNN/block8/conv8/kernel/AdamOptimizer/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block8/conv8/kernel"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "CDnCNN/block8/conv8/kernel/AdamOptimizer"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block8/conv8/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "CDnCNN/block8/conv8/kernel/AdamOptimizer/Assign"
  op: "Assign"
  input: "CDnCNN/block8/conv8/kernel/AdamOptimizer"
  input: "CDnCNN/block8/conv8/kernel/AdamOptimizer/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block8/conv8/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "CDnCNN/block8/conv8/kernel/AdamOptimizer/read"
  op: "Identity"
  input: "CDnCNN/block8/conv8/kernel/AdamOptimizer"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block8/conv8/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block8/conv8/kernel/AdamOptimizer_1/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block8/conv8/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "CDnCNN/block8/conv8/kernel/AdamOptimizer_1/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block8/conv8/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "CDnCNN/block8/conv8/kernel/AdamOptimizer_1/Initializer/zeros"
  op: "Fill"
  input: "CDnCNN/block8/conv8/kernel/AdamOptimizer_1/Initializer/zeros/shape_as_tensor"
  input: "CDnCNN/block8/conv8/kernel/AdamOptimizer_1/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block8/conv8/kernel"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "CDnCNN/block8/conv8/kernel/AdamOptimizer_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block8/conv8/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "CDnCNN/block8/conv8/kernel/AdamOptimizer_1/Assign"
  op: "Assign"
  input: "CDnCNN/block8/conv8/kernel/AdamOptimizer_1"
  input: "CDnCNN/block8/conv8/kernel/AdamOptimizer_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block8/conv8/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "CDnCNN/block8/conv8/kernel/AdamOptimizer_1/read"
  op: "Identity"
  input: "CDnCNN/block8/conv8/kernel/AdamOptimizer_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block8/conv8/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block9/conv9/kernel/AdamOptimizer/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block9/conv9/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "CDnCNN/block9/conv9/kernel/AdamOptimizer/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block9/conv9/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "CDnCNN/block9/conv9/kernel/AdamOptimizer/Initializer/zeros"
  op: "Fill"
  input: "CDnCNN/block9/conv9/kernel/AdamOptimizer/Initializer/zeros/shape_as_tensor"
  input: "CDnCNN/block9/conv9/kernel/AdamOptimizer/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block9/conv9/kernel"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "CDnCNN/block9/conv9/kernel/AdamOptimizer"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block9/conv9/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "CDnCNN/block9/conv9/kernel/AdamOptimizer/Assign"
  op: "Assign"
  input: "CDnCNN/block9/conv9/kernel/AdamOptimizer"
  input: "CDnCNN/block9/conv9/kernel/AdamOptimizer/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block9/conv9/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "CDnCNN/block9/conv9/kernel/AdamOptimizer/read"
  op: "Identity"
  input: "CDnCNN/block9/conv9/kernel/AdamOptimizer"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block9/conv9/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block9/conv9/kernel/AdamOptimizer_1/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block9/conv9/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "CDnCNN/block9/conv9/kernel/AdamOptimizer_1/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block9/conv9/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "CDnCNN/block9/conv9/kernel/AdamOptimizer_1/Initializer/zeros"
  op: "Fill"
  input: "CDnCNN/block9/conv9/kernel/AdamOptimizer_1/Initializer/zeros/shape_as_tensor"
  input: "CDnCNN/block9/conv9/kernel/AdamOptimizer_1/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block9/conv9/kernel"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "CDnCNN/block9/conv9/kernel/AdamOptimizer_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block9/conv9/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "CDnCNN/block9/conv9/kernel/AdamOptimizer_1/Assign"
  op: "Assign"
  input: "CDnCNN/block9/conv9/kernel/AdamOptimizer_1"
  input: "CDnCNN/block9/conv9/kernel/AdamOptimizer_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block9/conv9/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "CDnCNN/block9/conv9/kernel/AdamOptimizer_1/read"
  op: "Identity"
  input: "CDnCNN/block9/conv9/kernel/AdamOptimizer_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block9/conv9/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block10/conv2d/kernel/AdamOptimizer/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block10/conv2d/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\003\000\000\000"
      }
    }
  }
}
node {
  name: "CDnCNN/block10/conv2d/kernel/AdamOptimizer/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block10/conv2d/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "CDnCNN/block10/conv2d/kernel/AdamOptimizer/Initializer/zeros"
  op: "Fill"
  input: "CDnCNN/block10/conv2d/kernel/AdamOptimizer/Initializer/zeros/shape_as_tensor"
  input: "CDnCNN/block10/conv2d/kernel/AdamOptimizer/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block10/conv2d/kernel"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "CDnCNN/block10/conv2d/kernel/AdamOptimizer"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block10/conv2d/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 3
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "CDnCNN/block10/conv2d/kernel/AdamOptimizer/Assign"
  op: "Assign"
  input: "CDnCNN/block10/conv2d/kernel/AdamOptimizer"
  input: "CDnCNN/block10/conv2d/kernel/AdamOptimizer/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block10/conv2d/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "CDnCNN/block10/conv2d/kernel/AdamOptimizer/read"
  op: "Identity"
  input: "CDnCNN/block10/conv2d/kernel/AdamOptimizer"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block10/conv2d/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block10/conv2d/kernel/AdamOptimizer_1/Initializer/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block10/conv2d/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\003\000\000\000"
      }
    }
  }
}
node {
  name: "CDnCNN/block10/conv2d/kernel/AdamOptimizer_1/Initializer/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block10/conv2d/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "CDnCNN/block10/conv2d/kernel/AdamOptimizer_1/Initializer/zeros"
  op: "Fill"
  input: "CDnCNN/block10/conv2d/kernel/AdamOptimizer_1/Initializer/zeros/shape_as_tensor"
  input: "CDnCNN/block10/conv2d/kernel/AdamOptimizer_1/Initializer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block10/conv2d/kernel"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "CDnCNN/block10/conv2d/kernel/AdamOptimizer_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block10/conv2d/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 3
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "CDnCNN/block10/conv2d/kernel/AdamOptimizer_1/Assign"
  op: "Assign"
  input: "CDnCNN/block10/conv2d/kernel/AdamOptimizer_1"
  input: "CDnCNN/block10/conv2d/kernel/AdamOptimizer_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block10/conv2d/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "CDnCNN/block10/conv2d/kernel/AdamOptimizer_1/read"
  op: "Identity"
  input: "CDnCNN/block10/conv2d/kernel/AdamOptimizer_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block10/conv2d/kernel"
      }
    }
  }
}
node {
  name: "CDnCNN/block10/conv2d/bias/AdamOptimizer/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block10/conv2d/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "CDnCNN/block10/conv2d/bias/AdamOptimizer"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block10/conv2d/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "CDnCNN/block10/conv2d/bias/AdamOptimizer/Assign"
  op: "Assign"
  input: "CDnCNN/block10/conv2d/bias/AdamOptimizer"
  input: "CDnCNN/block10/conv2d/bias/AdamOptimizer/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block10/conv2d/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "CDnCNN/block10/conv2d/bias/AdamOptimizer/read"
  op: "Identity"
  input: "CDnCNN/block10/conv2d/bias/AdamOptimizer"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block10/conv2d/bias"
      }
    }
  }
}
node {
  name: "CDnCNN/block10/conv2d/bias/AdamOptimizer_1/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block10/conv2d/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "CDnCNN/block10/conv2d/bias/AdamOptimizer_1"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block10/conv2d/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "CDnCNN/block10/conv2d/bias/AdamOptimizer_1/Assign"
  op: "Assign"
  input: "CDnCNN/block10/conv2d/bias/AdamOptimizer_1"
  input: "CDnCNN/block10/conv2d/bias/AdamOptimizer_1/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block10/conv2d/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "CDnCNN/block10/conv2d/bias/AdamOptimizer_1/read"
  op: "Identity"
  input: "CDnCNN/block10/conv2d/bias/AdamOptimizer_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block10/conv2d/bias"
      }
    }
  }
}
node {
  name: "AdamOptimizer/beta1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.8999999761581421
      }
    }
  }
}
node {
  name: "AdamOptimizer/beta2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.9990000128746033
      }
    }
  }
}
node {
  name: "AdamOptimizer/epsilon"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 9.99999993922529e-09
      }
    }
  }
}
node {
  name: "AdamOptimizer/update_CDnCNN/block1/conv2d/kernel/ApplyAdam"
  op: "ApplyAdam"
  input: "CDnCNN/block1/conv2d/kernel"
  input: "CDnCNN/block1/conv2d/kernel/AdamOptimizer"
  input: "CDnCNN/block1/conv2d/kernel/AdamOptimizer_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "learning_rate"
  input: "AdamOptimizer/beta1"
  input: "AdamOptimizer/beta2"
  input: "AdamOptimizer/epsilon"
  input: "gradients/CDnCNN/block1/conv2d/Conv2D_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "AdamOptimizer/update_CDnCNN/block1/conv2d/bias/ApplyAdam"
  op: "ApplyAdam"
  input: "CDnCNN/block1/conv2d/bias"
  input: "CDnCNN/block1/conv2d/bias/AdamOptimizer"
  input: "CDnCNN/block1/conv2d/bias/AdamOptimizer_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "learning_rate"
  input: "AdamOptimizer/beta1"
  input: "AdamOptimizer/beta2"
  input: "AdamOptimizer/epsilon"
  input: "gradients/CDnCNN/block1/conv2d/BiasAdd_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "AdamOptimizer/update_CDnCNN/block2/conv2/kernel/ApplyAdam"
  op: "ApplyAdam"
  input: "CDnCNN/block2/conv2/kernel"
  input: "CDnCNN/block2/conv2/kernel/AdamOptimizer"
  input: "CDnCNN/block2/conv2/kernel/AdamOptimizer_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "learning_rate"
  input: "AdamOptimizer/beta1"
  input: "AdamOptimizer/beta2"
  input: "AdamOptimizer/epsilon"
  input: "gradients/CDnCNN/block2/conv2/Conv2D_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block2/conv2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "AdamOptimizer/update_CDnCNN/block3/conv3/kernel/ApplyAdam"
  op: "ApplyAdam"
  input: "CDnCNN/block3/conv3/kernel"
  input: "CDnCNN/block3/conv3/kernel/AdamOptimizer"
  input: "CDnCNN/block3/conv3/kernel/AdamOptimizer_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "learning_rate"
  input: "AdamOptimizer/beta1"
  input: "AdamOptimizer/beta2"
  input: "AdamOptimizer/epsilon"
  input: "gradients/CDnCNN/block3/conv3/Conv2D_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block3/conv3/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "AdamOptimizer/update_CDnCNN/block4/conv4/kernel/ApplyAdam"
  op: "ApplyAdam"
  input: "CDnCNN/block4/conv4/kernel"
  input: "CDnCNN/block4/conv4/kernel/AdamOptimizer"
  input: "CDnCNN/block4/conv4/kernel/AdamOptimizer_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "learning_rate"
  input: "AdamOptimizer/beta1"
  input: "AdamOptimizer/beta2"
  input: "AdamOptimizer/epsilon"
  input: "gradients/CDnCNN/block4/conv4/Conv2D_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block4/conv4/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "AdamOptimizer/update_CDnCNN/block5/conv5/kernel/ApplyAdam"
  op: "ApplyAdam"
  input: "CDnCNN/block5/conv5/kernel"
  input: "CDnCNN/block5/conv5/kernel/AdamOptimizer"
  input: "CDnCNN/block5/conv5/kernel/AdamOptimizer_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "learning_rate"
  input: "AdamOptimizer/beta1"
  input: "AdamOptimizer/beta2"
  input: "AdamOptimizer/epsilon"
  input: "gradients/CDnCNN/block5/conv5/Conv2D_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block5/conv5/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "AdamOptimizer/update_CDnCNN/block6/conv6/kernel/ApplyAdam"
  op: "ApplyAdam"
  input: "CDnCNN/block6/conv6/kernel"
  input: "CDnCNN/block6/conv6/kernel/AdamOptimizer"
  input: "CDnCNN/block6/conv6/kernel/AdamOptimizer_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "learning_rate"
  input: "AdamOptimizer/beta1"
  input: "AdamOptimizer/beta2"
  input: "AdamOptimizer/epsilon"
  input: "gradients/CDnCNN/block6/conv6/Conv2D_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block6/conv6/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "AdamOptimizer/update_CDnCNN/block7/conv7/kernel/ApplyAdam"
  op: "ApplyAdam"
  input: "CDnCNN/block7/conv7/kernel"
  input: "CDnCNN/block7/conv7/kernel/AdamOptimizer"
  input: "CDnCNN/block7/conv7/kernel/AdamOptimizer_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "learning_rate"
  input: "AdamOptimizer/beta1"
  input: "AdamOptimizer/beta2"
  input: "AdamOptimizer/epsilon"
  input: "gradients/CDnCNN/block7/conv7/Conv2D_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block7/conv7/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "AdamOptimizer/update_CDnCNN/block8/conv8/kernel/ApplyAdam"
  op: "ApplyAdam"
  input: "CDnCNN/block8/conv8/kernel"
  input: "CDnCNN/block8/conv8/kernel/AdamOptimizer"
  input: "CDnCNN/block8/conv8/kernel/AdamOptimizer_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "learning_rate"
  input: "AdamOptimizer/beta1"
  input: "AdamOptimizer/beta2"
  input: "AdamOptimizer/epsilon"
  input: "gradients/CDnCNN/block8/conv8/Conv2D_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block8/conv8/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "AdamOptimizer/update_CDnCNN/block9/conv9/kernel/ApplyAdam"
  op: "ApplyAdam"
  input: "CDnCNN/block9/conv9/kernel"
  input: "CDnCNN/block9/conv9/kernel/AdamOptimizer"
  input: "CDnCNN/block9/conv9/kernel/AdamOptimizer_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "learning_rate"
  input: "AdamOptimizer/beta1"
  input: "AdamOptimizer/beta2"
  input: "AdamOptimizer/epsilon"
  input: "gradients/CDnCNN/block9/conv9/Conv2D_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block9/conv9/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "AdamOptimizer/update_CDnCNN/block10/conv2d/kernel/ApplyAdam"
  op: "ApplyAdam"
  input: "CDnCNN/block10/conv2d/kernel"
  input: "CDnCNN/block10/conv2d/kernel/AdamOptimizer"
  input: "CDnCNN/block10/conv2d/kernel/AdamOptimizer_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "learning_rate"
  input: "AdamOptimizer/beta1"
  input: "AdamOptimizer/beta2"
  input: "AdamOptimizer/epsilon"
  input: "gradients/CDnCNN/block10/conv2d/Conv2D_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block10/conv2d/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "AdamOptimizer/update_CDnCNN/block10/conv2d/bias/ApplyAdam"
  op: "ApplyAdam"
  input: "CDnCNN/block10/conv2d/bias"
  input: "CDnCNN/block10/conv2d/bias/AdamOptimizer"
  input: "CDnCNN/block10/conv2d/bias/AdamOptimizer_1"
  input: "beta1_power/read"
  input: "beta2_power/read"
  input: "learning_rate"
  input: "AdamOptimizer/beta1"
  input: "AdamOptimizer/beta2"
  input: "AdamOptimizer/epsilon"
  input: "gradients/CDnCNN/block10/conv2d/BiasAdd_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block10/conv2d/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "use_nesterov"
    value {
      b: false
    }
  }
}
node {
  name: "AdamOptimizer/mul"
  op: "Mul"
  input: "beta1_power/read"
  input: "AdamOptimizer/beta1"
  input: "^AdamOptimizer/update_CDnCNN/block1/conv2d/bias/ApplyAdam"
  input: "^AdamOptimizer/update_CDnCNN/block1/conv2d/kernel/ApplyAdam"
  input: "^AdamOptimizer/update_CDnCNN/block10/conv2d/bias/ApplyAdam"
  input: "^AdamOptimizer/update_CDnCNN/block10/conv2d/kernel/ApplyAdam"
  input: "^AdamOptimizer/update_CDnCNN/block2/conv2/kernel/ApplyAdam"
  input: "^AdamOptimizer/update_CDnCNN/block3/conv3/kernel/ApplyAdam"
  input: "^AdamOptimizer/update_CDnCNN/block4/conv4/kernel/ApplyAdam"
  input: "^AdamOptimizer/update_CDnCNN/block5/conv5/kernel/ApplyAdam"
  input: "^AdamOptimizer/update_CDnCNN/block6/conv6/kernel/ApplyAdam"
  input: "^AdamOptimizer/update_CDnCNN/block7/conv7/kernel/ApplyAdam"
  input: "^AdamOptimizer/update_CDnCNN/block8/conv8/kernel/ApplyAdam"
  input: "^AdamOptimizer/update_CDnCNN/block9/conv9/kernel/ApplyAdam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/bias"
      }
    }
  }
}
node {
  name: "AdamOptimizer/Assign"
  op: "Assign"
  input: "beta1_power"
  input: "AdamOptimizer/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "AdamOptimizer/mul_1"
  op: "Mul"
  input: "beta2_power/read"
  input: "AdamOptimizer/beta2"
  input: "^AdamOptimizer/update_CDnCNN/block1/conv2d/bias/ApplyAdam"
  input: "^AdamOptimizer/update_CDnCNN/block1/conv2d/kernel/ApplyAdam"
  input: "^AdamOptimizer/update_CDnCNN/block10/conv2d/bias/ApplyAdam"
  input: "^AdamOptimizer/update_CDnCNN/block10/conv2d/kernel/ApplyAdam"
  input: "^AdamOptimizer/update_CDnCNN/block2/conv2/kernel/ApplyAdam"
  input: "^AdamOptimizer/update_CDnCNN/block3/conv3/kernel/ApplyAdam"
  input: "^AdamOptimizer/update_CDnCNN/block4/conv4/kernel/ApplyAdam"
  input: "^AdamOptimizer/update_CDnCNN/block5/conv5/kernel/ApplyAdam"
  input: "^AdamOptimizer/update_CDnCNN/block6/conv6/kernel/ApplyAdam"
  input: "^AdamOptimizer/update_CDnCNN/block7/conv7/kernel/ApplyAdam"
  input: "^AdamOptimizer/update_CDnCNN/block8/conv8/kernel/ApplyAdam"
  input: "^AdamOptimizer/update_CDnCNN/block9/conv9/kernel/ApplyAdam"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/bias"
      }
    }
  }
}
node {
  name: "AdamOptimizer/Assign_1"
  op: "Assign"
  input: "beta2_power"
  input: "AdamOptimizer/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "AdamOptimizer"
  op: "NoOp"
  input: "^AdamOptimizer/Assign"
  input: "^AdamOptimizer/Assign_1"
  input: "^AdamOptimizer/update_CDnCNN/block1/conv2d/bias/ApplyAdam"
  input: "^AdamOptimizer/update_CDnCNN/block1/conv2d/kernel/ApplyAdam"
  input: "^AdamOptimizer/update_CDnCNN/block10/conv2d/bias/ApplyAdam"
  input: "^AdamOptimizer/update_CDnCNN/block10/conv2d/kernel/ApplyAdam"
  input: "^AdamOptimizer/update_CDnCNN/block2/conv2/kernel/ApplyAdam"
  input: "^AdamOptimizer/update_CDnCNN/block3/conv3/kernel/ApplyAdam"
  input: "^AdamOptimizer/update_CDnCNN/block4/conv4/kernel/ApplyAdam"
  input: "^AdamOptimizer/update_CDnCNN/block5/conv5/kernel/ApplyAdam"
  input: "^AdamOptimizer/update_CDnCNN/block6/conv6/kernel/ApplyAdam"
  input: "^AdamOptimizer/update_CDnCNN/block7/conv7/kernel/ApplyAdam"
  input: "^AdamOptimizer/update_CDnCNN/block8/conv8/kernel/ApplyAdam"
  input: "^AdamOptimizer/update_CDnCNN/block9/conv9/kernel/ApplyAdam"
}
node {
  name: "save/filename/input"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "model"
      }
    }
  }
}
node {
  name: "save/filename"
  op: "PlaceholderWithDefault"
  input: "save/filename/input"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
}
node {
  name: "save/Const"
  op: "PlaceholderWithDefault"
  input: "save/filename"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
}
node {
  name: "save/SaveV2/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 38
          }
        }
        string_val: "CDnCNN/block1/conv2d/bias"
        string_val: "CDnCNN/block1/conv2d/bias/AdamOptimizer"
        string_val: "CDnCNN/block1/conv2d/bias/AdamOptimizer_1"
        string_val: "CDnCNN/block1/conv2d/kernel"
        string_val: "CDnCNN/block1/conv2d/kernel/AdamOptimizer"
        string_val: "CDnCNN/block1/conv2d/kernel/AdamOptimizer_1"
        string_val: "CDnCNN/block10/conv2d/bias"
        string_val: "CDnCNN/block10/conv2d/bias/AdamOptimizer"
        string_val: "CDnCNN/block10/conv2d/bias/AdamOptimizer_1"
        string_val: "CDnCNN/block10/conv2d/kernel"
        string_val: "CDnCNN/block10/conv2d/kernel/AdamOptimizer"
        string_val: "CDnCNN/block10/conv2d/kernel/AdamOptimizer_1"
        string_val: "CDnCNN/block2/conv2/kernel"
        string_val: "CDnCNN/block2/conv2/kernel/AdamOptimizer"
        string_val: "CDnCNN/block2/conv2/kernel/AdamOptimizer_1"
        string_val: "CDnCNN/block3/conv3/kernel"
        string_val: "CDnCNN/block3/conv3/kernel/AdamOptimizer"
        string_val: "CDnCNN/block3/conv3/kernel/AdamOptimizer_1"
        string_val: "CDnCNN/block4/conv4/kernel"
        string_val: "CDnCNN/block4/conv4/kernel/AdamOptimizer"
        string_val: "CDnCNN/block4/conv4/kernel/AdamOptimizer_1"
        string_val: "CDnCNN/block5/conv5/kernel"
        string_val: "CDnCNN/block5/conv5/kernel/AdamOptimizer"
        string_val: "CDnCNN/block5/conv5/kernel/AdamOptimizer_1"
        string_val: "CDnCNN/block6/conv6/kernel"
        string_val: "CDnCNN/block6/conv6/kernel/AdamOptimizer"
        string_val: "CDnCNN/block6/conv6/kernel/AdamOptimizer_1"
        string_val: "CDnCNN/block7/conv7/kernel"
        string_val: "CDnCNN/block7/conv7/kernel/AdamOptimizer"
        string_val: "CDnCNN/block7/conv7/kernel/AdamOptimizer_1"
        string_val: "CDnCNN/block8/conv8/kernel"
        string_val: "CDnCNN/block8/conv8/kernel/AdamOptimizer"
        string_val: "CDnCNN/block8/conv8/kernel/AdamOptimizer_1"
        string_val: "CDnCNN/block9/conv9/kernel"
        string_val: "CDnCNN/block9/conv9/kernel/AdamOptimizer"
        string_val: "CDnCNN/block9/conv9/kernel/AdamOptimizer_1"
        string_val: "beta1_power"
        string_val: "beta2_power"
      }
    }
  }
}
node {
  name: "save/SaveV2/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 38
          }
        }
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
      }
    }
  }
}
node {
  name: "save/SaveV2"
  op: "SaveV2"
  input: "save/Const"
  input: "save/SaveV2/tensor_names"
  input: "save/SaveV2/shape_and_slices"
  input: "CDnCNN/block1/conv2d/bias"
  input: "CDnCNN/block1/conv2d/bias/AdamOptimizer"
  input: "CDnCNN/block1/conv2d/bias/AdamOptimizer_1"
  input: "CDnCNN/block1/conv2d/kernel"
  input: "CDnCNN/block1/conv2d/kernel/AdamOptimizer"
  input: "CDnCNN/block1/conv2d/kernel/AdamOptimizer_1"
  input: "CDnCNN/block10/conv2d/bias"
  input: "CDnCNN/block10/conv2d/bias/AdamOptimizer"
  input: "CDnCNN/block10/conv2d/bias/AdamOptimizer_1"
  input: "CDnCNN/block10/conv2d/kernel"
  input: "CDnCNN/block10/conv2d/kernel/AdamOptimizer"
  input: "CDnCNN/block10/conv2d/kernel/AdamOptimizer_1"
  input: "CDnCNN/block2/conv2/kernel"
  input: "CDnCNN/block2/conv2/kernel/AdamOptimizer"
  input: "CDnCNN/block2/conv2/kernel/AdamOptimizer_1"
  input: "CDnCNN/block3/conv3/kernel"
  input: "CDnCNN/block3/conv3/kernel/AdamOptimizer"
  input: "CDnCNN/block3/conv3/kernel/AdamOptimizer_1"
  input: "CDnCNN/block4/conv4/kernel"
  input: "CDnCNN/block4/conv4/kernel/AdamOptimizer"
  input: "CDnCNN/block4/conv4/kernel/AdamOptimizer_1"
  input: "CDnCNN/block5/conv5/kernel"
  input: "CDnCNN/block5/conv5/kernel/AdamOptimizer"
  input: "CDnCNN/block5/conv5/kernel/AdamOptimizer_1"
  input: "CDnCNN/block6/conv6/kernel"
  input: "CDnCNN/block6/conv6/kernel/AdamOptimizer"
  input: "CDnCNN/block6/conv6/kernel/AdamOptimizer_1"
  input: "CDnCNN/block7/conv7/kernel"
  input: "CDnCNN/block7/conv7/kernel/AdamOptimizer"
  input: "CDnCNN/block7/conv7/kernel/AdamOptimizer_1"
  input: "CDnCNN/block8/conv8/kernel"
  input: "CDnCNN/block8/conv8/kernel/AdamOptimizer"
  input: "CDnCNN/block8/conv8/kernel/AdamOptimizer_1"
  input: "CDnCNN/block9/conv9/kernel"
  input: "CDnCNN/block9/conv9/kernel/AdamOptimizer"
  input: "CDnCNN/block9/conv9/kernel/AdamOptimizer_1"
  input: "beta1_power"
  input: "beta2_power"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/control_dependency"
  op: "Identity"
  input: "save/Const"
  input: "^save/SaveV2"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@save/Const"
      }
    }
  }
}
node {
  name: "save/RestoreV2/tensor_names"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 38
          }
        }
        string_val: "CDnCNN/block1/conv2d/bias"
        string_val: "CDnCNN/block1/conv2d/bias/AdamOptimizer"
        string_val: "CDnCNN/block1/conv2d/bias/AdamOptimizer_1"
        string_val: "CDnCNN/block1/conv2d/kernel"
        string_val: "CDnCNN/block1/conv2d/kernel/AdamOptimizer"
        string_val: "CDnCNN/block1/conv2d/kernel/AdamOptimizer_1"
        string_val: "CDnCNN/block10/conv2d/bias"
        string_val: "CDnCNN/block10/conv2d/bias/AdamOptimizer"
        string_val: "CDnCNN/block10/conv2d/bias/AdamOptimizer_1"
        string_val: "CDnCNN/block10/conv2d/kernel"
        string_val: "CDnCNN/block10/conv2d/kernel/AdamOptimizer"
        string_val: "CDnCNN/block10/conv2d/kernel/AdamOptimizer_1"
        string_val: "CDnCNN/block2/conv2/kernel"
        string_val: "CDnCNN/block2/conv2/kernel/AdamOptimizer"
        string_val: "CDnCNN/block2/conv2/kernel/AdamOptimizer_1"
        string_val: "CDnCNN/block3/conv3/kernel"
        string_val: "CDnCNN/block3/conv3/kernel/AdamOptimizer"
        string_val: "CDnCNN/block3/conv3/kernel/AdamOptimizer_1"
        string_val: "CDnCNN/block4/conv4/kernel"
        string_val: "CDnCNN/block4/conv4/kernel/AdamOptimizer"
        string_val: "CDnCNN/block4/conv4/kernel/AdamOptimizer_1"
        string_val: "CDnCNN/block5/conv5/kernel"
        string_val: "CDnCNN/block5/conv5/kernel/AdamOptimizer"
        string_val: "CDnCNN/block5/conv5/kernel/AdamOptimizer_1"
        string_val: "CDnCNN/block6/conv6/kernel"
        string_val: "CDnCNN/block6/conv6/kernel/AdamOptimizer"
        string_val: "CDnCNN/block6/conv6/kernel/AdamOptimizer_1"
        string_val: "CDnCNN/block7/conv7/kernel"
        string_val: "CDnCNN/block7/conv7/kernel/AdamOptimizer"
        string_val: "CDnCNN/block7/conv7/kernel/AdamOptimizer_1"
        string_val: "CDnCNN/block8/conv8/kernel"
        string_val: "CDnCNN/block8/conv8/kernel/AdamOptimizer"
        string_val: "CDnCNN/block8/conv8/kernel/AdamOptimizer_1"
        string_val: "CDnCNN/block9/conv9/kernel"
        string_val: "CDnCNN/block9/conv9/kernel/AdamOptimizer"
        string_val: "CDnCNN/block9/conv9/kernel/AdamOptimizer_1"
        string_val: "beta1_power"
        string_val: "beta2_power"
      }
    }
  }
}
node {
  name: "save/RestoreV2/shape_and_slices"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 38
          }
        }
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2/tensor_names"
  input: "save/RestoreV2/shape_and_slices"
  device: "/device:CPU:0"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign"
  op: "Assign"
  input: "CDnCNN/block1/conv2d/bias"
  input: "save/RestoreV2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_1"
  op: "Assign"
  input: "CDnCNN/block1/conv2d/bias/AdamOptimizer"
  input: "save/RestoreV2:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_2"
  op: "Assign"
  input: "CDnCNN/block1/conv2d/bias/AdamOptimizer_1"
  input: "save/RestoreV2:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_3"
  op: "Assign"
  input: "CDnCNN/block1/conv2d/kernel"
  input: "save/RestoreV2:3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_4"
  op: "Assign"
  input: "CDnCNN/block1/conv2d/kernel/AdamOptimizer"
  input: "save/RestoreV2:4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_5"
  op: "Assign"
  input: "CDnCNN/block1/conv2d/kernel/AdamOptimizer_1"
  input: "save/RestoreV2:5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_6"
  op: "Assign"
  input: "CDnCNN/block10/conv2d/bias"
  input: "save/RestoreV2:6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block10/conv2d/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_7"
  op: "Assign"
  input: "CDnCNN/block10/conv2d/bias/AdamOptimizer"
  input: "save/RestoreV2:7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block10/conv2d/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_8"
  op: "Assign"
  input: "CDnCNN/block10/conv2d/bias/AdamOptimizer_1"
  input: "save/RestoreV2:8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block10/conv2d/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_9"
  op: "Assign"
  input: "CDnCNN/block10/conv2d/kernel"
  input: "save/RestoreV2:9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block10/conv2d/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_10"
  op: "Assign"
  input: "CDnCNN/block10/conv2d/kernel/AdamOptimizer"
  input: "save/RestoreV2:10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block10/conv2d/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_11"
  op: "Assign"
  input: "CDnCNN/block10/conv2d/kernel/AdamOptimizer_1"
  input: "save/RestoreV2:11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block10/conv2d/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_12"
  op: "Assign"
  input: "CDnCNN/block2/conv2/kernel"
  input: "save/RestoreV2:12"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block2/conv2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_13"
  op: "Assign"
  input: "CDnCNN/block2/conv2/kernel/AdamOptimizer"
  input: "save/RestoreV2:13"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block2/conv2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_14"
  op: "Assign"
  input: "CDnCNN/block2/conv2/kernel/AdamOptimizer_1"
  input: "save/RestoreV2:14"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block2/conv2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_15"
  op: "Assign"
  input: "CDnCNN/block3/conv3/kernel"
  input: "save/RestoreV2:15"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block3/conv3/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_16"
  op: "Assign"
  input: "CDnCNN/block3/conv3/kernel/AdamOptimizer"
  input: "save/RestoreV2:16"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block3/conv3/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_17"
  op: "Assign"
  input: "CDnCNN/block3/conv3/kernel/AdamOptimizer_1"
  input: "save/RestoreV2:17"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block3/conv3/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_18"
  op: "Assign"
  input: "CDnCNN/block4/conv4/kernel"
  input: "save/RestoreV2:18"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block4/conv4/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_19"
  op: "Assign"
  input: "CDnCNN/block4/conv4/kernel/AdamOptimizer"
  input: "save/RestoreV2:19"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block4/conv4/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_20"
  op: "Assign"
  input: "CDnCNN/block4/conv4/kernel/AdamOptimizer_1"
  input: "save/RestoreV2:20"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block4/conv4/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_21"
  op: "Assign"
  input: "CDnCNN/block5/conv5/kernel"
  input: "save/RestoreV2:21"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block5/conv5/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_22"
  op: "Assign"
  input: "CDnCNN/block5/conv5/kernel/AdamOptimizer"
  input: "save/RestoreV2:22"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block5/conv5/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_23"
  op: "Assign"
  input: "CDnCNN/block5/conv5/kernel/AdamOptimizer_1"
  input: "save/RestoreV2:23"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block5/conv5/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_24"
  op: "Assign"
  input: "CDnCNN/block6/conv6/kernel"
  input: "save/RestoreV2:24"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block6/conv6/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_25"
  op: "Assign"
  input: "CDnCNN/block6/conv6/kernel/AdamOptimizer"
  input: "save/RestoreV2:25"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block6/conv6/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_26"
  op: "Assign"
  input: "CDnCNN/block6/conv6/kernel/AdamOptimizer_1"
  input: "save/RestoreV2:26"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block6/conv6/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_27"
  op: "Assign"
  input: "CDnCNN/block7/conv7/kernel"
  input: "save/RestoreV2:27"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block7/conv7/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_28"
  op: "Assign"
  input: "CDnCNN/block7/conv7/kernel/AdamOptimizer"
  input: "save/RestoreV2:28"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block7/conv7/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_29"
  op: "Assign"
  input: "CDnCNN/block7/conv7/kernel/AdamOptimizer_1"
  input: "save/RestoreV2:29"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block7/conv7/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_30"
  op: "Assign"
  input: "CDnCNN/block8/conv8/kernel"
  input: "save/RestoreV2:30"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block8/conv8/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_31"
  op: "Assign"
  input: "CDnCNN/block8/conv8/kernel/AdamOptimizer"
  input: "save/RestoreV2:31"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block8/conv8/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_32"
  op: "Assign"
  input: "CDnCNN/block8/conv8/kernel/AdamOptimizer_1"
  input: "save/RestoreV2:32"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block8/conv8/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_33"
  op: "Assign"
  input: "CDnCNN/block9/conv9/kernel"
  input: "save/RestoreV2:33"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block9/conv9/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_34"
  op: "Assign"
  input: "CDnCNN/block9/conv9/kernel/AdamOptimizer"
  input: "save/RestoreV2:34"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block9/conv9/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_35"
  op: "Assign"
  input: "CDnCNN/block9/conv9/kernel/AdamOptimizer_1"
  input: "save/RestoreV2:35"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block9/conv9/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_36"
  op: "Assign"
  input: "beta1_power"
  input: "save/RestoreV2:36"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_37"
  op: "Assign"
  input: "beta2_power"
  input: "save/RestoreV2:37"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@CDnCNN/block1/conv2d/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_all"
  op: "NoOp"
  input: "^save/Assign"
  input: "^save/Assign_1"
  input: "^save/Assign_10"
  input: "^save/Assign_11"
  input: "^save/Assign_12"
  input: "^save/Assign_13"
  input: "^save/Assign_14"
  input: "^save/Assign_15"
  input: "^save/Assign_16"
  input: "^save/Assign_17"
  input: "^save/Assign_18"
  input: "^save/Assign_19"
  input: "^save/Assign_2"
  input: "^save/Assign_20"
  input: "^save/Assign_21"
  input: "^save/Assign_22"
  input: "^save/Assign_23"
  input: "^save/Assign_24"
  input: "^save/Assign_25"
  input: "^save/Assign_26"
  input: "^save/Assign_27"
  input: "^save/Assign_28"
  input: "^save/Assign_29"
  input: "^save/Assign_3"
  input: "^save/Assign_30"
  input: "^save/Assign_31"
  input: "^save/Assign_32"
  input: "^save/Assign_33"
  input: "^save/Assign_34"
  input: "^save/Assign_35"
  input: "^save/Assign_36"
  input: "^save/Assign_37"
  input: "^save/Assign_4"
  input: "^save/Assign_5"
  input: "^save/Assign_6"
  input: "^save/Assign_7"
  input: "^save/Assign_8"
  input: "^save/Assign_9"
}
node {
  name: "init"
  op: "NoOp"
  input: "^CDnCNN/block1/conv2d/bias/AdamOptimizer/Assign"
  input: "^CDnCNN/block1/conv2d/bias/AdamOptimizer_1/Assign"
  input: "^CDnCNN/block1/conv2d/bias/Assign"
  input: "^CDnCNN/block1/conv2d/kernel/AdamOptimizer/Assign"
  input: "^CDnCNN/block1/conv2d/kernel/AdamOptimizer_1/Assign"
  input: "^CDnCNN/block1/conv2d/kernel/Assign"
  input: "^CDnCNN/block10/conv2d/bias/AdamOptimizer/Assign"
  input: "^CDnCNN/block10/conv2d/bias/AdamOptimizer_1/Assign"
  input: "^CDnCNN/block10/conv2d/bias/Assign"
  input: "^CDnCNN/block10/conv2d/kernel/AdamOptimizer/Assign"
  input: "^CDnCNN/block10/conv2d/kernel/AdamOptimizer_1/Assign"
  input: "^CDnCNN/block10/conv2d/kernel/Assign"
  input: "^CDnCNN/block2/conv2/kernel/AdamOptimizer/Assign"
  input: "^CDnCNN/block2/conv2/kernel/AdamOptimizer_1/Assign"
  input: "^CDnCNN/block2/conv2/kernel/Assign"
  input: "^CDnCNN/block3/conv3/kernel/AdamOptimizer/Assign"
  input: "^CDnCNN/block3/conv3/kernel/AdamOptimizer_1/Assign"
  input: "^CDnCNN/block3/conv3/kernel/Assign"
  input: "^CDnCNN/block4/conv4/kernel/AdamOptimizer/Assign"
  input: "^CDnCNN/block4/conv4/kernel/AdamOptimizer_1/Assign"
  input: "^CDnCNN/block4/conv4/kernel/Assign"
  input: "^CDnCNN/block5/conv5/kernel/AdamOptimizer/Assign"
  input: "^CDnCNN/block5/conv5/kernel/AdamOptimizer_1/Assign"
  input: "^CDnCNN/block5/conv5/kernel/Assign"
  input: "^CDnCNN/block6/conv6/kernel/AdamOptimizer/Assign"
  input: "^CDnCNN/block6/conv6/kernel/AdamOptimizer_1/Assign"
  input: "^CDnCNN/block6/conv6/kernel/Assign"
  input: "^CDnCNN/block7/conv7/kernel/AdamOptimizer/Assign"
  input: "^CDnCNN/block7/conv7/kernel/AdamOptimizer_1/Assign"
  input: "^CDnCNN/block7/conv7/kernel/Assign"
  input: "^CDnCNN/block8/conv8/kernel/AdamOptimizer/Assign"
  input: "^CDnCNN/block8/conv8/kernel/AdamOptimizer_1/Assign"
  input: "^CDnCNN/block8/conv8/kernel/Assign"
  input: "^CDnCNN/block9/conv9/kernel/AdamOptimizer/Assign"
  input: "^CDnCNN/block9/conv9/kernel/AdamOptimizer_1/Assign"
  input: "^CDnCNN/block9/conv9/kernel/Assign"
  input: "^beta1_power/Assign"
  input: "^beta2_power/Assign"
}
node {
  name: "init_1"
  op: "NoOp"
  input: "^CDnCNN/block1/conv2d/bias/AdamOptimizer/Assign"
  input: "^CDnCNN/block1/conv2d/bias/AdamOptimizer_1/Assign"
  input: "^CDnCNN/block1/conv2d/bias/Assign"
  input: "^CDnCNN/block1/conv2d/kernel/AdamOptimizer/Assign"
  input: "^CDnCNN/block1/conv2d/kernel/AdamOptimizer_1/Assign"
  input: "^CDnCNN/block1/conv2d/kernel/Assign"
  input: "^CDnCNN/block10/conv2d/bias/AdamOptimizer/Assign"
  input: "^CDnCNN/block10/conv2d/bias/AdamOptimizer_1/Assign"
  input: "^CDnCNN/block10/conv2d/bias/Assign"
  input: "^CDnCNN/block10/conv2d/kernel/AdamOptimizer/Assign"
  input: "^CDnCNN/block10/conv2d/kernel/AdamOptimizer_1/Assign"
  input: "^CDnCNN/block10/conv2d/kernel/Assign"
  input: "^CDnCNN/block2/conv2/kernel/AdamOptimizer/Assign"
  input: "^CDnCNN/block2/conv2/kernel/AdamOptimizer_1/Assign"
  input: "^CDnCNN/block2/conv2/kernel/Assign"
  input: "^CDnCNN/block3/conv3/kernel/AdamOptimizer/Assign"
  input: "^CDnCNN/block3/conv3/kernel/AdamOptimizer_1/Assign"
  input: "^CDnCNN/block3/conv3/kernel/Assign"
  input: "^CDnCNN/block4/conv4/kernel/AdamOptimizer/Assign"
  input: "^CDnCNN/block4/conv4/kernel/AdamOptimizer_1/Assign"
  input: "^CDnCNN/block4/conv4/kernel/Assign"
  input: "^CDnCNN/block5/conv5/kernel/AdamOptimizer/Assign"
  input: "^CDnCNN/block5/conv5/kernel/AdamOptimizer_1/Assign"
  input: "^CDnCNN/block5/conv5/kernel/Assign"
  input: "^CDnCNN/block6/conv6/kernel/AdamOptimizer/Assign"
  input: "^CDnCNN/block6/conv6/kernel/AdamOptimizer_1/Assign"
  input: "^CDnCNN/block6/conv6/kernel/Assign"
  input: "^CDnCNN/block7/conv7/kernel/AdamOptimizer/Assign"
  input: "^CDnCNN/block7/conv7/kernel/AdamOptimizer_1/Assign"
  input: "^CDnCNN/block7/conv7/kernel/Assign"
  input: "^CDnCNN/block8/conv8/kernel/AdamOptimizer/Assign"
  input: "^CDnCNN/block8/conv8/kernel/AdamOptimizer_1/Assign"
  input: "^CDnCNN/block8/conv8/kernel/Assign"
  input: "^CDnCNN/block9/conv9/kernel/AdamOptimizer/Assign"
  input: "^CDnCNN/block9/conv9/kernel/AdamOptimizer_1/Assign"
  input: "^CDnCNN/block9/conv9/kernel/Assign"
  input: "^beta1_power/Assign"
  input: "^beta2_power/Assign"
}
versions {
  producer: 716
}
