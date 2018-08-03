#!/usr/bin/env bash

SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"

java -jar ${SCRIPT_PATH}/.cache-initializer/cache-initializer.jar -c ${SCRIPT_PATH}/ignite-client.xml
