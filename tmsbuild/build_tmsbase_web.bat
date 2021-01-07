set workdir="C:\work\TMS_Standard\Source\Develop\Web"

pushd %~dp0
if exist .build-cache\TmsbaseWeb\node_modules (xcopy /E /R /Y /Q .build-cache\TmsbaseWeb\node_modules %TMP%\TmsbaseWeb\)

pushd %workdir%

set "pwd=%workdir:\=/%"
docker run --rm -v %pwd%/TmsbaseWeb:/tmp lifeym/node-buildenv:alpine sh -c "cd /tmp && npm install && npm run build"

popd

if exist output\TmsbaseWeb rd /s /q output\TmsbaseWeb
if exist .build-cache\TmsbaseWeb rd /s /q .build-cache\TmsbaseWeb
if not exist output mkdir output
if not exist .build-cache mkdir .build-cache
xcopy /E /R /Y /Q %TMP%\TmsbaseWeb\dist output\TmsbaseWeb
move /Y %TMP%\TmsbaseWeb\node_modules .build-cache\TmsbaseWeb
copy %TMP%\TmsbaseWeb\build.log output\build.log
if exist %TMP%\TmsWeb rd /s /q %TMP%\TmsWeb

popd
pause