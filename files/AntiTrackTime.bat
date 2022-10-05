@echo off
:: https://privacy.sexy — v0.11.4 — Wed, 05 Oct 2022 06:23:18 GMT
:: Ensure admin privileges
fltmc >nul 2>&1 || (
    echo Administrator privileges are required.
    PowerShell Start -Verb RunAs '%0' 2> nul || (
        echo Right-click on the script and select "Run as administrator".
        pause & exit 1
    )
    exit 0
)


:: ----------------------------------------------------------
:: ---------Change NTP (time) server to pool.ntp.org---------
:: ----------------------------------------------------------
echo --- Change NTP (time) server to pool.ntp.org
:: Configure time source
w32tm /config /syncfromflags:manual /manualpeerlist:"0.pool.ntp.org 1.pool.ntp.org 2.pool.ntp.org 3.pool.ntp.org"
:: Stop time service if running
SC queryex "w32time"|Find "STATE"|Find /v "RUNNING">Nul||(
    net stop w32time
)
:: Start time service and sync now
net start w32time
w32tm /config /update
w32tm /resync
:: ----------------------------------------------------------


pause
exit /b 0