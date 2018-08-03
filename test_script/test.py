import os
import time
import sys

import tensorflow as tf
from tensorflow.contrib.ignite import IgniteDataset

print("PYTHONPATH: ", os.environ['PYTHONPATH'])
print("TF_CONFIG: ", os.environ['TF_CONFIG'])
print("TF_WORKERS: ", os.environ['TF_WORKERS'])
print("TF_CHIEF_SERVER: ", os.environ['TF_CHIEF_SERVER'])
sys.stdout.flush()

with tf.Session(os.environ['TF_CHIEF_SERVER']) as sess:
    ds = IgniteDataset("MNIST_CACHE", page_size=10000, distributed=True)
    it = ds.make_one_shot_iterator()
    print("Next: ", sess.run(it.get_next()))
    sys.stdout.flush()

while(True):
    time.sleep(0.1)
