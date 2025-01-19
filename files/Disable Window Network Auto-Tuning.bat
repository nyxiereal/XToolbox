@echo off
netsh int tcp set global autotuninglevel=disabled
ipconfig /flushdns
cls
echo Windows Network Auto-Tuning has been Disabled!
pause
exit
