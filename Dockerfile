FROM yarflam/raspbian-buster
MAINTAINER Yarflam

# Prepare
RUN apt-get update &&\
    apt-get upgrade -y &&\
    apt-get install -y wget tar libatomic1

# Install Node.js
ENV NODE_VERSION=14.15.4
ENV NODE_PLATFORM=armv7l
RUN wget https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-$NODE_PLATFORM.tar.xz &&\
    tar xf node-v$NODE_VERSION-linux-$NODE_PLATFORM.tar.xz &&\
    mv ./node-v$NODE_VERSION-linux-$NODE_PLATFORM /opt/node &&\
    rm -f ./node-v$NODE_VERSION-linux-$NODE_PLATFORM.tar.xz
ENV PATH="/opt/node/bin:${PATH}"

# Clean up
RUN apt-get autoremove -y wget &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD [ "node" ]
