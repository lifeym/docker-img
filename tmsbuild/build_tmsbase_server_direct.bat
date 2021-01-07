xcopy /E /R /Y /Q C:\work\TMS_Standard\Source\Develop\AppServer %TMP%\AppServer\
pushd %~dp0
set projed=%cd%\projed
pushd %TMP%\AppServer

%projed% rm -i myProxy\myProxy.vbproj ItemGroup/COMReference[@Include='stdole']
%projed% addpkg -i myProxy\myProxy.vbproj stdole,7.0.3303
%projed% rm -i BusinessRule\BusinessRule.vbproj ItemGroup/Reference[@Include='stdole']
%projed% addpkg -i BusinessRule\BusinessRule.vbproj stdole,7.0.3303
%projed% rm -i EntityManager\EntityManager.vbproj ItemGroup/COMReference[@Include='stdole1']
%projed% rm -i EntityManager\EntityManager.vbproj ItemGroup/Reference[@Include='stdole']
%projed% addpkg -i EntityManager\EntityManager.vbproj stdole,7.0.3303
nuget restore CallServer.sln
nuget restore Appserver.sln
msbuild /t:Rebuild /p:Configuration=Debug;Platform=x86 CallServer.sln
msbuild /t:Rebuild /p:Configuration=Debug AppServer.sln

popd

if exist output rd /s /q output
md output
xcopy /E /R /Y /Q %TMP%\AppServer\KJTmsAppServer\bin output\KJTmsAppServer\
xcopy /E /R /Y /Q %TMP%\AppServer\CallServer\bin output\CallServer\
copy %TMP%\AppServer\build.log output\build.log
if exist %TMP%\AppServer rd /s /q %TMP%\AppServer
popd
pause