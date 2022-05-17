# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# !!                                         !!
# !!          SAFE TO EDIT VALUES            !!
# !!          CONFIGURATION START            !!
# !!                                         !!
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

# Edit values (Option) to your Choice

# Function = Option
# List of Options

$troubleshootInstalls = 0
# 0 = Do nothing. *Recomended.
# 1 = Enable essential stuff needed for some installations.
# Note: Set to 1 if you are having trouble installing something on you pc.
# Note: Known to fix these installations: windows language pack, Autodesk AutoCad and Appxs.
# Note: Top priority configuration, overrides other settings.

$beWifiSafe = 1
# 0 = May disable services required to use Wifi. *Recomended.
# 1 = Keep Wifi working
# Note: Top priority configuration, overrides other settings.

$beMicrophoneSafe = 1
# 0 = Disable services required to use the microphone. *Recomended.
# 1 = Keep microphone working
# Note: Top priority configuration, overrides other settings.

$beXboxSafe = 0
# 0 = Disable Xbox and Windows Live Games related stuff like Game Bar. *Recomended.
# 1 = Enable it.
# Note: Top priority configuration, overrides other settings.

$beBiometricSafe = 1
# 0 = Disable biometric related stuff. *Recomended.
# 1 = Enable it.
# Note: Refers to lockscreen, fingerprint reader, illuminated IR sensor or other biometric sensors.
# Note: Top priority configuration, overrides other settings.

$beNetworkPrinterSafe = 1
# 0 = Disable network printer. *Recomended.
# 1 = Enable it.
# Note: Top priority configuration, overrides other settings.

$beNetworkFolderSafe = 1
# 0 = Disable network folders. *Recomended.
# 1 = Enable it.
# Note: Top priority configuration, overrides other settings.

$beAeroPeekSafe = 1
# 0 = Disable Windows Aero Peek. *Recomended.
# 1 = Enable it to Windows defaults.
# Note: Top priority configuration, overrides other settings.

$beThumbnailSafe = 1
# 0 = Disable Windows Thumbnails. *Recomended.
# 1 = Enable it to Windows defaults.
# Note: Refers to the use of thumbnails instead of icon to some files.
# Note: Top priority configuration, overrides other settings.

$beCastSafe = 1
# 0 = Disable Casting. *Recomended.
# 1 = Enable it.  
# Note: Refers to the Windows ability to Cast screen to another device and or monitor, PIP (Picture-in-picture), projecting to another device.
# Note: Top priority configuration, overrides other settings.

$beVpnPppoeSafe = 1
# 0 = Will make the system safer against DNS cache poisoning but VPN or PPPOE conns may stop working. *Recomended.
# 1 = This script will not mess with stuff required for VPN or PPPOE to work.  
# Note: Set it to 1 if you pretend to use VPN, PPP conns, if the system is inside a VM or having trouble with internet.

$beTaskScheduleSafe = 1
# 0 = Disable Task Schedule. *Recomended.
# 1 = Enable it.  
# Note: Top priority configuration, overrides other settings.

$disableCortana = 1
# 0 = Enable Cortana
# 1 = Disable Cortana *Recomended

$legacyRightClicksMenu = 0
# 0 = Use Windows 11 right click menu
# 1 = Use legacy right click menu *Recomended

$disableStartupSound = 0
# 0 = Keep Windows 11 startup sound
# 1 = Disable Windows 11 startup sound *Recomended

$useGoogleDNS = 0
# 0 = Nothing
# 1 = Apply Google DNS to connections *Recomended.

$installNvidiaControlPanel = 1
# 0 = Remove Nvidia Appx.
# 1 = Install Nvidia control panel. *Recomended.
# Note: The script will check if your GPU vendor is Nvidia
# Note: Refers to the new Nvidia Appx. Nvidia driver install dont cames with control panel anymore.

$darkTheme = 1
# 0 = Use Windows and apps default light theme.
# 1 = Enable dark theme. *Recomended.

$draculaThemeNotepad = 1
# 0 = Disable Dracula theme for Notepad++.
# 1 = Enable Dracula theme for Notepad++. *Recomended.

$disableWindowsFirewall = 0
# 0 = Enable.
# 1 = Disable. *Recomended.

$disableWindowsUpdates = 0
# 0 = Enable Windows Updates.
# 1 = Disable Windows Updates. *Recomended.

$disableMSStore = 0
# 0 = Enable.
# 1 = Disable. *Recomended.

$disableTelemetry = 1
# 0 = Enable Telemetry.
# 1 = Disable Telemetry. *Recomended.
# Note: Microsoft uses telemetry to periodically collect information about Windows systems. It is possible to acquire information as the computer hardware serial number, the connection records for external storage devices, and traces of executed processes.
# Note: This tweak may cause Enterprise edition to stop receiving Windows updates.

$disableSMBServer = 1
# 0 = Enable SMB Server. 
# 1 = Disable it. *Recomended.
# Note: SMB Server is used for file and printer sharing.

$disablelastaccess = 0
# 0 = Enable it.
# 1 = Disable last file access date. *Recomended.

$doQualityOfLifeStuff = 1
# 0 = Reverse system settings to default.
# 1 = Perform routines to increase quality of life. *Recomended.

$doPerformanceStuff = 1
# 0 = Reverse system settings to default.
# 1 = Perform routines to increase system performance. *Recomended.

$doPrivacyStuff = 1
# 0 = Reverse system settings to default.
# 1 = Perform routines to increase system privacy. *Recomended.

$doSecurityStuff = 1
# 0 = Reverse system settings to default.
# 1 = Perform routines to increase system security. *Recomended.

$doFingerprintPrevention = 1
# 0 = Reverse system settings to default.
# 1 = Perform routines to prevent fingerprints. *Recomended.

$disableSystemRestore = 0
# 0 = Enable system restore
# 1 = Disable system restore. *Recomended.

$disableNtfsEncryption = 0
# 0 = Enable NTFS file encryption
# 1 = Disable NTFS file encryption. *Recomended.
# NTFS file encryption is the built-in encryption tool in Windows used to encrypt files and folders on NTFS drives to protect them from unwanted access
# Disabling it can reduce the processing overhead of filesystem operations

$disableNtfsCompression = 0
# 0 = Enable NTFS file compression
# 1 = Disable NTFS file compression. *Recomended.
# Disabling it can increase performance

$disableVBS = 1
# 0 = Enable VBS
# 1 = Disable VBS. *Recomended.
# VBS (Virtualization-based security) prevent unsigned or questionable drivers and software from getting into memory
# Disabling it may have a significant performance boost, specially in games

$powerPlan = '8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c' # (High performance)
#$powerPlan = '381b4222-f694-41f0-9685-ff5bb260df2e' # (Balanced)
#$powerPlan = 'a1841308-3541-4fab-bc81-f71556f20b4a' # (Power saver)
#$powerPlan = 'a1841308-3541-4fab-bc81-f71556f20b4a' # (Power saver)

$diskAcTimeout = 0
$diskDcTimeout = 0
$monitorAcTimeout = 10
$monitorDcTimeout = 5
$standbyAcTimeout = 0
$standbyDcTimeout = 25
$hybernateAcTimeout = 0
$hybernateDcTimeout = 0

$firefoxSettings = 1
# 0 = Keep Firefox settings unchanged.
# 1 = Apply pro Firefox settings. Disable update, cross-domain cookies... *Recomended.

$firefoxCachePath = "";
# Leave it EMPTY or...
# Define a custom folder for Firefox cache files.
# Example: "E:\\FIREFOX_CACHE";

$remove3dObjFolder = 0
# 0 = Keep 3d object folder.
# 1 = Remove 3d object folder. *Recomended.

$disableWindowsSounds = 0
# 0 = Do nothing (it won't reenable it);
# 1 = Disable Windows sound effects. *Recomended.
# If you want to re-enable it, will have to do it manually

$disablePerformanceMonitor = 0
# 0 = Do nothing;
# 1 = Disable Windows Performance Logs Monitor and clear all .etl caches. *Recomended.

$unpinStartMenu = 0
# 0 = Do nothing;
# 1 = Unpin all apps from start menu.

$unnistallWindowsDefender = 0
# 0 = Do nothing (won't re-install it);
# 1 = Unnistall Windows Defender, irreversible. Safe mode is required.

$disableBloatware = 1
# 0 = Install Windows Bloatware that are not commented in bloatwareList array.
# 1 = Remove non commented bloatware in bloatwareList array. *Recomended.
# Note: On bloatwareList comment the lines on Appxs that you want to keep/install.

$editor='"%programfiles%\Notepad++\notepad++.exe"'

$bloatwareList = @(		
	# Non commented lines will be uninstalled
)
		

##########
# Configuration - End
##########
#--------------------------------------------------------------------------

##########
# Global Functions - Start
##########

$env:POWERSHELL_TELEMETRY_OPTOUT = 'yes';
$ErrorActionPreference = "SilentlyContinue"
Set-ExecutionPolicy unrestricted
New-PSDrive  HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT | Out-Null
Set-MpPreference -EnableControlledFolderAccess Enabled -ErrorAction SilentlyContinue | Out-Null

Function hardenPath($path, $desc) {
	Write-Output ($desc) 
	$object = "System"
	$permission = "Modify, ChangePermissions"

	$FileSystemRights = [System.Security.AccessControl.FileSystemRights]$permission
	$InheritanceFlag = [System.Security.AccessControl.InheritanceFlags]"ContainerInherit, ObjectInherit"
	$PropagationFlag = [System.Security.AccessControl.PropagationFlags]"None"
	$AccessControlType =[System.Security.AccessControl.AccessControlType]::Allow
	$Account = New-Object System.Security.Principal.NTAccount($object)
	$FileSystemAccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule($Account, $FileSystemRights, $InheritanceFlag, $PropagationFlag, $AccessControlType)
	$DirectorySecurity = Get-ACL $path
	$DirectorySecurity.RemoveAccessRuleAll($FileSystemAccessRule)
	Set-ACL $path -AclObject $DirectorySecurity

	$Acl = Get-ACL $path
	$AccessRule= New-Object System.Security.AccessControl.FileSystemAccessRule("System","FullControl","ContainerInherit,Objectinherit","none","Deny")
	$Acl.AddAccessRule($AccessRule)
	Set-Acl $path $Acl
}

function takeownRegistry($key) {
    # TODO does not work for all root keys yet
    switch ($key.split('\')[0]) {
        "HKEY_CLASSES_ROOT" {
            $reg = [Microsoft.Win32.Registry]::ClassesRoot
            $key = $key.substring(18)
        }
        "HKEY_CURRENT_USER" {
            $reg = [Microsoft.Win32.Registry]::CurrentUser
            $key = $key.substring(18)
        }
        "HKEY_LOCAL_MACHINE" {
            $reg = [Microsoft.Win32.Registry]::LocalMachine
            $key = $key.substring(19)
        }
    }

    # get administraor group
    $admins = New-Object System.Security.Principal.SecurityIdentifier("S-1-5-32-544")
    $admins = $admins.Translate([System.Security.Principal.NTAccount])

    # set owner
    $key = $reg.OpenSubKey($key, "ReadWriteSubTree", "TakeOwnership")
    $acl = $key.GetAccessControl()
    $acl.SetOwner($admins)
    $key.SetAccessControl($acl)

    # set FullControl
    $acl = $key.GetAccessControl()
    $rule = New-Object System.Security.AccessControl.RegistryAccessRule($admins, "FullControl", "Allow")
    $acl.SetAccessRule($rule)
    $key.SetAccessControl($acl)
}
	
Function regDelete($path, $desc) {
	Write-Output ($desc)
	
    If (Test-Path ("HKLM:\" + $path)) {
        Remove-ItemProperty -Path ("HKLM:\" + $path) -Recurse -Force
    }
	If (Test-Path ("HKCU:\" + $path)) {
        Remove-ItemProperty -Path ("HKCU:\" + $path) -Recurse -Force
    }
}	

Function regDeleteKey($path, $key, $desc) {
	Write-Output ($desc)
	
    If (Test-Path ("HKLM:\" + $path)) {
		Remove-ItemProperty -Path ("HKLM:\" + $path) -Name $key
    }
	If (Test-Path ("HKCU:\" + $path)) {
		Remove-ItemProperty -Path ("HKCU:\" + $path) -Name $key
    }
}

Function deleteFile($path, $desc) {
	Write-Output ($desc) 
	
	if (!($path | Test-Path)) { 
		write-Host -ForegroundColor Green ($path + " dont exists.")
		return	
	}
	
	takeown /F $path | out-null

	$Acl = Get-ACL $path
	$AccessRule= New-Object System.Security.AccessControl.FileSystemAccessRule("everyone","FullControl","ContainerInherit,Objectinherit","none","Allow")
	$Acl.AddAccessRule($AccessRule)
	Set-Acl $path $Acl
	
	$Acl = Get-ACL $path
	$username = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
	$AccessRule= New-Object System.Security.AccessControl.FileSystemAccessRule($username,"FullControl","ContainerInherit,Objectinherit","none","Allow")
	$Acl.AddAccessRule($AccessRule)
	Set-Acl $path $Acl	
	
	Set-ItemProperty $path -name IsReadOnly -value $false
	try {
		Remove-Item -Path $path -Recurse -Force -ErrorAction Stop;
		write-Host -ForegroundColor Green ($path + " deleted.")
	}
	catch {			
		write-Host -ForegroundColor red ($path + " NOT deleted.")
	}	
}

Function deletePath($path, $desc) {
	Write-Output ($desc) 
	
	if (!($path | Test-Path)) { 
		write-Host -ForegroundColor Green ($path + " dont exists.")
		return	
	}
	
	takeown /F $path | out-null	

	$Acl = Get-ACL $path
	$AccessRule= New-Object System.Security.AccessControl.FileSystemAccessRule("everyone","FullControl","ContainerInherit,Objectinherit","none","Allow")
	$Acl.AddAccessRule($AccessRule)
	Set-Acl $path $Acl

	$Acl = Get-ACL $path
	$username = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
	$AccessRule= New-Object System.Security.AccessControl.FileSystemAccessRule($username,"FullControl","ContainerInherit,Objectinherit","none","Allow")
	$Acl.AddAccessRule($AccessRule)
	Set-Acl $path $Acl

	$files = Get-ChildItem $path
	foreach ($file in $files) {
		$Item = $path + "\" + $file.name

		takeown /F $Item | out-null

		$Acl = Get-ACL $Item
		$AccessRule= New-Object System.Security.AccessControl.FileSystemAccessRule("everyone","FullControl","Allow")
		$Acl.AddAccessRule($AccessRule)
		Set-Acl $Item $Acl 

		$Acl = Get-ACL $Item
		$username = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
		$AccessRule= New-Object System.Security.AccessControl.FileSystemAccessRule($username,"FullControl","Allow")
		$Acl.AddAccessRule($AccessRule)
		Set-Acl $Item $Acl

		$whatIs = (Get-Item $Item) -is [System.IO.DirectoryInfo]

		if ($whatIs -eq $False){
			Set-ItemProperty $Item -name IsReadOnly -value $false 
			try {
				Remove-Item -Path $Item -Recurse -Force -ErrorAction Stop;
				write-Host -ForegroundColor Green ($file.name + " deleted.")
			}
			catch {			
				write-Host -ForegroundColor red ($file.name + " NOT deleted.")
			}
		}
	}
}

Function clearCaches {	
	regDelete "SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkList\Profiles\*" "Clearing network profiles..."
	regDelete "SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkList\Signatures\Managed\*" "Clearing managed network profiles..."
	regDelete "SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkList\Signatures\Unmanaged\*" "Clearing managed network profiles..."
	regDelete "SYSTEM\CurrentControlSet\Enum\USBSTOR\*" "Clearing USB history..."
	regDelete "SYSTEM\CurrentControlSet\Control\usbflags\*" "Clearing USB history..."
	regDelete "SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkList\Nla\Cache\Intranet\*" "Clearing intranet history..."
	regDelete "Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU\*" "Clearing commands history..."
	regDelete "Software\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths\*" "Clearing typed paths cache..."
	regDelete "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\*" "Clearing recent docs cache..."
	regDelete "SYSTEM\CurrentControlSet\Control\Session Manager\AppCompatCache\*" "Clearing compat cache..."
	regDelete "Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2\*" "Clearing mapped drives cache..."
	
	Stop-Process -ProcessName explorer -Force	
	Remove-Item $env:TEMP\*.* -confirm:$false -Recurse -Force
	Get-ChildItem $env:TEMP\*.* | Remove-Item -confirm:$false -Recurse -Force
	Remove-Item $env:WINDIR\Prefetch\*.* -confirm:$false -Recurse -Force
	Get-ChildItem $env:WINDIR\Prefetch\*.* | Remove-Item -confirm:$false -Recurse -Force
	Remove-Item $env:WINDIR\*.dmp -confirm:$false -Recurse -Force	
	
	taskkill /F /IM explorer.exe
	Start-Sleep -Seconds 3
		
	deletePath "$env:LocalAppData\Microsoft\Windows\Explorer" "Clearing thumbs files cache..."
	deletePath "$env:LocalAppData\Microsoft\Windows\Recent" "Clearing recent folder cache..."
	deletePath "$env:LocalAppData\Microsoft\Windows\Recent\AutomaticDestinations" "Clearing automatic destinations folder cache..."
	deletePath "$env:LocalAppData\Microsoft\Windows\Recent\CustomDestinations" "Clearing custom destinations folder cache..."

	start explorer.exe	
}
	
Function RegChange($path, $thing, $value, $desc, $type) {
	Write-Output ($desc)	
	
   # String: Specifies a null-terminated string. Equivalent to REG_SZ.
   # ExpandString: Specifies a null-terminated string that contains unexpanded references to environment variables that are expanded when the value is retrieved. Equivalent to REG_EXPAND_SZ.
   # Binary: Specifies binary data in any form. Equivalent to REG_BINARY.
   # DWord: Specifies a 32-bit binary number. Equivalent to REG_DWORD.
   # MultiString: Specifies an array of null-terminated strings terminated by two null characters. Equivalent to REG_MULTI_SZ.
   # Qword: Specifies a 64-bit binary number. Equivalent to REG_QWORD.
   # Unknown: Indicates an unsupported registry data type, such as REG_RESOURCE_LIST.

	$type2 = "String"
	if (-not ([string]::IsNullOrEmpty($type)))
	{
		$type2 = $type
	}
	
	If (!(Test-Path ("HKLM:\" + $path))) {
		New-Item -Path ("HKLM:\" + $path) -Force | out-null
	}
	If (!(Test-Path ("HKCU:\" + $path))) {
        New-Item -Path ("HKCU:\" + $path) -Force | out-null
    }
	
    If (Test-Path ("HKLM:\" + $path)) {
        Set-ItemProperty ("HKLM:\" + $path) $thing -Value $value -Type $type2 -PassThru:$false | out-null
    }
	If (Test-Path ("HKCU:\" + $path)) {
        Set-ItemProperty ("HKCU:\" + $path) $thing -Value $value -Type $type2 -PassThru:$false | out-null
    }	

}

#This will self elevate the script so with a UAC prompt since this script needs to be run as an Administrator in order to function properly.
If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]'Administrator')) {
    Write-Host "You didn't run this script as an Administrator. This script will self elevate to run as an Administrator and continue."
    Start-Sleep 1
    Write-Host "                                               3"
    Start-Sleep 1
    Write-Host "                                               2"
    Start-Sleep 1
    Write-Host "                                               1"
    Start-Sleep 1
    Start-Process powershell.exe -ArgumentList ("-NoProfile -ExecutionPolicy Bypass -File `"{0}`"" -f $PSCommandPath) -Verb RunAs
    Exit
}

function serviceStatus{ 
	param($ServiceName)
	Write-Output $("Checking service " + $ServiceName + " status...")
	$arrService = Get-Service -Name $ServiceName	
	if ($arrService.Status -eq "Stopped"){
		Write-Output $("Service " + $ServiceName + " is stopped.")
		return "stopped"
	}
}
#serviceStatus("Schedule");

function killProcess{ 
	param($processName)
	Write-Output $("Trying to close " + $processName + " ...")
	
	for ($i=1; $i -le 10; $i++){
		$firefox = Get-Process $processName -ErrorAction SilentlyContinue
		if ($firefox) {
			$firefox | Stop-Process -Force
			Sleep 1			
		}
	}
	return
}

Function DisableUAC {
	New-ItemProperty -Path HKLM:Software\Microsoft\Windows\CurrentVersion\policies\system -Name EnableLUA -PropertyType DWord -Value 0 -Force -EA SilentlyContinue | Out-Null
	if($?){   write-Host -ForegroundColor Green "Windows UAC disabled"  }else{   write-Host -ForegroundColor green "Windows UAC not disabled" } 
	rd "%UserProfile%\OneDrive" /q /s > nul 2>&1
	rd "%SystemDrive%\OneDriveTemp" /q /s > nul 2>&1
	rd "%LocalAppData%\Microsoft\OneDrive" /q /s > nul 2>&1
	rd "%ProgramData%\Microsoft OneDrive" /q /s > nul 2>&1
	reg delete "HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f > nul 2>&1
	reg delete "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f > nul 2>&1
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v "DisableFileSyncNGSC" /t REG_DWORD /d 1 /f > nul
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v "DisableFileSync" /t REG_DWORD /d 1 /f > nul
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v "DisableMeteredNetworkFileSync" /t REG_DWORD /d 1 /f > nul
	reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v "DisableLibrariesDefaultSaveToOneDrive" /t REG_DWORD /d 1 /f > nul
	reg add "HKCU\SOFTWARE\Microsoft\OneDrive" /v "DisablePersonalSync" /t REG_DWORD /d 1 /f > nul
}

Function EnablePeek {	
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "DisablePreviewWindow" "0" "Enabling Windows Peek Thumbnail" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "DisablePreviewDesktop" "0" "Enabling Windows Peek Desktop Preview" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\DWM" "EnableAeroPeek" "1" "Enabling Windows Peek" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "ExtendedUIHoverTime" "0" "Enabling Windows Peek Taskbar Thumbnail" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\DWM" "AlwaysHibernateThumbnails" "1" "Enabling Windows Peek Taskbar Thumbnail Cache" "DWord"
}

Function DisablePeek {	
	if ($beAeroPeekSafe -eq 1) {
		Write-Host "Aero Peek NOT disabled because of the beAeroPeekSafe configuration" -ForegroundColor Yellow -BackgroundColor DarkGreen
		return
	}	
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "DisablePreviewWindow" "1" "Disabling Windows Peek Thumbnail" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "DisablePreviewDesktop" "1" "Disabling Windows Peek Desktop Preview" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\DWM" "EnableAeroPeek" "0" "Disabling Windows Peek" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "ExtendedUIHoverTime" "30000" "Disabling Windows Peek Taskbar Thumbnail" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\DWM" "AlwaysHibernateThumbnails" "0" "Disabling Windows Peek Taskbar Thumbnail Cache" "DWord"
}

Function EnableThumbnail {	
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "IconsOnly" "0" "Enabling Windows Thumbnail" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "DisableThumbnailCache" "0" "Enabling Windows Thumbnail" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "DisableThumbsDBOnNetworkFolders" "0" "Enabling Windows Thumbnail" "DWord"
}

Function DisableThumbnail {	
	if ($beThumbnailSafe -eq 1) {
		Write-Host "Windows Thumbnails NOT disabled because of the beThumbnailSafe configuration" -ForegroundColor Yellow -BackgroundColor DarkGreen
		return
	}
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "IconsOnly" "1" "Disabling Windows Thumbnail" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "DisableThumbnailCache" "1" "Disabling Windows Thumbnail" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "DisableThumbsDBOnNetworkFolders" "1" "Disabling Windows Thumbnail" "DWord"
}

# Disable Xbox features
Function DisableXboxFeatures {
	Write-Output "Disabling Xbox features..."
	Get-AppxPackage "Microsoft.XboxApp" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.XboxIdentityProvider" | Remove-AppxPackage -ErrorAction SilentlyContinue
	Get-AppxPackage "Microsoft.XboxSpeechToTextOverlay" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.XboxGameOverlay" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.XboxGamingOverlay" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.Xbox.TCUI" | Remove-AppxPackage
	
	if ($(serviceStatus("Schedule")) -eq "running") {
		Write-Output "Disabling Xbox scheduled tasks..."
		Get-ScheduledTask  XblGameSaveTaskLogon | Disable-ScheduledTask
		Get-ScheduledTask  XblGameSaveTask | Disable-ScheduledTask
	}
	
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\GameBar" -Name "AutoGameModeEnabled" -Type DWord -Value 0
	RegChange "System\GameConfigStore" "GameDVR_Enabled" "0" "Changing Registry key to disable Game DVR - GameDVR_Enabled" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" "AppCaptureEnabled" "0" "Changing Registry key to disable gamebarpresencewriter"
	
	If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR")) {
		New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR" | Out-Null
	}
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR" -Name "AllowGameDVR" -Type DWord -Value 0
	RegChange "Software\Microsoft\GameBar" "ShowStartupPanel" "0" "Disabling Game Bar Tips" "DWord"
}

# Prefetch-files contain metadata information about the last run of the program, how many times it was run, which logical drive a program was run and dlls used.
Function EnablePrefetcher {	
	RegChange "SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" "EnablePrefetcher" "3" "Enabling Prefetcher" "DWord"
}
Function DisablePrefetcher {	
	RegChange "SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" "EnablePrefetcher" "0" "Disabling Prefetcher" "DWord"
}

# 
Function DisableDnsCache {
	if ($beVpnPppoeSafe -eq 1) {
		Write-Host "DNS cache NOT disabled because of the beVpnPppoeSafe configuration" -ForegroundColor Yellow -BackgroundColor DarkGreen
		return
	}
	
	Write-Output "Flushing DNS."
	ipconfig /flushDNS
	RegChange "SYSTEM\CurrentControlSet\services\Dnscache" "Start" "4" "Disabling DNS Cache Service" "DWord"
}

Function EnableDnsCache {	
	RegChange "SYSTEM\CurrentControlSet\services\Dnscache" "Start" "2" "Enabling DNS Cache Service" "DWord"
}

Function EnableMemoryDump {
	RegChange "SYSTEM\CurrentControlSet\Control\CrashControl" "CrashDumpEnabled" "1" "Enabling Memory Dump" "DWord"
}

Function DisableMemoryDump {
	RegChange "SYSTEM\CurrentControlSet\Control\CrashControl" "CrashDumpEnabled" "0" "Disabling Memory Dump" "DWord"
}

Function GPUVendor {
	Write-Output "Checking your GPU vendor..."
	$myGPU = Get-WmiObject win32_VideoController
	if ($myGPU.name -like '*nvidia*') {
		write-host 'GPU vendor is Nvidia'
		return "nvidia"				
	}
}

Function installDraculaNotepad {
	Write-Output "Checking internet connection..." 
	
	$HTTP_Request = [System.Net.WebRequest]::Create('http://google.com')
	$HTTP_Response = $HTTP_Request.GetResponse()
	$HTTP_Status = [int]$HTTP_Response.StatusCode

	If ($HTTP_Status -eq 200) {
		Write-Output "Conected to the internet." 
	}
	Else {
		Write-Output "NOT conected to the internet." 
		return
	}

	If ($HTTP_Response -eq $null) { } 
	Else { $HTTP_Response.Close() }

	
	Write-Output "Checking if Notepad++ is running..." 	
	if((get-process "Notepad++" -ea SilentlyContinue) -eq $Null){        
		Write-Output "Notepad++ not running." 
	} else { 
		$restartNeeded = 1
		Write-Host "Notepad++ is running and will be killed. Press any key to continue..." -ForegroundColor Yellow -BackgroundColor DarkGreen
		$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
		killProcess("notepad++");
	}

	Write-Output "Downloading Dracula Theme for Notepad++..." 
	$url = "https://raw.githubusercontent.com/dracula/notepad-plus-plus/master/Dracula.xml"
	$output = "$Env:USERPROFILE\AppData\Roaming\Notepad++\themes\Dracula.xml"
	$start_time = Get-Date

	$wc = New-Object System.Net.WebClient
	$wc.DownloadFile($url, $output)

	Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)" 

	$file = "$Env:USERPROFILE\AppData\Roaming\Notepad++\config.xml"
	$OpenTag = 'name="stylerTheme" path="'
	$CloseTag = '" />'
	$NewText = $OpenTag + "$Env:USERPROFILE\AppData\Roaming\Notepad++\themes\Dracula.xml" + $CloseTag
	(Get-Content $file) | Foreach-Object {$_ -replace "$OpenTag.*$CloseTag", $NewText} | Set-Content $file
	
	if ($restartNeeded -eq 1) {	
		Write-Output "Starting Notepad++" 
		Start notepad++
	}
}

Function uninstallDraculaNotepad {
	Write-Output "Checking if Notepad++ is running..." 	
	if((get-process "Notepad++" -ea SilentlyContinue) -eq $Null){
		Write-Output "Notepad++ not running." 
	} else { 
		$restartNeeded = 1
		Write-Host "Notepad++ is running and will be killed. Press any key to continue..." -ForegroundColor Yellow -BackgroundColor DarkGreen
		$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
		killProcess("notepad++");
	}
	
	$file = "$Env:USERPROFILE\AppData\Roaming\Notepad++\config.xml"
	$OpenTag = 'name="stylerTheme" path="'
	$CloseTag = '" />'
	$NewText = $OpenTag + "$Env:USERPROFILE\AppData\Roaming\Notepad++\stylers.xml" + $CloseTag
	(Get-Content $file) | Foreach-Object {$_ -replace "$OpenTag.*$CloseTag", $NewText} | Set-Content $file
	
	if ($restartNeeded -eq 1) {	
		Write-Output "Starting Notepad++" 
		Start notepad++
	}
}	

# Link-Local Multicast Name Resolution (LLMNR) protocol, a protocol that allow name resolution without the requirement of a DNS server. LLMNR is a secondary name resolution protocol. 
# With LLMNR, queries are sent using multicast over a local network link on a single subnet from a client computer to another client computer on the same subnet that also has LLMNR enabled.
# Imposes security risk for layer-4 name resolution spoofing attacks, ARP poisoning, KARMA attack and cache poisoning.
Function DisableLLMNR {
	RegChange "SOFTWARE\Policies\Microsoft\Windows NT\DNSClient" "EnableMulticast" "0" "Disabling Link-Local Multicast Name Resolution (LLMNR) protocol" "DWord"
}

Function EnableLLMNR {
	RegChange "SOFTWARE\Policies\Microsoft\Windows NT\DNSClient" "EnableMulticast" "1" "Enabling Link-Local Multicast Name Resolution (LLMNR) protocol" "DWord"
}	

##########
# Global Functions - End
##########
#--------------------------------------------------------------------------

##########
# Program - Start
##########

if ($troubleshootInstalls -eq 1) {
	Write-Output "Troubleshoot Install: Enabling Windows Management Instrumentation service enabled."
	Get-Service Winmgmt | Start-Service -PassThru | Set-Service -StartupType automatic
	
	# BITS (Background Intelligent Transfer Service), its aggressive bandwidth eating will interfere with you online gameplay, work and navigation. Its aggressive disk usable will reduce your HDD or SSD lifespan
	write-Host "Troubleshoot Install: Enabling BITS (Background Intelligent Transfer Service)" -ForegroundColor Green -BackgroundColor Black 
	Get-Service BITS | Set-Service -StartupType automatic
	
	write-Host "DoSvc (Delivery Optimization) it overrides the windows updates opt-out user option, turn your pc into a p2p peer for Windows updates, mining your network performance and compromises your online gameplay, work and navigation." -ForegroundColor Green -BackgroundColor Black
	Write-Host "Troubleshoot Install: Enabling DoSvc (Delivery Optimization)..."
	Get-Service DoSvc | Set-Service -StartupType automatic
	
	Write-Output "Troubleshoot Install: Windows Management Instrumentation enabled by registry."
	New-ItemProperty -Path 'HKLM:SYSTEM\CurrentControlSet\Services\Winmgmt' -name Start -PropertyType DWord -Value 2 -Force
	
	Write-Output "Troubleshoot Install: Windows firewall service enabled by registry."
	New-ItemProperty -Path HKLM:SYSTEM\CurrentControlSet\Services\MpsSvc -Name Start -PropertyType DWord -Value 2 -Force -EA SilentlyContinue | Out-Null	
	
	Write-Output "Troubleshoot Install: Windows Firewall enabled by registry."
	RegChange "Software\Policies\Microsoft\Windows Defender" "DisableAntiSpyware" "0" "Enabling Windows Anti Spyware - DisableAntiSpyware - Windows Firewall"
	
	Write-Output "Troubleshoot Install: Windows Firewall enabled by Get-Service."
	Get-Service MpsSvc | Set-Service -StartupType automatic
	
	Write-Output "Troubleshoot Install: Windows Firewall enabled by Get-NetFirewallProfile."
	Get-NetFirewallProfile | Set-NetFirewallProfile -Enabled True
	
	RegChange "SYSTEM\CurrentControlSet\Services\MpsSvc" "Start" "2" "Enabling Windows Firewall service..." "DWord"
	
	Write-Output "Troubleshoot Install: Enabling connection related dependency services."
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\EventLog-Application" "Start" "1" "Enabling AutoLogger\EventLog-Application..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\EventLog-Security" "Start" "1" "Enabling AutoLogger\EventLog-Security..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\EventLog-System" "Start" "1" "Enabling AutoLogger\EventLog-System..." "DWord"
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\EventLog-Application" "Start" "1" "Enabling AutoLogger\EventLog-Application..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\EventLog-Security" "Start" "1" "Enabling AutoLogger\EventLog-Security..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\EventLog-System" "Start" "1" "Enabling AutoLogger\EventLog-System..." "DWord"
	
	PAUSE
}

if ($legacyRightClicksMenu -eq 0) {
	regDelete "Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" "Disabling legacy right click menu..." 
}

if ($legacyRightClicksMenu -eq 1) {
	RegChange "Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" "(Default)" "" "Enabling legacy right click menu..." "String"
}

if ($disableStartupSound -eq 0) {
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\BootAnimation" "DisableStartupSound" "0" "Enabling Windows startup sound..." "DWord"
}

if ($disableStartupSound -eq 1) {
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\BootAnimation" "DisableStartupSound" "1" "Disabling Windows startup sound..." "DWord"
}

if ($disableCortana -eq 1) {
	RegChange "SOFTWARE\Policies\Microsoft\Windows\Windows Search" "ConnectedSearchPrivacy" "3" "Setting ConnectedSearchPrivacy to 3..." "DWord"
	RegChange "SOFTWARE\Policies\Microsoft\Windows\Windows Search" "ConnectedSearchUseWeb" "0" "Setting ConnectedSearchUseWeb to 0..." "DWord"
	RegChange "SOFTWARE\Policies\Microsoft\Windows\Windows Search" "ConnectedSearchUseWebOverMeteredConnections" "0" "Setting ConnectedSearchUseWebOverMeteredConnections to 0..." "DWord"
	RegChange "SOFTWARE\Policies\Microsoft\Windows\Windows Search" "DisableWebSearch" "1" "Disabling Cortana web search..." "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\Search" "CortanaEnabled" "0" "Disabling Cortana..." "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\Search" "BingSearchEnabled" "0" "Disabling BingSearch..." "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\Search" "CanCortanaBeEnabled" "0" "Setting CanCortanaBeEnabled to 0..." "DWord"
	RegChange "SOFTWARE\Microsoft\Personalization\Settings" "AcceptedPrivacyPolicy" "0" "Setting AcceptedPrivacyPolicy to 0..." "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\Search" "DeviceHistoryEnabled" "0" "Setting DeviceHistoryEnabled to 0..." "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\Search" "HistoryViewEnabled" "0" "Setting HistoryViewEnabled to 0..." "DWord"
}

if ($disableVBS -eq 1) {
	RegChange "SYSTEM\CurrentControlSet\Control\DeviceGuard" "EnableVirtualizationBasedSecurity" "0" "Disabling Virtualization-based security..." "DWord"
}

if ($disableNtfsEncryption -eq 0) {
	RegChange "SYSTEM\CurrentControlSet\Policies" "NtfsDisableEncryption" "0" "Enabling NTFS file encryption..." "DWord"
}

if ($disableNtfsCompression -eq 1) {
	RegChange "SYSTEM\CurrentControlSet\Policies" "NtfsDisableCompression" "1" "Disabling NTFS file compression..." "DWord"
}

if ($beXboxSafe -eq 0) {
	DisableXboxFeatures
}

if ($beWifiSafe -eq 1) {
	RegChange "SYSTEM\CurrentControlSet\Services\RmSvc" "Start" "2" "Enabling RmSvc (Radio Management Service) service" "DWord"
	Get-Service RmSvc | Set-Service -StartupType automatic
	
	RegChange "SYSTEM\CurrentControlSet\Services\WlanSvc" "Start" "2" "Enabling WlanSvc (WLAN Autoconfig) service" "DWord"
	Get-Service WlanSvc | Set-Service -StartupType automatic
}

if ($beXboxSafe -eq 1) {
	$safeXboxBloatware = @(	
		"Microsoft.XboxGamingOverlay"
		"Microsoft.Xbox.TCUI"
		"Microsoft.XboxApp"
		"Microsoft.XboxGameOverlay"
		"Microsoft.XboxIdentityProvider"
		"Microsoft.XboxSpeechToTextOverlay"
	)
	foreach ($safeXboxBloatware1 in $safeXboxBloatware) {
		Write-Output "Trying to install $safeXboxBloatware1."
		Get-AppxPackage -Name $safeXboxBloatware1| Add-AppxPackage
		Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like $safeXboxBloatware1 | Add-AppxProvisionedPackage -Online		
	}
	
	RegChange "System\GameConfigStore" "GameDVR_Enabled" "1" "Changing Registry key to ENABLE Game DVR - GameDVR_Enabled" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" "AppCaptureEnabled" "1" "Changing Registry key to ENABLE gamebarpresencewriter"
	
	# The Game bar is a Xbox app Game DVR feature that makes it simple to take control of your gaming activities—such as broadcasting, capturing clips, and sharing captures
	# (delete) = Enable
	# 0 = Disable
	Remove-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR" -Name "AllowGameDVR" -ErrorAction SilentlyContinue
	Remove-ItemProperty -Path "HKCU:\Software\Microsoft\GameBar" -Name "AutoGameModeEnabled" -ErrorAction SilentlyContinue
	
	if ($(serviceStatus("Schedule")) -eq "running") {
		Write-Output "Enabling Xbox scheduled tasks..."
		Get-ScheduledTask  XblGameSaveTaskLogon | Enable-ScheduledTask
		Get-ScheduledTask  XblGameSaveTask | Enable-ScheduledTask
	}
	RegChange "Software\Microsoft\GameBar" "ShowStartupPanel" "1" "Enabling Game Bar Tips" "DWord"
}

if ($beBiometricSafe -eq 1) {
	$safebeBiometricSafe = @(	
		"*Microsoft.BioEnrollment*"
		"*Microsoft.CredDialogHost*"
		"*Microsoft.ECApp*"
		"*Microsoft.LockApp*"
	)
	foreach ($safebeBiometricSafe1 in $safebeBiometricSafe) {
		Get-AppxPackage -Name $safebeBiometricSafe1| Add-AppxPackage
		Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like $safebeBiometricSafe1 | Add-AppxProvisionedPackage -Online
		Write-Output "Trying to install $safebeBiometricSafe1."
	}
}

if ($beCastSafe -eq 1) {
	Write-Output "Trying to install Microsoft.PPIP."
	Get-AppxPackage -Name "*Microsoft.PPIP*" | Add-AppxPackage
	Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like "*Microsoft.PPIP*" | Add-AppxProvisionedPackage -Online
}

if ($beVpnPppoeSafe -eq 1) {
	RegChange "SYSTEM\CurrentControlSet\services\Dnscache" "Start" "2" "Enabling DNS Cache Service" "DWord"	
}
	
if (GPUVendor -eq "nvidia" -and installNvidiaControlPanel -eq 1) {	
	Get-AppxPackage -Name "*NVIDIACorp.NVIDIAControlPanel*" | Add-AppxPackage
	Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like "*NVIDIACorp.NVIDIAControlPanel*" | Add-AppxProvisionedPackage -Online
	Write-Output "Trying to install Nvidia control panel."
}

if ($draculaThemeNotepad -eq 0) {	
	Write-Output "Checking if Notepad++ is installed..."	
	$fileToCheck = "$Env:USERPROFILE\AppData\Roaming\Notepad++\config.xml"
	if (Test-Path $fileToCheck -PathType leaf)	{
		uninstallDraculaNotepad	
	} else { 		
		Write-Output "Notepad++ is not installed." 
	}
}

if ($draculaThemeNotepad -eq 1) {	
	Write-Output "Checking if Notepad++ is installed..."	
	$fileToCheck = "$Env:USERPROFILE\AppData\Roaming\Notepad++\config.xml"
	if (Test-Path $fileToCheck -PathType leaf)	{
		installDraculaNotepad	
	} else { 		
		Write-Output "Notepad++ is not installed." 
	}
}

# SMB Server is known for opening doors for mass ransomware attacks - WannaCry and NotPetya
if ($disableSMBServer -eq 0) {	
	Write-Output "Enabling SMB Server..."	
	Set-SmbServerConfiguration -EnableSMB2Protocol $true -Force
	Enable-NetAdapterBinding -Name "*" -ComponentID "ms_server"
}

if ($disableSMBServer -eq 1) {	
	Write-Output "Disabling SMB Server..."	
	Set-SmbServerConfiguration -EnableSMB1Protocol $false -Force
	Set-SmbServerConfiguration -EnableSMB2Protocol $false -Force
	Disable-NetAdapterBinding -Name "*" -ComponentID "ms_server"
}

if ($disableSystemRestore -eq 0) {
	Write-Output "Enabling system restore..."
	if ($(serviceStatus("Schedule")) -eq "running") {
		Write-Output "Enabling system restore scheduled task..."
		Enable-ScheduledTask -TaskName "Microsoft\Windows\SystemRestore\SR" -EA SilentlyContinue | Out-Null
	}
	
	Get-Service swprv | Set-Service -StartupType automatic
	Get-Service VSS | Set-Service -StartupType automatic
}

if ($disableSystemRestore -eq 1) {
	Write-Output "Disabling system restore..."
	if ($(serviceStatus("Schedule")) -eq "running") {
		Write-Output "Disabling system restore scheduled task..."
		Disable-ScheduledTask -TaskName "Microsoft\Windows\SystemRestore\SR" -EA SilentlyContinue | Out-Null
	}

	Get-Service swprv | Stop-Service -PassThru | Set-Service -StartupType disabled
	Get-Service VSS | Stop-Service -PassThru | Set-Service -StartupType disabled
}

if ($disableTelemetry -eq 0) {		
	RegChange "SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" "AllowTelemetry" "1" "Disabling data collection through telemetry"  
	RegChange "SOFTWARE\Policies\Microsoft\Windows\DataCollection" "AllowTelemetry" "1" "Disabling data collection through telemetry"  
	RegChange "SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" "AllowTelemetry" "1" "Disabling data collection through telemetry"  
	if ($(serviceStatus("Schedule")) -eq "running") {
		Write-Output "Enabling telemetry scheduled tasks..."
		Enable-ScheduledTask -TaskName "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" | Out-Null
		Enable-ScheduledTask -TaskName "Microsoft\Windows\Application Experience\ProgramDataUpdater" | Out-Null
		Enable-ScheduledTask -TaskName "Microsoft\Windows\Autochk\Proxy" | Out-Null
		Enable-ScheduledTask -TaskName "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" | Out-Null
		Enable-ScheduledTask -TaskName "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" | Out-Null
		Enable-ScheduledTask -TaskName "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" | Out-Null
	}
}

if ($disableTelemetry -eq 1) {	
	RegChange "SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" "AllowTelemetry" "0" "Disabling data collection through telemetry"  
	RegChange "SOFTWARE\Policies\Microsoft\Windows\DataCollection" "AllowTelemetry" "0" "Disabling data collection through telemetry"  
	RegChange "SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" "AllowTelemetry" "0" "Disabling data collection through telemetry"
	if ($(serviceStatus("Schedule")) -eq "running") {
		Write-Output "Disabling telemetry scheduled tasks..."
		Disable-ScheduledTask -TaskName "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" | Out-Null
		Disable-ScheduledTask -TaskName "Microsoft\Windows\Application Experience\ProgramDataUpdater" | Out-Null
		Disable-ScheduledTask -TaskName "Microsoft\Windows\Autochk\Proxy" | Out-Null
		Disable-ScheduledTask -TaskName "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" | Out-Null
		Disable-ScheduledTask -TaskName "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" | Out-Null
		Disable-ScheduledTask -TaskName "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" | Out-Null
	}	
}

if ($disableBloatware -eq 0) {	
	foreach ($Bloat in $bloatwareList) {
		Write-Output "Trying to INSTALL $Bloat."
		Get-AppxPackage -Name $Bloat| Add-AppxPackage
		Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like $Bloat | Add-AppxProvisionedPackage -Online		
	}	
	
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" "FeatureManagementEnabled" "1" "Enabling Windows bloatware" "Dword"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" "ContentDeliveryAllowed" "1" "Enabling Windows bloatware" "Dword"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" "OemPreInstalledAppsEnabled" "1" "Enabling Windows bloatware" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" "PreInstalledAppsEnabled" "1" "Enabling Windows bloatware" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" "PreInstalledAppsEverEnabled" "1" "Enabling Windows bloatware" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" "SilentInstalledAppsEnabled" "1" "Enabling Windows bloatware" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" "SystemPaneSuggestionsEnabled" "1" "Enabling Windows bloatware" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" "SubscribedContentEnabled" "1" "Enabling Windows bloatware" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" "SubscribedContent-353696Enabled" "1" "Enabling Windows bloatware" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" "SubscribedContent-353694Enabled" "1" "Enabling Windows bloatware" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" "SubscribedContent-338393Enabled" "1" "Enabling Windows bloatware" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" "SubscribedContent-338389Enabled" "1" "Enabling Windows bloatware" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" "SubscribedContent-338388Enabled" "1" "Enabling Windows bloatware" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" "SubscribedContent-310093Enabled" "1" "Enabling Windows bloatware" "DWord"
}

if ($disableBloatware -eq 1) {			
	foreach ($Bloat in $bloatwareList) {
		Write-Output "Trying to remove $Bloat"
		Get-AppxPackage -Name $Bloat| Remove-AppxPackage
	}	
	
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" "FeatureManagementEnabled" "0" "Adding Registry key to PREVENT bloatware apps from returning" "Dword"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" "ContentDeliveryAllowed" "0" "Adding Registry key to PREVENT bloatware apps from returning" "Dword"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" "OemPreInstalledAppsEnabled" "0" "Adding Registry key to PREVENT bloatware apps from returning" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" "PreInstalledAppsEnabled" "0" "Adding Registry key to PREVENT bloatware apps from returning" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" "PreInstalledAppsEverEnabled" "0" "Adding Registry key to PREVENT bloatware apps from returning" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" "SilentInstalledAppsEnabled" "0" "Adding Registry key to PREVENT bloatware apps from returning" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" "SystemPaneSuggestionsEnabled" "0" "Adding Registry key to PREVENT bloatware apps from returning" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" "SubscribedContentEnabled" "0" "Adding Registry key to PREVENT bloatware apps from returning" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" "SubscribedContent-353696Enabled" "0" "Adding Registry key to PREVENT bloatware apps from returning" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" "SubscribedContent-353694Enabled" "0" "Adding Registry key to PREVENT bloatware apps from returning" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" "SubscribedContent-338393Enabled" "0" "Adding Registry key to PREVENT bloatware apps from returning" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" "SubscribedContent-338389Enabled" "0" "Adding Registry key to PREVENT bloatware apps from returning" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" "SubscribedContent-338388Enabled" "0" "Adding Registry key to PREVENT bloatware apps from returning" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" "SubscribedContent-310093Enabled" "0" "Adding Registry key to PREVENT bloatware apps from returning" "DWord"
	
	regDelete "Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\Subscriptions" "Clearing bloatware registry keys"
	regDelete "Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" "Clearing bloatware registry keys"
}

if ($unpinStartMenu -eq 1) {			
	Write-Host "Unpinning all tiles from the start menu"
	regDelete "Software\Microsoft\Windows\CurrentVersion\CloudStore\*" "Clearing all start menu items..." 
	
    (New-Object -Com Shell.Application).
    NameSpace('shell:::{4234d49b-0245-4df3-b780-3893943456e1}').
    Items() |
        % { $_.Verbs() } |
        ? {$_.Name -match 'Un.*pin from Start'} |
        % {$_.DoIt()}
}

if ($disablelastaccess -eq 0) {
	Write-Output "Disabling last file access."
	fsutil behavior set disablelastaccess 3
}

if ($disablelastaccess -eq 1) {
	Write-Output "Enabling last file access."
	fsutil behavior set disablelastaccess 2
}

if ($doPerformanceStuff -eq 0) {
	RegChange "SYSTEM\CurrentControlSet\Services\StorSvc" "Start" "2" "Enabling StorSvc (Storage Service) service" "DWord"
	Get-Service StorSvc | Set-Service -StartupType automatic

	RegChange "SYSTEM\CurrentControlSet\Services\MSDTC" "Start" "2" "Enabling MSDTC (Distributed Transaction Coordinator) service" "DWord"
	Get-Service MSDTC | Set-Service -StartupType automatic
	
	RegChange "SYSTEM\CurrentControlSet\Services\TokenBroker" "Start" "2" "Enabling TokenBroker (Web Account Manager) service" "DWord"
	Get-Service TokenBroker | Set-Service -StartupType automatic
	
	RegChange "SYSTEM\CurrentControlSet\Services\Ndu" "Start" "2" "Enabling Ndu (Network Data Usage Monitor) service" "DWord"
	Get-Service Ndu | Set-Service -StartupType automatic
	
	RegChange "SYSTEM\CurrentControlSet\Services\AppMgmt" "Start" "2" "Enabling AppMgmt (Application Management) service" "DWord"
	Get-Service AppMgmt | Set-Service -StartupType automatic
	
	RegChange "SYSTEM\CurrentControlSet\Services\Spooler" "Start" "2" "Enabling print spooler service" "DWord"
	Get-Service Spooler | Set-Service -StartupType automatic
	
	RegChange "SYSTEM\CurrentControlSet\Services\StiSvc" "Start" "2" "Enabling StiSvc Windows Image Acquisition (WIA) service" "DWord"
	Get-Service StiSvc | Set-Service -StartupType automatic
	
	RegChange "SYSTEM\CurrentControlSet\Services\TrkWks" "Start" "2" "Enabling TrkWks (Distributed Link Tracking Client) service" "DWord"
	Get-Service TrkWks | Set-Service -StartupType automatic
	
	RegChange "SYSTEM\CurrentControlSet\Services\BthAvctpSvc" "Start" "2" "Enabling AVCTP (Audio Video Control Transport Protocol) service" "DWord"
	Get-Service BthAvctpSvc | Set-Service -StartupType automatic
	
	RegChange "SYSTEM\CurrentControlSet\Services\DispBrokerDesktopSvc" "Start" "2" "Enabling DispBrokerDesktopSvc (Display Policy Service) service" "DWord"
	Get-Service DispBrokerDesktopSvc | Set-Service -StartupType automatic
	
	# DoSvc (Delivery Optimization) it overrides the windows updates opt-out user option, turn your pc into a p2p peer for Windows updates, mining your network performance and compromises your online gameplay, work and navigation
	RegChange "SYSTEM\CurrentControlSet\Services\DoSvc" "Start" "2" "Enabling DoSvc (Delivery Optimization) service" "DWord"
	Get-Service DoSvc | Set-Service -StartupType automatic
	
	RegChange "SYSTEM\CurrentControlSet\Services\OneSyncSvc" "Start" "2" "Enabling OneSyncSvc service" "DWord"
	Get-Service OneSyncSvc | Set-Service -StartupType automatic
	
	RegChange "SYSTEM\CurrentControlSet\Services\WalletService" "Start" "2" "Enabling WalletService service" "DWord"
	Get-Service WalletService | Set-Service -StartupType automatic
	
	RegChange "SYSTEM\CurrentControlSet\Services\diagnosticshub.standardcollector.service" "Start" "2" "Enabling diagnosticshub.standardcollector.service service" "DWord"
	Get-Service diagnosticshub.standardcollector.service | Set-Service -StartupType automatic

	# In very rare cases, Hardware Accelerated GPU Scheduling set to ON (2) may improve latency
	RegChange "SYSTEM\CurrentControlSet\Control\GraphicsDrivers" "HwSchMode" "1" "Disabling Hardware Accelerated GPU Scheduling" "DWord"

	RegChange "Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" "EnableTransparency" "1" "Enabling Windows transparency effect" "DWord"	
	RegChange "SYSTEM\CurrentControlSet\services\WdiServiceHost" "Start" "2" "Enabling Diagnostic Service Host" "DWord"
	RegChange "SYSTEM\CurrentControlSet\services\WdiSystemHost" "Start" "2" "Enabling Diagnostic System Host Service" "DWord"
	RegChange "SYSTEM\CurrentControlSet\services\DPS" "Start" "2" "Enabling Diagnostic Policy Service" "DWord"
	
	Write-Output "Enabling EpsonCustomerResearchParticipation..."
	Get-Service EpsonCustomerResearchParticipation | Set-Service -StartupType automatic
	Write-Output "Enabling LGHUBUpdaterService..."
	Get-Service LGHUBUpdaterService | Set-Service -StartupType automatic
	
	RegChange "System\CurrentControlSet\Control\Session Manager\Power" "HibernateEnabled" "1" "Enabling hibernation..." "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" "ShowHibernateOption" "1" "Making visible hibernation..." "DWord"
	
	if ($(serviceStatus("Schedule")) -eq "running") {
		write-Host -ForegroundColor Green -BackgroundColor Black "Defragmentation cause unnecessary wear on SSDs"
		Write-Host "Enabling scheduled defragmentation..."
		Enable-ScheduledTask -TaskName "Microsoft\Windows\Defrag\ScheduledDefrag" | Out-Null
	}
	
	write-Host "Superfetch is known to cause all kinds of problems: slow boot times, disk wear, bottleneck, RAM consumption" -ForegroundColor Green -BackgroundColor Black 
	Write-Host "Enabling Superfetch service..."
	Get-Service SysMain | Stop-Service -PassThru | Set-Service -StartupType automatic
	
	Write-Host "Enabling SSDPSRV service..."
	Get-Service SSDPSRV | Stop-Service -PassThru | Set-Service -StartupType automatic
	
	Write-Host "Enabling AxInstSV service..."
	Get-Service AxInstSV | Stop-Service -PassThru | Set-Service -StartupType automatic
	
	Write-Host "Enabling MapsBroker (Downloaded Maps Manager) service..."
	Get-Service MapsBroker | Set-Service -StartupType automatic
	
	# BITS (Background Intelligent Transfer Service), its aggressive bandwidth eating will interfere with you online gameplay, work and navigation. Its aggressive disk usable will reduce your HDD or SSD lifespan
	write-Host "Enabling BITS (Background Intelligent Transfer Service)" -ForegroundColor Green -BackgroundColor Black 
	Get-Service BITS | Set-Service -StartupType automatic

	Write-Host "Disabling netsvcs. Its known for huge bandwidth usage..."
	Get-Service netsvcs | Stop-Service -PassThru | Set-Service -StartupType disabled	
	
	#RegChange "SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" "DODownloadMode" "3" "Enabling DeliveryOptimization download mode HTTP blended with Internet Peering..." "DWord"
	#RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" "DODownloadMode" "3" "Enabling DeliveryOptimization download mode HTTP blended with Internet Peering..." "DWord"	
	#RegChange "System\CurrentControlSet\Services\edgeupdate*" "Start" "2" "Enabling Edge updates..." "DWord"
		
	Write-Host "Enabling LanmanWorkstation Service..."
	Get-Service Workstation | Set-Service -StartupType automatic
		
	Write-Host "Enabling LanmanServer Service..."
	Get-Service Server | Set-Service -StartupType automatic
	
	RegChange "SYSTEM\CurrentControlSet\Services\camsvc" "Start" "2" "Enabling camsvc service" "DWord"
	Get-Service camsvc | Set-Service -StartupType automatic
}

if ($doPerformanceStuff -eq 1) {
	RegChange "SYSTEM\CurrentControlSet\Services\StorSvc" "Start" "4" "Disabling StorSvc (Storage Service) service" "DWord"
	Get-Service StorSvc | Set-Service -StartupType disabled
	
	RegChange "SYSTEM\CurrentControlSet\Services\MSDTC" "Start" "4" "Disabling MSDTC (Distributed Transaction Coordinator) service" "DWord"
	Get-Service MSDTC | Set-Service -StartupType disabled
	
	RegChange "SYSTEM\CurrentControlSet\Services\TokenBroker" "Start" "4" "Disabling TokenBroker (Web Account Manager) service" "DWord"
	Get-Service TokenBroker | Set-Service -StartupType disabled
	
	RegChange "SYSTEM\CurrentControlSet\Services\Ndu" "Start" "4" "Disabling Ndu (Network Data Usage Monitor) service" "DWord"
	Get-Service Ndu | Set-Service -StartupType disabled
	
	RegChange "SYSTEM\CurrentControlSet\Services\AppMgmt" "Start" "4" "Disabling AppMgmt (Application Management) service" "DWord"
	Get-Service AppMgmt | Set-Service -StartupType disabled
	
	RegChange "SYSTEM\CurrentControlSet\Services\Spooler" "Start" "4" "Disabling print spooler service" "DWord"
	Get-Service Spooler | Set-Service -StartupType disabled
	
	RegChange "SYSTEM\CurrentControlSet\Services\StiSvc" "Start" "4" "Disabling StiSvc Windows Image Acquisition (WIA) service" "DWord"
	Get-Service StiSvc | Set-Service -StartupType disabled
	
	RegChange "SYSTEM\CurrentControlSet\Services\TrkWks" "Start" "4" "Disabling TrkWks (Distributed Link Tracking Client) service" "DWord"
	Get-Service TrkWks | Set-Service -StartupType disabled
	
	RegChange "SYSTEM\CurrentControlSet\Services\BthAvctpSvc" "Start" "4" "Disabling AVCTP (Audio Video Control Transport Protocol) service" "DWord"
	Get-Service BthAvctpSvc | Set-Service -StartupType disabled
	
	RegChange "SYSTEM\CurrentControlSet\Services\DispBrokerDesktopSvc" "Start" "4" "Disabling DispBrokerDesktopSvc (Display Policy Service) service" "DWord"
	Get-Service DispBrokerDesktopSvc | Set-Service -StartupType disabled
	
	# DoSvc (Delivery Optimization) it overrides the windows updates opt-out user option, turn your pc into a p2p peer for Windows updates, mining your network performance and compromises your online gameplay, work and navigation
	RegChange "SYSTEM\CurrentControlSet\Services\DoSvc" "Start" "4" "Disabling DoSvc (Delivery Optimization) service" "DWord"
	Get-Service DoSvc | Set-Service -StartupType disabled
	
	RegChange "SYSTEM\CurrentControlSet\Services\OneSyncSvc" "Start" "4" "Disabling OneSyncSvc service" "DWord"
	Get-Service OneSyncSvc | Set-Service -StartupType disabled
	
	RegChange "SYSTEM\CurrentControlSet\Services\WalletService" "Start" "4" "Disabling WalletService service" "DWord"
	Get-Service WalletService | Set-Service -StartupType disabled
	
	RegChange "SYSTEM\CurrentControlSet\Services\diagnosticshub.standardcollector.service" "Start" "4" "Disabling diagnosticshub.standardcollector.service service" "DWord"
	Get-Service diagnosticshub.standardcollector.service | Set-Service -StartupType disabled
	
	#In very rare cases, Hardware Accelerated GPU Scheduling set to ON (2) may improve latency
	RegChange "SYSTEM\CurrentControlSet\Control\GraphicsDrivers" "HwSchMode" "2" "Disabling Hardware Accelerated GPU Scheduling" "DWord"
	
	RegChange "Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" "EnableTransparency" "0" "Disabling Windows transparency effect" "DWord"
	RegChange "SYSTEM\CurrentControlSet\services\WdiServiceHost" "Start" "4" "Disabling Diagnostic Service Host" "DWord"
	RegChange "SYSTEM\CurrentControlSet\services\WdiSystemHost" "Start" "4" "Disabling Diagnostic System Host Service" "DWord"
	RegChange "SYSTEM\CurrentControlSet\services\DPS" "Start" "4" "Disabling Diagnostic Policy Service" "DWord"
	
	killProcess("nvngx_update");
	deleteFile "$env:WINDIR\System32\DriverStore\FileRepository\nv_dispi.inf_amd64_577df0ba9db954d8\nvngx_update.exe" "Deleting Nvidia nvngx_update (bandwidth usage, lack of parameters for users to choose when its suppose to update)..."
	RegChange "System\CurrentControlSet\Control\Session Manager\Power" "HibernateEnabled" "0" "Disabling hibernation..." "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" "ShowHibernateOption" "0" "Hiding hibernation..." "DWord"
	
	Write-Output "Disabling EpsonCustomerResearchParticipation..."
	Get-Service EpsonCustomerResearchParticipation | Stop-Service -PassThru | Set-Service -StartupType disabled
	
	Write-Output "Disabling LGHUBUpdaterService (bandwidth usage, lack of parameters for users to choose when its suppose to update)..."
	Get-Service LGHUBUpdaterService | Stop-Service -PassThru | Set-Service -StartupType disabled
	
	if ($disableWindowsUpdates -eq 0) {
		Write-Host "BITS NOT disabled because of the disableWindowsUpdates configuration" -ForegroundColor Yellow -BackgroundColor DarkGreen
	}	else {
		# BITS (Background Intelligent Transfer Service), its aggressive bandwidth eating will interfere with you online gameplay, work and navigation. Its aggressive disk usable will reduce your HDD or SSD lifespan
		Write-Host "Disabling BITS Background Intelligent Transfer Service"
		Get-Service BITS | Stop-Service -PassThru | Set-Service -StartupType disabled		
	}
	
	Write-Host "Disabling netsvcs. Its known for huge bandwidth usage..."
	Get-Service netsvcs | Stop-Service -PassThru | Set-Service -StartupType disabled
	
	if ($(serviceStatus("Schedule")) -eq "running") {
		write-Host -ForegroundColor Green -BackgroundColor Black "Defragmentation cause unnecessary wear on SSDs"
		Write-Host "Disabling scheduled defragmentation..."
		Disable-ScheduledTask -TaskName "Microsoft\Windows\Defrag\ScheduledDefrag" | Out-Null
	}
	
	write-Host "Superfetch is known to cause all kinds of problems: slow boot times, disk wear, bottleneck, RAM consumption" -ForegroundColor Green -BackgroundColor Black 
	Write-Host "Stopping and disabling Superfetch service..."
	Get-Service SysMain | Stop-Service -PassThru | Set-Service -StartupType disabled	
	
	Write-Host "Stopping and disabling SSDPSRV service..."
	Get-Service SSDPSRV | Stop-Service -PassThru | Set-Service -StartupType disabled
	
	Write-Host "Stopping and disabling AxInstSV service..."
	Get-Service AxInstSV | Stop-Service -PassThru | Set-Service -StartupType disabled
	
	Write-Host "Stopping and disabling MapsBroker (Downloaded Maps Manager) service..."
	Get-Service MapsBroker | Stop-Service -PassThru | Set-Service -StartupType disabled
	
	RegChange "SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" "DODownloadMode" "100" "Disabling DeliveryOptimization Peering and HTTP download mode (bypass mode)..." "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" "DODownloadMode" "100" "Disabling DeliveryOptimization Peering and HTTP download mode (bypass mode)..." "DWord"	
	RegChange "System\CurrentControlSet\Services\edgeupdate*" "Start" "4" "Disabling Edge updates..." "DWord"
	
	if ($beNetworkPrinterSafe -eq 0) {
		Write-Host "Disabling LanmanWorkstation Service..."
		Get-Service Workstation | Stop-Service -PassThru | Set-Service -StartupType disabled
		
		Write-Host "Disabling LanmanServer Service..."
		Get-Service Server | Stop-Service -PassThru | Set-Service -StartupType disabled
	}	
		
	if ($beWifiSafe -eq 0) {
		RegChange "SYSTEM\CurrentControlSet\Services\RmSvc" "Start" "4" "Disabling RmSvc (Radio Management Service) service" "DWord"
		Get-Service RmSvc | Set-Service -StartupType disabled
		
		RegChange "SYSTEM\CurrentControlSet\Services\WlanSvc" "Start" "4" "Disabling WlanSvc (WLAN Autoconfig) service" "DWord"
		Get-Service WlanSvc | Set-Service -StartupType disabled
	}
	
	if ($beWifiSafe -eq 1) {
		Write-Host "RmSvc (Radio Management Service) service  NOT disabled because of the beWifiSafe configuration" -ForegroundColor Yellow -BackgroundColor DarkGreen
	}
	
	if ($beMicrophoneSafe -eq 0) {			
		RegChange "SYSTEM\CurrentControlSet\Services\camsvc" "Start" "4" "Disabling camsvc service" "DWord"
		Get-Service camsvc | Set-Service -StartupType disabled
	}
	
	if ($beMicrophoneSafe -eq 1) {			
		Write-Host "camsvc service  was NOT disabled because of the beMicrophoneSafe configuration" -ForegroundColor Yellow -BackgroundColor DarkGreen
		RegChange "SYSTEM\CurrentControlSet\Services\camsvc" "Start" "2" "Enabling camsvc service" "DWord"
		Get-Service camsvc | Set-Service -StartupType automatic
	}
}

if ($doQualityOfLifeStuff -eq 0) {
	Get-Service VMwareHostd | Set-Service -StartupType automatic
	RegChange "SYSTEM\CurrentControlSet\services\VMwareHostd" "Start" "2" "Enabling VMware host..." "DWord"
	
	# Look for an app in the Microsoft Store
	RegChange "Software\Policies\Microsoft\Windows\Explorer" "NoUseStoreOpenWith" "0" "Enabling Look for an app in the Microsoft Store" "DWord"
	
	RegChange "Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "TaskbarDa" "1" "Adding widgets button to taskbar" "DWord"
	RegChange "Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "TaskbarMn" "1" "Adding chat button to taskbar" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" "SoftLandingEnabled" "1" "Enabling Get tips and suggestion when i use Windows" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" "DisableAutomaticRestartSignOn" "0" "Enabling Windows Winlogon Automatic Restart Sign-On..." "DWord"
	RegChange "Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" "NOC_GLOBAL_SETTING_TOASTS_ENABLED" "1" "Enabling Action Center toasts..." "DWord"
	RegChange "SOFTWARE\Policies\Microsoft\Windows\Explorer" "DisableNotificationCenter" "0" "Enabling Action Center notification center..." "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications" "ToastEnabled" "1" "Enabling Action Center toast push notifications..." "DWord"
	RegChange "Control Panel\Accessibility" "DynamicScrollbars" "1" "Enabling dynamic scrollbars..." "DWord"
	RegChange "SOFTWARE\Policies\Microsoft\MRT" "DontOfferThroughWUAU " "0" "Enabling Malicious Software Removal Tool offering" "DWord"

	write-Host "Fast Boot is known to cause problems with steam" -ForegroundColor Green -BackgroundColor Black 
	RegChange "SYSTEM\CurrentControlSet\Control\Session Manager\Power" "HiberbootEnabled" "1" "Enabling Fast boot..." "DWord"
	powercfg /hibernate ON
	
	write-Host "RAZER services that allows third party software to ness with your keyboard backlight" -ForegroundColor Green -BackgroundColor Black 	
	Write-Output "Enabling Razer Chroma SDK Server..."
	Get-Service "Razer Chroma SDK Server" | Stop-Service -PassThru | Set-Service -StartupType automatic
	Write-Output "Enabling Razer Chroma SDK Service..."
	Get-Service "Razer Chroma SDK Service" | Stop-Service -PassThru | Set-Service -StartupType automatic

	Write-Output "Enabling WpnService, push notification anoyance service..."
	Get-Service WpnService | Stop-Service -PassThru | Set-Service -StartupType automatic
	
	RegChange "System\CurrentControlSet\Services\WpnUserService*" "Start" "2" "Enabling WpnUserService, push notification anoyance service..." "DWord"
	RegChange "Software\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform" "NoGenTicket" "1" "Enabling Licence Checking..." "DWord"
	
	RegChange "SOFTWARE\Microsoft\Windows\Windows Error Reporting" "Disabled" "0" "Enabling Error reporting..." "DWord"
	if ($(serviceStatus("Schedule")) -eq "running") {
		Write-Host "Enabling Error reporting task..."
		Get-ScheduledTask  *QueueReporting* | Enable-ScheduledTask
	}
	RegChange "Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" "1" "Hiding This PC shortcut on desktop..." "DWord"
	RegChange "Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" "1" "Hiding This PC shortcut on desktop..." "DWord"
	RegChange "Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "ShowSyncProviderNotifications" "1" "Enabling Windows Ads within file explorer..." "DWord"
	RegChange "SOFTWARE\Policies\Microsoft\Windows\CloudContent" "DisableThirdPartySuggestions" "0" "Disabling Windows suggestions of apps and content from third-party software publishers..." "DWord"	
	RegChange "Control Panel\Mouse" "MouseSpeed" "1" "Disabling Windows enhanced pointer precision..." "DWord"
	RegChange "Control Panel\Mouse" "MouseThreshold1" "6" "Enabling Windows enhanced pointer acceleration..." "DWord"
	RegChange "Control Panel\Mouse" "MouseThreshold2" "10" "Enabling Windows enhanced pointer acceleration..." "DWord"
}

if ($doQualityOfLifeStuff -eq 1) {
	Get-Service VMwareHostd | Stop-Service -PassThru | Set-Service -StartupType disabled
	RegChange "SYSTEM\CurrentControlSet\services\VMwareHostd" "Start" "4" "Disabling VMware host..." "DWord"
	
	# Look for an app in the Microsoft Store
	RegChange "Software\Policies\Microsoft\Windows\Explorer" "NoUseStoreOpenWith" "1" "Disabling Look for an app in the Microsoft Store" "DWord"
	
	RegChange "Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "TaskbarDa" "0" "Removing widgets button from taskbar" "DWord"
	RegChange "Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "TaskbarMn" "0" "Removing chat button from taskbar" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" "SoftLandingEnabled" "0" "Disabling Get tips and suggestion when i use Windows" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" "DisableAutomaticRestartSignOn" "1" "Disabling Windows Winlogon Automatic Restart Sign-On..." "DWord"
	RegChange "Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" "NOC_GLOBAL_SETTING_TOASTS_ENABLED" "0" "Disabling Action Center global toasts..." "DWord"	
	RegChange "SOFTWARE\Policies\Microsoft\Windows\Explorer" "DisableNotificationCenter" "1" "Disabling Action Center notification center..." "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications" "ToastEnabled" "0" "Disabling Action Center toast push notifications..." "DWord"
	RegChange "Control Panel\Accessibility" "DynamicScrollbars " "0" "Disabling dynamic scrollbars..." "DWord"
	RegChange "SOFTWARE\Policies\Microsoft\MRT" "DontOfferThroughWUAU " "1" "Disabling Malicious Software Removal Tool offering" "DWord"
	
	write-Host "Fast Boot is known to cause problems with steam" -ForegroundColor Green -BackgroundColor Black 
	RegChange "SYSTEM\CurrentControlSet\Control\Session Manager\Power" "HiberbootEnabled" "0" "Disabling Fast boot..." "DWord"
	powercfg /hibernate OFF
	
	Write-Host "RAZER services that allows third party software to mess with your keyboard backlight" -ForegroundColor Green -BackgroundColor Black 	
	Write-Output "Disabling Razer Chroma SDK Server..."
	Get-Service "Razer Chroma SDK Server" | Stop-Service -PassThru | Set-Service -StartupType disabled
	Write-Output "Disabling Razer Chroma SDK Service..."
	Get-Service "Razer Chroma SDK Service" | Stop-Service -PassThru | Set-Service -StartupType disabled
	Write-Output "Disabling WpnService, push notification anoyance service..."
	Get-Service WpnService | Stop-Service -PassThru | Set-Service -StartupType disabled
	
	RegChange "System\CurrentControlSet\Services\WpnUserService*" "Start" "4" "Disabling WpnUserService, push notification anoyance service..." "DWord"	
	RegChange "Software\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform" "NoGenTicket" "0" "Disabling Licence Checking..." "DWord"	
	RegChange "SOFTWARE\Microsoft\Windows\Windows Error Reporting" "Disabled" "1" "Disabling Error reporting..." "DWord"
	if ($(serviceStatus("Schedule")) -eq "running") {
		Write-Host "Disabling Error reporting task..."
		Get-ScheduledTask  *QueueReporting* | Disable-ScheduledTask
	}
	
	RegChange "Control Panel\Accessibility\StickyKeys" "Flags" "506" "Disabling Sticky keys prompt..." "DWord"
	RegChange "Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" "0" "Show This PC shortcut on desktop..." "DWord"
	RegChange "Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" "0" "Show This PC shortcut on desktop..." "DWord"
	RegChange "Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "ShowSyncProviderNotifications" "0" "Disabling Windows Ads within file explorer..." "DWord"
	RegChange "SOFTWARE\Policies\Microsoft\Windows\CloudContent" "DisableThirdPartySuggestions" "1" "Disabling Windows suggestions of apps and content from third-party software publishers..." "DWord"
	RegChange "Control Panel\Mouse" "MouseSpeed" "0" "Disabling Windows enhanced pointer precision..." "DWord"
	RegChange "Control Panel\Mouse" "MouseThreshold1" "0" "Disabling Windows enhanced pointer acceleration..." "DWord"
	RegChange "Control Panel\Mouse" "MouseThreshold2" "0" "Disabling Windows enhanced pointer acceleration..." "DWord"
	
}

if ($doPrivacyStuff -eq 0) {
	Write-Output "Reverse privacy stuff..."
	EnableThumbnail
	EnablePeek
	EnablePrefetcher	
	EnableMemoryDump

	RegChange "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" "SensorPermissionState" "1" "Enabling Windows location tracking" "DWord"
	RegChange "System\CurrentControlSet\Services\lfsvc\Service\Configuration" "Status" "1" "Enabling Windows location tracking" "DWord"
	RegChange "Software\Microsoft\InputPersonalization" "RestrictImplicitInkCollection" "0" "Enabling Windows implicit ink collection" "DWord"
	RegChange "Software\Microsoft\InputPersonalization" "RestrictImplicitTextCollection" "0" "Enabling Windows implicit text collection" "DWord"
	RegChange "Software\Microsoft\InputPersonalization\TrainedDataStore" "HarvestContacts" "1" "Enabling Windows contact harvesting" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" "Enabled" "1" "Enabling Windows Feedback Experience program / Advertising ID" "DWord"
	RegChange "SOFTWARE\Policies\Microsoft\Windows\Windows Search" "AllowCortana" "1" "Enabling Cortana from being used as part of your Windows Search Function" 
	RegChange "Software\Microsoft\Siuf\Rules" "NumberOfSIUFInPeriod" "1" "Enabling Windows Feedback Experience from sending anonymous data" "DWord"   
	RegChange "SOFTWARE\Policies\Microsoft\Windows\CloudContent" "DisableWindowsConsumerFeatures" "0" "Adding Registry key to allow bloatware apps from returning" "DWord"
	RegChange "Software\Microsoft\Windows\CurrentVersion\Holographic" "FirstRunSucceeded" "1" "Enabling Reality Portal" "DWord"
	RegChange "SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" "NoTileApplicationNotification" "0" "Enabling live tiles" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" "SensorPermissionState" "1" "Enabling Location Tracking" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" "Status" "1" "Enabling Location Tracking" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" "PeopleBand" "1" "Enabling People icon on Taskbar" "DWord"
	RegChange "Software\Policies\Microsoft\Windows\Explorer" "HidePeopleBar" "0" "Enabling People Bar" "DWord"
	RegChange "SOFTWARE\Policies\Microsoft\Windows\System" "EnableActivityFeed" "1" "Enabling Activity History Feed" "DWord"
	RegChange "SOFTWARE\Policies\Microsoft\Windows\System" "PublishUserActivities" "1" "Enabling Activity History Feed" "DWord"
	RegChange "SOFTWARE\Policies\Microsoft\Windows\System" "UploadUserActivities" "1" "Enabling Activity History Feed" "DWord"
	RegChange "SOFTWARE\Policies\Microsoft\Windows\CloudContent" "DisableTailoredExperiencesWithDiagnosticData" "0" "Enabling Tailored Experiences" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\NcdAutoSetup\Private" "AutoSetup" "1" "Enabling automatic installation of network devices" "DWord"
	RegChange "SYSTEM\CurrentControlSet\Control\Terminal Server" "fDenyTSConnections" "0" "Enabling Remote Desktop" "DWord"
	RegChange "SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" "UserAuthentication" "0" "Enabling Remote Desktop" "DWord"
	RegChange "SOFTWARE\Policies\Microsoft\Windows\TabletPC" "PreventHandwritingDataSharing" "0" "Enabling handwriting personalization data sharing..." "DWord"	
	RegChange "SOFTWARE\Policies\Microsoft\SQMClient\Windows" "CEIPEnable" "1" "Enabling Windows Customer Experience Improvement Program..." "DWord"
	RegChange "SOFTWARE\Policies\Microsoft\AppV\CEIP" "CEIPEnable" "1" "Enabling Windows Customer Experience Improvement Program..." "DWord"
	RegChange "SOFTWARE\Microsoft\SQMClient\IE" "CEIPEnable" "1" "Enabling Windows Customer Experience Improvement Program..." "DWord"
	RegChange "SOFTWARE\Microsoft\SQMClient\IE" "SqmLoggerRunning" "1" "Enabling Windows Customer Experience Improvement Program..." "DWord"
	RegChange "SOFTWARE\Microsoft\SQMClient\Windows" "CEIPEnable" "1" "Enabling Windows Customer Experience Improvement Program..." "DWord"
	RegChange "SOFTWARE\Microsoft\SQMClient\Windows" "SqmLoggerRunning" "1" "Enabling Windows Customer Experience Improvement Program..." "DWord"
	RegChange "SOFTWARE\Microsoft\SQMClient\Windows" "DisableOptinExperience" "0" "Enabling Windows Customer Experience Improvement Program..." "DWord"
	RegChange "SOFTWARE\Microsoft\SQMClient\Reliability" "CEIPEnable" "1" "Enabling Windows Customer Experience Improvement Program..." "DWord"
	RegChange "SOFTWARE\Microsoft\SQMClient\Reliability" "SqmLoggerRunning" "1" "Enabling Windows Customer Experience Improvement Program..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\AppModel" "Start" "1" "Enabling AutoLogger\AppModel..." "DWord"
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" "Start" "1" "Enabling AutoLogger\AutoLogger-Diagtrack-Listener..." "DWord"
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\Circular Kernel Context Logger" "Start" "1" "Enabling AutoLogger\Circular Kernel Context Logger..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\DataMarket" "Start" "1" "Enabling AutoLogger\DataMarket..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\DefenderApiLogger" "Start" "1" "Enabling AutoLogger\DefenderApiLogger..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\DefenderAuditLogger" "Start" "1" "Enabling AutoLogger\DefenderAuditLogger..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\DiagLog" "Start" "1" "Enabling AutoLogger\DiagLog..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\LwtNetLog" "Start" "1" "Enabling AutoLogger\LwtNetLog..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\Mellanox-Kernel" "Start" "1" "Enabling AutoLogger\Mellanox-Kernel..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\Microsoft-Windows-AssignedAccess-Trace" "Start" "1" "Enabling AutoLogger\Microsoft-Windows-AssignedAccess-Trace..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\Microsoft-Windows-Setup" "Start" "1" "Enabling AutoLogger\Microsoft-Windows-Setup..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\NBSMBLOGGER" "Start" "1" "Enabling AutoLogger\NBSMBLOGGER..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\NtfsLog" "Start" "1" "Enabling AutoLogger\NtfsLog..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\PEAuthLog" "Start" "1" "Enabling AutoLogger\PEAuthLog..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\RdrLog" "Start" "1" "Enabling AutoLogger\RdrLog..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\ReadyBoot" "Start" "1" "Enabling AutoLogger\ReadyBoot..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\SetupPlatform" "Start" "1" "Enabling AutoLogger\SetupPlatform..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\SetupPlatformTel" "Start" "1" "Enabling AutoLogger\SetupPlatformTel..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\SpoolerLogger" "Start" "1" "Enabling AutoLogger\SpoolerLogger..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\SQMLogger" "Start" "1" "Enabling AutoLogger\SQMLogger..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\TCPIPLOGGER" "Start" "1" "Enabling AutoLogger\TCPIPLOGGER..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\TileStore" "Start" "1" "Enabling AutoLogger\TileStore..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\UBPM" "Start" "1" "Enabling AutoLogger\UBPM..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\WdiContextLog" "Start" "1" "Enabling AutoLogger\WdiContextLog..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\WFP-IPsec Trace" "Start" "1" "Enabling AutoLogger\WFP-IPsec Trace..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\WiFiDriverIHVSessionRepro" "Start" "1" "Enabling AutoLogger\WiFiDriverIHVSessionRepro..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\WiFiSession" "Start" "1" "Enabling AutoLogger\WiFiSession..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\AppModel" "Start" "1" "Enabling AutoLogger\AppModel..." "DWord"
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" "Start" "1" "Enabling AutoLogger\AutoLogger-Diagtrack-Listener..." "DWord"
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\Circular Kernel Context Logger" "Start" "1" "Enabling AutoLogger\Circular Kernel Context Logger..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\DataMarket" "Start" "1" "Enabling AutoLogger\DataMarket..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\DefenderApiLogger" "Start" "1" "Enabling AutoLogger\DefenderApiLogger..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\DefenderAuditLogger" "Start" "1" "Enabling AutoLogger\DefenderAuditLogger..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\DiagLog" "Start" "1" "Enabling AutoLogger\DiagLog..." "DWord"
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\LwtNetLog" "Start" "1" "Enabling AutoLogger\LwtNetLog..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\Mellanox-Kernel" "Start" "1" "Enabling AutoLogger\Mellanox-Kernel..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\Microsoft-Windows-AssignedAccess-Trace" "Start" "1" "Enabling AutoLogger\Microsoft-Windows-AssignedAccess-Trace..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\Microsoft-Windows-Setup" "Start" "1" "Enabling AutoLogger\Microsoft-Windows-Setup..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\NBSMBLOGGER" "Start" "1" "Enabling AutoLogger\NBSMBLOGGER..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\NtfsLog" "Start" "1" "Enabling AutoLogger\NtfsLog..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\PEAuthLog" "Start" "1" "Enabling AutoLogger\PEAuthLog..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\RdrLog" "Start" "1" "Enabling AutoLogger\RdrLog..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\ReadyBoot" "Start" "1" "Enabling AutoLogger\ReadyBoot..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\SetupPlatform" "Start" "1" "Enabling AutoLogger\SetupPlatform..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\SetupPlatformTel" "Start" "1" "Enabling AutoLogger\SetupPlatformTel..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\SpoolerLogger" "Start" "1" "Enabling AutoLogger\SpoolerLogger..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\SQMLogger" "Start" "1" "Enabling AutoLogger\SQMLogger..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\TCPIPLOGGER" "Start" "1" "Enabling AutoLogger\TCPIPLOGGER..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\TileStore" "Start" "1" "Enabling AutoLogger\TileStore..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\UBPM" "Start" "1" "Enabling AutoLogger\UBPM..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\WdiContextLog" "Start" "1" "Enabling AutoLogger\WdiContextLog..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\WFP-IPsec Trace" "Start" "1" "Enabling AutoLogger\WFP-IPsec Trace..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\WiFiDriverIHVSessionRepro" "Start" "1" "Enabling AutoLogger\WiFiDriverIHVSessionRepro..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\WiFiSession" "Start" "1" "Enabling AutoLogger\WiFiSession..." "DWord"	
	RegChange "SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds" "AllowBuildPreview" "0" "Enabling Windows Insider Program..." "DWord"	
	RegChange "SYSTEM\CurrentControlSet\Services\TimeBrokerSvc" "Start" "2" "Enabling Time Brooker..." "DWord"

	Write-Output "Setting network to private..."
	Set-NetConnectionProfile -NetworkCategory Private
   
   Write-Output "Enabling Background application access..."
	Get-ChildItem -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" -Exclude "Microsoft.Windows.Cortana*" | ForEach {
		Set-ItemProperty -Path $_.PsPath -Name "Disabled" -Type DWord -Value 0
		Set-ItemProperty -Path $_.PsPath -Name "DisabledByUser" -Type DWord -Value 0
	}
	
	if ($(serviceStatus("Schedule")) -eq "running") {
		Write-Output "Enabling scheduled tasks, Consolidator, UsbCeip, DmClient..."  
		Get-ScheduledTask  Consolidator | Enable-ScheduledTask
		Get-ScheduledTask  UsbCeip | Enable-ScheduledTask
		Get-ScheduledTask  DmClient | Enable-ScheduledTask
		Get-ScheduledTask  DmClientOnScenarioDownload | Enable-ScheduledTask
	}
	
    # Diagnostics Tracking Service is a Windows keylogger to collect all the speeches, calendar, contacts, typing, inking informations
    RegChange "SYSTEM\CurrentControlSet\Services\DiagTrack" "Start" "2" "Enabling DiagTrack (Connected User Experiences and Telemetry) service" "DWord"
	Get-Service DiagTrack | Set-Service -StartupType automatic
    
	# dmwappushservice is a Windows keylogger to collect all the speeches, calendar, contacts, typing, inking informations
	Get-Service dmwappushservice | Set-Service -StartupType automatic
	
	write-Host "Windows Insider Service contact web servers by its own" -ForegroundColor Green -BackgroundColor Black 
	Write-Host "Enabling wisvc (Windows Insider Service)..."
	Get-Service wisvc | Set-Service -StartupType automatic
	Get-Service CryptSvc | Set-Service -StartupType automatic
	
	Write-Host "Stopping and disabling EventLog (Windows Event Log)..."
	Get-Service EventLog | Set-Service -StartupType automatic
	
	# Disable Ip helper due transfering a lot of strange data
	RegChange "SYSTEM\CurrentControlSet\Services\iphlpsvc" "Start" "2" "Enabling Ip Helper service" "DWord"
	Get-Service iphlpsvc | Set-Service -StartupType automatic
}

if ($doPrivacyStuff -eq 1) {
	Write-Output "Doing privacy stuff..."
	
	clearCaches
	DisableThumbnail
	DisablePeek
	DisablePrefetcher	
	DisableMemoryDump
	
	RegChange "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" "SensorPermissionState" "0" "Disabling Windows location tracking" "DWord"
	RegChange "System\CurrentControlSet\Services\lfsvc\Service\Configuration" "Status" "0" "Disabling Windows location tracking" "DWord"
	RegChange "Software\Microsoft\InputPersonalization" "RestrictImplicitInkCollection" "1" "Disabling Windows implicit ink collection" "DWord"
	RegChange "Software\Microsoft\InputPersonalization" "RestrictImplicitTextCollection" "1" "Disabling Windows implicit text collection" "DWord"
	RegChange "Software\Microsoft\InputPersonalization\TrainedDataStore" "HarvestContacts" "0" "Disabling Windows contact harvesting" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" "Enabled" "0" "Disabling Windows Feedback Experience program / Advertising ID"
	RegChange "SOFTWARE\Policies\Microsoft\Windows\Windows Search" "AllowCortana" "0" "Stopping Cortana from being used as part of your Windows Search Function" 
	RegChange "Software\Microsoft\Siuf\Rules" "NumberOfSIUFInPeriod" "0" "Disabling Windows Feedback Experience from sending anonymous data"         
	RegChange "SOFTWARE\Policies\Microsoft\Windows\CloudContent" "DisableWindowsConsumerFeatures" "1" "Adding Registry key to prevent bloatware apps from returning"	
	RegChange "Software\Microsoft\Windows\CurrentVersion\Holographic" "FirstRunSucceeded" "0" "Disabling Reality Portal"	
	RegChange "SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" "NoTileApplicationNotification" "1" "Disabling live tiles"  
	RegChange "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" "SensorPermissionState" "0" "Disabling Location Tracking"
	RegChange "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" "Status" "0" "Disabling Location Tracking"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" "PeopleBand" "0" "Disabling People icon on Taskbar"
	RegChange "Software\Policies\Microsoft\Windows\Explorer" "HidePeopleBar" "1" "Disabling People Bar"
	RegChange "SOFTWARE\Policies\Microsoft\Windows\System" "EnableActivityFeed" "0" "Disabling Activity History Feed"
	RegChange "SOFTWARE\Policies\Microsoft\Windows\System" "PublishUserActivities" "0" "Disabling Activity History Feed"
	RegChange "SOFTWARE\Policies\Microsoft\Windows\System" "UploadUserActivities" "0" "Disabling Activity History Feed"
	RegChange "SOFTWARE\Policies\Microsoft\Windows\CloudContent" "DisableTailoredExperiencesWithDiagnosticData" "1" "Disabling Tailored Experiences"	
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\NcdAutoSetup\Private" "AutoSetup" "0" "Disabling automatic installation of network devices"
	RegChange "SYSTEM\CurrentControlSet\Control\Terminal Server" "fDenyTSConnections" "1" "Disabling Remote Desktop"
	RegChange "SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" "UserAuthentication" "1" "Disabling Remote Desktop"	
	RegChange "SYSTEM\CurrentControlSet001\Control\Terminal Server" "fDenyTSConnections" "1" "Disabling Remote Desktop"
	RegChange "SYSTEM\CurrentControlSet001\Control\Terminal Server\WinStations\RDP-Tcp" "UserAuthentication" "1" "Disabling Remote Desktop"
	RegChange "SOFTWARE\Policies\Microsoft\Windows\TabletPC" "PreventHandwritingDataSharing" "1" "Disabling handwriting personalization data sharing..." "DWord"	
	RegChange "SOFTWARE\Policies\Microsoft\SQMClient\Windows" "CEIPEnable" "0" "Disabling Windows Customer Experience Improvement Program..." "DWord"
	RegChange "SOFTWARE\Policies\Microsoft\AppV\CEIP" "CEIPEnable" "0" "Disabling Windows Customer Experience Improvement Program..." "DWord"
	RegChange "SOFTWARE\Microsoft\SQMClient\IE" "CEIPEnable" "0" "Disabling Windows Customer Experience Improvement Program..." "DWord"
	RegChange "SOFTWARE\Microsoft\SQMClient\IE" "SqmLoggerRunning" "0" "Disabling Windows Customer Experience Improvement Program..." "DWord"
	RegChange "SOFTWARE\Microsoft\SQMClient\Windows" "CEIPEnable" "0" "Disabling Windows Customer Experience Improvement Program..." "DWord"
	RegChange "SOFTWARE\Microsoft\SQMClient\Windows" "SqmLoggerRunning" "0" "Disabling Windows Customer Experience Improvement Program..." "DWord"
	RegChange "SOFTWARE\Microsoft\SQMClient\Windows" "DisableOptinExperience" "1" "Disabling Windows Customer Experience Improvement Program..." "DWord"
	RegChange "SOFTWARE\Microsoft\SQMClient\Reliability" "CEIPEnable" "0" "Disabling Windows Customer Experience Improvement Program..." "DWord"
	RegChange "SOFTWARE\Microsoft\SQMClient\Reliability" "SqmLoggerRunning" "0" "Disabling Windows Customer Experience Improvement Program..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\AppModel" "Start" "0" "Disabling AutoLogger\AppModel..." "DWord"
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" "Start" "0" "Disabling AutoLogger\AutoLogger-Diagtrack-Listener..." "DWord"
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\Circular Kernel Context Logger" "Start" "0" "Disabling AutoLogger\Circular Kernel Context Logger..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\DataMarket" "Start" "0" "Disabling AutoLogger\DataMarket..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\DefenderApiLogger" "Start" "0" "Disabling AutoLogger\DefenderApiLogger..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\DefenderAuditLogger" "Start" "0" "Disabling AutoLogger\DefenderAuditLogger..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\DiagLog" "Start" "0" "Disabling AutoLogger\DiagLog..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\LwtNetLog" "Start" "0" "Disabling AutoLogger\LwtNetLog..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\Mellanox-Kernel" "Start" "0" "Disabling AutoLogger\Mellanox-Kernel..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\Microsoft-Windows-AssignedAccess-Trace" "Start" "0" "Disabling AutoLogger\Microsoft-Windows-AssignedAccess-Trace..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\Microsoft-Windows-Setup" "Start" "0" "Disabling AutoLogger\Microsoft-Windows-Setup..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\NBSMBLOGGER" "Start" "0" "Disabling AutoLogger\NBSMBLOGGER..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\NtfsLog" "Start" "0" "Disabling AutoLogger\NtfsLog..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\PEAuthLog" "Start" "0" "Disabling AutoLogger\PEAuthLog..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\RdrLog" "Start" "0" "Disabling AutoLogger\RdrLog..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\ReadyBoot" "Start" "0" "Disabling AutoLogger\ReadyBoot..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\SetupPlatform" "Start" "0" "Disabling AutoLogger\SetupPlatform..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\SetupPlatformTel" "Start" "0" "Disabling AutoLogger\SetupPlatformTel..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\SpoolerLogger" "Start" "0" "Disabling AutoLogger\SpoolerLogger..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\SQMLogger" "Start" "0" "Disabling AutoLogger\SQMLogger..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\TCPIPLOGGER" "Start" "0" "Disabling AutoLogger\TCPIPLOGGER..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\TileStore" "Start" "0" "Disabling AutoLogger\TileStore..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\UBPM" "Start" "0" "Disabling AutoLogger\UBPM..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\WdiContextLog" "Start" "0" "Disabling AutoLogger\WdiContextLog..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\WFP-IPsec Trace" "Start" "0" "Disabling AutoLogger\WFP-IPsec Trace..." "DWord"	
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\WiFiDriverIHVSessionRepro" "Start" "0" "Disabling AutoLogger\WiFiDriverIHVSessionRepro..." "DWord"
	RegChange "SYSTEM\ControlSet001\Control\WMI\AutoLogger\WiFiSession" "Start" "0" "Disabling AutoLogger\WiFiSession..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\AppModel" "Start" "0" "Disabling AutoLogger\AppModel..." "DWord"
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" "Start" "0" "Disabling AutoLogger\AutoLogger-Diagtrack-Listener..." "DWord"
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\Circular Kernel Context Logger" "Start" "0" "Disabling AutoLogger\Circular Kernel Context Logger..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\DataMarket" "Start" "0" "Disabling AutoLogger\DataMarket..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\DefenderApiLogger" "Start" "0" "Disabling AutoLogger\DefenderApiLogger..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\DefenderAuditLogger" "Start" "0" "Disabling AutoLogger\DefenderAuditLogger..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\DiagLog" "Start" "0" "Disabling AutoLogger\DiagLog..." "DWord"
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\LwtNetLog" "Start" "0" "Disabling AutoLogger\LwtNetLog..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\Mellanox-Kernel" "Start" "0" "Disabling AutoLogger\Mellanox-Kernel..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\Microsoft-Windows-AssignedAccess-Trace" "Start" "0" "Disabling AutoLogger\Microsoft-Windows-AssignedAccess-Trace..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\Microsoft-Windows-Setup" "Start" "0" "Disabling AutoLogger\Microsoft-Windows-Setup..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\NBSMBLOGGER" "Start" "0" "Disabling AutoLogger\NBSMBLOGGER..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\NtfsLog" "Start" "0" "Disabling AutoLogger\NtfsLog..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\PEAuthLog" "Start" "0" "Disabling AutoLogger\PEAuthLog..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\RdrLog" "Start" "0" "Disabling AutoLogger\RdrLog..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\ReadyBoot" "Start" "0" "Disabling AutoLogger\ReadyBoot..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\SetupPlatform" "Start" "0" "Disabling AutoLogger\SetupPlatform..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\SetupPlatformTel" "Start" "0" "Disabling AutoLogger\SetupPlatformTel..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\SpoolerLogger" "Start" "0" "Disabling AutoLogger\SpoolerLogger..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\SQMLogger" "Start" "0" "Disabling AutoLogger\SQMLogger..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\TCPIPLOGGER" "Start" "0" "Disabling AutoLogger\TCPIPLOGGER..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\TileStore" "Start" "0" "Disabling AutoLogger\TileStore..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\UBPM" "Start" "0" "Disabling AutoLogger\UBPM..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\WdiContextLog" "Start" "0" "Disabling AutoLogger\WdiContextLog..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\WFP-IPsec Trace" "Start" "0" "Disabling AutoLogger\WFP-IPsec Trace..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\WiFiDriverIHVSessionRepro" "Start" "0" "Disabling AutoLogger\WiFiDriverIHVSessionRepro..." "DWord"	
	RegChange "SYSTEM\ControlSet\Control\WMI\AutoLogger\WiFiSession" "Start" "0" "Disabling AutoLogger\WiFiSession..." "DWord"	
	RegChange "SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds" "AllowBuildPreview" "0" "Disabling Windows Insider Program..." "DWord"	
	
	if ($beTaskScheduleSafe -eq 1) {
		Write-Host "TimeBrokerSvc NOT disabled because of the beTaskScheduleSafe configuration" -ForegroundColor Yellow -BackgroundColor DarkGreen
		RegChange "SYSTEM\CurrentControlSet\Services\TimeBrokerSvc" "Start" "2" "Enabling Time Brooker..." "DWord"
	} else {	
		RegChange "SYSTEM\CurrentControlSet\Services\TimeBrokerSvc" "Start" "4" "Disabling Time Brooker due to huge network usage and for spying users..." "DWord"
	}
	
	Set-NetConnectionProfile -NetworkCategory Public
   
	Write-Output "Disabling Background application access..."
	Get-ChildItem -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" -Exclude "Microsoft.Windows.Cortana*" | ForEach {
		Set-ItemProperty -Path $_.PsPath -Name "Disabled" -Type DWord -Value 1
		Set-ItemProperty -Path $_.PsPath -Name "DisabledByUser" -Type DWord -Value 1
	}	
	
	if ($(serviceStatus("Schedule")) -eq "running") {
		Write-Output "Disabling scheduled tasks, Consolidator, UsbCeip, DmClient..."
		Get-ScheduledTask  Consolidator | Disable-ScheduledTask
		Get-ScheduledTask  UsbCeip | Disable-ScheduledTask
		Get-ScheduledTask  DmClient | Disable-ScheduledTask
		Get-ScheduledTask  DmClientOnScenarioDownload | Disable-ScheduledTask
	}
	
	# Diagnostics Tracking Service is a Windows keylogger to collect all the speeches, calendar, contacts, typing, inking informations
    RegChange "SYSTEM\CurrentControlSet\Services\DiagTrack" "Start" "4" "Disabling DiagTrack (Connected User Experiences and Telemetry) service" "DWord"
	Get-Service DiagTrack | Set-Service -StartupType disabled
    
	# dmwappushservice is a Windows keylogger to collect all the speeches, calendar, contacts, typing, inking informations
	Get-Service dmwappushservice | Set-Service -StartupType disabled
	
	$path = "$env:PROGRAMDATA\Microsoft\Diagnosis\ETLLogs\AutoLogger"
	deletePath $path "Clearing ETL Autologs..."
	hardenPath $path "Hardening ETL Autologs folder..."
	
	write-Host "AppHostRegistrationVerifier tries to connect to 13.107.246.19 port 443 when the pc is idle for no known reason." -ForegroundColor Green -BackgroundColor Black
	deleteFile "$env:WINDIR\system32\AppHostRegistrationVerifier.exe" "Deleting AppHostRegistrationVerifier.exe..."		
	deleteFile "$env:WINDIR\system32\wbem\wmiprvse.exe" "Deleting WMI Provider Host..."	
	
	write-Host "Windows Insider Service contact web servers by its own" -ForegroundColor Green -BackgroundColor Black 
	Write-Host "Stopping and disabling wisvc (Windows Insider Service)..."
	Get-Service wisvc | Stop-Service -PassThru | Set-Service -StartupType disabled
	
	if ($disableWindowsUpdates -eq 0) {
		Write-Host "CryptSvc NOT disabled because of the disableWindowsUpdates configuration" -ForegroundColor Yellow -BackgroundColor DarkGreen
	}	else {
		Write-Host "Stopping and disabling CryptSvc (Cryptographic Services)..."
		Get-Service CryptSvc | Stop-Service -PassThru | Set-Service -StartupType disabled	
	}	
	
	Write-Host "Stopping and disabling EventLog (Windows Event Log)..."
	Get-Service EventLog | Stop-Service -PassThru | Set-Service -StartupType disabled
	
	# Disable Ip helper due transfering a lot of strange data
	RegChange "SYSTEM\CurrentControlSet\Services\iphlpsvc" "Start" "4" "Disabling Ip Helper service" "DWord"
	Get-Service iphlpsvc | Set-Service -StartupType disabled
}

EnableDnsCache

if ($doSecurityStuff -eq 0) {
	# Airstrike Attack - FDE bypass and EoP on domain joined Windows workstations. An attacker with physical access to a locked device with WiFi capabilities (such as a laptop or a workstation) can abuse this functionality to force the laptop to authenticate against a rogue access point and capture a MSCHAPv2 challenge response hash for the domain computer account.
	RegChange "SOFTWARE\Policies\Microsoft\Windows\System" "DontDisplayNetworkSelectionUI" "0" "Disabling the hardening against the Airstrike Attack" "DWord"
	
	RegChange "SYSTEM\CurrentControlSet\services\WMPNetworkSvc" "Start" "2" "Enabling Windows Media Player Network Sharing Service" "DWord"
	
	# WPAD exposes the system to MITM attack
	RegChange "SYSTEM\CurrentControlSet\Services\WinHttpAutoProxySvc" "Start" "2" "Enabling WPAD WinHttpAutoProxySvc Service" "DWord"
	
	EnableDnsCache
	EnableLLMNR
	
	# NetBIOS imposes security risk for layer-4 name resolution spoofing attacks, ARP poisoning, KARMA attack and cache poisoning.
	RegChange "SYSTEM\CurrentControlSet\services\NetBT\Parameters\Interfaces\Tcpip*" "NetbiosOptions" "0" "Enabling NetBIOS over TCP/IP..." "DWord"
	
	#Allowing Anonymous logon users to list all account names and enumerate all shared resources can provide a map of potential points to attack the system. (Stig Viewer V-220930)
	RegChange "SYSTEM\CurrentControlSet\Control\Lsa" "RestrictAnonymous" "0" "Allowing Anonymous enumeration of shares (Allowing anonymous logon users to list all account names and enumerate all shared resources can provide a map of potential points to attack the system.)- Stig Viewer V-220930" "Dword"	
	RegChange "SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" "Value" "1" "Enabling Wi-Fi Sense" "Dword"  
	RegChange "SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" "Value" "1" "Enabling Wi-Fi Sense, it connects you to open hotspots that are greenlighted through crowdsourcing. Openning doors to Lure10 MITM attack and phishing" "Dword"
	RegChange "SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config" "AutoConnectAllowedOEM" "1" "Enabling Wi-Fi Sense"
	RegChange "SYSTEM\CurrentControlSet\Control\Remote Assistance" "fAllowToGetHelp" "1" "Enabling Remote Assistance (RA). RA may allow unauthorized parties access to the resources on the computer. (Stigviewer V-220823)"
	RegChange "SYSTEM\CurrentControlSet001\Control\Remote Assistance" "fAllowToGetHelp" "1" "Enabling Remote Assistance"
	RegChange "SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" "fAllowToGetHelp" "1" "Enabling Remote Assistance"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer" "NoDriveTypeAutoRun" "149" "Enabling autoplay " "DWord"
	RegChange "SOFTWARE\Policies\Microsoft\Windows\Explorer" "NoAutoplayfornonVolume" "0" "Enabling autoplay " "DWord"
	RegChange "SOFTWARE\Policies\Microsoft\Windows\Explorer" "NoAutorun" "0" "Enabling autorun " "DWord"
	
	# Protect against credential scraping, mimikatz attack
	# Configures lsass.exe as a protected process and disables wdigest
	# Enables delegation of non-exported credentials which enables support for Restricted Admin Mode or Remote Credential Guard
	RegChange "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\LSASS.exe" "AuditLevel" "8" "Hardening LSASS... " "DWord"
	RegChange "SYSTEM\CurrentControlSet\Control\Lsa" "RunAsPPL" "0" "Hardening LSASS... " "DWord"
	RegChange "SYSTEM\CurrentControlSet\Control\Lsa" "DisableRestrictedAdmin" "1" "Hardening LSASS... " "DWord"
	RegChange "SYSTEM\CurrentControlSet\Control\Lsa" "DisableRestrictedAdminOutboundCreds" "0" "Hardening LSASS... " "DWord"
	RegChange "SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest" "UseLogonCredential" "1" "Hardening LSASS... " "DWord"
	RegChange "SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest" "Negotiate" "1" "Hardening LSASS... " "DWord"
	RegChange "SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation" "AllowProtectedCreds" "0" "Hardening LSASS... " "DWord"
	
	#Enable the LSA protection to prevent Mimikatz from accessing a specific memory location of the LSASS process and scraping credentials
	RegChange "SYSTEM\CurrentControlSet\Control\Lsa" "RunAsPPL" "0" "Hardening LSASS... " "DWord"
	RegChange "SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest" "UseLogonCredential" "1" "Hardening LSASS... " "DWord"
	
	#Windows 10 must be configured to enable Remote host allows delegation of non-exportable credentials. (Stig Viewer V-74699)
	RegChange "SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation" "AllowProtectedCreds" "0" "Hardening LSASS... " "DWord"
	
	Write-Host "Enabling Network Location Awareness Service..."
	Enable-NetAdapterBinding -Name "*" -ComponentID "ms_msclient"	
	
	Write-Host "Enabling Network Location Awareness Service..."
	Get-Service NlaSvc | Set-Service -StartupType automatic
}

if ($doSecurityStuff -eq 1) {
	# Airstrike Attack - FDE bypass and EoP on domain joined Windows workstations. An attacker with physical access to a locked device with WiFi capabilities (such as a laptop or a workstation) can abuse this functionality to force the laptop to authenticate against a rogue access point and capture a MSCHAPv2 challenge response hash for the domain computer account.
	RegChange "SOFTWARE\Policies\Microsoft\Windows\System" "DontDisplayNetworkSelectionUI" "1" "Hardening against the Airstrike Attack" "DWord"
	
	RegChange "SYSTEM\CurrentControlSet\services\WMPNetworkSvc" "Start" "4" "Disabling Windows Media Player Network Sharing Service" "DWord"
	
	# WPAD exposes the system to MITM attack
	RegChange "SYSTEM\CurrentControlSet\Services\WinHttpAutoProxySvc" "Start" "4" "Disabeling WPAD WinHttpAutoProxySvc Service" "DWord"
	
	DisableDnsCache
	DisableLLMNR
	
	# NetBIOS imposes security risk for layer-4 name resolution spoofing attacks, ARP poisoning, KARMA attack and cache poisoning.
	RegChange "SYSTEM\CurrentControlSet\services\NetBT\Parameters\Interfaces\Tcpip*" "NetbiosOptions" "2" "Disabling NetBIOS over TCP/IP..." "DWord"
	
	#Allowing Anonymous logon users to list all account names and enumerate all shared resources can provide a map of potential points to attack the system. (Stig Viewer V-220930)
	RegChange "SYSTEM\CurrentControlSet\Control\Lsa" "RestrictAnonymous" "1" "Disabling Anonymous enumeration of shares..." "Dword" 		
	RegChange "SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" "Value" "0" "Disabling Wi-Fi Sense" "Dword"   
	RegChange "SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" "Value" "0" "Disabling Wi-Fi Sense, it connects you to open hotspots that are greenlighted through crowdsourcing. Openning doors to Lure10 MITM attack and phishing" "Dword"
	RegChange "SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config" "AutoConnectAllowedOEM" "0" "Disabling Wi-Fi Sense"	
	RegChange "SYSTEM\CurrentControlSet\Control\Remote Assistance" "fAllowToGetHelp" "0" "Disabling Remote Assistance (RA). RA may allow unauthorized parties access to the resources on the computer. (Stigviewer V-220823)"
	RegChange "SYSTEM\CurrentControlSet001\Control\Remote Assistance" "fAllowToGetHelp" "0" "Disabling Remote Assistance"
	RegChange "SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" "fAllowToGetHelp" "0" "Disabling Remote Assistance"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer" "NoDriveTypeAutoRun" "255" "Disabling autoplay " "DWord"
	RegChange "SOFTWARE\Policies\Microsoft\Windows\Explorer" "NoAutoplayfornonVolume" "1" "Disabling autoplay " "DWord"
	RegChange "SOFTWARE\Policies\Microsoft\Windows\Explorer" "NoAutorun" "1" "Disabling autorun " "DWord"	
	
	# Protect against credential scraping, mimikatz attack
	# Configures lsass.exe as a protected process and disables wdigest
	# Enables delegation of non-exported credentials which enables support for Restricted Admin Mode or Remote Credential Guard
	RegChange "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\LSASS.exe" "AuditLevel" "8" "Hardening LSASS... " "DWord"
	RegChange "SYSTEM\CurrentControlSet\Control\Lsa" "RunAsPPL" "1" "Hardening LSASS... " "DWord"
	RegChange "SYSTEM\CurrentControlSet\Control\Lsa" "DisableRestrictedAdmin" "0" "Hardening LSASS... " "DWord"
	RegChange "SYSTEM\CurrentControlSet\Control\Lsa" "DisableRestrictedAdminOutboundCreds" "1" "Hardening LSASS... " "DWord"
	RegChange "SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest" "UseLogonCredential" "0" "Hardening LSASS... " "DWord"
	RegChange "SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest" "Negotiate" "0" "Hardening LSASS... " "DWord"
	RegChange "SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation" "AllowProtectedCreds" "1" "Hardening LSASS... " "DWord"	
	
	#Enable the LSA protection to prevent Mimikatz from accessing a specific memory location of the LSASS process and scraping credentials
	RegChange "SYSTEM\CurrentControlSet\Control\Lsa" "RunAsPPL" "1" "Hardening LSASS... " "DWord"
	RegChange "SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest" "UseLogonCredential" "0" "Hardening LSASS... " "DWord"
	
	#Windows 10 must be configured to enable Remote host allows delegation of non-exportable credentials. (Stig Viewer V-74699)
	RegChange "SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation" "AllowProtectedCreds" "1" "Hardening LSASS... " "DWord"

	if ($beNetworkFolderSafe -eq 0) {
		Write-Host "Disabling Network Location Awareness Service..."
		Disable-NetAdapterBinding -Name "*" -ComponentID "ms_msclient"
		
		Write-Host "Disabling Network Location Awareness Service..."
		Get-Service NlaSvc | Set-Service -StartupType disabled
	}
	
	if ($beNetworkFolderSafe -eq 1) {
		Write-Host "Enabling Network Location Awareness Service..."
		Get-Service NlaSvc | Set-Service -StartupType automatic
	}
}

if ($doFingerprintPrevention -eq 0) {
	RegChange "Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" "NoRecentDocsHistory" "0" "Enabling Recent docs history " "DWord"
	RegChange "Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" "SaveZoneInformation" "0" "Enabling Windows save zone information..." "DWord"
	RegChange "SYSTEM\CurrentControlSet\Services\NlaSvc\Parameters\Internet" "EnableActiveProbing" "1" "Enabling internet connection test... " "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" "NoRecycleFiles" "1" "Enabling recycle bin... " "DWord"
	
	# DNS-over-HTTPS (DoH) encrypt the communication between the client and the resolver to prevent the inspection of domain names by network eavesdroppers
	RegChange "SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" "EnableAutoDoh" "0" "Disabling DNS over HTTPS (DoH)... " "DWord"

}

if ($doFingerprintPrevention -eq 1) {
	RegChange "Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" "NoRecentDocsHistory" "1" "Disabling Recent docs history " "DWord"
	RegChange "Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" "SaveZoneInformation" "1" "Disabling Windows save zone information..." "DWord"
	RegChange "SYSTEM\CurrentControlSet\Services\NlaSvc\Parameters\Internet" "EnableActiveProbing" "0" "Disabling internet connection test... " "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" "NoRecycleFiles" "1" "Disabling recycle bin... " "DWord"
	
	# DNS-over-HTTPS (DoH) encrypt the communication between the client and the resolver to prevent the inspection of domain names by network eavesdroppers
	RegChange "SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" "EnableAutoDoh" "2" "Enabling DNS over HTTPS (DoH)... " "DWord"

}


if ($darkTheme -eq 0) {
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" "AppsUseLightTheme" "1" "Disabling dark theme mode" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" "SystemUsesLightTheme" "1" "Disabling dark theme for system" "DWord"
}

if ($darkTheme -eq 1) {
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" "AppsUseLightTheme" "0" "Enabling dark theme mode" "DWord"
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" "SystemUsesLightTheme" "0" "Enabling dark theme for system" "DWord"
}

if ($disableWindowsFirewall -eq 0) {
	Write-Host "Enabling MpsSvc (Windows Firewall Service)..."
	Get-Service MpsSvc | Set-Service -StartupType automatic
	Write-Host "Enabling Windows Firewall..."
	Get-NetFirewallProfile | Set-NetFirewallProfile -Enabled True | Out-Null
	RegChange "SYSTEM\CurrentControlSet\Services\MpsSvc" "Start" "2" "Enabling Windows Firewall service..." "DWord"
}

if ($disableWindowsFirewall -eq 1) {
	Write-Host "Stopping and disabling MpsSvc (Windows Firewall Service)..."
	Get-Service MpsSvc | Stop-Service -PassThru | Set-Service -StartupType disabled
	Write-Host "Disabling Windows Firewall..."
	Get-NetFirewallProfile | Set-NetFirewallProfile -Enabled False | Out-Null
	RegChange "SYSTEM\CurrentControlSet\Services\MpsSvc" "Start" "4" "Disabling Windows Firewall service..." "DWord"	
}

if ($firefoxSettings -eq 1) {
	killProcess("firefox");
	
	$PrefsFiles = Get-Item -Path ($env:APPDATA+"\Mozilla\Firefox\Profiles\*\prefs.js")
	$currentDate = Get-Date -UFormat "%Y-%m-%d-%Hh%M"

	$aboutConfigArr = @('geo.enabled', 'general.warnOnAboutConfig', 'dom.push.enabled', 'dom.webnotifications.enabled', 'app.update.auto', 'app.update.checkInstallTime', 'app.update.auto.migrated', 'app.update.service.enabled',  'identity.fxaccounts.enabled', 'privacy.firstparty.isolate', 'privacy.firstparty.isolate.block_post_message', 'privacy.resistFingerprinting', 'browser.cache.offline.enable', 'browser.send_pings', 'browser.sessionstore.max_tabs_undo', 'dom.battery.enabled', 'dom.event.clipboardevents.enabled', 'browser.startup.homepage_override.mstone', 'browser.cache.disk.smart_size', 'browser.cache.disk.capacity', 'dom.event.contextmenu.enabled', 'media.videocontrols.picture-in-picture.video-toggle.enabled', 'skipConfirmLaunchExecutable', 'activity-stream.disableSnippets', 'browser.messaging-system.whatsNewPanel.enabled', 'extensions.htmlaboutaddons.recommendations.enabled', 'extensions.pocket.onSaveRecs', 'extensions.pocket.enabled', 'browser.aboutConfig.showWarning', 'browser.search.widget.inNavBar', 'browser.urlbar.richSuggestions.tail', 'browser.tabs.warnOnCloseOtherTabs', 'network.trr.mode', 'network.trr.uri', 'network.trr.bootstrapAddress', 'network.security.esni.enabled', 'network.dns.echconfig.enabled', 'network.dns.use_https_rr_as_altsvc', 'browser.topsites.blockedSponsors', 'app.update.BITS.enabled', 'app.update.background.interval', 'media.autoplay.default', 'browser.search.widget.inNavBar', 'browser.contentblocking.category', 'network.cookie.cookieBehavior', 'browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons', 'browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features', 'browser.uiCustomization.state')

	foreach ($file in $PrefsFiles) {
		$path = Get-ItemProperty -Path $file
		Write-Output "editing $path"
		$out = @()

		:Outer foreach ($line in Get-Content $file){
			foreach ($aboutConfigArr2 in $aboutConfigArr){
				if ($line -match $aboutConfigArr2) {
					continue Outer
				}
			}
			$out+= $line 
		}	
		
		$out+= 'user_pref("geo.enabled", false);'
		$out+= 'user_pref("general.warnOnAboutConfig", false);'
		$out+= 'user_pref("dom.push.enabled", false);'
		$out+= 'user_pref("dom.webnotifications.enabled", false);'		
		$out+= 'user_pref("identity.fxaccounts.enabled", false);'
		$out+= 'user_pref("privacy.firstparty.isolate", true);'
		$out+= 'user_pref("privacy.firstparty.isolate.block_post_message", true);'
		$out+= 'user_pref("privacy.resistFingerprinting", true);'
		$out+= 'user_pref("browser.cache.offline.enable", false);'
		$out+= 'user_pref("browser.send_pings", false);'
		$out+= 'user_pref("browser.sessionstore.max_tabs_undo", 0);'
		$out+= 'user_pref("dom.battery.enabled", false);'
		$out+= 'user_pref("dom.event.clipboardevents.enabled", false);'
		$out+= 'user_pref("browser.startup.homepage_override.mstone", ignore);'
		$out+= 'user_pref("browser.cache.disk.smart_size", false);'
		$out+= 'user_pref("browser.cache.disk.capacity", 10000000);'
		$out+= 'user_pref("dom.event.contextmenu.enabled", false);'
		$out+= 'user_pref("media.videocontrols.picture-in-picture.video-toggle.enabled", false);'
		$out+= 'user_pref("browser.download.skipConfirmLaunchExecutable", true);'
		$out+= 'user_pref("browser.newtabpage.activity-stream.disableSnippets", true);'
		$out+= 'user_pref("browser.messaging-system.whatsNewPanel.enabled", false);'	
		$out+= 'user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);'
		$out+= 'user_pref("extensions.pocket.onSaveRecs", false);'
		$out+= 'user_pref("extensions.pocket.enabled", false);'
		$out+= 'user_pref("browser.aboutConfig.showWarning", false);'
		$out+= 'user_pref("browser.urlbar.richSuggestions.tail", false);'
		$out+= 'user_pref("browser.tabs.warnOnCloseOtherTabs", false);'
		
		# Disable update
		$out+= 'user_pref("app.update.auto", false);'
		$out+= 'user_pref("app.update.checkInstallTime", false);'
		$out+= 'user_pref("app.update.auto.migrated", false);'
		$out+= 'user_pref("app.update.service.enabled", false);'
		$out+= 'user_pref("app.update.BITS.enabled", false);'		
		$out+= 'user_pref("app.update.background.interval", "999999999");'
		
		# DNS-over-HTTPS (DoH) encrypt the communication between the client and the resolver to prevent the inspection of domain names by network eavesdroppers
		$out+= 'user_pref("network.trr.mode", 2);'
		$out+= 'user_pref("network.trr.uri", "https://dns.google/dns-query");'
		$out+= 'user_pref("network.trr.bootstrapAddress", "8.8.8.8");'
		
		# Enable Encrypted Client Hello (ECH) on Firefox, to prevent TLS from leaking any data by encrypting all messages;
		$out+= 'user_pref("network.dns.echconfig.enabled", true);'
		$out+= 'user_pref("network.dns.use_https_rr_as_altsvc", true);'
		
		# Remove Amazon`s shortcut from startup
		$out+= 'user_pref("browser.topsites.blockedSponsors", "[\"amazon\"]");'
		
		# Allow autoplay of audio and video
		$out+= 'user_pref("media.autoplay.default", "0");'
		
		# Show search bar
		$out+= 'user_pref("browser.search.widget.inNavBar", true);'
		$out+= 'user_pref("browser.uiCustomization.state", "{\"placements\":{\"widget-overflow-fixed-list\":[],\"nav-bar\":[\"back-button\",\"forward-button\",\"stop-reload-button\",\"customizableui-special-spring1\",\"urlbar-container\",\"search-container\",\"customizableui-special-spring2\",\"save-to-pocket-button\",\"downloads-button\",\"fxa-toolbar-menu-button\",\"addon_darkreader_org-browser-action\",\"ublock0_raymondhill_net-browser-action\"],\"toolbar-menubar\":[\"menubar-items\"],\"TabsToolbar\":[\"tabbrowser-tabs\",\"new-tab-button\",\"alltabs-button\"],\"PersonalToolbar\":[\"personal-bookmarks\"]},\"seen\":[\"addon_darkreader_org-browser-action\",\"ublock0_raymondhill_net-browser-action\",\"developer-button\"],\"dirtyAreaCache\":[\"nav-bar\"],\"currentVersion\":17,\"newElementCount\":2}");'
		
		# Block third-party cookies
		$out+= 'user_pref("browser.contentblocking.category", "custom");'
		$out+= 'user_pref("network.cookie.cookieBehavior", "1");'
		
		# Disable recommendations
		$out+= 'user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false);'
		$out+= 'user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false);'

		Copy-Item $file $file$currentDate".txt"

		Clear-Content $file
		Add-Content $file $out

		Write-Output "Updated $path"
	}
}

if ($firefoxCachePath) {
	killProcess("firefox");	
	$PrefsFiles = Get-Item -Path ($env:SystemDrive+"\Users\*\AppData\Roaming\Mozilla\Firefox\Profiles\*\prefs.js")
	$currentDate = Get-Date -UFormat "%Y-%m-%d-%Hh%M"
	$aboutConfigArr = @('*"browser.cache.disk.parent_directory"*','*"browser.cache.disk.capacity"*')
	
	foreach ($file in $PrefsFiles) {
	$path = Get-ItemProperty -Path $file
	Write-Output "editing $path"
	$out = @()

	foreach ($line in Get-Content $file){
		$matchAboutConfig = 0
		foreach ($aboutConfigArr2 in $aboutConfigArr){
			if ($line -like $aboutConfigArr2) {
				$matchAboutConfig = 1 
			}	
		}

		if ($matchAboutConfig -eq 0) {				
			$out+= $line  
		}
	}	
	$out+= 'user_pref("browser.cache.disk.capacity", 250000000);'
	$out+= 'user_pref("browser.cache.disk.parent_directory", "' + $firefoxCachePath + '");'	
	Copy-Item $file $file$currentDate".txt"
	Clear-Content $file
	Add-Content $file $out
	Write-Output "Updated $path"
	}
} 

if ($remove3dObjFolder -eq 0) {
	RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" "a" "1" "Enabling 3D Objects from explorer My Computer submenu" "DWord"
	RegChange "SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" "a" "1" "Enabling 3D Objects from explorer My Computer submenu" "DWord"
}

if ($remove3dObjFolder -eq 1) {	
    Write-Host "Removing 3D Objects from explorer 'My Computer' submenu"
	regDelete "SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" "Removing 3D Objects from explorer My Computer submenu"
	regDelete "SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" "Removing 3D Objects from explorer My Computer submenu"
}

if ($disableWindowsSounds -eq 1) { 
	Write-Host "Disabling Windows sound effects..."
	Get-ChildItem -Path "HKCU:\AppEvents\Schemes\Apps" | Get-ChildItem | Get-ChildItem | Where-Object {$_.PSChildName -eq ".Current"} | Set-ItemProperty -Name "(Default)" -Value ".None"
}


if ($disablePerformanceMonitor -eq 1) { 
	deletePath "$env:WINDIR\System32\SleepStudy" "Clearing SleepStudy event trace session log..."
	deletePath "$env:WINDIR\System32\SleepStudy\ScreenOn" "Clearing ScreenOn event trace session log..."
	deletePath "$env:WINDIR\System32\LogFiles\WMI" "Clearing RadioMgr/WMI event trace session log..."
	deletePath "$env:WINDIR\System32\LogFiles\WMI\RtBackup" "Clearing RadioMgr/WMI event trace session log..."
	
	Write-Output "Stopping and disabling PLA service Performance Logs & Alerts"
	Get-Service pla | Stop-Service -PassThru | Set-Service -StartupType disabled
	Get-Service PerfHost | Stop-Service -PassThru | Set-Service -StartupType disabled
}

if ($disableWindowsUpdates -eq 0) {	
	RegChange "SYSTEM\CurrentControlSet\Services\UsoSvc" "Start" "2" "Enabling UsoSvc service" "DWord"
	Get-Service UsoSvc | Set-Service -StartupType automatic

	RegChange "SYSTEM\CurrentControlSet\Services\CryptSvc" "Start" "2" "CryptSvc service enabled" "DWord"
	Get-Service CryptSvc | Set-Service -StartupType automatic

	
	RegChange "SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" "Start" "2" "Windows Update Medic Service enabled" "DWord"
	Get-Service WaaSMedicSvc | Set-Service -StartupType automatic

	RegChange "SYSTEM\CurrentControlSet\Services\wuauserv" "Start" "2" "Windows Updates service enabled" "DWord"
	Get-Service wuauserv | Set-Service -StartupType automatic
	
	# BITS (Background Intelligent Transfer Service), its aggressive bandwidth eating will interfere with you online gameplay, work and navigation. Its aggressive disk usable will reduce your HDD or SSD lifespan
	RegChange "SYSTEM\CurrentControlSet\Services\BITS" "Start" "2" "BITS (Background Intelligent Transfer Service) enabled" "DWord"
	Get-Service BITS | Set-Service -StartupType automatic
	
	RegChange "SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" "NoAutoUpdate" "0" "Windows Update enabled" "DWord"
	
	# This enable "Receive updates for other Microsoft products"
	regDelete "SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" "Clearing network profiles..."
	
	RegChange "SOFTWARE\Policies\Microsoft\Windows\Device Metadata" "PreventDeviceMetadataFromNetwork" "0" "Enabling retrieve device metadata for installed devices from the Internet" "DWord"
	RegChange "SOFTWARE\Policies\Microsoft\Windows\DriverSearching" "DontPromptForWindowsUpdate" "0" "Enabling prompt to search Windows Update" "DWord"
	RegChange "SOFTWARE\Policies\Microsoft\Windows\DriverSearching" "DontSearchWindowsUpdate" "0" "Enabling Windows Update to search for device drivers when no local drivers for a device are present" "DWord"
	RegChange "SOFTWARE\Policies\Microsoft\Windows\DriverSearching" "DriverUpdateWizardWuSearchEnabled" "1" "Enabling DriverUpdateWizardWuSearchEnabled" "DWord"
	RegChange "SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" "ExcludeWUDriversInQualityUpdate" "0" "Enabling Windows Update to include updates that have a Driver classification" "DWord"
}

if ($disableWindowsUpdates -eq 1) {
	RegChange "SYSTEM\CurrentControlSet\Services\UsoSvc" "Start" "4" "Disabling UsoSvc service" "DWord"
	Get-Service UsoSvc | Set-Service -StartupType disabled

	RegChange "SYSTEM\CurrentControlSet\Services\CryptSvc" "Start" "4" "Disabling CryptSvc service" "DWord"
	Get-Service CryptSvc | Set-Service -StartupType disabled

	
	RegChange "SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" "Start" "4" "Disabling Windows Update Medic Service" "DWord"
	Get-Service WaaSMedicSvc | Set-Service -StartupType disabled
	
	RegChange "SYSTEM\CurrentControlSet\Services\wuauserv" "Start" "4" "Disabling Windows Updates service" "DWord"
	Get-Service wuauserv | Set-Service -StartupType disabled
	
	# BITS (Background Intelligent Transfer Service), its aggressive bandwidth eating will interfere with you online gameplay, work and navigation. Its aggressive disk usable will reduce your HDD or SSD lifespan
	RegChange "SYSTEM\CurrentControlSet\Services\BITS" "Start" "4" "Disabling BITS (Background Intelligent Transfer Service)" "DWord"
	Get-Service BITS | Set-Service -StartupType disabled
	
	RegChange "SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" "NoAutoUpdate" "1" "Windows Update enabled" "DWord"
	RegChange "SOFTWARE\Policies\Microsoft\Windows\Device Metadata" "PreventDeviceMetadataFromNetwork" "1" "Disabling retrieve device metadata for installed devices from the Internet" "DWord"
	RegChange "SOFTWARE\Policies\Microsoft\Windows\DriverSearching" "DontPromptForWindowsUpdate" "1" "Disabling prompt to search Windows Update" "DWord"
	RegChange "SOFTWARE\Policies\Microsoft\Windows\DriverSearching" "DontSearchWindowsUpdate" "1" "Disabling Windows Update to search for device drivers when no local drivers for a device are present" "DWord"
	RegChange "SOFTWARE\Policies\Microsoft\Windows\DriverSearching" "DriverUpdateWizardWuSearchEnabled" "0" "Disabling DriverUpdateWizardWuSearchEnabled" "DWord"
	RegChange "SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" "ExcludeWUDriversInQualityUpdate" "1" "Disabling Windows Update to include updates that have a Driver classification" "DWord"
	
}

if ($disableMSStore -eq 0) { 
	RegChange "SYSTEM\CurrentControlSet\Services\InstallService" "Start" "2" "Enabling InstallService MS Store service" "DWord"
	Get-Service InstallService | Set-Service -StartupType automatic	
}

if ($disableMSStore -eq 1) { 
	RegChange "SYSTEM\CurrentControlSet\Services\InstallService" "Start" "4" "Disabling InstallService MS Store service" "DWord"
	Get-Service InstallService | Stop-Service -PassThru | Set-Service -StartupType disabled	
}

if ($useGoogleDNS -eq 1) { 
	$DC = "8.8.8.8"
	$Internet = "8.8.4.4"
	$dns = "$DC", "$Internet"

	$Interface = Get-WmiObject Win32_NetworkAdapterConfiguration 
	Write-Host "Registering DNS $dns" -ForegroundColor Green
	$Interface.SetDNSServerSearchOrder($dns)  | Out-Null
}

if ($unnistallWindowsDefender -eq 1) {
	Write-Output "Checking if you are in safe mode..."
	$mySafeMode = gwmi win32_computersystem | select BootupState
	if ($mySafeMode -notlike '*Normal boot*') {
		write-host 'Safe mode confirmed.'				
	} else {		
		write-host 'System needs to be in safe mode to unninstall Windows Defender.' -ForegroundColor Black -BackgroundColor Red			
	}
	
	takeownRegistry("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WinDefend")
	
	Write-Output "Disabling Windows Defender Application Guard..."
	Disable-WindowsOptionalFeature -online -FeatureName "Windows-Defender-ApplicationGuard" -NoRestart -WarningAction SilentlyContinue | Out-Null
	
	deletePath "$env:Programfiles\windows defender" "Deleting Defender run under demand service MpCmdRun.exe..."
	deletePath "$env:Programfiles\Windows Defender Advanced Threat Protection" "Deleting Windows Defender Advanced Threat Protection folder..."
	deletePath "$env:Programfiles (x86)\Windows Defender" "Deleting windows Windows defender x86 folder..."
	deletePath "$env:ProgramData\Microsoft\Windows Defender" "Deleting Defender Antivirus and Defender Antivirus Network Inspection Service folder..."
	deletePath "$env:ProgramData\Microsoft\Windows Defender\Platform" "Deleting Defender run under demand service MpCmdRun.exe..."
	deletePath "$env:ProgramData\Microsoft\Windows Defender Advanced Threat Protection" "Deleting windows Windows defender program data folder..."
	deletePath "$env:ProgramData\Microsoft\Windows Security Health" "Deleting windows Windows defender program data folder..."
	
	regDeleteKey "SOFTWARE\Microsoft\Windows\CurrentVersion\Run\" "SecurityHealth" "Disabling SecurityHealth startup"
	
	RegChange "SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" "SpynetReporting" "0" "Disabling Windows Defender Cloud..." "DWord"
	RegChange "SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" "SubmitSamplesConsent" "2" "Disabling Windows Defender Cloud Sample..." "DWord"			
	RegChange "Software\Policies\Microsoft\Windows Defender" "DisableConfig" "1" "Disabling Windows Anti Spyware - DisableConfig"
	RegChange "Software\Policies\Microsoft\Windows Defender" "DisableAntiSpyware" "1" "Disabling Windows Anti Spyware - DisableAntiSpyware"
	RegChange "SYSTEM\CurrentControlSet\Services\WdBoot" "Start" "4" "Disabling WdBoot (Windows Defender)"
	RegChange "SYSTEM\CurrentControlSet\Services\WdFilter" "Start" "4" "Disabling WdFilter (Windows Defender)"
	RegChange "SYSTEM\CurrentControlSet\Services\WdNisDrv" "Start" "4" "Disabling WdNisDrv (Windows Defender)"
	RegChange "SYSTEM\CurrentControlSet\Services\WdNisSvc" "Start" "4" "Disabling WdNisSvc (Windows Defender)"
	RegChange "SYSTEM\CurrentControlSet\Services\WinDefend" "Start" "4" "Disabling WinDefend (Windows Defender)"
	RegChange "SYSTEM\CurrentControlSet\Services\wscsvc" "Start" "4" "Disabling Windows Security Service Center"
	RegChange "SYSTEM\CurrentControlSet\Services\SecurityHealthService" "Start" "4" "Disabling SecurityHealthService (Windows Defender)"
	RegChange "SYSTEM\CurrentControlSet\Services\Sense" "Start" "4" "Disabling Sense (Windows Defender)"
	RegChange "SYSTEM\ControlSet001\Services\WinDefend" "Start" "4" "Disabling WinDefend (Windows Defender)"

	# Disable SmartScreen Filter
	RegChange "Software\Microsoft\Windows\CurrentVersion\Explorer" "SmartScreenEnabled" "Off" "Disabling SmartScreen Filter" "String"
	RegChange "Software\Microsoft\Windows\CurrentVersion\AppHost" "EnableWebContentEvaluation" "0" "Disabling SmartScreen Filter" "DWord"

	# Necessary bacause Windows still load this service even if its disabled
	deleteFile "$env:WINDIR\system32\SecurityHealthService.exe" "Deleting SecurityHealthService.exe..."	
	
	sc.exe config WinDefend start=disabled | Out-Null
	if($?){   write-Host -ForegroundColor Green "Windows Updates Service Disabled"  }else{   write-Host -ForegroundColor red "Windows Updates Service Not Disabled" }

	Set-MpPreference -DisableRealtimeMonitoring $true -EA SilentlyContinue
	if($?){   write-Host -ForegroundColor Green "Windows Defender Current Session Disabled"  }else{   write-Host -ForegroundColor Green "Windows Defender Current Session not running" }

	Set-ItemProperty -Path "HKLM:Software\Policies\Microsoft\Windows Defender" -Name "DisableRoutinelyTakingAction" -Type DWord -Value 1
	if($?){   write-Host -ForegroundColor Green "Windows Defender DisableRoutinelyTakingAction Disabled"  }else{   write-Host -ForegroundColor red "Windows Defender DisableRoutinelyTakingAction Not Disabled" }

	Set-ItemProperty -Path "HKLM:Software\Microsoft\Windows Defender\Real-Time Protection" -Name "DisableBehaviorMonitoring" -Type DWord -Value 1
	if($?){   write-Host -ForegroundColor Green "Windows DisableBehaviorMonitoring Disabled"  }else{   write-Host -ForegroundColor red "Windows DisableBehaviorMonitoring not Disabled" }

	Set-ItemProperty -Path "HKLM:Software\Microsoft\Windows Defender\Real-Time Protection" -Name "DisableAntiSpywareRealtimeProtection" -Type DWord -Value 1
	if($?){   write-Host -ForegroundColor Green "Windows DisableAntiSpywareRealtimeProtection Disabled"  }else{   write-Host -ForegroundColor red "Windows DisableAntiSpywareRealtimeProtection not Disabled" }

	Set-ItemProperty -Path "HKLM:Software\Microsoft\Windows Defender\Real-Time Protection" -Name "DisableOnAccessProtection" -Type DWord -Value 1
	if($?){   write-Host -ForegroundColor Green "Windows On Access Protection Disabled"  }else{   write-Host -ForegroundColor red "Windows On Access Protection not Disabled" }

	Set-ItemProperty -Path "HKLM:Software\Microsoft\Windows Defender\Real-Time Protection" -Name "DisableScanOnRealtimeEnable" -Type DWord -Value 1
	if($?){   write-Host -ForegroundColor Green "Windows Real Time Protection Disabled"  }else{   write-Host -ForegroundColor red "Windows Real Time Protection not Disabled" }

	# Disable AllowUpdateService
	If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Update\AllowUpdateService")) {
		New-Item -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Update\AllowUpdateService" | Out-Null
	}
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Update\AllowUpdateService" -Name "value" -Type DWord -Value 0
	if($?){   write-Host -ForegroundColor Green "Windows AllowUpdateService disabled"  }else{   write-Host -ForegroundColor red "Windows AllowUpdateService not disabled" } 

	# Disable AllowAutoUpdate
	If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Update\AllowAutoUpdate")) {
		New-Item -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Update\AllowAutoUpdate" | Out-Null
	}
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Update\AllowAutoUpdate" -Name "value" -Type DWord -Value 5
	if($?){   write-Host -ForegroundColor Green "Windows AllowAutoUpdate disabled"  }else{   write-Host -ForegroundColor red "Windows AllowAutoUpdate not disabled" } 

	# Disable Windows Defender AllowArchiveScanning
	If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Defender\AllowArchiveScanning")) {
		New-Item -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Defender\AllowArchiveScanning" | Out-Null
	}
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Defender\AllowArchiveScanning" -Name "value" -Type DWord -Value 0
	if($?){   write-Host -ForegroundColor Green "Windows Defender AllowArchiveScanning disabled"  }else{   write-Host -ForegroundColor red "Windows Defender AllowArchiveScanning not disabled" } 

	# Disable Windows Defender AllowBehaviorMonitoring
	If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Defender\AllowBehaviorMonitoring")) {
		New-Item -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Defender\AllowBehaviorMonitoring" | Out-Null
	}
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Defender\AllowBehaviorMonitoring" -Name "value" -Type DWord -Value 0
	if($?){   write-Host -ForegroundColor Green "Windows Defender AllowBehaviorMonitoring disabled"  }else{   write-Host -ForegroundColor red "Windows Defender AllowBehaviorMonitoring not disabled" } 

	# Disable Windows Defender AllowCloudProtection
	If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Defender\AllowCloudProtection")) {
		New-Item -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Defender\AllowCloudProtection" | Out-Null
	}
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Defender\AllowCloudProtection" -Name "value" -Type DWord -Value 0
	if($?){   write-Host -ForegroundColor Green "Windows Defender AllowCloudProtection disabled"  }else{   write-Host -ForegroundColor red "Windows Defender AllowCloudProtection not disabled" } 

	# Disable Windows Defender AllowIntrusionPreventionSystem
	If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Defender\AllowIntrusionPreventionSystem")) {
		New-Item -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Defender\AllowIntrusionPreventionSystem" | Out-Null
	}
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Defender\AllowIntrusionPreventionSystem" -Name "value" -Type DWord -Value 0
	if($?){   write-Host -ForegroundColor Green "Windows Defender AllowIntrusionPreventionSystem disabled"  }else{   write-Host -ForegroundColor red "Windows Defender AllowIntrusionPreventionSystem not disabled" } 

	# Disable Windows Defender AllowIOAVProtection
	If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Defender\AllowIOAVProtection")) {
		New-Item -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Defender\AllowIOAVProtection" | Out-Null
	}
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Defender\AllowIOAVProtection" -Name "value" -Type DWord -Value 0
	if($?){   write-Host -ForegroundColor Green "Windows Defender AllowIOAVProtection disabled"  }else{   write-Host -ForegroundColor red "Windows Defender AllowIOAVProtection not disabled" } 

	# Disable Windows Defender AllowOnAccessProtection
	If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Defender\AllowOnAccessProtection")) {
		New-Item -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Defender\AllowOnAccessProtection" | Out-Null
	}
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Defender\AllowOnAccessProtection" -Name "value" -Type DWord -Value 0
	if($?){   write-Host -ForegroundColor Green "Windows Defender AllowOnAccessProtection disabled"  }else{   write-Host -ForegroundColor red "Windows Defender AllowOnAccessProtection not disabled" } 

	# Disable Windows Defender AllowRealtimeMonitoring
	If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Defender\AllowRealtimeMonitoring")) {
		New-Item -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Defender\AllowRealtimeMonitoring" | Out-Null
	}
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Defender\AllowRealtimeMonitoring" -Name "value" -Type DWord -Value 0
	if($?){   write-Host -ForegroundColor Green "Windows Defender AllowRealtimeMonitoring disabled"  }else{   write-Host -ForegroundColor red "Windows Defender AllowRealtimeMonitoring not disabled" } 

	# Disable Windows Defender AllowScanningNetworkFiles
	If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Defender\AllowScanningNetworkFiles")) {
		New-Item -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Defender\AllowScanningNetworkFiles" | Out-Null
	}
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Defender\AllowScanningNetworkFiles" -Name "value" -Type DWord -Value 0
	if($?){   write-Host -ForegroundColor Green "Windows Defender AllowScanningNetworkFiles disabled"  }else{   write-Host -ForegroundColor red "Windows Defender AllowScanningNetworkFiles not disabled" } 

	# Disable Windows Defender AllowScriptScanning
	If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Defender\AllowScriptScanning")) {
		New-Item -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Defender\AllowScriptScanning" | Out-Null
	}
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Defender\AllowScriptScanning" -Name "value" -Type DWord -Value 0
	if($?){   write-Host -ForegroundColor Green "Windows Defender AllowScriptScanning disabled"  }else{   write-Host -ForegroundColor red "Windows Defender AllowScriptScanning not disabled" } 

	# Disable Windows Defender DisableCatchupFullScan
	If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Defender\DisableCatchupFullScan")) {
		New-Item -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Defender\DisableCatchupFullScan" | Out-Null
	}
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Defender\DisableCatchupFullScan" -Name "value" -Type DWord -Value 0
	if($?){   write-Host -ForegroundColor Green "Windows Defender DisableCatchupFullScan disabled"  }else{   write-Host -ForegroundColor red "Windows Defender DisableCatchupFullScan not disabled" } 

	# Disable Windows Defender DisableCatchupQuickScan
	If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Defender\DisableCatchupQuickScan")) {
		New-Item -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Defender\DisableCatchupQuickScan" | Out-Null
	}
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Defender\DisableCatchupQuickScan" -Name "value" -Type DWord -Value 0
	if($?){   write-Host -ForegroundColor Green "Windows Defender DisableCatchupQuickScan disabled"  }else{   write-Host -ForegroundColor red "Windows Defender DisableCatchupQuickScan not disabled" } 

	# Disable Windows Defender EnableNetworkProtection
	If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Defender\EnableNetworkProtection")) {
		New-Item -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Defender\EnableNetworkProtection" | Out-Null
	}
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Defender\EnableNetworkProtection" -Name "value" -Type DWord -Value 0
	if($?){   write-Host -ForegroundColor Green "Windows Defender EnableNetworkProtection disabled"  }else{   write-Host -ForegroundColor red "Windows Defender EnableNetworkProtection not disabled" } 

	# Disable Windows Defender PUAProtection
	If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Defender\PUAProtection")) {
		New-Item -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Defender\PUAProtection" | Out-Null
	}
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Defender\PUAProtection" -Name "value" -Type DWord -Value 0
	if($?){   write-Host -ForegroundColor Green "Windows Defender PUAProtection disabled"  }else{   write-Host -ForegroundColor red "Windows Defender PUAProtection not disabled" } 

	# Change Windows Defender RealTimeScanDirection to monitor only outgoing files
	If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Defender\RealTimeScanDirection")) {
		New-Item -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Defender\RealTimeScanDirection" | Out-Null
	}
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Defender\RealTimeScanDirection" -Name "value" -Type DWord -Value 2
	if($?){   write-Host -ForegroundColor Green "Changed Windows Defender RealTimeScanDirection to monitor only outgoing files"  }else{   write-Host -ForegroundColor red "Windows RealTimeScanDirection not changed" } 

	# Disable Windows Defender AllowEmailScanning
	If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Defender\AllowEmailScanning")) {
		New-Item -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Defender\AllowEmailScanning" | Out-Null
	}
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Defender\AllowEmailScanning" -Name "value" -Type DWord -Value 0
	if($?){   write-Host -ForegroundColor Green "Windows Defender AllowEmailScanning disabled"  }else{   write-Host -ForegroundColor red "Windows Defender AllowEmailScanning not disabled" } 
}




##########
# Program - End
##########
#--------------------------------------------------------------------------

RegChange "SOFTWARE\Microsoft\CTF\LangBar" "ExtraIconsOnMinimized" "1" "Fix language bar..." "DWord"
RegChange "SOFTWARE\Microsoft\CTF\LangBar" "Label" "1" "Fix language bar..." "DWord"
RegChange "SOFTWARE\Microsoft\CTF\LangBar" "ShowStatus" "4" "Fix language bar..." "DWord"
RegChange "SOFTWARE\Microsoft\Windows\CurrentVersion\Run" "CTFMON" "ctfmon.exe" "Fix typing in windows search bar..." "String"

$visual = Read-Host "Install Initial Packages? (y/n)"

while("y","n" -notcontains $visual)
{
	$visual = Read-Host "y or n?"
}

$showhidden = Read-Host "Show hidden files and extensions (y/n)"
while("y","n" -notcontains $showhidden)
{
	$showhidden = Read-Host "y or n?"
}


$disableuac = Read-Host "Disable UAC and remove windows apps (y/n)"
switch ($disableuac) {
	y {
	DisableUAC
	}
}


$ink = Read-Host "Disable Windows INK (y/n)"
while("y","n" -notcontains $ink)
{
	$ink = Read-Host "y or n?"
}

if ($showhidden -like "y") { 
	#SHOW HIDDEN FILES AND EXTENSIONS

	$key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
	Set-ItemProperty $key Hidden 1
	if($?){   write-Host -ForegroundColor Green "Windows Hidden Files Disabled"  }else{   write-Host -ForegroundColor red "Windows Hidden Files not Disabled" }

	Set-ItemProperty $key HideFileExt 0
	if($?){   write-Host -ForegroundColor Green "Windows Hidden Extensions Disabled"  }else{   write-Host -ForegroundColor red "Windows Hidden Extensions Options not Disabled" }
}


if ($ink -like "y") { 
	#Disable INK
	New-ItemProperty -Path HKLM:SOFTWARE\Policies\Microsoft -Name WindowsInkWorkspace -PropertyType DWord -Value 0 -Force -EA SilentlyContinue | Out-Null
	if($?){   write-Host -ForegroundColor Green "Windows INK disabled"  }else{   write-Host -ForegroundColor red "Windows INK not disabled" } 
}

if ($visual -like "y") { 
	Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
	choco install vcredist-all -y 
	choco install vcredist2010 -y
	choco install vcredist2017 -y
	choco install dotnet4.0 -y 
	choco install dotnet4.5 -y 
	choco install dotnetfx -y
	choco install directx -y
	choco install dotnetcore -y
	choco install dotnet-runtime -y
	
	choco install qbittorrent -y
	choco install k-litecodecpackfull -y
	choco install imageglass -y
	choco install 7zip.install -y
	choco install notepadplusplus -y
}

# REMOVE ONEDRIVE
kill -processname OneDrive, aaa -Force -Verbose -EA SilentlyContinue
if($?){   write-Host -ForegroundColor Green "One Drive process has been stoped"  }else{   write-Host -ForegroundColor Green "One Drive process is not running" } 

if (Test-Path "$env:SYSTEMROOT\SysWOW64\OneDriveSetup.exe") {
"$env:SYSTEMROOT\SysWOW64\OneDriveSetup.exe /uninstall" | Out-Null
if($?){   write-Host -ForegroundColor Green "One Drive has been uninstalled"  }else{   write-Host -ForegroundColor red "One Drive uninstaller failed!" } 
}Else{
write-Host -ForegroundColor yellow "One Drive unnistaller is not present on the system"
}

Remove-Item "$env:USERPROFILE\OneDrive\*.*" -Force -ErrorAction SilentlyContinue
if($?){   write-Host -ForegroundColor Green "One Drive files removed"  }else{   write-Host -ForegroundColor red "One Drive files not Removed" } 

Remove-Item "C:\OneDriveTemp\*.*" -Force -EA SilentlyContinue | Out-Null
if($?){   write-Host -ForegroundColor Green "One Drive temp files Removed (Step 2)"  }else{   write-Host -ForegroundColor green "One Drive temp files not present" } 

Remove-Item "$env:LOCALAPPDATA\Microsoft\OneDrive\" -Force -EA SilentlyContinue | Out-Null
if($?){   write-Host -ForegroundColor Green "One Drive appdata folder removed"  }else{   write-Host -ForegroundColor green "One Drive appdata folder not present" } 


# Disable ShadowCopy
vssadmin delete shadows /all /quiet | Out-Null
if($?){   write-Host -ForegroundColor Green "Windows Shadowcopy removed"  }else{   write-Host -ForegroundColor green "Windows Shadowcopy already disabled" } 

# Disable notifications
reg add 'HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\Explorer' /v DisableNotificationCenter /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v "ToastEnabled" /t REG_DWORD /d 0 /f
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v EnableBalloonTips /t REG_DWORD /d 0 /f
reg add HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer /v DisableNotificationCenter /t REG_DWORD /d 1 /f
reg add HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer /v DisableNotificationCenter /t REG_DWORD /d 1 /f

# Disable Windows Tile Notifications
If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Notifications\DisallowTileNotification")) {
    New-Item -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Notifications\DisallowTileNotification" | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Notifications\DisallowTileNotification" -Name "value" -Type DWord -Value 1
if($?){   write-Host -ForegroundColor Green "Windows Tile Notifications disabled"  }else{   write-Host -ForegroundColor red "Windows Tile Notifications not disabled" } 

# Disable Windows Defender Enhanced Notifications
If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\WindowsDefenderSecurityCenter\DisableEnhancedNotifications")) {
    New-Item -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\WindowsDefenderSecurityCenter\DisableEnhancedNotifications" | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\WindowsDefenderSecurityCenter\DisableEnhancedNotifications" -Name "value" -Type DWord -Value 1
if($?){   write-Host -ForegroundColor Green "Windows Defender Enhanced Notifications disabled"  }else{   write-Host -ForegroundColor red "Windows Defender Enhanced Notifications not disabled" } 

# Disable Windows Defender Security Center Notifications
If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\WindowsDefenderSecurityCenter\DisableNotifications")) {
    New-Item -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\WindowsDefenderSecurityCenter\DisableNotifications" | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\WindowsDefenderSecurityCenter\DisableNotifications" -Name "value" -Type DWord -Value 1
if($?){   write-Host -ForegroundColor Green "Windows Defender Security Center Notifications disabled"  }else{   write-Host -ForegroundColor red "Windows Defender Security Center Notifications not disabled" } 


# Disable AllowSuggestedAppsInWindowsInkWorkspace
If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\WindowsInkWorkspace\AllowSuggestedAppsInWindowsInkWorkspace")) {
    New-Item -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\WindowsInkWorkspace\AllowSuggestedAppsInWindowsInkWorkspace" | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\WindowsInkWorkspace\AllowSuggestedAppsInWindowsInkWorkspace" -Name "value" -Type DWord -Value 0
if($?){   write-Host -ForegroundColor Green "AllowSuggestedAppsInWindowsInkWorkspace disabled"  }else{   write-Host -ForegroundColor red "AllowSuggestedAppsInWindowsInkWorkspace not disabled" } 

# Disable SgrmAgent
If (!(Test-Path "HKLM:\SYSTEM\CurrentControlSet\Services\SgrmAgent")) {
    New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Services\SgrmAgent" | Out-Null
}
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\SgrmAgent" -Name "Start" -Type DWord -Value 4
if($?){   write-Host -ForegroundColor Green "SgrmAgent disabled"  }else{   write-Host -ForegroundColor red "SgrmAgent not disabled" } 

# Disable SgrmBroker
If (!(Test-Path "HKLM:\SYSTEM\CurrentControlSet\Services\SgrmBroker")) {
    New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Services\SgrmBroker" | Out-Null
}
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\SgrmBroker" -Name "Start" -Type DWord -Value 4
if($?){   write-Host -ForegroundColor Green "SgrmBroker disabled"  }else{   write-Host -ForegroundColor red "SgrmBroker not disabled" } 

# Disable SgrmAgent
If (!(Test-Path "HKLM:\SYSTEM\ControlSet001\Services\SgrmAgent")) {
    New-Item -Path "HKLM:\SYSTEM\ControlSet001\Services\SgrmAgent" | Out-Null
}
Set-ItemProperty -Path "HKLM:\SYSTEM\ControlSet001\Services\SgrmAgent" -Name "Start" -Type DWord -Value 4
if($?){   write-Host -ForegroundColor Green "SgrmAgent disabled"  }else{   write-Host -ForegroundColor red "SgrmAgent not disabled" } 

# Disable SgrmBroker
If (!(Test-Path "HKLM:\SYSTEM\ControlSet001\Services\SgrmBroker")) {
    New-Item -Path "HKLM:\SYSTEM\ControlSet001\Services\SgrmBroker" | Out-Null
}
Set-ItemProperty -Path "HKLM:\SYSTEM\ControlSet001\Services\SgrmBroker" -Name "Start" -Type DWord -Value 4
if($?){   write-Host -ForegroundColor Green "SgrmBroker disabled"  }else{   write-Host -ForegroundColor red "SgrmBroker not disabled" } 

# xbox dvr causing fps issues
reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR /v value /t REG_DWORD /d 0 /f

# WE DONT NEED TELEMETRY AGENT NVIDIA!
Get-Service NvTelemetryContainer | Stop-Service -PassThru | Set-Service -StartupType disabled

# USELESS FAX
Get-Service Fax | Stop-Service -PassThru | Set-Service -StartupType disabled
if($?){   write-Host -ForegroundColor Green "Windows Fax service disabled"  }else{   write-Host -ForegroundColor red "Windows Fax service not disabled" } 

# USELESS GEO
Get-Service lfsvc | Stop-Service -PassThru | Set-Service -StartupType disabled
if($?){   write-Host -ForegroundColor Green "Geo service disabled"  }else{   write-Host -ForegroundColor red "Geo service not disabled" } 

Get-Service wlidsvc | Stop-Service -PassThru | Set-Service -StartupType disabled
if($?){   write-Host -ForegroundColor Green "wlidsvc disabled"  }else{   write-Host -ForegroundColor red "wlidsvc not disabled" } 

# USELESS PcaSvc
Get-Service PcaSvc | Stop-Service -PassThru | Set-Service -StartupType disabled
if($?){   write-Host -ForegroundColor Green "PcaSvc service disabled"  }else{   write-Host -ForegroundColor red "PcaSvc service not disabled" } 

# USELESS DusmSvc
Get-Service DusmSvc | Stop-Service -PassThru | Set-Service -StartupType disabled
if($?){   write-Host -ForegroundColor Green "DusmSvc service disabled"  }else{   write-Host -ForegroundColor red "DusmSvc service not disabled" } 

PowerCfg -SetActive $powerPlan
write-Host -ForegroundColor Green "PowerScheme Sucessfully Applied"
powercfg.exe -x -monitor-timeout-ac $monitorAcTimeout
powercfg.exe -x -monitor-timeout-dc $monitorDcTimeout
powercfg.exe -x -disk-timeout-ac $diskAcTimeout
powercfg.exe -x -disk-timeout-dc $diskDcTimeout
powercfg.exe -x -standby-timeout-ac $standbyAcTimeout
powercfg.exe -x -standby-timeout-dc $standbyDcTimeout
powercfg.exe -x -hibernate-timeout-ac $hybernateAcTimeout
powercfg.exe -x -hibernate-timeout-dc $hybernateDcTimeout

Remove-PSDrive HKCR
PAUSE

# NcbService is required by Windows setting app and night light function
# sppsvc necessary to keep Windows activated