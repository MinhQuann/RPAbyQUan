import tensorflow as tf

def disable_xnnpack_delegate(model_path):
    """
    Load a TensorFlow Lite model without using the XNNPACK delegate.
    """
    interpreter = tf.lite.Interpreter(model_path=model_path, experimental_delegates=None)
    return interpreter