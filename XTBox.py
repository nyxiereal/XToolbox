from os import startfile, system, mkdir, remove, rmdir
from os.path import isfile, isdir
from sys import exit
from time import sleep
from urllib.request import urlretrieve
from colorama import init, Fore, Back
from lastversion import latest
from psutil import cpu_count, cpu_percent, disk_usage, virtual_memory
from XeLib import cls, printer,  color, mbgb, download, getmyping
from ping3 import ping

def prep():
    printer.lprint("Initializing Libraries...")
    init(autoreset=True)
    printer.lprint("Checking hardware requirements...")
    if cpu_count(logical=True)<3 and cpu_count(logical=False)<2:
        printer.lprint("Your Processor don't meet the minimum hardware requirements (2C / 3T).\n"
                       "Do You want to continue anyways?\n"
                       "(Y/n)")
        input("> ")
    if virtual_memory().total/1073741824<4:
        printer.lprint("Your RAM don't meet the minimum hardware requirements (4GB RAM).\n"
                       "Do You want to continue anyways?\n"
                       "(Y/n)")
        input("> ")
    if not virtual_memory().total/1073741824<4 and cpu_count(logical=True)<3 and cpu_count(logical=False)<2:
        printer.lprint("All Hardware requirements met!")

def update():
    while True:
        print("It seems your version of XToolBox is outdated!\n"
            "Do you want me to update it for you?")
        doupdate = input("(Y/n): ")
        if doupdate == "n" or doupdate == "N":
            print("Okey.")
            sleep(2)
            p1()
        elif doupdate == "Y" or doupdate == "y":
            printer.lprint("Downloading " + "XTBox "+str(latest("xemulat/XToolbox")) + " ...")
            urlretrieve("https://github.com/xemulat/XToolbox/releases/download/v"+str(latest("xemulat/XToolbox"))+"/XTBox.exe", "XTBox"+str(latest("xemulat/XToolbox"))+".exe", reporter)
            printer.lprint("XTBox "+str(latest("xemulat/XToolbox")) + ' Downloaded!')
            print("This program will exit in 3s...")
            sleep(3)
            startfile("XTBox"+str(latest("xemulat/XToolbox"))+".exe")
            exit()
        else:
            print(doupdate + " Isn't an option, try again.")
            sleep(2)

def dl(org, url, urlr, name):
    if isfile(urlr) == True:
        printer.lprint("ERROR - File " + urlr + " already exists!")
        chose = input("Overwrite? (Y/n): ")
        if chose == "Y" or chose == "y":
            pass
        elif chose == "N" or chose == "n":
            if org == 1:
                p1()
    
    download(url, urlr, name)
    if urlr != "WindowsOnReins.ps1":
        startfile(urlr)
    if org == 1: p1()

def eula():
    cls()
    readityoucanacceptin5sorels = Fore.RED + "Read it, You can accept in 5s" + Fore.WHITE
    print(" ┌───────────────────────────────────────────────────────────────────────────────┐\n"
          ' │ THE BEER-WARE LICENSE" (Revision 42):                                         │\n',
           "│ As long as you retain this notice you can do whatever you want with this      │\n",
           "│ stuff. If we meet someday, and you think this stuff is worth it, you can      │\n",
           "│ buy me a beer in return.                                                      │\n",
           "│                                                                               │\n",
           "│ This project is distributed in the hope that it will be useful, but WITHOUT   │\n",
           "│ ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or         │\n",
           "│ FITNESS FOR A PARTICULAR PURPOSE. The owner will not be held responsible      │\n"
          " │ for any damage that may be caused by this project.                            │\n"
          " ├───────────────────────┬───────────────────────────────┬───────────────────────┤\n"
         f" │                       │ {readityoucanacceptin5sorels} │                       │\n"
          " └───────────────────────┴───────────────────────────────┴───────────────────────┘\n")
    sleep(5)
    while True:
        agree = input("Do you agree? ("+Fore.GREEN+"Y"+Fore.WHITE+"/"+Fore.RED+"n"+Fore.WHITE + "): ")
        if agree == "y" or agree == "Y":
            print("You agreed to the EULA.")
            fp = open('EULA.XTB', 'w')
            fp.write('True')
            fp.close()
            sleep(3)
            p1()
        elif agree == "n" or agree == "N":
            print("Ok, come back if you change your mind.")
            exit(sleep(3))
        else:
            print("That wasn't one of the options...")
            sleep(2)
            cls()

def helpe():
    cls()
    e = Back.RED+"Red"+Back.RESET
    ng = Back.RED+"DNGR"+Back.RESET
    ree = Back.GREEN+"Green"+Back.RESET
    print(" ┌─────────────────────────────────────────────────────────────┐\n",
           "│ Keybind │ Command                                           │\n",
           "│    H    │ Help Page (this page)                             │\n",
           "│    N    │ Next Page                                         │\n",
           "│    B    │ Back                                              │\n",
           "|    UN   │ Uninstalls The Program                            │\n",
           "│    99   │ Exit                                              │\n",
           "├─────────────────────────────────────────────────────────────┤\n",
           "│ Color   │ Meaning                                           │\n",
          f"│ {e}     │ Dangerous Option                                  │\n",
          f"│ {ng}    │ Option that can f*ck up your PC                   │\n",
          f"│ {ree}   │ Recommended Option                                │\n",
           "├─────────────────────────────────────────────────────────────┤\n",
           "│ If scrips won't execute, run this in PowerShell:            │\n",
           "│ Set-ExecutionPolicy Unrestricted -Scope CurrentUser         │\n",
           "├─────────────────────────────────────────────────────────────┤\n",
           "│                   Press ENTER to go back.                   │\n",
           "└─────────────────────────────────────────────────────────────┘\n")
    input("> ")

def chooseeset():
    while True:
        cls()
        print(" ┌─────────────────────────────────────────────────────────────────────┐\n"
              ' │ [1] ESET Smart Security Premium                                     │\n',
               "│ [2] ESET Internet Security                                          │\n",
               "│ [3] ESET NOD32 Antivirus                                            │\n",
               "│ [4] ESET NOD32 Antivirus Gamer Edition                              │\n",
               "│ [5] ESET Security for Small Office                                  │\n",
               "│                                                                     │\n",
               "├─────────┬──────────────────────────┬───────────┬──────────┬─────────┤\n"
              " │         │ Choose your ESET version │ 99 - Exit │ B - Back │         │\n"
              " └─────────┴──────────────────────────┴───────────┴──────────┴─────────┘\n")
        choose = input("> ")
        if choose == "1":
            dl(1, "https://liveinstaller.eset.systems/odc/4e8c5ac2-4b04-4580-b453-45e209c6850d/eset_smart_security_premium_live_installer.exe", "ESETSmartSecurity.exe", "ESET Smart Security Premium")

        elif choose == "2":
            dl(1, "https://liveinstaller.eset.systems/odc/a2fae1b5-a31e-4f3a-a0c9-242f9f0cf51b/eset_internet_security_live_installer.exe", "ESETInternetSecurity.exe", "ESET Internet Security")

        elif choose == "3":
            dl(1, "https://liveinstaller.eset.systems/odc/f41b6af0-4718-4e4e-9ae5-ddf25b3ba713/eset_nod32_antivirus_live_installer.exe", "ESETNOD32.exe", "ESET NOD32 Antivirus")

        elif choose == "4":
            dl(1, "https://liveinstaller.eset.systems/odc/a9233029-a9e4-4a49-9005-82e4b994f765/eset_nod32_antivirus_live_installer.exe", "ESETNOD32Gamer.exe", "ESET NOD32 Antivirus Gamer Edition")

        elif choose == "5":
            dl(1, "https://liveinstaller.eset.systems/odc/0af63a7b-d4e0-4e5c-a4dc-c58fed3d6b78/eset_smart_security_premium_live_installer.exe", "ESETForSmallOffice.exe", "ESET Security for Small Office")

        elif choose == "B" or chooseeset == "b":
            p1()

        elif choose == "99":
            exit()

        else:
            print("No option named " + chooseeset)
            sleep(3)

def quicktweaks():
    while True:
        #hibli bibly, your house is gone, quote the raven, nevermore
        cls()
        LimitQ = color("LimitQoS", 2)
        optimizess = color("Optimize SSD", 2)
        AntiTrackTi = color("AntiTrackTime", 1)
        print(" ┌──────────────────────────┬──────────────────────────┐\n"
             f' │ [1] {AntiTrackTi}        │ [7] NoXboxBloat         R│\n',
              f"│ [2] NoNetworkAuto-Tune   │ [8] {LimitQ}            R│\n",
              f"│ [3] {optimizess}        R│ [9] XanderTweak         R│\n",
               "│ [4] NoActionCenter      R│ [10] AddCopyPath        R│\n",
               "│ [5] NoNews              R│ [11] DarkMode           R│\n",
               "│ [6] NoOneDrive           │ [12] AddTakeOwnership   R│\n",
               "│                          │                          │\n",
               "├────┬────────────────────┬┴──────────┬──────────┬────┤\n"
              " │    │ Choose your Tweaks │ 99 - Exit │ B - Back │    │\n"
              " └────┴────────────────────┴───────────┴──────────┴────┘\n")
        choose = input("> ")

        if choose == "1":
            dl(99, "https://raw.githubusercontent.com/xemulat/Windows-Toolkit/main/files/AntiTrackTime.bat", "AntiTrackTime.bat", "AntiTrackTime")
                
        elif choose == "2":
            urlretrieve("https://raw.githubusercontent.com/xemulat/Windows-Toolkit/main/files/Enable%20Window%20Network%20Auto-Tuning.bat", "NoNetworkAutotuneREVERT.bat")
            dl(99, "https://raw.githubusercontent.com/xemulat/Windows-Toolkit/main/files/Disable%20Window%20Network%20Auto-Tuning.bat", "NoNetworkAutoTune.bat", "NoNetworkAutoTune")
                
        elif choose == "3":
            dl(99, "https://raw.githubusercontent.com/tcja/Windows-10-tweaks/master/SSD_Optimizations.reg", "OptimizeSSD.reg", "OptimizeSSD")

        elif choose == "4":
            dl(99, "https://raw.githubusercontent.com/tcja/Windows-10-tweaks/master/Disable_Action_Center.reg", "NoActionCenter.reg", "NoActionCenter")
                
        elif choose == "5":
            dl(99, "https://raw.githubusercontent.com/tcja/Windows-10-tweaks/master/Disable_News_and_Interests_on_taskbar_feature_for_all_users.reg", "NoNews.reg", "NoNews")
                
        elif choose == "6":
            dl(99, "https://raw.githubusercontent.com/tcja/Windows-10-tweaks/master/OneDrive_Uninstaller_v1.2.bat", "NoOneDrive.bat", "NoOneDrive")
                
        elif choose == "7":
            dl(99, "https://raw.githubusercontent.com/tcja/Windows-10-tweaks/master/RemoveXboxAppsBloat.bat", "NoXboxBloat.bat", "NoXboxBloat")
                
        elif choose == "8":
            dl(99, "https://raw.githubusercontent.com/tcja/Windows-10-tweaks/master/QoS_Limiter.reg", "LimitQoS.reg", "LimitQoS")
            
        elif choose == "9":
            dl(99, "https://raw.githubusercontent.com/tcja/Windows-10-tweaks/master/other_scripts/XanderBaatzTweaks.reg", "XanderTweak.reg", "Xander Tweak")
            
        elif choose == "10":
            dl(99, "https://raw.githubusercontent.com/tcja/Windows-10-tweaks/master/Add_Copy_path_to_context_menu.reg", "AddCopyPath.reg", "AddCopyPath")

        elif choose == "11":
            dl(99, "https://raw.githubusercontent.com/tcja/Windows-10-tweaks/master/darkmodetoggle/darkmodeON.reg", "DarkModeON.reg", "DarkMode")
            
        elif choose == "12":
            dl(99, r"https://raw.githubusercontent.com/couleurm/couleurstoolbox/main/3%20Windows%20Tweaks/0%20Quality%20of%20life%20tweaks/Take%20Ownership%20in%20context%20menu/Add%20Take%20Ownership.reg", "AddTakeOwnership.reg", "AddTakeOwnership")
            
        elif choose == "B" or choose == "b":
            p1()

        elif choose == "99":
            exit()

        else:
            print("No option named " + choose)
            sleep(3)

def p1():
    cls()
    pre = "-RC.DEV1"
    version = "1.7"
    # Updater
    newver = latest("xemulat/XToolbox")
    if version == str(newver):
        Errorhd = color("UpToDate ", 1)
        version = version+"        "
    elif str(newver) > version:
        Errorhd = color("Outdated ", 2)
        version = version+"        "
        update()
    else:
        version = version+pre
        Errorhd = color("DevBuild ", 3)

    # Set vars (do math and some crap)

    # RAM / VMEM percent
    vmp = str(virtual_memory().percent).split(".", 1)[0]
    checkram =  len(vmp)
    if checkram == 1:   helpline1 = "  "
    elif checkram == 2: helpline1 = " "
    elif checkram == 3: helpline1 = ""
    else: helpline1 = ""
    if float(vmp) > 60:
        ramavailz =  color(vmp + "%", 2) + " / 100%"+helpline1
    else:
        ramavailz =  vmp + "% / 100%"+helpline1
    
    # CPU cores and threads
    lf = str(cpu_count(logical=False))
    lt = str(cpu_count(logical=True))
    checklogict = len(lt)
    if checklogict == 1:   helpline6 = " "
    elif checklogict == 2: helpline6 = ""
    else: helpline6 = ""
    checklogicf = len(lf)
    if checklogicf == 1:   helpline0 = " "
    elif checklogicf == 2: helpline0 = ""
    else: helpline0 = ""
    if int(lf) < 2 and int(lt) < 3:
        c = color(lf + "C / " + lt.replace(".0", "") + "T"+helpline0+helpline6, 2)
    else:
        c = lf + "C / " + lt.replace(".0", "") + "T"+helpline0+helpline6

    # CPU utiliation
    cpup = str(cpu_percent()).replace("%", "").split(".", 1)[0]
    checkcpu = len(cpup)
    if checkcpu == 1:   helpline2 = " "
    elif checkcpu == 2: helpline2 = ""
    else: helpline2 = ""
    if int(cpup) > 60:
        cpuavailifffff = color(cpup, 2) + "% / 100%" + helpline2
    else:
        cpuavailifffff = cpup + "% / 100%" + helpline2

    # C:/ Disk usage
    dusa = str(disk_usage("/").total/1073741824)
    duss = str(disk_usage("/").used/1073741824)
    checkdisk =  len(str(duss.split(".", 1)[0]))
    if checkdisk == 2:   helpline3 = "   "
    elif checkdisk == 3: helpline3 = "  "
    elif checkdisk == 4: helpline3 = " "
    else: helpline2 = ""
    if (int(dusa.split(".", 1)[0]))/(int(duss.split(".", 1)[0])) < 0.5:
        dusagehebeded = color(duss.split(".", 1)[0] + "GB", 2) + " / " + dusa.split(".", 1)[0] + "GB" + helpline3
    else:
        dusagehebeded = duss.split(".", 1)[0] + "GB" + " / " + dusa.split(".", 1)[0] + "GB" + helpline3

    # 1 is green, 2 is red, 3 is magenta
    xtoolboxvv1asdfghjz = color("XToolBox v"+version, 2)
    xemulatddddd = color("xemulated#2622", 2)
    windowsonreinddddd = color("WindowsOnReins  DNGR", 2)
    posttweaksjfjfjf = color("PostTweaks    DNGR", 2)
    ohdwindowwwwwwwww = color("OHD Windows    DNGR", 2)
    neCtrl = color("HoneCtrl", 1)
    malwarebyt = color("Malwarebytes", 1)
    rav = color("Brave", 1)
    firef = color("Firefox", 1)
    sweetyli = color("SweetyLite", 1)
    quicktwea = color("QuickTweaks", 1)

    #Check ping DON'T TOUCH IT!!!
    checkping = len(str(getmyping().replace("ms", "").replace(Fore.RED or Fore.GREEN, "")))
    if checkping == 6:   helpline4 = "    "
    elif checkping == 7: helpline4 = "   "
    elif checkping == 8: helpline4 = "  "
    else: helpline4 = ""

    qwert = getmyping()+Fore.RESET+helpline4
    print(f" ┌────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐\n", 
           f"│ {xtoolboxvv1asdfghjz}                             │ Made by {xemulatddddd} For Dan │ Internet: {qwert}             │\n",
           f"│ Update Status: {Errorhd} │ RAM: {ramavailz}       │ CPU: {cpuavailifffff} | {c}    │ Disk: {dusagehebeded}         │\n",
            "├──────────────────────────┼────────────────────────┼────────────────────────────────┼───────────────────────────────┤\n", 
            "│ [D] Debloat              │ [T] Tweaks             │ [A] Apps                       │ [C] Cleaning / Antiviruses    │\n",
            "├──────────────────────────┼────────────────────────┼────────────────────────────────┼───────────────────────────────┤\n", 
           f"│ [1] EchoX                │ [1] {posttweaksjfjfjf} │ [1] Chocholatey                │ [1] ADW Cleaner               │\n",
           f"│ [2] {neCtrl}             │ [2] Insider Enroller   │ [2] {rav}                      │ [2] ATF Cleaner               │\n",
           f"│ [3] ShutUp10             │ [3] Windows11Fixer     │ [3] {firef}                    │ [3] Defraggler                │\n",
           f"│ [4] Optimizer            │ [4] Activator          │ [4] Lively Wallpaper           │ [4] {malwarebyt}              │\n",
            "│ [5] PyDebloatX           │ [5] AntiRoundCorners   │ [5] LibreWolf                  │ [5] ESET Online Scanner       │\n",
           f"│ [6] {windowsonreinddddd} │ [6] FixDrag&Drop       │ [6] qBittorrent                │ [6] ESET                      │\n",
            "│ [7] QuickBoost           │ [7] Winaero Tweaker    │ [7] Rainmeter                  │                               │\n",
            "│ [8] Win10Debloater       │                        │ [8] 7-Zip                      │                               │\n",
           f"│ [9] SadCoy               │ [QT] {quicktwea}       │ [9] Memory Cleaner             │                               │\n",
           f"│ [10] {sweetyli}          │                        │                                │                               │\n",
           f"│ [11] {ohdwindowwwwwwwww} │                        │                                │                               │\n",
            "│ [12] WindowsSpyBlocker   │                        │                                │                               │\n",
            "│ [13] PrivateZilla        │                        │                                │                               │\n",
            "│ [14] ZusierAIO           │                        │                                │                               │\n",
            "│                          │                        │                                │                               │\n",
            "│                          │                        │                                │                               │\n",
            "├──────────────────────────┴────────────────────────┴────────────────────────────────┴───────────────────────────────┤\n",
            "│                    Ex.: 'D2' ─ HoneCtrl │ N ─ Next Page │ 99 ─ Exit │ H - Help │ UN - Uninstall                    │\n",
            "└────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘")
    choose = input("> ")

    if choose == "99":
        exit()

    # =============< Debloat
    elif choose == "D1" or choose == "d1":
        dl(1, "https://raw.githubusercontent.com/UnLovedCookie/EchoX/main/EchoX.bat", "EchoX.bat", "EchoX")
        
    elif choose == "D2" or choose == "d2":
        dl(1, "https://raw.githubusercontent.com/auraside/HoneCtrl/main/HoneCtrl.bat", "HoneCtrl.bat", "HoneCtrl")
        
    elif choose == "D3" or choose == "d3":
        dl(1, "https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe", "ShutUp10.exe", "ShutUp10")
        
    elif choose == "D4" or choose == "d4":
        dl(1, "https://github.com/hellzerg/optimizer/releases/download/" + str(latest("hellzerg/optimizer")) + "/Optimizer-" + str(latest("hellzerg/optimizer")) + ".exe", "Optimizer.exe", "Optimizer")
            
    elif choose == "D5" or choose == "d5":
        dl(1, "https://github.com/Teraskull/PyDebloatX/releases/download/" + str(latest("Teraskull/PyDebloatX")) + "/PyDebloatX_portable.exe", "PyDebloatX.exe", "PyDebloatX")

    elif choose == "D6" or choose == "d6":
        dl(1, "https://raw.githubusercontent.com/gordonbay/Windows-On-Reins/master/wor.ps1", "WindowsOnReins.ps1", "WindowsOnReins")

    elif choose == "D7" or choose == "d7":
        dl(1, "https://github.com/SanGraphic/QuickBoost/releases/download/" + str(latest("SanGraphic/QuickBoost")) + "/QuickBoost.exe", "QuickBoost.exe", "QuickBoost")

    elif choose == "D8" or choose == "d8":
        dl(1, "https://raw.githubusercontent.com/xemulat/Windows-Toolkit/main/files/win10debloater.bat", "Win10Debloater.bat", "Win10Debloater")

    elif choose == "D9" or choose == "d9":
        dl(1, "https://github.com/Jisll/Sadcoy/releases/download/v" + str(latest("Jisll/Sadcoy")) + "/Sadcoy.exe", "Sadcoy.exe", "Sadcoy")
    
    elif choose == "D10" or choose == "d10":
        dl(1, "https://cdn.discordapp.com/attachments/953004468503461948/1031289678013411368/SweetyLite2.bat", "SweetyLite.bat", "SweetyLite")
    
    elif choose == "D11" or choose == "d11":
        dl(1, "https://github.com/xemulat/XToolbox/raw/main/files/OHDW.bat", "OHDWindows.bat", "OHD Windows")
    
    elif choose == "d12" or choose == "D12":
        dl(1, "https://github.com/crazy-max/WindowsSpyBlocker/releases/download/" + str(latest("crazy-max/WindowsSpyBlocker")) + "/WindowsSpyBlocker.exe", "WindowsSpyBlocker.exe", "WindowsSpyBlocker")

    elif choose == "d13" or choose == "D13":
        dl(1, "https://github.com/builtbybel/privatezilla/releases/download/" + str(latest("builtbybel/privatezilla")) + "/privatezilla.zip", "PrivateZilla.zip", "PrivateZilla")

    elif choose == "d14" or choose == "D14":
        dl(1, "https://raw.githubusercontent.com/Zusier/Zusiers-optimization-Batch/master/Zusier%20AIO.bat", "ZusierAIO.bat", "ZusierAIO")

    # =============< Tweaks

    elif choose == "T1" or choose == "t1":
        dl(1, "https://raw.githubusercontent.com/ArtanisInc/Post-Tweaks/main/PostTweaks.bat", "PostTweaks.bat", "PostTweaks")
        
    elif choose == "T2" or choose == "t2":
        dl(1, "https://github.com/Jathurshan-2019/Insider-Enroller/releases/download/v" + str(latest("Jathurshan-2019/Insider-Enroller")) + "/Insider_Enrollerv" + str(latest("Jathurshan-2019/Insider-Enroller")) + ".zip", "InsiderEnroller.zip", "InsiderEnroller")

    elif choose == "T3" or choose == "t3":
        dl(1, "https://github.com/99natmar99/Windows-11-Fixer/releases/download/v" + str(latest("99natmar99/Windows-11-Fixer")) + "/Windows.11.Fixer.v" + str(latest("99natmar99/Windows-11-Fixer")) + ".Portable.zip", "Windows11Fixer.zip", "Windows11Fixer")

    elif choose == "T4" or choose == "t4":
        dl(1, "https://raw.githubusercontent.com/xemulat/Windows-Toolkit/main/files/MAS.bat", "MAS.bat", "MAS")

    elif choose == "T5" or choose == "t5":
        dl(1, "https://github.com/valinet/Win11DisableRoundedCorners/releases/download/" + str(latest("valinet/Win11DisableRoundedCorners")) + "/Win11DisableOrRestoreRoundedCorners.exe", "AntiRoundCorners.exe", "AntiRoundCorners")

    elif choose == "T6" or choose == "t6":
        dl(1, "https://github.com/HerMajestyDrMona/Windows11DragAndDropToTaskbarFix/releases/download/v." + str(latest("HerMajestyDrMona/Windows11DragAndDropToTaskbarFix")) + "-release/Windows11DragAndDropToTaskbarFix.exe", "FixDragAndDrop.exe", "Fix Drag&Drop")
        
    elif choose == "T7" or choose == "t7":
        dl(1, "https://winaero.com/downloads/winaerotweaker.zip", "WinaeroTweaker.zip", "Winaero Tweaker")
    
    elif choose == "QT" or choose == "qt" or choose == "Qt" or choose == "qT":
        quicktweaks()

    # =============< Apps

    elif choose == "A1" or choose == "a1":
        dl(1, "https://raw.githubusercontent.com/xemulat/Windows-Toolkit/main/files/choco.bat", "choco.bat", "Choco")

    elif choose == "A2" or choose == "a2":
        dl(1, "https://referrals.brave.com/latest/BraveBrowserSetup.exe", "Brave.exe", "Brave Browser")

    elif choose == "A3" or choose == "a3":
        dl(1, "https://download-installer.cdn.mozilla.net/pub/firefox/releases/105.0.3/win32/en-US/Firefox%20Installer.exe", "Firefox.exe", "Firefox")

    elif choose == "A4" or choose == "a4":
        dl(1, "https://github.com/rocksdanister/lively/releases/download/v" + str(latest("rocksdanister/lively")) + "/lively_setup_x86_full_v" + str(latest("rocksdanister/lively")).replace(".", "") + ".exe", "LivelyWallpaper.exe", "Lively Wallpaper")

    elif choose == "A5" or choose == "a5":
        dl(1, "https://gitlab.com/librewolf-community/browser/windows/uploads/f5c35c96a94b78ac847f19f6c3d3e49e/librewolf-105.0.3-1.en-US.win64-setup.exe", "LibreWolf.exe", "LibreWolf")

    elif choose == "A6" or choose == "a6":
        dl(1, "https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases/download/release-" + str(latest("c0re100/qBittorrent-Enhanced-Edition")) + "/qbittorrent_enhanced_" + str(latest("c0re100/qBittorrent-Enhanced-Edition")) + "_Qt6_setup.exe", "qBittorrent.exe", "qBittorrent")

    elif choose == "A7" or choose == "a7":
        dl(1, "https://github.com/rainmeter/rainmeter/releases/download/v4.5.16.3687/Rainmeter-4.5.16.exe", "Rainmeter.exe", "Rainmeter")

    elif choose == "A8" or choose == "a8":
        dl(1, "https://www.7-zip.org/a/7z2201-x64.exe", "7Zip.exe", "7-Zip")

    elif choose == "A9" or choose == "a9":
        dl(1, "https://www.koshyjohn.com/software/MemClean.exe", "MemoryCleaner.exe", "Memory Cleaner")
    
    # =============< Cleanup

    elif choose == "C1" or choose == "c1":
        dl(1, "https://adwcleaner.malwarebytes.com/adwcleaner?channel=release", ".exe", "ADW Cleaner")

    elif choose == "C2" or choose == "c2":
        dl(1, "https://files1.majorgeeks.com/10afebdbffcd4742c81a3cb0f6ce4092156b4375/drives/ATF-Cleaner.exe", "ATF-Cleaner.exe", "ATF Cleaner")

    elif choose == "C3" or choose == "c3":
        dl(1, "https://download.ccleaner.com/dfsetup222.exe", "Defraggler.exe", "Defraggler")

    elif choose == "C4" or choose == "c4":
        dl(1, "https://www.malwarebytes.com/api/downloads/mb-windows?filename=MBSetup-37335.37335.exe", "Malwarebytes.exe", "Malwarebytes")

    elif choose == "C5" or choose == "c5":
        dl(1, "https://download.eset.com/com/eset/tools/online_scanner/latest/esetonlinescanner.exe", "ESETOnlineScanner.exe", "ESET Online Scanner")

    elif choose == "C6" or choose == "c6":
        chooseeset()

    elif choose == "n" or choose == "N":
        print("Option not finished (yet!)")
        sleep(4)
        p1()

    elif choose == "h" or choose == "H":
        helpe()

    elif choose == "un" or choose == "Un" or choose == "uN" or choose == "UN":
        areusure = input("Are you sure you want to uninstall? (Y/n): ")
        if areusure == "Y" or areusure == "y":
            real = input("Do you want to uninstall this file too? (Y/n): ")
            if real == "y" or real == "Y":
                fp = open('delxtb.bat', 'w')
                fp.write('del XTBox.exe\n'
                         'start /b "" cmd /c del "%~f0"&exit /b')
                fp.close()
                startfile("delxtb.bat")
                exit()
    else:
        print("No option named " + choose)
        sleep(3)
        p1()

if __name__ == __name__:
    # Checks if you agreed to the EULA
    if isfile("EULA.XTB") == False:
        eula()
    prep()
    p1()
