from lastversion import latest
from getpass import getpass

#class for storing download data on individual download links
class Dwn:
    #since the urls can change with updates, this class accepts 1 or more stationary url parts
    #later when the assembleUrl() is called, the changeable url part is added between
    #the result gets saved into self.url which is by default empty
    #each download link may be slightly different with the name and executable of the program that is downloaded
    #that is why those parameters are provided in the constructor
    def __init__(self, name, description, executable, *url_parts):
        self.name = name
        if description=="":
            self.description = name
        else:
            self.description = description
        self.executable = executable
        self.url_parts = list(url_parts)
        self.url=""
    
    def assembleUrl(self, missing):
        for i in range(len(self.url_parts)):
            if i+1 == len(self.url_parts):
                self.url += self.url_parts[i]
            else:
                self.url += self.url_parts[i] + missing

#this functions displays info on a specific tool
def showInfo(tool):
    # print basic info
    print(f"Name: {tool.name}")
    if tool.command == 1: print("Download links:")
    elif tool.command == 2: print("Powershell commands:")
    elif tool.command == 3: print("Links that will open:")
    elif tool.command == 4: print("Links that will be retrieved:")
    elif tool.command == 5: print("Will be written to a new file:")
    for i in range(len(tool.dwn)): print(f"\t{tool.getDwn(i)}")
    
    #check if tool.info leads to a website, if not, print it

    print("Additional info:")
    if tool.info == "": print("\twhoopsie, we dont have any additional info on this tool :/")
    else: print(f"\t{tool.info}")
    
    getpass("\n... press ENTER to continue ...", stream=None)

#class for storing tools
class Tool:
    #name: the name of the tool, code: unique tool idetity
    #command type: 1-dl, 2-runaspowershell, 3-webopen, 4-urlretrieve, 5-fwrite
    #gotlatest: a bool that checks if self.latest is yet to be updated
    #latestfn: function to run to get data on latest version and save it to self.latest
    #info: additional information on a tool
    #dwn: list of Dwn objects that allows a tool to have multiple download links
    def __init__(self, name, code, command, gotLatest, latestfn, info, dwn):
        self.name = name
        self.code = code
        self.command = command
        
        self.gotlatest=gotLatest
        self.latestfn = latestfn
        self.latest = ""
        
        self.info = info
        self.dwn = dwn
    
    def getLatest(self):
        if not self.gotlatest:
            print("Checking for latest version...")
            self.latest = self.latestfn()
            print(f"Found it: {self.latest}")
            self.gotlatest = True

    def getDwn(self, num):
        self.getLatest()
        if num >= len(self.dwn) or num < 0:
            raise IndexError("Tool.getDwn: out of bounds!")
        if self.dwn[num].url == "": self.dwn[num].assembleUrl(self.latest)
        return self.dwn[num].url
    
    def getExec(self, num):
        if num >= len(self.dwn) or num < 0:
            raise IndexError("Tool.getDwn: out of bounds!")
        return self.dwn[num].executable
    
    def getName(self, num):
        if num >= len(self.dwn) or num < 0:
            raise IndexError("Tool.getDwn: out of bounds!")
        return self.dwn[num].name
    
    
    def getDesc(self, num):
        if num >= len(self.dwn) or num < 0:
            raise IndexError("Tool.getDwn: out of bounds!")
        return self.dwn[num].description


tools = {

    # Example:
    # code<string> : Tool(
    #     name<string>, code<string>, command<int>, gotLatest<bool>,
    #     latestfn<function>,
    #     info<raw string>,
    #     [
    #         #download link 1
    #         Dwn(
    #             dwn_name<string>, dwn_description<string>, dwn_executable<string>,
    #             dwn_url_part1<raw string>,
    #             dwn_url_part2<raw string>,
    #             ...
    #         ),
    #         #download link 2
    #         Dwn(
    #         ...
    #     ]
    # )

    "d1-1" : Tool(
        "EchoX", "d1-1", 1, True,
        lambda: "",
        r"https://github.com/UnLovedCookie/EchoX",
        [
            Dwn(
                "EchoX", "", "EchoX.bat",
                r"https://github.com/UnLovedCookie/EchoX/releases/latest/download/EchoX.bat"
            )
        ]
    ),

    "d2-1" : Tool(
        "Hone", "d2-1", 1, True,
        lambda: "",
        r"https://hone.gg/",
        [
            Dwn(
                "Hone", "", "Hone-Setup.exe",
                r"https://download.overwolf.com/install/Download?Name=Hone&ExtensionId=mgkabooemhaamambocobpeoeelpadcjhjgbcfhlc"
            )
        ]
    ),

    "d3-1" : Tool(
        "ShutUp10", "d3-1", 1, True,
        lambda: "",
        r"https://www.oo-software.com/shutup10",
        [
            Dwn(
                "ShutUp10", "", "ShutUp10.exe",
                r"https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe"
            )
        ]
    ),

    "d4-1" : Tool(
        "Optimizer", "d4-1", 1, False,
        lambda: str(latest("hellzerg/optimizer")),
        r"https://github.com/hellzerg/optimizer",
        [
            Dwn(
                "Optimizer", "", "Optimizer.exe",
                r"https://github.com/hellzerg/optimizer/releases/latest/download/Optimizer-",
                r".exe"
            )
        ]
    ),

    "d5-1" : Tool(
        "PyDebloatX", "d5-1", 1, True,
        lambda: "",
        r"https://github.com/Teraskull/PyDebloatX",
        [
            Dwn(
                "PyDebloatX", "", "PyDebloatX-Portable.exe",
                r"https://github.com/Teraskull/PyDebloatX/releases/latest/download/PyDebloatX_portable.exe"
            )
        ]
    ),

    "d6-1" : Tool(
        "QuickBoost", "d6-1", 1, True,
        lambda: "",
        r"https://github.com/SanGraphic/QuickBoost",
        [
            Dwn(
                "QuickBoost", "", "QuickBoost.exe",
                r"https://github.com/SanGraphic/QuickBoost/releases/latest/download/QuickBoost.exe"
            )
        ]
    ),

    "d7-1" : Tool(
        "Win10Debloat", "d7-1", 2, True,
        lambda: "",
        r"https://github.com/Sycnex/Windows10Debloater/",
        [
            Dwn(
                "Win10Debloat", "", "",
                r"iwr -useb https://git.io/debloat|iex"
            )
        ]
    ),

    "d8-1" : Tool(
        "WindowsSpyBlocker", "d8-1", 1, True,
        lambda: "",
        r"https://github.com/crazy-max/WindowsSpyBlocker",
        [
            Dwn(
                "WindowsSpyBlocker", "", "WindowsSpyBlocker.exe",
                r"https://github.com/crazy-max/WindowsSpyBlocker/releases/latest/download/WindowsSpyBlocker.exe"
            )
        ]
    ),

    "d9-1" : Tool(
        "PrivateZilla", "d9-1", 1, True,
        lambda: "",
        r"https://github.com/builtbybel/privatezilla",
        [
            Dwn(
                "PrivateZilla", "", "PrivateZilla.zip",
                r"https://github.com/builtbybel/privatezilla/releases/latest/download/privatezilla.zip"
            )
        ]
    ),

    "d10-1" : Tool(
        "ZusierAIO", "d10-1", 1, True,
        lambda: "",
        r"https://github.com/Zusier/Zusiers-optimization-Batch",
        [
            Dwn(
                "ZusierAIO", "", "ZusierAIO.bat",
                r"https://raw.githubusercontent.com/Zusier/Zusiers-optimization-Batch/master/Zusier%20AIO.bat"
            )
        ]
    ),

    "d11-1" : Tool(
        "CoutX", "d11-1", 1, True,
        lambda: "",
        r"https://github.com/UnLovedCookie/CoutX",
        [
            Dwn(
                "CoutX", "", "CoutX-Setup.exe.exe",
                r"https://github.com/UnLovedCookie/CoutX/releases/latest/download/CoutX-Setup.exe"
            )
        ]
    ),

    "t1-1" : Tool(
        "PostTweaks", "t1-1", 1, True,
        lambda: "",
        r"https://github.com/ArtanisInc/Post-Tweaks",
        [
            Dwn(
                "PostTweaks", "", "PostTweaks.bat",
                r"https://raw.githubusercontent.com/ArtanisInc/Post-Tweaks/main/PostTweaks.bat"
            )
        ]
    ),

    "t2-1" : Tool(
        "InsiderEnroller", "t2-1", 1, False,
        lambda: str(latest("Jathurshan-2019/Insider-Enroller")),
        r"https://github.com/Jathurshan-2019/Insider-Enroller",
        [
            Dwn(
                "InsiderEnroller", "", "InsiderEnroller.zip",
                r"https://github.com/Jathurshan-2019/Insider-Enroller/releases/latest/download/Insider_Enrollerv",
                r".zip"
            )
        ]
    ),

    "t3-1" : Tool(
        "Windows11Fixer", "t3-1", 1, False,
        lambda: str(latest("99natmar99/Windows-11-Fixer")),
        r"https://github.com/99natmar99/Windows-11-Fixer",
        [
            Dwn(
                "Windows11Fixer", "", "Windows11Fixer.zip",
                r"https://github.com/99natmar99/Windows-11-Fixer/releases/latest/download/Windows.11.Fixer.v",
                r".Portable.zip"
            )
        ]
    ),

    "t4-1" : Tool(
        "AntiRoundCorners", "t4-1", 1, True,
        lambda: "",
        r"https://github.com/valinet/Win11DisableRoundedCorners",
        [
            Dwn(
                "AntiRoundCorners", "", "AntiRoundCorners.exe",
                r"https://github.com/valinet/Win11DisableRoundedCorners/releases/latest/download/Win11DisableOrRestoreRoundedCorners.exe"
            )
        ]
    ),

    "t5-1" : Tool(
        "Fix Drag&Drop", "t5-1", 1, True,
        lambda: "",
        r"https://github.com/HerMajestyDrMona/Windows11DragAndDropToTaskbarFix",
        [
            Dwn(
                "Fix Drag&Drop", "", "FixDragAndDrop.exe",
                r"https://github.com/HerMajestyDrMona/Windows11DragAndDropToTaskbarFix/releases/latest/download/Windows11DragAndDropToTaskbarFix.exe"
            )
        ]
    ),

    "t6-1" : Tool(
        "Winaero Tweaker", "t6-1", 1, True,
        lambda: "",
        r"https://winaero.com/winaero-tweaker/",
        [
            Dwn(
                "Winaero Tweaker", "", "WinaeroTweaker.zip",
                r"https://winaerotweaker.com/download/winaerotweaker.zip"
            )
        ]
    ),

    "t7-1" : Tool(
        "CTT", "t7-1", 2, True,
        lambda: "",
        r"https://github.com/ChrisTitusTech/winutil/blob/main/winutil.ps1",
        [
            Dwn(
                "CTT", "", "",
                r"irm christitus.com/win | iex"
            )
        ]
    ),

    "t8-1" : Tool(
        "REAL", "t8-1", 1, True,
        lambda: "",
        r"https://github.com/miniant-git/REAL",
        [
            Dwn(
                "REAL", "", "REAL.exe",
                r"https://github.com/miniant-git/REAL/releases/latest/download/REAL.exe"
            )
        ]
    ),

    "t9-1" : Tool(
        "NVCleanstall", "t9-1", 1, True,
        lambda: "",
        r"",
        [
            Dwn(
                "NVCleanstall", "", "NVCleanstall.exe",
                r"https://cdn.discordapp.com/attachments/1045063596134117456/1074431416152105090/NVCleanstall_1.15.1.exe"
            )
        ]
    ),

    "t10-1" : Tool(
        "Twinker", "t10-1", 1, True,
        lambda: "",
        r"https://github.com/xemulat/twinker",
        [
            Dwn(
                "Twinker", "", "Twinker-Setup.exe",
                r"https://github.com/xemulat/twinker/releases/latest/download/Twinker-Setup.exe"
            )
        ]
    ),

    "t11-1" : Tool(
        "SophiApp", "t11-1", 1, True,
        lambda: "",
        r"https://github.com/Sophia-Community/SophiApp",
        [
            Dwn(
                "SophiApp", "", "SophiApp.zip",
                r"https://github.com/Sophia-Community/SophiApp/releases/download/1.0.94/SophiApp.zip"
            )
        ]
    ),

    "a1-1" : Tool(
        "Choco", "a1-1", 1, True,
        lambda: "",
        r"https://github.com/xemulat/XToolbox/blob/main/files/choco.bat",
        [
            Dwn(
                "Choco", "", "choco.bat",
                r"https://raw.githubusercontent.com/xemulat/Windows-Toolkit/main/files/choco.bat"
            )
        ]
    ),

    "a2-1" : Tool(
        "Brave Browser", "a2-1", 1, True,
        lambda: "",
        r"https://brave.com/",
        [
            Dwn(
                "Brave Browser", "", "Brave-Setup.exe",
                r"https://referrals.brave.com/latest/BraveBrowserSetup.exe",
                r""
            )
        ]
    ),

    "a3-1" : Tool(
        "Firefox Setup", "a3-1", 1, True,
        lambda: "",
        r"https://www.mozilla.org/firefox",
        [
            Dwn(
                "Firefox Setup", "", "Firefox-Setup.exe",
                r"https://download.mozilla.org/?product=firefox-stub&os=win&lang=en-US"
            )
        ]
    ),

    "a4-1" : Tool(
        "Lively Wallpaper", "a4-1", 1, False,
        lambda: str(latest("rocksdanister/lively")).replace(".", ""),
        r"https://github.com/rocksdanister/lively",
        [
            Dwn(
                "Lively Wallpaper", "", "LivelyWallpaper-Setup.exe",
                r"https://github.com/rocksdanister/lively/releases/latest/download/lively_setup_x86_full_v",
                r".exe"
            )
        ]
    ),

    "a5-1" : Tool(
        "LibreWolf", "a5-1", 1, True,
        lambda: "",
        r"https://librewolf.net/",
        [
            Dwn(
                "LibreWolf", "", "LibreWolf-Setup.exe",
                r"https://gitlab.com/librewolf-community/browser/windows/-/package_files/69100828/download"
            )
        ]
    ),

    "a6-1" : Tool(
        "qBittorrent EE", "a6-1", 1, False,
        lambda: str(latest("c0re100/qBittorrent-Enhanced-Edition")),
        r"https://github.com/c0re100/qBittorrent-Enhanced-Edition",
        [
            Dwn(
                "qBittorrent Enhanced Edition", "", "qBittorrent-EE-Setup.exe",
                r"https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases/latest/download/qbittorrent_enhanced_",
                r"_qt6_x64_setup.exe"
            )
        ]
    ),

    "a7-1" : Tool(
        "Rainmeter", "a7-1", 1, True,
        lambda: "",
        r"https://github.com/rainmeter/rainmeter",
        [
            Dwn(
                "Rainmeter", "", "Rainmeter-Setup.exe",
                r"https://github.com/rainmeter/rainmeter/releases/download/v4.5.17.3700/Rainmeter-4.5.17.exe"
            )
        ]
    ),

    "a8-1" : Tool(
        "7-Zip", "a8-1", 1, True,
        lambda: "",
        r"https://www.7-zip.org/",
        [
            Dwn(
                "7-Zip", "", "7Zip.exe",
                r"https://www.7-zip.org/a/7z2201-x64.exe"
            )
        ]
    ),

    "a9-1" : Tool(
        "Memory Cleaner", "a9-1", 1, True,
        lambda: "",
        r"https://www.koshyjohn.com/software/memclean/",
        [
            Dwn(
                "Memory Cleaner", "", "MemoryCleaner.exe",
                r"https://www.koshyjohn.com/software/MemClean.exe"
            )
        ]
    ),

    "a10-1" : Tool(
        "Compact Memory Cleaner", "a10-1", 1, True,
        lambda: "",
        r"https://github.com/qualcosa/Compact-RAM-Cleaner",
        [
            Dwn(
                "Compact Memory Cleaner", "", "CompactMemoryCleaner.exe",
                r"https://github.com/qualcosa/Compact-RAM-Cleaner/releases/latest/download/Compact.RAM.Cleaner.exe"
            )
        ]
    ),
    
    "a11-1" : Tool(
        "PowerToys", "a11-1", 1, False,
        lambda: str(latest("microsoft/PowerToys")),
        r"https://github.com/microsoft/PowerToys",
        [
            Dwn(
                "Microsoft Power Toys", "", "PowerToys-Setup.exe",
                r"https://github.com/microsoft/PowerToys/releases/download/v",
                r"/PowerToysSetup-",
                r"-x64.exe"
            )
        ]
    ),

    "c1-1" : Tool(
        "ADW Cleaner", "c1-1", 1, True,
        lambda: "",
        r"https://www.malwarebytes.com/adwcleaner",
        [
            Dwn(
                "ADW Cleaner", "", "ADW-Cleaner.exe",
                r"https://adwcleaner.malwarebytes.com/adwcleaner?channel=release"
            )
        ]
    ),

    "c2-1" : Tool(
        "ATF Cleaner", "c2-1", 1, True,
        lambda: "",
        r"https://www.majorgeeks.com/files/details/atf_cleaner.html",
        [
            Dwn(
                "ATF Cleaner", "", "ATF-Cleaner.exe",
                r"https://files1.majorgeeks.com/10afebdbffcd4742c81a3cb0f6ce4092156b4375/drives/ATF-Cleaner.exe"
            )
        ]
    ),

    "c3-1" : Tool(
        "Defraggler", "c3-1", 1, True,
        lambda: "",
        r"https://www.ccleaner.com/defraggler",
        [
            Dwn(
                "Defraggler", "", "Defraggler-Setup.exe",
                r"https://download.ccleaner.com/dfsetup222.exe"
            )
        ]
    ),

    "c4-1" : Tool(
        "Malwarebytes", "c4-1", 1, True,
        lambda: "",
        r"https://www.malwarebytes.com/",
        [
            Dwn(
                "Malwarebytes", "", "Malwarebytes.exe",
                r"https://www.malwarebytes.com/api/downloads/mb-windows?filename=MBSetup.exe"
            )
        ]
    ),

    "c5-1" : Tool(
        "Emsisoft Emergency Kit", "c5-1", 1, True,
        lambda: "",
        r"https://www.emsisoft.com/en/emergency-kit/",
        [
            Dwn(
                "Emsisoft Emergency Kit", "", "EmsisoftEmergencyKit.exe",
                r"https://dl.emsisoft.com/EmsisoftEmergencyKit.exe"
            )
        ]
    ),

    "c8-1" : Tool(
        "CleanmgrPlus", "c8-1", 1, True,
        lambda: "",
        r"https://github.com/builtbybel/CleanmgrPlus",
        [
            Dwn(
                "CleanmgrPlus", "", "CleanmgrPlus.zip",
                r"https://github.com/builtbybel/CleanmgrPlus/releases/latest/download/cleanmgrplus.zip"
            )
        ]
    ),

    "c9-1" : Tool(
        "Glary Utilities", "c9-1", 1, True,
        lambda: "",
        r"https://www.glarysoft.com/",
        [
            Dwn(
                "Glary Utilities", "", "GlaryUtilities.exe",
                r"https://download.glarysoft.com/gu5setup.exe"
            )
        ]
    ),

    "1-QT" : Tool(
        "AntiTrackTime", "1-QT", 1, True,
        lambda: "",
        r"https://github.com/xemulat/XToolbox/tree/main/files",
        [
            Dwn(
                "AntiTrackTime", "", "AntiTrackTime.bat",
                r"https://raw.githubusercontent.com/xemulat/Windows-Toolkit/main/files/AntiTrackTime.bat"
            )
        ]
    ),

    "2-QT-1" : Tool(
        "NoNetworkAuto-Tune", "2-QT-1", 4, True,
        lambda: "",
        r"https://github.com/xemulat/XToolbox/tree/main/files",
        [
            Dwn(
                "NoNetworkAutotune", "", "NoNetworkAutotuneREVERT.bat",
                r"https://raw.githubusercontent.com/xemulat/Windows-Toolkit/main/files/Enable%20Window%20Network%20Auto-Tuning.bat"
            )
        ]
    ),
    "2-QT-2" : Tool(
        "NoNetworkAuto-Tune", "2-QT-1", 1, True,
        lambda: "",
        r"https://github.com/xemulat/XToolbox/tree/main/files",
        [
            Dwn(
                "NoNetworkAutoTune", "", "NoNetworkAutoTune.bat",
                r"https://raw.githubusercontent.com/xemulat/Windows-Toolkit/main/files/Disable%20Window%20Network%20Auto-Tuning.bat"
            )
        ]
    ),

    "3-QT" : Tool(
        "OptimizeSSD", "3-QT", 1, True,
        lambda: "",
        r"https://github.com/tcja/Windows-10-tweaks",
        [
            Dwn(
                "OptimizeSSD", "", "OptimizeSSD.reg",
                r"https://raw.githubusercontent.com/tcja/Windows-10-tweaks/master/SSD_Optimizations.reg"
            )
        ]
    ),

    "4-QT" : Tool(
        "NoActionCenter", "4-QT", 1, True,
        lambda: "",
        r"https://github.com/tcja/Windows-10-tweaks",
        [
            Dwn(
                "NoActionCenter", "", "NoActionCenter.reg",
                r"https://raw.githubusercontent.com/tcja/Windows-10-tweaks/master/Disable_Action_Center.reg"
            )
        ]
    ),

    "5-QT" : Tool(
        "NoNews", "5-QT", 1, True,
        lambda: "",
        r"https://github.com/tcja/Windows-10-tweaks",
        [
            Dwn(
                "NoNews", "", "NoNews.reg",
                r"https://raw.githubusercontent.com/tcja/Windows-10-tweaks/master/Disable_News_and_Interests_on_taskbar_feature_for_all_users.reg"
            )
        ]
    ),

    "6-QT" : Tool(
        "NoOneDrive", "6-QT", 1, True,
        lambda: "",
        r"https://github.com/tcja/Windows-10-tweaks",
        [
            Dwn(
                "NoOneDrive", "", "NoOneDrive.bat",
                r"https://raw.githubusercontent.com/tcja/Windows-10-tweaks/master/OneDrive_Uninstaller_v1.2.bat"
            )
        ]
    ),

    "7-QT" : Tool(
        "NoXboxBloat", "7-QT", 1, True,
        lambda: "",
        r"https://github.com/tcja/Windows-10-tweaks",
        [
            Dwn(
                "NoXboxBloat", "", "NoXboxBloat.bat",
                r"https://raw.githubusercontent.com/tcja/Windows-10-tweaks/master/RemoveXboxAppsBloat.bat"
            )
        ]
    ),

    "8-QT" : Tool(
        "LimitQoS", "8-QT", 1, True,
        lambda: "",
        r"https://github.com/tcja/Windows-10-tweaks",
        [
            Dwn(
                "LimitQoS", "", "LimitQos.reg",
                r"https://raw.githubusercontent.com/tcja/Windows-10-tweaks/master/QoS_Limiter.reg"
            )
        ]
    ),

    "9-QT" : Tool(
        "Xander Tweak", "9-QT", 1, True,
        lambda: "",
        r"https://github.com/tcja/Windows-10-tweaks",
        [
            Dwn(
                "Xander Tweak", "", "XanderTweak.reg",
                r"https://raw.githubusercontent.com/tcja/Windows-10-tweaks/master/other_scripts/XanderBaatzTweaks.reg"
            )
        ]
    ),
    
    "10-QT" : Tool(
        "AddCopyPath", "10-QT", 1, True,
        lambda: "",
        r"https://github.com/tcja/Windows-10-tweaks",
        [
            Dwn(
                "AddCopyPath", "", "AddCopyPath.reg",
                r"https://raw.githubusercontent.com/tcja/Windows-10-tweaks/master/Add_Copy_path_to_context_menu.reg"
            )
        ]
    ),

    "11-QT" : Tool(
        "DarkMode", "11-QT", 1, True,
        lambda: "",
        r"https://github.com/tcja/Windows-10-tweaks",
        [
            Dwn(
                "DarkMode", "", "DarkModeON.reg",
                r"https://raw.githubusercontent.com/tcja/Windows-10-tweaks/master/darkmodetoggle/darkmodeON.reg"
            )
        ]
    ),

    "12-QT" : Tool(
        "AddTakeOwnership", "12-QT", 1, True,
        lambda: "",
        r"https://github.com/couleurm/couleurstoolbox/tree/main/3%20Windows%20Tweaks/0%20Quality%20of%20life%20tweaks/Take%20Ownership%20in%20context%20menu",
        [
            Dwn(
                "AddTakeOwnership", "", "AddTakeOwnership.reg",
                r"https://raw.githubusercontent.com/couleurm/couleurstoolbox/main/3%20Windows%20Tweaks/0%20Quality%20of%20life%20tweaks/Take%20Ownership%20in%20context%20menu/Add%20Take%20Ownership.reg"
            )
        ]
    ),

    "1-ESET" : Tool(
        "ESET Smart Security Premium", "1-ESET", 1, True,
        lambda: "",
        r"https://www.eset.com/us/home/smart-security-premium/",
        [
            Dwn(
                "ESET Smart Security Premium", "", "ESETSmartSecurity.exe",
                r"https://proxy.eset.com/li-handler/?transaction_id=odcm_download|esetgwsprod|us|oks9ghjy5s2i61au5rnrfg0r1ykid0rnhqtbtnqroh93wfb7038207oeqw049nznldnid&branch=us&prod=essp"
            )
        ]
    ),

    "2-ESET" : Tool(
        "ESET Internet Security", "2-ESET", 1, True,
        lambda: "",
        r"https://www.eset.com/int/home/internet-security/",
        [
            Dwn(
                "ESET Internet Security", "", "ESETInternetSecurity.exe",
                r"https://proxy.eset.com/li-handler/?transaction_id=odcm_download|esetgwsprod|us|oksm3adws43jeih7v7q1yzoind790asam1cuq0unxeww9d63ebma9syry3brmbass36id&branch=us&prod=eis"
            )
        ]
    ),

    "3-ESET" : Tool(
        "ESET NOD32 Antivirus", "3-ESET", 1, True,
        lambda: "",
        r"https://www.eset.com/int/home/antivirus/",
        [
            Dwn(
                "ESET NOD32 Antivirus", "", "ESETNOD32.exe",
                r"https://proxy.eset.com/li-handler/?transaction_id=odcm_download|esetgwsprod|us|oksrvu6kmvzgtlav8e9m5ptig5lrtrx88hbdf3n6wqs2j3i3sniyl9slhlibh6t2vf7id&branch=us&prod=eav",
            )
        ]
    ),

    "4-ESET" : Tool(
        "ESET NOD32 Antivirus Gamer Edition", "4-ESET", 1, True,
        lambda: "",
        r"https://www.eset.com/us/home/gamer/",
        [
            Dwn(
                "ESET NOD32 Antivirus Gamer Edition", "", "ESETNOD32Gamer.exe",
                r"https://proxy.eset.com/li-handler/?transaction_id=odcm_download|esetgwsprod|us|okseuzentzl4e6u8vrufel57sww7unp7uwgtyg0na2e4o2bxmq4r8fds6qmfjz6fj6zid&branch=us&prod=eav"
            )
        ]
    ),

    "5-ESET" : Tool(
        "ESET Security for Small Office", "5-ESET", 1, True,
        lambda: "",
        r"https://www.eset.com/int/business/security-packs/download-small-business-security-pack/",
        [
            Dwn(
                "ESET Security for Small Office", "", "ESETForSmallOffice.exe", 
                r"https://proxy.eset.com/li-handler/?transaction_id=odcm_download|esetgwsprod|us|okszgg8un2iekhydiszxmhrdmvxdo8aupvot9y3d5ifkm9rzslti7t5r2xitfxrefj4id&branch=us&prod=essp"
            )
        ]
    ),

    "6-ESET" : Tool(
        "ESET Online Scanner", "6-ESET", 1, True,
        lambda: "",
        r"https://www.eset.com/int/home/online-scanner/",
        [
            Dwn(
                "ESET Online Scanner", "", "ESETOnlineScanner.exe",
                r"https://download.eset.com/com/eset/tools/online_scanner/latest/esetonlinescanner.exe"
            )
        ]
    ),

    "1-KAS" : Tool(
        "Kaspersky Internet Security", "1-KAS", 1, True,
        lambda: "",
        r"https://www.kaspersky.com/downloads/internet-security",
        [
            Dwn(
                "Kaspersky Internet Security", "", "KasperskyInternetSecurity.exe",
                r"https://pdc2.fra5.pdc.kaspersky.com/DownloadManagers/53/53327722-0bb0-4ffd-9cf8-905ff29a8569/kis21.3.10.391en_26095.exe"
            )
        ]
    ),

    "2-KAS" : Tool(
        "Kaspersky Anti-Virus", "2-KAS", 1, True,
        lambda: "",
        r"https://www.kaspersky.com/downloads/antivirus",
        [
            Dwn(
                "Kaspersky Anti-Virus", "", "KasperskyAnti-Virus.exe",
                r"https://pdc5.pa2.pdc.kaspersky.com/DownloadManagers/da/da25e9e1-1d42-4fe8-ba86-ed9bc5f20560/kav21.3.10.391en_26074.exe"
            )
        ]
    ),

    "3-KAS" : Tool(
        "Kaspersky Total Security", "3-KAS", 1, True,
        lambda: "",
        r"https://www.kaspersky.com/downloads/total-security",
        [
            Dwn(
                "Kaspersky Total Security", "", "KasperskyTotalSecurity.exe",
                r"https://pdc5.pa2.pdc.kaspersky.com/DownloadManagers/85/85d5534f-3c7b-483f-8ced-da04793e8045/kts21.3.10.391en_26098.exe"
            )
        ]
    ),

    "l1-2" : Tool(
        "Linux Mint 21", "l1-2", 1, True,
        lambda: "",
        r"https://linuxmint.com/",
        [
            Dwn(
                "Linux Mint Cinnamon", "Cinnamon", "LinuxMint-21.2-Cinnamon.iso",
                r"https://mirror.rackspace.com/linuxmint/iso/stable/21.2/linuxmint-21.2-cinnamon-64bit.iso"
            ),
            Dwn(
                "Linux Mint MATE", "MATE", "LinuxMint-21.2-MATE.iso",
                r"https://mirror.rackspace.com/linuxmint/iso/stable/21.2/linuxmint-21.2-mate-64bit.iso"
            ),
            Dwn(
                "Linux Mint Xfce", "Xfce", "LinuxMint-21.2-Xfce.iso",
                r"https://mirror.rackspace.com/linuxmint/iso/stable/21.2/linuxmint-21.2-xfce-64bit.iso"
            )
        ]
    ),

    "l2-2" : Tool(
        "Pop!_OS - 34", "l2-2", 1, True,
        lambda: "",
        r"https://pop.system76.com/",
        [
            Dwn(
                "Pop!_OS Nvidia", "Nvidia", "PopOS-Nvidia.iso",
                r"https://iso.pop-os.org/22.04/amd64/nvidia/34/pop-os_22.04_amd64_nvidia_34.iso"
            ),
            Dwn(
                "Pop!_OS RPI 4 Tech Preview", "RPI4", "PopOS-RPI4.img.xz",
                r"https://iso.pop-os.org/22.04/arm64/raspi/4/pop-os_22.04_arm64_raspi_4.img.xz"
            ),
            Dwn(
                "Pop!_OS LTS", "LTS", "PopOS-LTS.iso",
                r"https://iso.pop-os.org/22.04/amd64/intel/34/pop-os_22.04_amd64_intel_34.iso"
            )
        ]
    ),

    "l3-2" : Tool(
        "Ubuntu 23.04", "l3-2", 1, True,
        lambda: "",
        r"https://ubuntu.com/",
        [
            Dwn(
                "Ubuntu", "", "Ubuntu.iso",
                r"https://releases.ubuntu.com/23.04/ubuntu-23.04-desktop-amd64.iso"
            ),
            Dwn(
                "Kubuntu", "", "Kubuntu.iso",
                r"https://cdimage.ubuntu.com/kubuntu/releases/23.04/release/kubuntu-23.04-desktop-amd64.iso"
            ),
            Dwn(
                "Lubuntu", "", "Lubuntu.iso",
                r"https://cdimage.ubuntu.com/lubuntu/releases/23.04/release/lubuntu-23.04-desktop-amd64.iso"
            )
        ]
    ),

    "l4-2" : Tool(
        "Arch Linux", "l4-2", 1, True,
        lambda: "",
        r"https://archlinux.org/",
        [
            Dwn(
                "Arch-23.09.iso", "Latest", "Arch 23.09",
                r"https://geo.mirror.pkgbuild.com/iso/2023.09.01/archlinux-2023.09.01-x86_64.iso"
            ),
            Dwn(
                "Arch Old", "Bootstrap", "Arch-Old.iso",
                r"https://geo.mirror.pkgbuild.com/iso/2023.09.01/archlinux-x86_64.iso"
            )
        ]
    ),

    "l5-2" : Tool(
        "Atrix Linux OpenRC", "l5-2", 1, True,
        lambda: "",
        r"https://artixlinux.org/",
        [
            Dwn(
                "Artix Plasma", "Plasma", "Artix-Plasma.iso",
                r"https://mirrors.dotsrc.org/artix-linux/iso/artix-plasma-openrc-20230814-x86_64.iso"
            ),
            Dwn(
                "Atrix Xfce", "Xfce", "Artix-Xfce.iso",
                r"https://mirrors.dotsrc.org/artix-linux/iso/artix-xfce-openrc-20230814-x86_64.iso"
            ),
            Dwn(
                "Artix MATE", "MATE", "Artix-MATE.iso",
                r"https://mirrors.dotsrc.org/artix-linux/iso/artix-mate-openrc-20230814-x86_64.iso"
            )
        ]
    ),

    "l6-2" : Tool(
        "Solus - 4.3", "l6-2", 1, True,
        lambda: "",
        r"https://getsol.us/",
        [
            Dwn(
                "Solus Budgie", "Budgie", "Solus-Budgie.iso",
                r"https://downloads.getsol.us/isos/4.4/Solus-4.4-Budgie.iso"
            ),
            Dwn(
                "Solus Plasma", "Plasma", "Solus-Plasma.iso",
                r"https://downloads.getsol.us/isos/4.4/Solus-4.4-Plasma.iso"
            ),
            Dwn(
                "Solus GNOME", "GNOME", "Solus-GNOME.iso",
                r"https://downloads.getsol.us/isos/4.4/Solus-4.4-GNOME.iso"
            )
        ]
    ),

    "l7-2" : Tool(
        "Debian - 11.5.0", "l7-2", 1, True,
        lambda: "",
        r"https://www.debian.org/",
        [
            Dwn(
                "Debian NetInstall", "NetInst", "Debian-NetInst.iso",
                r"https://saimei.ftp.acc.umu.se/debian-cd/current/amd64/iso-cd/debian-12.1.0-amd64-netinst.iso"
            )
        ]
    ),

    "l8-2" : Tool(
        "Garuda Linux", "l8-2", 1, True,
        lambda: "",
        r"https://garudalinux.org/",
        [
            Dwn(
                "Garuda DR460NIZED Gaming", "DR460NIZED", "Garuda-DR460NIZED.iso",
                r"https://iso.builds.garudalinux.org/iso/latest/garuda/dr460nized-gaming/latest.iso?fosshost=1"
            ),
            Dwn(
                "Garuda GNOME", "GNOME", "Garuda-GNOME.iso",
                r"https://iso.builds.garudalinux.org/iso/latest/garuda/gnome/latest.iso?fosshost=1"
            ),
            Dwn(
                "Garuda Xfce", "Xfce", "Garuda-Xfce.iso",
                r"https://iso.builds.garudalinux.org/iso/latest/garuda/xfce/latest.iso?fosshost=1"
            )
        ]
    ),

    "l9-2" : Tool(
        "Zorin OS - 16.3", "l9-2", 1, True,
        lambda: "",
        r"https://zorin.com/os/",
        [
            Dwn(
                "Zorin OS Core", "Core", "ZorinOS-Core.iso",
                r"https://ftp.icm.edu.pl/pub/linux/zorinos/16/Zorin-OS-16.3-Core-64-bit.iso"
            ),
            Dwn(
                "Zorin OS Lite", "Lite", "ZorinOS-Lite.iso",
                r"https://ftp.icm.edu.pl/pub/linux/zorinos/16/Zorin-OS-16.3-Lite-64-bit.iso"
            )
        ]
    ),

    "l10-2" : Tool(
        "CachyOS - 230917", "l10-2", 1, True,
        lambda: "",
        r"https://cachyos.org/",
        [
            Dwn(
                "CachyOS KDE", "KDE Plasma", "CachyOS-KDE.iso",
                r"https://mirror.cachyos.org/ISO/kde/230917/cachyos-kde-linux-230917.iso"
            ),
            Dwn(
                "CachyOS GNOME", "GNOME", "CachyOS-GNOME.iso",
                r"https://mirror.cachyos.org/ISO/gnome/230917/cachyos-gnome-linux-230917.iso"
            ),
            # Dwn(
            #     "CachyOS Xfce", "Xfce", "CachyOS-Xfce.iso",
            #     r"Under Construction"
            # )
        ]
    ),

    "w1-2" : Tool(
        "Windows 11", "w1-2", 3, True,
        lambda: "",
        r"Running the command opens the website",
        [
            Dwn(
                "Windows 11", "", "",
                r"https://www.microsoft.com/software-download/windows11"
            )
        ]
    ),

    "w2-2" : Tool(
        "Windows 10", "w2-2", 3, True,
        lambda: "",
        r"Running the command opens the website",
        [
            Dwn(
                "Windows 10", "", "",
                r"https://www.microsoft.com/software-download/windows10"
            )
        ]
    ),

    "w3-2" : Tool(
        "Windows 8.1", "w3-2", 1, True,
        lambda: "",
        r"Just google this one lol",
        [
            Dwn(
                "Windows 8.1", "", "Windows-8.1.iso",
                r"https://dl.malwarewatch.org/windows/Windows%208.1%20%28x64%29.iso"
            )
        ]
    ),

    "w4-2" : Tool(
        "Windows 8", "w4-2", 1, True,
        lambda: "",
        r"Just google this one lol",
        [
            Dwn(
                "Windows 8", "", "Windows-8.iso",
                r"https://dl.malwarewatch.org/windows/Windows%208%20%28x64%29.iso"
            )
        ]
    ),

    "w5-2" : Tool(
        "Windows 7", "w5-2", 1, True,
        lambda: "",
        r"Just google this one lol",
        [
            Dwn(
                "Windows 7", "", "Windows-7.iso",
                r"https://dl.malwarewatch.org/windows/Windows%207%20%28x64%29.iso"
            )
        ]
    ),

    "o1-2" : Tool(
        ".NET 4.8 SDK", "o1-2", 1, True,
        lambda: "",
        r"https://dotnet.microsoft.com/en-us/download/dotnet-framework/net48",
        [
            Dwn(
                ".NET 4.8 SDK", "", ".NET-4.8-SDK.exe",
                r"https://download.visualstudio.microsoft.com/download/pr/6f083c7e-bd40-44d4-9e3f-ffba71ec8b09/d05099507287c103a91bb68994498bde/ndp481-web.exe"
            )
        ]
    ),

    "o2-2" : Tool(
        "DirectX AIO", "o2-2", 1, True,
        lambda: "",
        r"https://www.microsoft.com/en-us/download/details.aspx?id=35",
        [
            Dwn(
                "DirectX AIO", "", "DirectX-AIO.exe",
                r"https://download.microsoft.com/download/1/7/1/1718CCC4-6315-4D8E-9543-8E28A4E18C4C/dxwebsetup.exe"
            )
        ]
    ),

    "o3-2" : Tool(
        "VisualCppRedist", "o3-2", 1, True,
        lambda: "",
        r"https://github.com/abbodi1406/vcredist",
        [
            Dwn(
                "VisualCppRedist", "", "VisualCppRedist.zip",
                r"https://github.com/abbodi1406/vcredist/releases/download/v0.66.0/VisualCppRedist_AIO_x86_x64_66.zip"
            )
        ]
    ),

    "o4-2" : Tool(
        "XNAF", "o4-2", 1, True,
        lambda: "",
        r"https://www.microsoft.com/en-us/download/details.aspx?id=20914",
        [
            Dwn(
                "XNAF", "", "XNAF-Setup.msi",
                r"https://download.microsoft.com/download/A/C/2/AC2C903B-E6E8-42C2-9FD7-BEBAC362A930/xnafx40_redist.msi"
            )
        ]
    ),

    "o5-2" : Tool(
        "Python", "o5-2", 1, True,
        lambda: "",
        r"https://www.python.org",
        [
            Dwn(
                "Python", "", "Python-Setup.exe",
                r"https://www.python.org/ftp/python/3.11.2/python-3.11.2-amd64.exe"
            )
        ]
    ),

    "m1-2" : Tool(
        "Rectify11 v2", "m1-2", 1, True,
        lambda: "",
        r"https://archive.org/details/rectify-11-v-2/",
        [
            Dwn(
                "Rectify11 v2", "", "Rectify11.iso",
                r"https://archive.org/download/rectify-11-v-2/Rectify11%20%28v2%29.iso"
            )
        ]
    ),

    "m2-2" : Tool(
        "AtlasOS", "m2-2", 1, True,
        lambda: "",
        r"https://github.com/Atlas-OS/",
        [
            Dwn(
                "AtlasOS 21H2", "21H2 + Faceit", "AtlasOS-21H2.iso",
                r"https://github.com/Atlas-OS/atlas-releases/releases/download/20H2-v0.5.2/Atlas_v0.5.2_21H2.iso"
            ),
            Dwn(
                "AtlasOS 20H2", "20H2 + Better than Old", "AtlasOS-20H2.iso",
                r"https://github.com/Atlas-OS/atlas-releases/releases/download/20H2-v0.5.2/Atlas_v0.5.2.iso"
            ),
            Dwn(
                "AtlasOS 1803", "1803 + Old version", "AtlasOS-1803.iso",
                r"https://github.com/Atlas-OS/atlas-releases/releases/download/1803/Atlas_1803_v0.2.iso"
            ),
        ]
    ),

    "m3-2" : Tool(
        "Ghost Spectre", "m3-2", 3, True,
        lambda: "",
        r"We dont have a dedicated info site on this, do a google search",
        [
            Dwn(
                "Ghost Spectre", "", "",
                r"https://www.mediafire.com/file/2z30tuoy3ojsp3h/WIN10.PRO.20H2.SUPERLITE%2BCOMPACT.U3.X64.GHOSTSPECTRE.%28W%29.iso"
            )
        ]
    ),

    "m4-2" : Tool(
        "ReviOS", "m4-2", 1, True,
        lambda: "",
        r"https://revi.cc/",
        [
            Dwn(
                "ReviOS 11", "", "ReviOS-11.iso",
                r"https://pixeldrain.com/api/file/DAatLgjZ?download"
            ),
            Dwn(
                "ReviOS 10", "", "ReviOS-10.iso",
                r"https://pixeldrain.com/api/file/hyVCKphd?download"
            )
        ]
    ),

    "m5-2" : Tool(
        "GGOS 0.8.20", "m5-2", 1, True,
        lambda: "",
        r"We dont have a dedicated info site on this, do a google search",
        [
            Dwn(
                "GGOS 0.8.20", "", "GGOS.iso",
                r"https://archive.org/download/ggos-0.8.20/ggos-0.8.20.iso"
            )
        ]
    ),

    "m6-2" : Tool(
        "Simplify Windows", "m6-2", 1, True,
        lambda: "",
        r"https://github.com/WhatTheBlock/WindowsSimplify",
        [
            Dwn(
                "WindowsSimplify-1.66GB", "1.66GB - Extreme Lite with Store", "WindowsStimplfy-1.iso", 
                r"https://github.com/WhatTheBlock/WindowsSimplify/releases/download/iso/22621.525_221014.iso"
            ),
            Dwn(
                "WindowsSimplify-1.73GB", "1.73GB - No Windows Update", "WindowsSimplify-2.iso",
                r"https://github.com/WhatTheBlock/WindowsSimplify/releases/download/iso/22623.746_221018.iso"
            ),
            Dwn(
                "WindowsSimplify-1.83GB", "1.83GB - Max Debloat", "WindowsStimplfy-3.iso",
                r"https://archive.org/download/simplify-windows-v2/22621.317_220811-2.iso"
            )
        ]
    ),

    "m7-2" : Tool(
        "Aero10", "m7-2", 1, True,
        lambda: "",
        r"https://archive.org/details/Aero10ENX64",
        [
            Dwn(
                "Aero10", "", "Aero10.iso",
                r"https://dl.malwarewatch.org/windows/mods/Aero%2010%20%28x64%29.iso"
            )
        ]
    ),

    "m8-2" : Tool(
        "Tiny10", "m8-2", 1, True,
        lambda: "",
        r"https://archive.org/details/tiny-10-NTDEV",
        [
            Dwn(
                "Tiny10", "", "Tiny10.iso",
                r"https://dl.malwarewatch.org/windows/mods/Tiny%2010.iso"
            )
        ]
    ),

    "m9-2" : Tool(
        "KernelOS", "m9-2", 1, True,
        lambda: "",
        r"We dont have a dedicated info site on this, do a google search",
        [
            Dwn(
                "KernelOS", "", "KernelOS.iso",
                r"https://archive.org/download/kernel-os-22-h-2-beta/KernelOS%2022H2%20BETA.iso"
            )
        ]
    ),

    "m10-2" : Tool(
        "Windows 7 Super Nano", "m10-2", 1, True,
        lambda: "",
        r"https://archive.org/details/windows-7x-86-supernano-final",
        [
            Dwn(
                "Windows 7 Super Nano", "", "Windows-7-SuperNano.iso",
                r"https://dl.malwarewatch.org/windows/Windows%207%20%28SuperNano%29.iso"
            )
        ]
    ),

    "m11-2" : Tool(
        "Windows 11 Debloated", "m11-2", 1, True,
        lambda: "",
        r"https://archive.org/details/windows-11-debloated",
        [
            Dwn(
                "Windows 11 Debloated", "", "Windows-11-Debloated.iso",
                r"https://archive.org/download/windows-11-debloated/Windows%2011%20Debloated.iso"
            )
        ]
    ),

    "t1-2" : Tool(
        "Rufus", "t1-2", 1, False,
        lambda: str(latest("pbatard/rufus")),
        r"https://github.com/pbatard/rufus",
        [
            Dwn(
                "Rufus", "", "Rufus.exe",
                r"https://github.com/pbatard/rufus/releases/latest/download/rufus-",
                r".exe"
            )
        ]
    ),

    "t2-2" : Tool(
        "Balena Etcher", "t2-2", 1, False,
        lambda: str(latest("balena-io/etcher")),
        r"https://github.com/balena-io/etcher",
        [
            Dwn(
                "Balena Etcher", "", "Etcher-Portable.exe",
                r"https://github.com/balena-io/etcher/releases/latest/download/balenaEtcher-Portable-",
                r".exe"
            )
        ]
    ),

    "t3-2" : Tool(
        "UNetBootin", "t3-2", 1, False,
        lambda: str(latest("unetbootin/unetbootin")),
        r"https://github.com/unetbootin/unetbootin",
        [
            Dwn(
                "UNetBootin", "", "UNetBootin.exe",
                r"https://github.com/unetbootin/unetbootin/releases/latest/download/unetbootin-windows-",
                r".exe"
            )
        ]
    ),

    "t4-2" : Tool(
        "HeiDoc Iso Downloader", "t4-2", 1, True,
        lambda: "",
        r"https://www.heidoc.net/joomla/technology-science/microsoft/67-microsoft-windows-and-office-iso-download-tool",
        [
            Dwn(
                "HeiDoc Iso Downloader", "", "HeiDoc-ISO-Downloader.exe",
                r"https://www.heidoc.net/php/Windows-ISO-Downloader.exe"
            )
        ]
    ),

    "a1-2" : Tool(
        "KeePassXC", "a1-2", 1, False,
        lambda: str(latest('keepassxreboot/keepassxc')),
        r"https://github.com/keepassxreboot/keepassxc",
        [
            Dwn(
                "KeePassXC", "", "KeePassXC-Setup.msi",
                r"https://github.com/keepassxreboot/keepassxc/releases/latest/download/KeePassXC-",
                r"-Win64.msi"
            )
        ]
    ),

    "a2-2" : Tool(
        "PowerToys", "a2-2", 1, False,
        lambda: (str(latest('microsoft/PowerToys'))).replace("v", ""),
        r"https://github.com/microsoft/PowerToys",
        [
            Dwn(
                "PowerToys", "", "PowerToys-Setup.exe",
                r"https://github.com/microsoft/PowerToys/releases/latest/download/PowerToysSetup-",
                r"-x64.exe"
            )
        ]
    ),

    "a3-2" : Tool(
        "Alacritty", "a3-2", 1, False,
        lambda: str(latest('alacritty/alacritty')),
        r"https://github.com/alacritty/alacritty",
        [
            Dwn(
                "Alacritty", "", "Alacritty-Setup.exe",
                r"https://github.com/alacritty/alacritty/releases/latest/download/Alacritty-",
                r"-installer.msi"
            )
        ]
    ),

    "a4-2" : Tool(
        "PowerShell", "a4-2", 1, False,
        lambda: (str(latest('PowerShell/PowerShell'))).replace("v", ""),
        r"https://github.com/PowerShell/PowerShell",
        [
            Dwn(
                "PowerShell", "", "PowerShell-Setup.msi",
                r"https://github.com/PowerShell/PowerShell/releases/latest/download/PowerShell-",
                r"-win-x64.msi"
            )
        ]
    ),

    "a5-2" : Tool(
        "Motrix", "a5-2", 1, False,
        lambda: (str(latest('agalwood/Motrix'))).replace("v", ""),
        r"https://github.com/agalwood/Motrix",
        [
            Dwn(
                "Motrix", "", "Motrix-Setup.exe",
                r"https://github.com/agalwood/Motrix/releases/latest/download/Motrix-Setup-",
                r".exe"
            )
        ]
    ),

    "a6-2" : Tool(
        "Files", "a6-2", 1, False,
        lambda: "",
        r"https://files.community/",
        [
            Dwn(
                "Files", "", "Files.appinstaller",
                r"https://files.community/appinstallers/Files.preview.appinstaller"
            )
        ]
    ),

    "l1-3" : Tool(
        "Minecraft Launcher", "l1-3", 1, True,
        lambda: "",
        r"https://www.minecraft.net",
        [
            Dwn(
                "Minecraft Launcher", "", "MinecraftInstaller.exe",
                r"https://launcher.mojang.com/download/MinecraftInstaller.exe",
            )
        ]
    ),

    "l2-3" : Tool(
        "Prism", "l2-3", 1, False,
        lambda: str(latest("PrismLauncher/PrismLauncher")),
        r"https://github.com/PrismLauncher/PrismLauncher",
        [
            Dwn(
                "Portable", "PrismLauncher Portable", "PrismLauncher-Portable.zip",
                r"https://github.com/PrismLauncher/PrismLauncher/releases/download/"
                r"/PrismLauncher-Windows-Portable-"
                r".zip",
            ),
            Dwn(
                "Setup","PrismLauncher Setup", "PrismLauncher-Setup.exe",
                r"https://github.com/PrismLauncher/PrismLauncher/releases/download/"
                r"/PrismLauncher-Windows-Setup-"
                r".exe",
            )
        ]
    ),

    "l3-3" : Tool(
        "ATLauncher", "l3-3", 1, False,
        lambda: str(latest("ATLauncher/ATLauncher")),
        r"https://github.com/ATLauncher/ATLauncher",
        [
            Dwn(
                "ATLauncher", "", "ATLauncher-Setup.exe",
                r"https://github.com/ATLauncher/ATLauncher/releases/latest/download/ATLauncher-",
                r".exe"
            )
        ]
    ),

    "l4-3" : Tool(
        "HMCL", "l4-3", 1, False,
        lambda: str(latest("huanghongxun/HMCL")),
        r"https://github.com/huanghongxun/HMCL",
        [
            Dwn(
                "HMCL", "", "HMCL.exe",
                r"https://github.com/huanghongxun/HMCL/releases/latest/download/HMCL-",
                r".exe"
            )
        ]
    ),

    "l5-3" : Tool(
        "XMCL", "l5-3", 1, False,
        lambda: str(latest("Voxelum/x-minecraft-launcher")),
        r"https://github.com/Voxelum/x-minecraft-launcher",
        [
            Dwn(
                "XMCL", "", "XMCL.zip",
                r"https://github.com/Voxelum/x-minecraft-launcher/releases/latest/download/xmcl-",
                r"-win32-x64.zip"
            )
        ]
    ),

    "l6-3" : Tool(
        "GDLauncher", "l6-3", 1, False,
        lambda: str(latest("gorilla-devs/GDLauncher")),
        r"https://github.com/gorilla-devs/GDLauncher",
        [
            Dwn(
                "Portable", "GDLauncher Portable", "GDLauncher-Portable.zip",
                r"https://github.com/gorilla-devs/GDLauncher/releases/download/v"
                r"/GDLauncher-win-portable.zip" 
            ),
            Dwn(
                "Setup", "GDLauncher Setup", "GDLauncher-Setup.exe",
                r"https://github.com/gorilla-devs/GDLauncher/releases/download/v"
                r"/GDLauncher-win-setup.exe",
            ),
        ]
    ),

    "g1-3" : Tool(
        "Steam", "g1-3", 1, True,
        lambda: "",
        r"https://store.steampowered.com/",
        [
            Dwn(
                "Steam", "", "Steam-Setup.exe",
                r"https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe"
            )
        ]
    ),

    "g2-3" : Tool(
        "Uplay", "g2-3", 1, True,
        lambda: "",
        r"https://ubisoftconnect.com",
        [
            Dwn(
                "Uplay", "", "Uplay-Setup.exe",
                r"https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UbisoftConnectInstaller.exe"
            )
        ]
    ),

    "g3-3" : Tool(
        "Origin", "g3-3", 1, True,
        lambda: "",
        r"https://www.ea.com/ea-app",
        [
            Dwn(
                "Origin", "", "Origin-Setup.exe",
                r"https://origin-a.akamaihd.net/EA-Desktop-Client-Download/installer-releases/EAappInstaller.exe"
            )
        ]
    ),

    "g4-3" : Tool(
        "Epic Games", "g4-3", 1, True,
        lambda: "",
        r"https://store.epicgames.com",
        [
            Dwn(
                "Epic Games", "", "Epic-Games-Setup.msi",
                r"https://launcher-public-service-prod06.ol.epicgames.com/launcher/api/installer/download/EpicGamesLauncherInstaller.msi"
            )
        ]
    ),

    "g5-3" : Tool(
        "GOG Galaxy", "g5-3", 1, True,
        lambda: "",
        r"https://www.gog.com/galaxy",
        [
            Dwn(
                "GOG Galaxy", "", "GOG-Galaxy-Setup.exe",
                r"https://webinstallers.gog-statics.com/download/GOG_Galaxy_2.0.exe"
            )
        ]
    ),

    "g6-3" : Tool(
        "Paradox", "g6-3", 1, True,
        lambda: "",
        r"https://www.paradoxinteractive.com/our-games/launcher",
        [
            Dwn(
                "Paradox", "", "Paradox-Setup.msi",
                r"https://launcher.paradoxinteractive.com/v2/paradox-launcher-installer-2023_2_1.msi"
            )
        ]
    ),

    "g7-3" : Tool(
        "Roblox", "g7-3", 1, True,
        lambda: "",
        r"https://www.roblox.com",
        [
            Dwn(
                "Roblox", "", "Roblox.exe",
                r"https://setup.roblox.com/Roblox.exe"
            )
        ]
    ),

    "c1-3" : Tool(
        "Tecknix Client", "c1-3", 1, True,
        lambda: "",
        r"https://tecknix.com/",
        [
            Dwn(
                "Tecknix Client", "", "Tecknix-Setup.exe",
                r"https://tecknix.com/client/TecknixClient.exe"
            )
        ]
    ),

    "c2-3" : Tool(
        "Salwyrr CLients", "c2-3", 1, True,
        lambda: "",
        r"https://www.salwyrr.com/",
        [
            Dwn(
                "Salwyrr CLients", "", "Salwyrr-Setup.exe",
                r"https://www.salwyrr.com/4/download/Salwyrr%20Launcher%20Installer.exe"
            )
        ]
    ),

    "c3-3" : Tool(
        "LabyMod", "c3-3", 1, True,
        lambda: "",
        r"https://www.labymod.net/",
        [
            Dwn(
                "LabyMod", "", "LabyMod-Setup.exe",
                r"https://dl.labymod.net/latest/install/LabyMod3_Installer.exe"
            )
        ]
    ),

    "c4-3" : Tool(
        "Feather Launcher", "c4-3", 1, True,
        lambda: "",
        r"https://feathermc.com/",
        [
            Dwn(
                "Feather Launcher", "", "FeatherLauncher-Setup.exe",
                r"https://launcher.feathercdn.net/dl/Feather%20Launcher%20Setup%201.4.8.exe"
            )
        ]
    ),

    "c5-3" : Tool(
        "Lunar Client", "c5-3", 1, True,
        lambda: "",
        r"https://www.lunarclient.com/",
        [
            Dwn(
                "Lunar Client", "", "LunarClient-Setup.exe",
                r"https://launcherupdates.lunarclientcdn.com/Lunar%20Client%20v2.15.1.exe"
            )
        ]
    ),

    "c6-3" : Tool(
        "OFL CheatBreaker", "c6-3", 1, True,
        lambda: "",
        r"https://github.com/Offline-CheatBreaker/Launcher",
        [
            Dwn(
                "Offline CheatBreaker", "", "Offline-CheatBreaker-Setup.exe",
                r"https://github.com/Offline-CheatBreaker/Launcher/releases/latest/download/Offline_CheatBreaker_Setup.exe"
            )
        ]
    ),

    "c7-3" : Tool(
        "Badlion Client", "c7-3", 1, True,
        lambda: "",
        r"https://client.badlion.net/",
        [
            Dwn(
                "Badlion Client", "", "BadlionClient-Setup.exe",
                r"https://client-updates.badlion.net/Badlion%20Client%20Setup%203.12.2.exe"
            )
        ]
    ),

    "i1-3" : Tool(
        "Achievement Watcher", "i1-3", 1, True,
        lambda: "",
        r"https://github.com/xan105/Achievement-Watcher",
        [
            Dwn(
                "Achievement Watcher", "", "Achievement-Watcher.exe",
                r"https://github.com/xan105/Achievement-Watcher/releases/latest/download/Achievement.Watcher.Setup.exe"
            )
        ]
    ),

    "i2-3" : Tool(
        "Discord", "i2-3", 1, True,
        lambda: "",
        r"https://discord.com/",
        [
            Dwn(
                "Discord", "", "Discord-Setup.exe",
                r"https://discord.com/api/downloads/distributions/app/installers/latest?channel=stable&platform=win&arch=x86"
            )
        ]
    ),

    "i3-3" : Tool(
        "Spotify", "i3-3", 1, True,
        lambda: "",
        r"https://open.spotify.com/",
        [
            Dwn(
                "Spotify", "", "Spotify.exe",
                r"https://download.scdn.co/SpotifySetup.exe"
            )
        ]
    ),

    "t1-3" : Tool(
        "Open Asar", "t1-3", 5, True,
        lambda: "\n",
        r"https://openasar.dev/",
        [
            Dwn(
                "Open Asar", "", "OpenAsar.bat",
                r'@echo off'
                r'C:\Windows\System32\TASKKILL.exe /f /im Discord.exe'
                r'C:\Windows\System32\TASKKILL.exe /f /im Discord.exe'
                r'C:\Windows\System32\TASKKILL.exe /f /im Discord.exe'
                r'C:\Windows\System32\TIMEOUT.exe /t 5 /nobreak'
                r'copy /y "%localappdata%\Discord\app-1.0.9011\resources\app.asar" "%localappdata%\Discord\app-1.0.9011\resources\app.asar.backup"'
                r'powershell -Command "Invoke-WebRequest https://github.com/GooseMod/OpenAsar/releases/download/nightly/app.asar -OutFile \"$Env:LOCALAPPDATA\Discord\app-1.0.9007\resources\app.asar\""'
                r'start "" "%localappdata%\Discord\Update.exe" --processStart Discord.exe'
                r'goto 2>nul & del "%~f0"'

            )
        ]
    ),

    "t2-3" : Tool(
        "Spicefy", "t2-3", 2, True,
        lambda: "",
        r"https://spicetify.app/",
        [
            Dwn(
                "Spicefy", "", "",
                r"iwr -useb https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.ps1 | iex && iwr -useb https://raw.githubusercontent.com/spicetify/spicetify-marketplace/main/resources/install.ps1 | iex"
            )
        ]
    ),

    "t3-3" : Tool(
        "VenCord", "t3-3", 1, True,
        lambda: "",
        r"https://github.com/Vendicated/VencordInstaller",
        [
            Dwn(
                "VenCord", "", "VenCord.exe",
                r"https://github.com/Vendicated/VencordInstaller/releases/latest/download/VencordInstaller.exe"
            )
        ]
    ),

    "t4-3" : Tool(
        "BetterDiscord", "t4-3", 1, True,
        lambda: "",
        r"https://github.com/BetterDiscord/Installer",
        [
            Dwn(
                "BetterDiscord", "", "BetterDiscord-Setup.exe",
                r"https://github.com/BetterDiscord/Installer/releases/latest/download/BetterDiscord-Windows.exe"
            )
        ]
    ),

}
