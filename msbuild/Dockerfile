FROM mcr.microsoft.com/dotnet/framework/sdk:4.8

LABEL maintainer="MS BUILD ENV by leonardo_yu@hotmail.com"

# install chocolatey
# and scoop
RUN powershell.exe -Command \
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')); \
    Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')

# restart shell to install our staff
# bin folder is created for storing any custom exe tools. Add it to the PATH env,then we can access exe anywhere.
# build folder is the building place.
RUN md c:\bin & md c:\build \
    & setx PATH "c:\bin;%PATH%"

# The entrypoint.bat will execute the build.bat or build.ps1 under c:\build while started - if it find one.
# A build.log will be generated under c:\build, if auto-build executed.
ADD entrypoint.bat /

WORKDIR /build

ENTRYPOINT ["/entrypoint.bat"]

# All resource to be built must be mapped to c:\build.
VOLUME "c:/build"

CMD ["msbuild"]