!define MAINFOLDER	"PortableApps"

;=== Program Details
Name "${APPNAME} Portable"
OutFile "..\..\..\${DLNAME}_Portable_${DLVER}_${APPLANG}.exe"
InstallDir "\${FOLDER}"
Caption "${APPNAME} Portable"
Icon "${APP}.ico"
BrandingText "Portable App"

VIProductVersion "${APPVER}"
VIAddVersionKey ProductName "${APPNAME} Portable"
VIAddVersionKey CompanyName ""
VIAddVersionKey LegalCopyright ""
VIAddVersionKey FileDescription "${APPNAME} Portable"
VIAddVersionKey FileVersion "${APPVER}"
VIAddVersionKey ProductVersion "${APPVER}"
VIAddVersionKey InternalName "${APPNAME} Portable"
VIAddVersionKey LegalTrademarks ""
VIAddVersionKey OriginalFilename "${APP}Portable.exe"
VIAddVersionKey Comments "${__DATE__} ${__TIME__}"

;=== Runtime Switches
AutoCloseWindow True
RequestExecutionLevel user

;=== Include
!include MUI.nsh
!include FileFunc.nsh
!insertmacro GetDrives
!insertmacro GetOptions

;=== Icon & Stye ===
!define MUI_ICON "${APP}.ico"
!define MUI_WELCOMEFINISHPAGE_BITMAP "..\_Include\Installer.bmp"
!define MUI_WELCOMEPAGE_TITLE "${APPNAME} Portable"
!ifndef DESCOPTIONS
!define MUI_COMPONENTSPAGE_NODESC
!endif

;=== Pages
!ifdef INPUTBOX
	Page Custom InputBoxPageShow InputBoxPageLeave
	!define IDC_INPUTBOX 1215
!endif
!ifdef OPTIONS
	!insertmacro MUI_PAGE_COMPONENTS
!endif
!insertmacro MUI_PAGE_DIRECTORY
!define MUI_PAGE_CUSTOMFUNCTION_SHOW ShowInstFiles
!insertmacro MUI_PAGE_INSTFILES

!ifdef FINISHRUN
	!define MUI_FINISHPAGE_RUN
	!define MUI_FINISHPAGE_RUN_FUNCTION "Launch"
	!insertmacro MUI_PAGE_FINISH
!endif

Function ShowInstFiles
	w7tbp::Start
FunctionEnd

Var MAINPATH
Function .onInit
 	FindProcDLL::FindProc "${APP}Portable.exe"
	Pop $R0
	StrCmp $R0 "1" 0 +3
	MessageBox MB_USERICON "Please close all instances of ${APP}Portable.  The portable app can not be upgraded while it is running."
	Abort

!ifdef MULTILANG
	Call MultiLang
!endif

	${GetDrives} "HDD+FDD" GetDrivesCallback
	StrCpy $INSTDIR "$MAINPATH\${FOLDER}"

!ifdef OPTIONS
	Call Init
!endif

!ifdef APPSIZE
	SectionSetSize ${main} ${APPSIZE}
!endif

FunctionEnd

Function GetDrivesCallback
	StrCmp $8 "FDD" 0 +3
	StrCmp $9 "A:\" +4
	StrCmp $9 "B:\" +3
	IfFileExists "$9${MAINFOLDER}" 0 +2
	StrCpy $MAINPATH "$9${MAINFOLDER}"
	Push $0
FunctionEnd

Function Launch
	Exec '"$INSTDIR\${APP}Portable.exe"'
FunctionEnd

!ifdef DESCRIPTION
Function AppInfo
CreateDirectory "$INSTDIR\App\AppInfo"
WriteINIStr "$INSTDIR\App\AppInfo\appinfo.ini" "Format" "Type" "PortableApps.comFormat"
WriteINIStr "$INSTDIR\App\AppInfo\appinfo.ini" "Format" "Version" "3.0"
WriteINIStr "$INSTDIR\App\AppInfo\appinfo.ini" "Details" "Name" "${APPNAME} Portable"
WriteINIStr "$INSTDIR\App\AppInfo\appinfo.ini" "Details" "AppID" "${APP}Portable"
WriteINIStr "$INSTDIR\App\AppInfo\appinfo.ini" "Details" "Publisher" "${APPNAME} Developer"
WriteINIStr "$INSTDIR\App\AppInfo\appinfo.ini" "Details" "Homepage" ""
WriteINIStr "$INSTDIR\App\AppInfo\appinfo.ini" "Details" "Category" "Utilities"
WriteINIStr "$INSTDIR\App\AppInfo\appinfo.ini" "Details" "Description" "${DESCRIPTION}"
WriteINIStr "$INSTDIR\App\AppInfo\appinfo.ini" "Details" "Language" "${APPLANG}"
WriteINIStr "$INSTDIR\App\AppInfo\appinfo.ini" "License" "Shareable" "true"
WriteINIStr "$INSTDIR\App\AppInfo\appinfo.ini" "License" "OpenSource" "true"
WriteINIStr "$INSTDIR\App\AppInfo\appinfo.ini" "License" "Freeware" "true"
WriteINIStr "$INSTDIR\App\AppInfo\appinfo.ini" "License" "CommercialUse" "true"
WriteINIStr "$INSTDIR\App\AppInfo\appinfo.ini" "Version" "PackageVersion" "${APPVER}"
WriteINIStr "$INSTDIR\App\AppInfo\appinfo.ini" "Version" "DisplayVersion" "${DLVER}"
WriteINIStr "$INSTDIR\App\AppInfo\appinfo.ini" "Control" "Icons" "1"
WriteINIStr "$INSTDIR\App\AppInfo\appinfo.ini" "Control" "Start" "${APP}Portable.exe"
File "/oname=$INSTDIR\App\AppInfo\appicon.ico" ${APP}.ico
File "/oname=$INSTDIR\App\AppInfo\appicon_16.png" ${APP}_16.png
File "/oname=$INSTDIR\App\AppInfo\appicon_32.png" ${APP}_32.png
File "/oname=$INSTDIR\help.html" ${APP}.html
SetOutPath "$INSTDIR\Other\Help"
File /r "..\..\Other\_Include\Help\*.*"
FunctionEnd
!endif

!ifdef SOURCES
Function Sources
	SetOutPath "$INSTDIR\Other\_Include"
	File "..\..\Other\_Include\*.*"
	SetOutPath "$INSTDIR\Other\Source"
	File "_${APP}Portable.nsi"
	File "_${APP}PortableInstaller.nsi"
	File "${APP}.ico"
FunctionEnd
!endif

!ifdef SOURCES & DESCRIPTION
Function SourceInfo
	SetOutPath "$INSTDIR\Other\_Include\Help"
	File /r "..\..\Other\_Include\Help\*.*"
	SetOutPath "$INSTDIR\Other\Source"
	File "${APP}.html"
	File "${APP}_16.png"
	File "${APP}_32.png"
FunctionEnd
!endif
