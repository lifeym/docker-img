FROM mcr.microsoft.com/dotnet/framework/runtime:4.8 as build
RUN powershell.exe -Command \
    $ErrorActionPreference = 'Stop'; \
    Set-Location c:\ ; \
	(New-Object Net.WebClient).DownloadFile('http://nginx.org/download/nginx-1.20.0.zip', 'c:\nginx.zip'); \
	Expand-Archive -Path c:\nginx.zip -DestinationPath ./

FROM mcr.microsoft.com/windows/servercore:1909
LABEL maintainer="NGINX windows image by leonardo_yu@hotmail.com"
WORKDIR /nginx
COPY --from=build /nginx-1.20.0 .
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
