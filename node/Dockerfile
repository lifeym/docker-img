# node with cnpm and yarn preinstalled.
FROM node:alpine

LABEL maintainer="MS BUILD ENV by leonardo_yu@hotmail.com"

# install cnpm and yarn
RUN npm install -g cnpm --registry=https://registry.npm.taobao.org \
    && apk add yarn

CMD ["npm"]