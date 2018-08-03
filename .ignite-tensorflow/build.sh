#!/usr/bin/env bash

SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"
TMP_DIR="tmp"

cd ${SCRIPT_PATH}

. ../.common.sh
. ../env.sh

fetch_and_build ${IGNITE_URL} ${IGNITE_BRANCH} ${TMP_DIR} && \
VERSION=`ls ${TMP_DIR}/target/bin/apache-ignite-fabric-*-bin.zip \
    | sed -r 's/.*apache-ignite-fabric-(.*)-bin.zip/\1/'` && \
echo Apache Ignite version: ${VERSION} && \

unzip ${TMP_DIR}/modules/tensorflow/target/ignite-tensorflow-${VERSION}.zip && \
rm -rf bin && \
mv ignite-tensorflow-${VERSION} bin && \
export PATH=${SCRIPT_PATH}/bin/:${PATH} && \

rm -rf ${TMP_DIR}

