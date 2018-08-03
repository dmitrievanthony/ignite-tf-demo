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
unzip ${TMP_DIR}/target/bin/apache-ignite-fabric-${VERSION}-bin.zip -d ${TMP_DIR} && \
mv ${TMP_DIR}/apache-ignite-fabric-${VERSION}-bin ${TMP_DIR}/apache-ignite-fabric-bin && \

rsync -r --exclude ${TMP_DIR} . ${TMP_DIR} && \
cd ${TMP_DIR}/apache-ignite-fabric-bin/libs && \
cp optional/ignite-tensorflow/ignite-tensorflow-${VERSION}.jar ignite-tensorflow-${VERSION}.jar && \
cp optional/ignite-slf4j/ignite-slf4j-${VERSION}.jar ignite-slf4j-${VERSION}.jar && \
mvn dependency:copy -Dartifact=commons-io:commons-io:2.6 -DoutputDirectory=. && \
mvn dependency:copy -Dartifact=org.slf4j:slf4j-api:1.7.7 -DoutputDirectory=. && \
mvn dependency:copy -Dartifact=ch.qos.logback:logback-core:1.2.3 -DoutputDirectory=. && \
mvn dependency:copy -Dartifact=ch.qos.logback:logback-classic:1.2.3 -DoutputDirectory=. && \
cd ../.. && \
wget ${TF_PACK_URL} && \

echo Building Apache Ignite Docker container && \
sudo docker build -t ignite-with-tf --build-arg TF_PACKAGE_NAME=${TF_PACK_NAME} . 1>/dev/null && \
echo Done

cd ${SCRIPT_PATH}
rm -rf ${TMP_DIR}
