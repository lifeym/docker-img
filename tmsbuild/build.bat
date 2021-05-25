projed rm -i myProxy\myProxy.vbproj ItemGroup/COMReference[@Include='stdole'] 
projed addpkg -i myProxy\myProxy.vbproj stdole,7.0.3303 
projed rm -i BusinessRule\BusinessRule.vbproj ItemGroup/Reference[@Include='stdole'] 
projed addpkg -i BusinessRule\BusinessRule.vbproj stdole,7.0.3303 
projed rm -i EntityManager\EntityManager.vbproj ItemGroup/COMReference[@Include='stdole1'] 
projed rm -i EntityManager\EntityManager.vbproj ItemGroup/Reference[@Include='stdole'] 
projed addpkg -i EntityManager\EntityManager.vbproj stdole,7.0.3303 
nuget restore CallServer.sln 
nuget restore Appserver.sln 
msbuild /t:Rebuild /p:Configuration=Debug;Platform=x86 CallServer.sln 
msbuild /t:Rebuild /p:Configuration=Debug AppServer.sln 
