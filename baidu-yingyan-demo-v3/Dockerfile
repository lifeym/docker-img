# can only be built by nodejs 12
FROM node:12-alpine as builder

RUN yarn global add fis3

ADD src /tmp

RUN cd /tmp \
    && yarn add package.json \
    && fis3 release demo -d ./dist

FROM nginx:alpine

LABEL maintainer="baidu yingyan web demo v3 docker ENV by leonardo_yu@hotmail.com"

COPY --from=builder \
    /tmp/dist \
    /usr/share/nginx/html