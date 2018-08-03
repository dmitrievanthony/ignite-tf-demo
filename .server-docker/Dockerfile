from ubuntu:17.10

ARG TF_PACKAGE_NAME

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        python3 \
        python3-pip \
        python3-dev \
        python3-setuptools \
        openjdk-8-jdk \
        tmux \
        build-essential \
        htop

COPY requirements.txt requirements.txt
COPY .htoprc /root/.config/htop/htoprc
COPY apache-ignite-fabric-bin apache-ignite-fabric-bin
COPY ${TF_PACKAGE_NAME} ${TF_PACKAGE_NAME}
RUN pip3 install -U ${TF_PACKAGE_NAME} && \
    pip3 install --user -r requirements.txt

COPY logback.xml /apache-ignite-fabric-bin/
COPY ignite-server.xml ignite-server.xml

ENV IGNITE_HOME=/apache-ignite-fabric-bin
CMD tmux \
    new-session "/apache-ignite-fabric-bin/bin/ignite.sh ignite-server.xml; bash" \; \
    split-window -h "htop; bash" \; \
