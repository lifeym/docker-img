FROM mcr.microsoft.com/windows/servercore:ltsc2019

ARG NVER=1.22.0

# since nginx for windows was built use win32 api,
# we cannot run it under nanoserver.
SHELL ["powershell", "-Command"]
ADD http://nginx.org/download/nginx-$NVER.zip /bin/nginx.zip
RUN cd /bin; Expand-Archive -Path ./nginx.zip -DestinationPath ./; ren nginx-$env:NVER nginx; \
    rm /bin/nginx.zip

WORKDIR /bin/nginx
EXPOSE 80
CMD ["nginx"]

