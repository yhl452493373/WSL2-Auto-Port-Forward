@echo off & setlocal enabledelayedexpansion & CD /D %~DP0

::get input params.if the first param is yes,this script will exit at finish
set slient=%1%

echo get WSL host ip

set wslNetworkName=vEthernet (WSL):

for /f "tokens=1 delims=[]" %%i in ('nbtstat -S^|find /n "%wslNetworkName%"') do (
      nbtstat -S | more +%%i >$
      set /p Str=<$
      del $
      for /f "tokens=2 delims=[]" %%i in ('echo "!Str!"') do set ip=%%i
)

echo wsl host ip is %ip% . you can ping this ip in WSL

::Ports format:
::WSL,Host;WSL,Host
::for example
::if you want to forward your wsl port 80 to host port 8080 and forward wsl port 81 to host port 8081,update like this:
::set forwardPorts=8081,8081

set forwardPorts=8081,8081

set linuxName=Ubuntu-18.04
set linuxUser=root
set linuxScript=/etc/port-to-host.sh

wsl -d %linuxName% -u %linuxUser% rm -rf /etc/nginx/port-to-host/ >nul

echo start forward wsl2 port to host

:SplitAndForward
for /f "tokens=1,* delims=;" %%i in ("%forwardPorts%") do (
	for /f "tokens=1,2 delims=," %%m in ("%%i") do (
		echo forwad wsl2 port %%m to host %%n
		wsl -d %linuxName% -u %linuxUser% %linuxScript% %%m %ip% %%n
	)
	set forwardPorts=%%j
	if not "%forwardPorts%"=="" goto SplitAndForward
)

echo forward wsl2 port to host done

wsl -d %linuxName% -u %linuxUser% nginx -s reload

if "%slient%"=="yes" exit
pause