#!/usr/bin/env bash

sudo docker network rm tensorflow-on-ignite
sudo docker network create --subnet=192.168.42.0/24 tensorflow-on-ignite

sudo gnome-terminal --zoom=0.75 -e "tmux \
  new-session -s tensorflow-on-ignite \"docker run --name tensorflow-on-ignite-1 --rm --net tensorflow-on-ignite --ip 192.168.42.2 -it ignite-with-tf ; read\" \; \
  split-window \"docker run --name tensorflow-on-ignite-2 --rm --net tensorflow-on-ignite --ip 192.168.42.3 -it ignite-with-tf ; read\" \; \
  split-window \"docker run --name tensorflow-on-ignite-3 --rm --net tensorflow-on-ignite --ip 192.168.42.4 -it ignite-with-tf ; read\" \; \
  split-window \"docker run --name tensorflow-on-ignite-4 --rm --net tensorflow-on-ignite --ip 192.168.42.5 -it ignite-with-tf ; read\" \; \
  select-layout tiled"
