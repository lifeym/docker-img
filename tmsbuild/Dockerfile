FROM lifeym/msbuild

LABEL maintainer="TMS BUILD ENV by leonardo_yu@hotmail.com"

# restart shell to install our staff
RUN choco install -y sed nodejs \
    & refreshenv \
    & npm install -g cnpm --registry=https://registry.npm.taobao.org

ADD projed.exe /bin