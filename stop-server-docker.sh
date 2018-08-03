#!/usr/bin/env bash

sudo tmux kill-session -t tensorflow-on-ignite
sudo docker rm -f tensorflow-on-ignite-1
sudo docker rm -f tensorflow-on-ignite-2
sudo docker rm -f tensorflow-on-ignite-3
sudo docker rm -f tensorflow-on-ignite-4
