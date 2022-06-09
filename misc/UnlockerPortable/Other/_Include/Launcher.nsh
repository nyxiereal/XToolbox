; **************************************************************************
; === Set version information ===
; **************************************************************************
Caption "${APPNAME} Portable"
VIProductVersion "${VER}"
VIAddVersionKey ProductName "${APPNAME} Portable"
VIAddVersionKey Comments "Allows ${APPNAME} to be run from a removable drive."
VIAddVersionKey CompanyName ""
VIAddVersionKey LegalCopyright ""
VIAddVersionKey FileDescription "${APPNAME} Portable"
VIAddVersionKey FileVersion "${VER}"
VIAddVersionKey ProductVersion "${VER}"
VIAddVersionKey InternalName "${APPNAME} Portable"
VIAddVersionKey LegalTrademarks ""
VIAddVersionKey OriginalFilename "${APP}Portable.exe"

; **************************************************************************
; === Macros ===
; **************************************************************************
; --- Registry ---
!ifdef REGKEY1 | REGKEYVALUE1
!define registry::BackupKey `!insertmacro registry::BackupKey`
!macro registry::BackupKey _PATH
	registry::_DeleteKey /NOUNLOAD `${_PATH}-BackupBy${APP}Portable`
	Pop $R0
	registry::_MoveKey /NOUNLOAD `${_PATH}` `${_PATH}-BackupBy${APP}Portable`
	Pop $R0
!macroend

!define registry::RestoreBackupKey `!insertmacro registry::RestoreBackupKey`
!macro registry::RestoreBackupKey _PATH
	registry::_DeleteKey /NOUNLOAD `${_PATH}`
	Pop $R0
	registry::_MoveKey /NOUNLOAD `${_PATH}-BackupBy${APP}Portable` `${_PATH}`
	Pop $R0
!macroend

!define registry::BackupValue `!insertmacro registry::BackupValue`
!macro registry::BackupValue _PATH _VALUE
	registry::_DeleteValue /NOUNLOAD `${_PATH}` `${_VALUE}-BackupBy${APP}Portable`
	Pop $R0
	registry::_MoveValue /NOUNLOAD `${_PATH}` `${_VALUE}` `${_PATH}` `${_VALUE}-BackupBy${APP}Portable`
	Pop $R0
!macroend

!define registry::RestoreBackupValue `!insertmacro registry::RestoreBackupValue`
!macro registry::RestoreBackupValue _PATH _VALUE
	registry::_DeleteValue /NOUNLOAD `${_PATH}` `${_VALUE}`
	Pop $R0
	registry::_MoveValue /NOUNLOAD `${_PATH}` `${_VALUE}-BackupBy${APP}Portable` `${_PATH}` `${_VALUE}`
	Pop $R0
!macroend
!include Registry.nsh
!endif

; --- Directories ---
!ifdef LOCALDIR1
!define directory::BackupLocal `!insertmacro directory::BackupLocal`
!macro directory::BackupLocal _LOCALDIR _SUBDIR
	RMDir "/r" "${_LOCALDIR}${_SUBDIR}-BackupBy${APP}Portable"
	Rename "${_LOCALDIR}${_SUBDIR}" "${_LOCALDIR}${_SUBDIR}-BackupBy${APP}Portable"
!macroend

!define directory::RestorePortable `!insertmacro directory::RestorePortable`
!macro directory::RestorePortable _PORTABLEDIR _DEFAULTPORTABLEDIR _LOCALDIR _SUBDIR
	IfFileExists "${_PORTABLEDIR}\*.*" +4
	IfFileExists "${_DEFAULTPORTABLEDIR}\*.*" 0 +5
	CreateDirectory "${_PORTABLEDIR}"
	CopyFiles /SILENT "${_DEFAULTPORTABLEDIR}\*.*" "${_PORTABLEDIR}"
	CreateDirectory "${_LOCALDIR}${_SUBDIR}"
	CopyFiles /SILENT "${_PORTABLEDIR}\*.*" "${_LOCALDIR}${_SUBDIR}"
!macroend

!define directory::BackupPortable `!insertmacro directory::BackupPortable`
!macro directory::BackupPortable _PORTABLEDIR _LOCALDIR _SUBDIR
	RMDir "/r" "${_PORTABLEDIR}"
	CreateDirectory "${_PORTABLEDIR}"
	CopyFiles /SILENT "${_LOCALDIR}${_SUBDIR}\*.*" "${_PORTABLEDIR}"
!macroend

!define directory::RestoreLocal `!insertmacro directory::RestoreLocal`
!macro directory::RestoreLocal _LOCALDIR _SUBDIR
	RMDir "/r" "${_LOCALDIR}${_SUBDIR}"
	Rename "${_LOCALDIR}${_SUBDIR}-BackupBy${APP}Portable" "${_LOCALDIR}${_SUBDIR}"
	RMDir "${_LOCALDIR}${_SUBDIR}"
	RMDir "${_LOCALDIR}"
!macroend
!endif

; --- Files ---
!ifdef LOCALFILE1 | LOCALSYSTEMFILE1 | PORTABLESYSTEMFILE1
!define file::BackupLocal `!insertmacro file::BackupLocal`
!macro file::BackupLocal _LOCALFILE
	Delete "${_LOCALFILE}.BackupBy${APP}Portable"
	Rename "${_LOCALFILE}" "${_LOCALFILE}.BackupBy${APP}Portable"
!macroend

!define file::RestorePortable `!insertmacro file::RestorePortable`
!macro file::RestorePortable _PORTABLEFILE _DEFAULTPORTABLEFILE _LOCALFILE
	IfFileExists "${_PORTABLEFILE}" +4
	IfFileExists "${_DEFAULTPORTABLEFILE}" 0 +4
CreateDirectory "$EXEDIR\Data" ;bug if not root
	CopyFiles /SILENT "${_DEFAULTPORTABLEFILE}" "$EXEDIR\Data"
	Rename  "${_PORTABLEFILE}" "${_LOCALFILE}"
!macroend

!define file::BackupPortable `!insertmacro file::BackupPortable`
!macro file::BackupPortable _PORTABLEFILE _LOCALFILE
CreateDirectory "$EXEDIR\Data"
	Delete "${_PORTABLEFILE}" 
	Rename "${_LOCALFILE}" "${_PORTABLEFILE}"
!macroend

!define file::RestoreLocal `!insertmacro file::RestoreLocal`
!macro file::RestoreLocal _LOCALFILE
	Delete "${_LOCALFILE}"
	Rename "${_LOCALFILE}.BackupBy${APP}Portable" "${_LOCALFILE}"
!macroend

; --- System Files ---
!define file::CopyPortable `!insertmacro file::CopyPortable`
!macro file::CopyPortable _PORTABLEFILE _LOCALFILE
	CopyFiles /SILENT "${_PORTABLEFILE}" "${_LOCALFILE}"
!macroend

!define file::CopyLocal `!insertmacro file::CopyLocal`
!macro file::CopyLocal _PORTABLEFILE _LOCALFILE
	IfFileExists "${_LOCALFILE}" +3
	WriteINIStr "$EXEDIR\Data\${APP}Portable.ini" "${APP}Portable" "${_LOCALFILE}" "false"
	CopyFiles /SILENT "${_PORTABLEFILE}" "${_LOCALFILE}"
!macroend

!define file::DelLocal `!insertmacro file::DelLocal`
!macro file::DelLocal _LOCALFILE
	ReadINIStr $0 "$EXEDIR\Data\${APP}Portable.ini" "${APP}Portable" "${_LOCALFILE}"
	StrCmp $0 "false" 0 +3
	Delete  "${_LOCALFILE}"
	DeleteINIStr "$EXEDIR\Data\${APP}Portable.ini" "${APP}Portable" "${_LOCALFILE}"
!macroend

!define file::Share `!insertmacro file::Share`
!macro file::Share _FILE
	WriteRegDWORD HKEY_LOCAL_MACHINE "SOFTWARE\Microsoft\Windows\CurrentVersion\SharedDlls" "${_FILE}" 0x1
!macroend

!define file::UnShare `!insertmacro file::UnShare`
!macro file::UnShare _FILE
	IfFileExists "${_FILE}.BackupBy${APP}Portable" +2
	DeleteRegValue HKEY_LOCAL_MACHINE "SOFTWARE\Microsoft\Windows\CurrentVersion\SharedDlls" "${_FILE}"
!macroend

!endif

; --- DLL ---
!ifdef LOCALDLL1 | PORTABLEDLL1
!define dll::UnRegLocal `!insertmacro dll::UnRegLocal`
!macro dll::UnRegLocal _LOCALDLL
	IfFileExists "${_LOCALDLL}" 0 +2
	UnRegDLL "${_LOCALDLL}"
!macroend

!define dll::RegPortable `!insertmacro dll::RegPortable`
!macro dll::RegPortable _PORTABLEDLL
	RegDLL "${_PORTABLEDLL}"
	WriteRegDWORD HKEY_LOCAL_MACHINE "SOFTWARE\Microsoft\Windows\CurrentVersion\SharedDlls" "${_PORTABLEDLL}" 0x1
!macroend

!define dll::UnRegPortable `!insertmacro dll::UnRegPortable`
!macro dll::UnRegPortable _PORTABLEDLL
	DeleteRegValue HKEY_LOCAL_MACHINE "SOFTWARE\Microsoft\Windows\CurrentVersion\SharedDlls" "${_PORTABLEDLL}"
	UnRegDLL "${_PORTABLEDLL}"
!macroend

!define dll::RegLocal `!insertmacro dll::RegLocal`
!macro dll::RegLocal _LOCALDLL
	IfFileExists "${_LOCALDLL}" 0 +2
	RegDLL "${_LOCALDLL}"
!macroend
!endif

; --- Services ---
!ifdef SRC1
!define src::DelLocal `!insertmacro src::DelLocal`
!macro src::DelLocal _SRC _LOCALSRC
	IfFileExists "${_LOCALSRC}" 0 +3
	SimpleSC::StopService "${_SRC}"
	SimpleSC::RemoveService "${_SRC}"
!macroend

!define src::CreatePortable `!insertmacro src::CreatePortable`
!macro src::CreatePortable _SRC _SRCNAME _TYPESRC _STARTSRC _PORTABLESRC
	  SimpleSC::InstallService "${_SRC}" "${_SRCNAME}" "${_TYPESRC}" "${_STARTSRC}" "${_PORTABLESRC}" "" "" ""
	  SimpleSC::StartService "${_SRC}" ""
!macroend

!define src::DelPortable `!insertmacro src::DelPortable`
!macro src::DelPortable _SRC
	SimpleSC::StopService "${_SRC}"
	SimpleSC::RemoveService "${_SRC}"
!macroend

!define src::CreateLocal `!insertmacro src::CreateLocal`
!macro src::CreateLocal _SRC _SRCNAME _TYPESRC _STARTSRC _LOCALSRC
	IfFileExists "${_LOCALSRC}" 0 +2
	  SimpleSC::InstallService "${_SRC}" "${_SRCNAME}" "${_TYPESRC}" "${_STARTSRC}" "${_LOCALSRC}" "" "" ""
!macroend
!endif

; --- VC ---
!ifdef VC1
!define vc::CopyLocal `!insertmacro vc::CopyLocal`
!macro vc::CopyLocal _VC _VCP
	IfFileExists "$WINDIR\WinSxS\${_VC}\*.*" +8
	WriteINIStr "$EXEDIR\Data\${APP}Portable.ini" "${APP}Portable" "${_VC}" "false"
	CopyFiles /SILENT "$EXEDIR\App\WinSxS\Manifests\${_VC}.manifest" "$WINDIR\WinSxS\Manifests"
	CopyFiles /SILENT "$EXEDIR\App\WinSxS\Manifests\${_VC}.cat" "$WINDIR\WinSxS\Manifests"
	CreateDirectory "$WINDIR\WinSxS\${_VC}"
	CopyFiles /SILENT "$EXEDIR\App\WinSxS\${_VC}\*.*" "$WINDIR\WinSxS\${_VC}"
	CreateDirectory "$WINDIR\WinSxS\Policies\${_VCP}"
	CopyFiles /SILENT "$EXEDIR\App\WinSxS\Policies\${_VCP}\*.*" "$WINDIR\WinSxS\Policies\${_VCP}"
!macroend

!define vc::DelLocal `!insertmacro vc::DelLocal`
!macro vc::DelLocal _VC _VCP
	ReadINIStr $0 "$EXEDIR\Data\${APP}Portable.ini" "${APP}Portable" "${_VC}"
	StrCmp $0 "false" 0 +6
	Delete "$WINDIR\WinSxS\Manifests\${_VC}.manifest"
	Delete "$WINDIR\WinSxS\Manifests\${_VC}.cat"
	RMDir "/r" "$WINDIR\WinSxS\${_VC}"
	RMDir "/r" "$WINDIR\WinSxS\Policies\${_VCP}"
	DeleteINIStr "$EXEDIR\Data\${APP}Portable.ini" "${APP}Portable" "${_VC}"
!macroend

!endif

; **************************************************************************
; === Includes ===
; **************************************************************************
!include TextFunc.nsh
!insertmacro GetParameters

; **************************************************************************
; === Runtime Switches ===
; **************************************************************************
WindowIcon Off
SilentInstall Silent
AutoCloseWindow True
RequestExecutionLevel admin

; **************************************************************************
; ===Start ===
; **************************************************************************

Function CheckDirExe
	IfFileExists "$EXEDIR\${APPDIR}\${APPEXE}" +3
	MessageBox MB_OK|MB_ICONEXCLAMATION `${APPEXE} was not found in $EXEDIR\${APPDIR}`
	Abort
FunctionEnd

Function CheckRunExe
	ReadINIStr $0 "$EXEDIR\${APP}Portable.ini" "${APP}Portable" "AllowMultipleInstances"
	StrCmp $0 "" 0 +2
	WriteINIStr "$EXEDIR\${APP}Portable.ini" "${APP}Portable" "AllowMultipleInstances" "false"
	FindProcDLL::FindProc "${APPEXE}"
		Pop $R0
		StrCmp $R0 "1" 0 CheckRunEnd
	ReadINIStr $0 "$EXEDIR\${APP}Portable.ini" "${APP}Portable" "AllowMultipleInstances"
	StrCmp $0 "true" SecondLaunch
		MessageBox MB_OK|MB_ICONINFORMATION `Another ${APPNAME} is running.$\nClose ${APPNAME} before running ${APPNAME} Portable.`
		Abort
SecondLaunch:
	SetOutPath "$EXEDIR\${APPDIR}"
	${GetParameters} $0
	Exec `"$EXEDIR\${APPDIR}\${APPEXE}"${APPSWITCH} $0`
	Abort
CheckRunEnd:
FunctionEnd

Function CheckRegWrite
!ifdef REGKEY1
ReadINIStr $0 "$EXEDIR\${APP}Portable.ini" "${APP}Portable" "CheckRegWrite"
StrCmp $0 "false" +8
WriteINIStr "$EXEDIR\${APP}Portable.ini" "${APP}Portable" "CheckRegWrite" "true"
	${registry::CreateKey} "HKEY_LOCAL_MACHINE\SOFTWARE\PortableAppRegistryTest" "$R7"
	StrCmp "$R7" "-1" "" +4
		MessageBox MB_OKCANCEL 'You are not allowed to write to the registry!!$\nContinue anyway?' IDOK +3 IDCANCEL 0
		${registry::Unload}
		Abort
	${registry::DeleteKey} "HKEY_LOCAL_MACHINE\SOFTWARE\PortableAppRegistryTest" "$R7"
!endif
FunctionEnd

Function CheckGoodExit
	ReadINIStr $0 "$EXEDIR\Data\${APP}Portable.ini" "${APP}Portable" "GoodExit"
	StrCmp $0 "false" 0 CheckExitEnd
	ReadINIStr $0 "$EXEDIR\${APP}Portable.ini" "${APP}Portable" "AllowMultipleInstances"
	StrCmp $0 "true" 0 +4
	FindProcDLL::FindProc "${APPEXE}"
		Pop $R0
		StrCmp $R0 "1" CheckExitEnd
	MessageBox MB_OKCANCEL|MB_ICONEXCLAMATION `Last exit of ${APP}Portable did'nt restore settings.$\nWould you try to restore local and backup portable settings now?` IDOK RestoreNow IDCANCEL CheckExitEnd
	RestoreNow:
	Call Restore
	CheckExitEnd:
FunctionEnd

Function CheckStart
	Call CheckDirExe
	Call CheckRegWrite
	Call CheckRunExe
	Call CheckGoodExit
FunctionEnd

; **************************************************************************
; === Before Launching ===
; **************************************************************************
Function SplashLogo
CreateDirectory "$EXEDIR\Data"
	ReadINIStr $0 "$EXEDIR\${APP}Portable.ini" "${APP}Portable" "DisableSplashScreen"
	StrCmp $0 "true" +6
	WriteINIStr "$EXEDIR\${APP}Portable.ini" "${APP}Portable" "DisableSplashScreen" "false"
	InitPluginsDir
	File /oname=$PLUGINSDIR\splash.bmp "..\_Include\Splash.bmp"
	newadvsplash::show /NOUNLOAD 1000 300 200 0xFF00FF /L $PLUGINSDIR\splash.bmp
	Pop $0
	WriteINIStr "$EXEDIR\Data\${APP}Portable.ini" "${APP}Portable" "LastDirectory" "$EXEDIR"
	WriteINIStr "$EXEDIR\Data\${APP}Portable.ini" "${APP}Portable" "GoodExit" "false"
	SetFileAttributes "$EXEDIR\Data\${APP}Portable.ini" HIDDEN
FunctionEnd
