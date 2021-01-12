# node env with cnpm and yarn python preinstalled.
FROM node:alpine3.12

LABEL maintainer="nodejs BUILD ENV by leonardo_yu@hotmail.com"

RUN yarn global add npm@7.4.0 && npm install cnpm -g --registry=https://registry.npm.taobao.org
RUN set -x \
    && echo -e "https://mirrors.aliyun.com/alpine/v3.12/main" > /etc/apk/repositories \
    && apk add --update --no-cache python2 make g++