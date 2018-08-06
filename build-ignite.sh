#!/usr/bin/env bash

. .common.sh
. env.sh
TMP_DIR="tmp"

SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"


fetch_and_build ${IGNITE_URL} ${IGNITE_BRANCH} ${TMP_DIR} 