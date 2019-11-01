@echo off & setlocal enabledelayedexpansion & CD /D %~DP0
::this use to get administrator auth
>NUL 2>&1 REG.exe query "HKU\S-1-5-19" || (
    ECHO SET UAC = CreateObject^("Shell.Application"^) > "%TEMP%\Getadmin.vbs"
    ECHO UAC.ShellExecute "%~f0", "%1", "", "runas", 1 >> "%TEMP%\Getadmin.vbs"
    "%TEMP%\Getadmin.vbs"
    DEL /f /q "%TEMP%\Getadmin.vbs" 2>NUL
    Exit /b
)
::get administrator auth end

::get input params.if the first param is yes,this script will exit at finish
set slient=%1%

set wslNetworkName=vEthernet (WSL):

for /f "tokens=1 delims=[]" %%i in ('nbtstat -S^|find /n "%wslNetworkName%"') do (
      nbtstat -S | more +%%i >$
      set /p Str=<$
      del $
      for /f "tokens=2 delims=[]" %%i in ('echo "!Str!"') do set ip=%%i
)

::Ports format:
::WSL,Host;WSL,Host
::for example
::if you want to forward your wsl port 80 to host port 8080 and forward wsl port 81 to host port 8081,update like this:
::set forwardPorts=8081,8081

set forwardPorts=8081,8081

set linuxName=Ubuntu-18.04
set linuxUser=root

echo start remove port forwad

:SplitAndForward
for /f "tokens=1,* delims=;" %%i in ("%forwardPorts%") do (
	for /f "tokens=1,2 delims=," %%m in ("%%i") do (
		echo remove file /etc/nginx/port-to-host/127.0.0.1-%%m-to-%ip%-%%n
		wsl -d %linuxName% -u %linuxUser% rm -rf /etc/nginx/port-to-host/127.0.0.1-%%m-to-%ip%-%%n
	)
	set forwardPorts=%%j
	if not "%forwardPorts%"=="" goto SplitAndForward
)

wsl -d %linuxName% -u %linuxUser% nginx -s reload

echo remove port forwad done.

if "%slient%"=="yes" (
	exit
)
pause