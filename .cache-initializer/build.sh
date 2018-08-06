#!/usr/bin/env bash

SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"
TMP_DIR="tmp"
IGNITE_TMP_DIR="ignite-tmp"

cd ${SCRIPT_PATH}

. ../.common.sh
. ../env.sh

if [ -d ${TMP_DIR} ]; then rm -rf ${TMP_DIR}; fi && \
mkdir ${TMP_DIR} && \
cp -r ../tmp/ ${TMP_DIR}

if [ -d ${IGNITE_TMP_DIR} ]; then rm -rf ${IGNITE_TMP_DIR}; fi && \
mkdir ${IGNITE_TMP_DIR} && \
cp -rf ${SCRIPT_PATH}/../tmp/* ${IGNITE_TMP_DIR}/

fetch_and_build ${CACHE_INIT_URL} ${CACHE_INIT_BRANCH} ${TMP_DIR}

VERSION=`ls ${TMP_DIR}/target/ignite-test-cache-*-jar-with-dependencies.jar \
    | sed -r 's/.*ignite-test-cache-(.*)-jar-with-dependencies.jar/\1/'` && \
echo Cache initializer version: ${VERSION} && \
cp ${TMP_DIR}/target/ignite-test-cache-${VERSION}-jar-with-dependencies.jar ./cache-initializer.jar && \
      
rm -rf ${TMP_DIR}
rm -rf ${IGNITE_TMP_DIR}
