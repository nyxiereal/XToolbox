from os import startfile, system
from os.path import isfile
from sys import exit
from time import sleep
from urllib.request import urlretrieve
from colorama import init, Fore, Back
from lastversion import latest
from psutil import cpu_count, cpu_percent, disk_usage, virtual_memory
from XeLib import cls, printer

def mbgb(input_megabyte):
    gigabyte = 1.0/1024
    convert_gb = gigabyte * input_megabyte
    return convert_gb

def reporter(block_num, block_size, total_size):
    read_so_far = block_num * block_size
    if total_size > 0:
        percent = read_so_far * 1e2 / total_size
        print(f"\r{percent:5.1f}% {read_so_far:{len(str(total_size))}} out of {total_size}", end='')
        if read_so_far >= total_size:
            print()
    else:
        print(f"read {read_so_far}", end='')

def prep():
    init(autoreset=True)
    cls()

def dl(org, url, urlr, name):
    if isfile(urlr) == True:
        printer.lprint("ERROR - File " + urlr + " already exists!")
        chose = input("Overwrite? (Y/n): ")
        if chose == "Y" or chose == "y":
            pass
        elif chose == "N" or chose == "n":
            if org == 1:
                p1()
    
    printer.lprint("Downloading " + name + " ...")
    urlretrieve(url, urlr, reporter)
    printer.lprint(name + ' Downloaded!')
    if urlr != "WindowsOnReins.ps1":
        startfile(urlr)
    if org == 1:    p1()

def eula():
    cls()
    print(" ┌─────────────────────────────────────────────────────────────────────────────┐\n"
          ' │THE BEER-WARE LICENSE" (Revision 42):                                        │\n',
           "│As long as you retain this notice you can do whatever you want with this     │\n",
           "│stuff. If we meet someday, and you think this stuff is worth it, you can     │\n",
           "│buy me a beer in return.                                                     │\n",
           "│                                                                             │\n",
           "│This project is distributed in the hope that it will be useful, but WITHOUT  │\n",
           "│ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or        │\n",
           "│FITNESS FOR A PARTICULAR PURPOSE. The owener will not be held responsible    │\n"
          " │for any damage that may be caused by this project.                           │\n"
          " └─────────────────────────────────────────────────────────────────────────────┘")

    agree = input("Do you agree? (Y/n): ")
    if agree == "y" or agree == "Y":
        print("You agreed to the EULA.")
        fp = open('EULA.XTB', 'w')
        fp.write('True')
        fp.close()
        sleep(3)
        p1()
    elif agree == "n" or agree == "N":
        print("Ok, so come back if you change your mind lol.")
        exit(sleep(3))

def helpe():
    cls()
    e = Back.RED+"Red"+Back.RESET
    ree = Back.GREEN+"Green"+Back.RESET
    print(" ┌────────────────────────────────────────┐\n",
           "│ Keybind │ Command                      │\n",
           "│    H    │ Help Page (this page)        │\n",
           "│    N    │ Next Page                    │\n",
           "│    99   │ Exit                         │\n",
           "├────────────────────────────────────────┤\n",
           "│ Colors  │ Meaning                      │\n",
          f"│ {e}     │ Dangerous Option             │\n",
          f"│ {ree}   │ Reccomended Option           │\n",
           "│                                        │\n",
           "├────────────────────────────────────────┤\n",
           "│        Press ENTER to go back.         │\n",
           "└────────────────────────────────────────┘\n")
    input("> ")

def p1():
    cls()
    # Updater
    newver = latest("xemulat/XToolbox")
    if "1.4" == str(newver):
        Errorhd = Fore.GREEN+"UpToDate "+Fore.WHITE
    elif str(newver) > "1.4":
        Errorhd = Fore.RED+"Outdated "+Fore.WHITE
    else:
        Errorhd = Fore.MAGENTA+"Error    "+Fore.WHITE

    # Set vars (do math and some crap)
    if cpu_count(logical=False) < 2 and cpu_count(logical=True) < 3:
        c = Fore.RED+str(cpu_count(logical=False)) + "C / " + str(cpu_count(logical=True)).replace(".0", "") + "T "+Fore.WHITE
    else:
        c = str(cpu_count(logical=False)) + "C / " + str(cpu_count(logical=True)).replace(".0", "") + "T "

    if int(virtual_memory().percent) > 60:
        ramavailiz =  Fore.RED+str(virtual_memory().percent) + "%" + Fore.WHITE + " / 100%"
    else:
        ramavailiz =  str(virtual_memory().percent) + "% / 100%"

    cpup = str(cpu_percent()).replace("%", "").split(".", 1)[0]
    if int(cpup) > 60:
        cpuavailiffff = Fore.RED+cpup+Fore.WHITE + " / 100%"
    else:
        cpuavailiffff = cpup + "% / 100%"

    if (int(str(disk_usage("/").total/1073741824).split(".", 1)[0]))/(int(str(disk_usage("/").used/1073741824).split(".", 1)[0])) < 0.5:
        dusagehebed = Fore.RED+str(disk_usage("/").used/1073741824).split(".", 1)[0] + "GB"+Fore.WHITE + " / " + str(disk_usage("/").total/1073741824).split(".", 1)[0] + "GB"
    else:
        dusagehebed = str(disk_usage("/").used/1073741824).split(".", 1)[0] + "GB" + " / " + str(disk_usage("/").total/1073741824).split(".", 1)[0] + "GB"

    xtoolboxvv1 = Fore.RED+"XToolBox v1.4"+Fore.WHITE
    # CLI-GUI
    xemulat = Fore.RED+"Xemulated"+Fore.WHITE
    windowsonreinddddddddd = Fore.RED+"[6] WindowsOnReins  DNGR"+Fore.WHITE
    posttweaksjfjfjfjddd = Fore.RED+"[1] PostTweaks    DNGR"+Fore.WHITE
    print(f" ┌─────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐\n", 
           f"│ {xtoolboxvv1}                                     │ Made by {xemulat}                                           │\n",
           f"│ Update Status: {Errorhd} │ RAM: {ramavailiz}      │ CPU: {cpuavailiffff} | {c}   │ Disk: {dusagehebed}          │\n",
            "├──────────────────────────┼────────────────────────┼──────────────────────────────┼──────────────────────────────┤\n", 
            "│ [D] Debloat              │ [T] Tweaks             │ [A] Apps                     │ [C] Cleaning / Antiviruses   │\n",
            "├──────────────────────────┼────────────────────────┼──────────────────────────────┼──────────────────────────────┤\n", 
           f"│ [1] EchoX                │ {posttweaksjfjfjfjddd} │ [1] Chocholatey              │ [1] ADW Cleaner              │\n",
            "│ [2] HoneCtrl             │ [2] AntiTrackTime      │ [2] Brave Browser            │ [2] ATF Cleaner              │\n",
            "│ [3] ShutUp10             │ [3] NoNetworkAutoTune  │ [3] FireFox                  │ [3] Defraggler               │\n",
            "│ [4] Optimizer            │ [4] NoActionCenter     │ [4] Lively Wallpaper         │ [4] Malwarebytes             │\n",
            "│ [5] PyDebloatX           │ [5] NoNews + R         │ [5] LibreWolf                │ [5] ESET Full                │\n",
           f"│ {windowsonreinddddddddd} │ [6] NoOneDrive         │ [6] qBittorrent              │ [6] ESET Online Scanner      │\n",
            "│ [7] QuickBoost           │ [7] NoXboxBloat        │ [7] Rainmeter                │                              │\n",
            "│ [8] Win10Debloater       │ [8] LimitQoS           │ [8] 7-Zip                    │                              │\n",
            "│ [9] SadCoy               │ [9] OptimizeSSD        │ [9] Memory Cleaner           │                              │\n",
            "│ [10] SweetyLite          │ [10] Insider Enroller  │                              │                              │\n",
            "│                          │ [11] Windows11Fixer    │                              │                              │\n",
            "│                          │ [12] Activator         │                              │                              │\n",
            "│                          │ [13] AntiRoundCorners  │                              │                              │\n",
            "│                          │ [14] FixDrag&Drop      │                              │                              │\n",
            "│                          │ [15] Winaero Tweaker   │                              │                              │\n",
            "│                          │                        │                              │                              │\n",
            "├──────────────────────────┴────────────────────────┴──────────────────────────────┴──────────────────────────────┤\n",
            "│                           Ex.: 'D2' ─ HoneCtrl │ N ─ Next Page │ 99 ─ Exit │ H - Help                           │\n",
            "└─────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘")
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

    # =============< Tweaks

    elif choose == "T1" or choose == "t1":
        dl(1, "https://raw.githubusercontent.com/ArtanisInc/Post-Tweaks/main/PostTweaks.bat", "PostTweaks.bat", "PostTweaks")
        
    elif choose == "T2" or choose == "t2":
        dl(1, "https://raw.githubusercontent.com/xemulat/Windows-Toolkit/main/files/AntiTrackTime.bat", "AntiTrackTime.bat", "AntiTrackTime")
        
    elif choose == "T3" or choose == "t3":
        urlretrieve("https://raw.githubusercontent.com/xemulat/Windows-Toolkit/main/files/Enable%20Window%20Network%20Auto-Tuning.bat", "NoNetworkAutotuneREVERT.bat")
        dl(1, "https://raw.githubusercontent.com/xemulat/Windows-Toolkit/main/files/Disable%20Window%20Network%20Auto-Tuning.bat", "NoNetworkAutoTune.bat", "NoNetworkAutoTune")
        
    elif choose == "T4" or choose == "t4":
        dl(1, "https://raw.githubusercontent.com/tcja/Windows-10-tweaks/master/Disable_Action_Center.reg", "NoActionCenter.reg", "NoActionCenter")
        
    elif choose == "T5" or choose == "t5":
        dl(1, "https://raw.githubusercontent.com/tcja/Windows-10-tweaks/master/Disable_News_and_Interests_on_taskbar_feature_for_all_users.reg", "NoNews.reg", "NoNews")
        
    elif choose == "T6" or choose == "t6":
        dl(1, "https://raw.githubusercontent.com/tcja/Windows-10-tweaks/master/OneDrive_Uninstaller_v1.2.bat", "NoOneDrive.bat", "NoOneDrive")
        
    elif choose == "T7" or choose == "t7":
        dl(1, "https://raw.githubusercontent.com/tcja/Windows-10-tweaks/master/RemoveXboxAppsBloat.bat", "NoXboxBloat.bat", "NoXboxBloat")
        
    elif choose == "T8" or choose == "t8":
        dl(1, "https://raw.githubusercontent.com/tcja/Windows-10-tweaks/master/QoS_Limiter.reg", "LimitQoS.reg", "LimitQoS")
        
    elif choose == "T9" or choose == "t9":
        dl(1, "https://raw.githubusercontent.com/tcja/Windows-10-tweaks/master/SSD_Optimizations.reg", "OptimizeSSD.reg", "OptimizeSSD")
        
    elif choose == "T10" or choose == "t10":
        dl(1, "https://github.com/Jathurshan-2019/Insider-Enroller/releases/download/v" + str(latest("Jathurshan-2019/Insider-Enroller")) + "/Insider_Enrollerv" + str(latest("Jathurshan-2019/Insider-Enroller")) + ".zip", "InsiderEnroller.zip", "InsiderEnroller")

    elif choose == "T11" or choose == "t11":
        dl(1, "https://github.com/99natmar99/Windows-11-Fixer/releases/download/v" + str(latest("99natmar99/Windows-11-Fixer")) + "/Windows.11.Fixer.v" + str(latest("99natmar99/Windows-11-Fixer")) + ".Portable.zip", "Windows11Fixer.zip", "Windows11Fixer")

    elif choose == "T12" or choose == "t12":
        dl(1, "https://raw.githubusercontent.com/xemulat/Windows-Toolkit/main/files/MAS.bat", "MAS.bat", "MAS")

    elif choose == "T13" or choose == "t13":
        dl(1, "https://github.com/valinet/Win11DisableRoundedCorners/releases/download/" + str(latest("valinet/Win11DisableRoundedCorners")) + "/Win11DisableOrRestoreRoundedCorners.exe", "AntiRoundCorners.exe", "AntiRoundCorners")

    elif choose == "T14" or choose == "t14":
        dl(1, "https://github.com/HerMajestyDrMona/Windows11DragAndDropToTaskbarFix/releases/download/v." + str(latest("HerMajestyDrMona/Windows11DragAndDropToTaskbarFix")) + "-release/Windows11DragAndDropToTaskbarFix.exe", "FixDragAndDrop.exe", "Fix Drag&Drop")
        
    elif choose == "T15" or choose == "t15":
        dl(1, "https://winaero.com/downloads/winaerotweaker.zip", "WinaeroTweaker.zip", "Winaero Tweaker")

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
        dl(1, "https://liveinstaller.eset.systems/odc/4e8c5ac2-4b04-4580-b453-45e209c6850d/eset_smart_security_premium_live_installer.exe", "ESETSetup.exe", "ESET Full")

    elif choose == "C5" or choose == "c6":
        dl(1, "https://download.eset.com/com/eset/tools/online_scanner/latest/esetonlinescanner.exe", "ESETOnlineScanner.exe", "ESET Online Scanner")

    elif choose == "n" or choose == "N":
        print("Option not finished (yet!)")
        sleep(4)
        p1()

    elif choose == "h" or choose == "H":
        helpe()

    else:
        print("No option named " + choose)
        sleep(3)
        p1()

if __name__ == __name__:
    # Checks if you agreed to the EULA
    if isfile("EULA.XTB") == True:
        p1()
    elif isfile("EULA.XTB") == False:
        eula()
    prep()
    p1()
