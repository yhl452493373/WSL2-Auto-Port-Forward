@ECHO OFF & CD /D %~DP0

set slient=%1%

set linuxName=Ubuntu-18.04
set linuxUser=root
set linuxScript=/etc/init.sh
set linuxParam=start
wsl -d %linuxName% -u %linuxUser% %linuxScript% %linuxParam%

if "%slient%"=="yes" start 转发端口到WSL容器.vbs & exit
pause