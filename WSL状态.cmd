@echo off
wsl -l -v
echo ---------------------------------------------------------
netsh interface portproxy show v4tov4
pause