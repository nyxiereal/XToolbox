@echo off
netsh int tcp set global autotuninglevel=normal
ipconfig /flushdns
cls
echo Windows Network Auto-Tuning have been Enabled!
pause
exit