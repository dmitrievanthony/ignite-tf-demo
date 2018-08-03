#!/usr/bin/env bash

.ignite-tensorflow/bin/ignite-tf.sh start -c=ignite-client.xml MNIST_CACHE test_script python3 test.py
