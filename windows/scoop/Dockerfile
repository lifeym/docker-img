FROM mcr.microsoft.com/windows/servercore:ltsc2019

SHELL ["powershell", "-Command"]
RUN Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser; \
    irm https://ghproxy.com/https://raw.githubusercontent.com/scoopinstaller/install/master/install.ps1 | Out-File install.ps1; \
    ./install.ps1 -RunAsAdmin; \
    Remove-Item -Force install.ps1
