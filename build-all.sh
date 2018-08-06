#!/usr/bin/env bash

SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"

${SCRIPT_PATH}/.server-docker/build.sh && \
${SCRIPT_PATH}/.cache-initializer/build.sh && \
${SCRIPT_PATH}/.ignite-tensorflow/build.sh
