#!/usr/bin/env bash

fetch_and_build() {
    REPO_URL=$1
    REPO_BRANCH=$2
    TMP_DIR=$3

    # Create or clear directory.
    if [ -d ${TMP_DIR} ]; then rm -rf ${TMP_DIR}; fi && \
    mkdir ${TMP_DIR} && \

    # Fetch sources.
    echo Fetching sources \[repo=\"${REPO_URL}\", branch=\"${REPO_BRANCH}\"\] && \
    git clone --quiet ${REPO_URL} --depth=1 --branch ${REPO_BRANCH} --single-branch ${TMP_DIR} 1>/dev/null && \
    cd ${TMP_DIR} && \
    {
        # Build sources.
        echo Building sources \[repo=\"${REPO_URL}\", branch=\"${REPO_BRANCH}\"\] && \
        mvn clean install -B -q -DskipTests -Prelease,lgpl,tensorflow
        cd ..
    } 
}
