FROM ubuntu
ARG VERSION=3.1.1
# ARG RELEASE_URL=https://github.com/cloudreve/Cloudreve/releases/download/${VERSION}/cloudreve_${VERSION}_linux_amd64.tar.gz
ARG RELEASE_URL=https://st0n3-dev.obs.cn-south-1.myhuaweicloud.com/cloudreve/release/${VERSION}/cloudreve.tar.gz
ARG TZ="Asia/Shanghai"
ENV TZ ${TZ}

ADD ${RELEASE_URL} /cloudreve.tar.gz
RUN mkdir -p /cloudreve && \
    tar -C /cloudreve -xzvf /cloudreve.tar.gz && \
    rm /cloudreve.tar.gz && \
    ln -s /cloudreve/cloudreve /usr/bin/cloudreve
ENTRYPOINT ["cloudreve"]