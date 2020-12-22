@echo off
pushd c:\build
if exist build.ps1 (
    powershell -Command build.ps1 > build.log
) else if exist build.bat (
    call build.bat > build.log
)
popd