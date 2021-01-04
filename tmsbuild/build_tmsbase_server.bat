xcopy /E /R /Y /Q d:\VSS\TMS_Standard\Source\Develop\AppServer %TMP%\AppServer\
pushd %TMP%\AppServer

@echo off
echo projed rm -i myProxy\myProxy.vbproj ItemGroup/COMReference[@Include='stdole'] >build.bat
echo projed addpkg -i myProxy\myProxy.vbproj stdole,7.0.3303 >>build.bat
echo projed rm -i BusinessRule\BusinessRule.vbproj ItemGroup/Reference[@Include='stdole'] >>build.bat
echo projed addpkg -i BusinessRule\BusinessRule.vbproj stdole,7.0.3303 >>build.bat
echo projed rm -i EntityManager\EntityManager.vbproj ItemGroup/COMReference[@Include='stdole1'] >>build.bat
echo projed rm -i EntityManager\EntityManager.vbproj ItemGroup/Reference[@Include='stdole'] >>build.bat
echo projed addpkg -i EntityManager\EntityManager.vbproj stdole,7.0.3303 >>build.bat
echo nuget restore CallServer.sln >>build.bat
echo nuget restore Appserver.sln >>build.bat
echo msbuild /t:Rebuild /p:Configuration=Debug;Platform=x86 CallServer.sln >>build.bat
echo msbuild /t:Rebuild /p:Configuration=Debug AppServer.sln >>build.bat
@echo on

set "pwd=%TMP:\=/%"
docker run --rm -v %pwd%/AppServer:c:/build tmsbuild
popd

if exist output rclone purge output
md output
xcopy /E /R /Y /Q %TMP%\AppServer\KJTmsAppServer\bin output\KJTmsAppServer\
xcopy /E /R /Y /Q %TMP%\AppServer\CallServer\bin output\CallServer\
copy %TMP%\AppServer\build.log output\build.log
if exist %TMP%\AppServer del /F /S /Q %TMP%\AppServer
pause