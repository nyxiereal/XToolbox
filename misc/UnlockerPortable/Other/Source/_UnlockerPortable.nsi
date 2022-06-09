; **************************************************************************
; === Define constants ===
; **************************************************************************
!define /date VER	"%Y.%m.%d.%H"
!define APPNAME		"Unlocker"
!define APP			"Unlocker"
!define APPDIR		"App\Unlocker"
!define APPEXE32	"UnlockerAssistant.exe"
!define APPEXE		"Unlocker.exe"
!define APPSWITCH 	``

; --- Define RegKeys ---
	!define REGKEY1 "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Unlocker"
	!define REGKEY2 "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\UnlockerShellExtension"
	!define REGKEY3 "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UnlockerDriver5"

; --- Define install path relative to Program Files (used down) ---
!define LOCALDIR "Unlocker"
; --- Define RegServer Shared DLLs ---
	!define LOCALDLL1 "$PROGRAMFILES\${LOCALDIR}\UnlockerCOM.dll"
	!define PORTABLEDLL1 "$EXEDIR\${APPDIR}\UnlockerCOM.dll"
	!define PORTABLEDLL164 "$EXEDIR\${APPDIR}64\UnlockerCOM.dll"

; **************************************************************************
; === Best Compression ===
; **************************************************************************
SetCompressor /SOLID lzma
SetCompressorDictSize 32

; **************************************************************************
; === Includes ===
; **************************************************************************
!include "..\_Include\Launcher.nsh" 
!include "LogicLib.nsh"
!include "x64.nsh"

; **************************************************************************
; === Set basic information ===
; **************************************************************************
Name "${APPNAME} Portable"
OutFile "..\..\..\${APP}Portable\${APP}Portable.exe"
Icon "${APP}.ico"

; **************************************************************************
; === Other Actions ===
; **************************************************************************
Var LNG
Function Init
	ReadINIStr $LNG "$EXEDIR\${APP}Portable.ini" "${APP}Portable" "LanguageID"
	StrCmp $LNG "" 0 +4
	System::Call 'kernel32::GetUserDefaultLangID() i .r0'
	StrCpy $LNG $0
	WriteINIStr "$EXEDIR\${APP}Portable.ini" "${APP}Portable" "LanguageID" "$LNG"
${If} ${RunningX64}
	Rename "$EXEDIR\Data\${APP}64\${APP}.cfg" "$EXEDIR\${APPDIR}64\${APP}.cfg"
	SetRegView 64
	${DisableX64FSRedirection}
	WriteRegStr HKEY_LOCAL_MACHINE "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Unlocker" "Language" "$LNG"
	WriteRegStr HKEY_LOCAL_MACHINE "SYSTEM\CurrentControlSet\services\UnlockerDriver5" "ImagePath" "\??\$EXEDIR\${APPDIR}64\UnlockerDriver5.sys"
	WriteRegDWORD HKEY_LOCAL_MACHINE "SYSTEM\CurrentControlSet\services\UnlockerDriver5" "Type" 0x1
	CreateShortCut "$SENDTO\${APP}Portable.lnk" "$EXEDIR\${APPDIR}64\${APP}.exe"
	${EnableX64FSRedirection}
${Else}
	Rename "$EXEDIR\Data\${APP}\${APP}.cfg" "$EXEDIR\${APPDIR}\${APP}.cfg"
	WriteRegStr HKEY_LOCAL_MACHINE "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Unlocker" "Language" "$LNG"
	WriteRegStr HKEY_LOCAL_MACHINE "SYSTEM\CurrentControlSet\Services\UnlockerDriver5" "ImagePath" "\??\$EXEDIR\${APPDIR}\UnlockerDriver5.sys"
	WriteRegDWORD HKEY_LOCAL_MACHINE "SYSTEM\CurrentControlSet\Services\UnlockerDriver5" "Type" 0x1
	CreateShortCut "$SENDTO\${APP}Portable.lnk" "$EXEDIR\${APPDIR}\${APP}.exe"
${EndIf}
FunctionEnd

Function Close
${If} ${RunningX64}
CreateDirectory "$EXEDIR\Data\${APP}64"
Rename "$EXEDIR\${APPDIR}64\${APP}.cfg" "$EXEDIR\Data\${APP}64\${APP}.cfg"
${Else}
CreateDirectory "$EXEDIR\Data\${APP}"
Rename "$EXEDIR\${APPDIR}\${APP}.cfg" "$EXEDIR\Data\${APP}\${APP}.cfg"
${EndIf}
Delete "$SENDTO\${APP}Portable.lnk"
FunctionEnd

; **************************************************************************
; === Run Application ===
; **************************************************************************
Function Launch
${If} ${RunningX64}
	SetOutPath "$EXEDIR\${APPDIR}64"
	${GetParameters} $0
	ExecWait `"$EXEDIR\${APPDIR}64\${APPEXE}"${APPSWITCH} $0`
${Else}
	SetOutPath "$EXEDIR\${APPDIR}"
	Exec `"$EXEDIR\${APPDIR}\${APPEXE32}"`
	${GetParameters} $0
	ExecWait `"$EXEDIR\${APPDIR}\${APPEXE}"${APPSWITCH} $0`
	KillProcDLL::KillProc "${APPEXE32}"
${EndIf}
WriteINIStr "$EXEDIR\Data\${APP}Portable.ini" "${APP}Portable" "GoodExit" "true"
newadvsplash::stop
FunctionEnd

; **************************************************************************
; ==== Running ====
; **************************************************************************

Section "Main"

	Call CheckStart

	Call BackupLocalKeys

	Call UnRegLocalDLL
	Call RegPortableDLL

	Call Init

		Call SplashLogo
		Call Launch

	Call Restore

SectionEnd

Function Restore

	Call Close

	Call UnRegPortableDLL
	Call RegLocalDLL

	Call RestoreLocalKeys

FunctionEnd

; **************************************************************************
; ==== Actions on Registry Keys =====
; **************************************************************************
Function BackupLocalKeys
	${registry::BackupKey} "${REGKEY1}"
	${registry::BackupKey} "${REGKEY2}"
	${registry::BackupKey} "${REGKEY3}"
FunctionEnd

Function RestoreLocalKeys
	${registry::RestoreBackupKey} "${REGKEY1}"
	${registry::RestoreBackupKey} "${REGKEY2}"
	${registry::RestoreBackupKey} "${REGKEY3}"
${registry::Unload}
FunctionEnd

; ************************************************************************
; ==== Actions on DLLs ====
; ************************************************************************
Function UnRegLocalDLL
	${dll::UnregLocal} "${LOCALDLL1}"
FunctionEnd

Function RegPortableDLL
${If} ${RunningX64}
SetOutPath "$EXEDIR\${APPDIR}64"
Exec `"$SYSDIR\regsvr32.exe" /s "${PORTABLEDLL164}"`
${Else}
	${dll::RegPortable} "${PORTABLEDLL1}"
${EndIf}
FunctionEnd

Function UnRegPortableDLL
${If} ${RunningX64}
SetOutPath "$EXEDIR\${APPDIR}64"
Exec `"$SYSDIR\regsvr32.exe" /u /s "${PORTABLEDLL164}"`
${Else}
	${dll::UnRegPortable} "${PORTABLEDLL1}"
${EndIf}
FunctionEnd

Function RegLocalDLL
	${dll::RegLocal} "${LOCALDLL1}"
FunctionEnd
