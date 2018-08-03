#!/usr/bin/env bash

SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"
TMP_DIR="tmp"

cd ${SCRIPT_PATH}

. ../.common.sh
. ../env.sh

fetch_and_build ${CACHE_INIT_URL} ${CACHE_INIT_BRANCH} ${TMP_DIR}

VERSION=`ls ${TMP_DIR}/target/ignite-test-cache-*-jar-with-dependencies.jar \
    | sed -r 's/.*ignite-test-cache-(.*)-jar-with-dependencies.jar/\1/'` && \
echo Cache initializer version: ${VERSION} && \
cp ${TMP_DIR}/target/ignite-test-cache-${VERSION}-jar-with-dependencies.jar ./cache-initializer.jar && \
      
rm -rf ${TMP_DIR}
