from XeLib import cls, printer
from os import system, startfile
from sys import exit
from os.path import isfile
from time import sleep
from urllib.request import urlretrieve
from lastversion import latest

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
            elif org == 2:
                p2()
    
    printer.lprint("Downloading " + name + " ...")
    urlretrieve(url, urlr, reporter)
    printer.lprint(name + ' Downloaded!')
    if urlr != "WindowsOnReins.ps1":
        startfile(urlr)
    if org == 1:    p1()
    elif org == 2:  p2()

def p1():
    cls()
    print(" ┌──────────────────────────┬────────────────────────┬──────────────────────────────┬─────────────────────────────┐\n", 
           "│ [D] Debloat              │ [T] Tweaks             │ [A] Apps                     │ [C] Cleaning / Antiviruses  │\n",
           "├──────────────────────────┼────────────────────────┼──────────────────────────────┼─────────────────────────────┤\n", 
           "│ [1] EchoX                │ [1] PostTweaks         │ [1] Chocholatey (required)   │ [1] ADW Cleaner             │\n",
           "│ [2] HoneCtrl             │ [2] AntiTrackTime      │ [2] Brave Browser            │ [2] ATF Cleaner             │\n",
           "│ [3] ShutUp10             │ [3] NoNetworkAutoTune  │ [3] FireFox                  │ [3] Defragmenter            │\n",
           "│ [4] Optimizer            │ [4] NoActionCenter     │ [4] Chromium                 │ [4] Disk Cleaner            │\n",
           "│ [5] PyDebloatX           │ [5] NoNews + R         │ [5] EarTrumpet               │ [5] Registry Cleaner        │\n",
           "│ [6] WindowsOnReins  DNGR │ [6] NoOneDrive         │ [6] ModernFlyouts            │ [6] Malwarebytes            │\n",
           "│ [7] QuickBoost           │ [7] NoXboxBloat        │ [7] Rainmeter                │ [7] ESET Full               │\n",
           "│ [8] Win10Debloater       │ [8] LimitQoS           │ [8] 7-Zip                    │ [8] ESET Online Scanner     │\n",
           "│ [9] SadCoy               │ [9] OptimizeSSD        │ [9] Memory Cleaner           │                             │\n",
           "│                          │ [10] Insider Enroller  │ [10] qBittorrent             │                             │\n",
           "│                          │ [11] Windows11Fixer    │ [11] LibreWolf               │                             │\n",
           "│                          │ [12] Activator         │                              │                             │\n",
           "│                          │                        │                              │                             │\n"
          " ├──────────────────────────┴────────────────────────┴──────────────────────────────┴─────────────────────────────┤\n",
           "│                                Ex.: 'D2' ─ HoneCtrl │ N ─ Next Page │ 99 ─ Exit                                │\n",
           "└────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘")
    while True:
        choose = input(": ")

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
            dl(1, "https://google.com/robots.txt", "WindowsOnReins.ps1", "WindowsOnReins")

        elif choose == "D7" or choose == "d7":
            dl(1, "https://github.com/SanGraphic/QuickBoost/releases/download/" + str(latest("SanGraphic/QuickBoost")) + "/QuickBoost.exe", "QuickBoost.exe", "QuickBoost")

        elif choose == "D8" or choose == "d8":
            dl(1, "https://raw.githubusercontent.com/xemulat/Windows-Toolkit/main/files/win10debloater.bat", "Win10Debloater.bat", "Win10Debloater")

        elif choose == "D9" or choose == "d9":
            dl(1, "https://github.com/Jisll/Sadcoy/releases/download/v" + str(latest("Jisll/Sadcoy")) + "/Sadcoy.exe", "Sadcoy.exe", "Sadcoy")

        elif choose == "n" or choose == "N":
            p2()

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

        # =============< Apps

        elif choose == "A1" or choose == "a1":
            dl(1, "https://raw.githubusercontent.com/xemulat/Windows-Toolkit/main/files/choco.bat", "choco.bat", "Choco")

        elif choose == "A2" or choose == "a2":
            system("choco install brave")

        elif choose == "A3" or choose == "a3":
            system("choco install firefox")

        elif choose == "A4" or choose == "a4":
            system("choco install chromium")

        elif choose == "A5" or choose == "a5":
            system("choco install eartrumpet")

        elif choose == "A6" or choose == "a6":
            system("choco install modernflyouts")

        elif choose == "A7" or choose == "a7":
            system("choco install rainmeter")

        elif choose == "A8" or choose == "a8":
            system("choco install 7zip")

        elif choose == "A9" or choose == "a9":
            dl(1, "https://www.koshyjohn.com/software/MemClean.exe", "MemoryCleaner.exe", "Memory Cleaner")

        elif choose == "A10" or choose == "a10":
            system("choco install qbittorrent")

        elif choose == "A11" or choose == "a11":
            system("choco install librewolf")

        # =============< Cleanup

        elif choose == "C1" or choose == "c1":
            dl(1, "https://adwcleaner.malwarebytes.com/adwcleaner?channel=release", ".exe", "ADW Cleaner")

        elif choose == "C2" or choose == "c2":
            dl(1, "https://files1.majorgeeks.com/10afebdbffcd4742c81a3cb0f6ce4092156b4375/drives/ATF-Cleaner.exe", "ATF-Cleaner.exe", "ATF Cleaner")

        elif choose == "C3" or choose == "c3":
            dl(1, "", ".exe", "")

        elif choose == "C4" or choose == "c4":
            dl(1, "", ".exe", "")

        elif choose == "C5" or choose == "c5":
            dl(1, "", ".exe", "")

        elif choose == "C5" or choose == "c5":
            dl(1, "", ".exe", "Malwarebytes")

        else:
            print("No option named " + choose)
            sleep(3)
            p1()
def p2():
    cls()
    print(" ┌──────────────────────────┬────────────────────────┬──────────────────────────────┬─────────────────────────┐\n", 
          "│                          │                        │                              │                         │\n",
          "├──────────────────────────┼────────────────────────┼──────────────────────────────┼─────────────────────────┤\n", 
          "│                          │                        │                              │                         │\n",
          "│                          │                        │                              │                         │\n",
          "│                          │                        │                              │                         │\n",
          "│                          │                        │                              │                         │\n",
          "│                          │                        │                              │                         │\n",
          "│                          │                        │                              │                         │\n",
          "│                          │                        │                              │                         │\n",
          "│                          │                        │                              │                         │\n",
          "│                          │                        │                              │                         │\n",
          "│                          │                        │                              │                         │\n",
          "│                          │                        │                              │                         │\n",
          "│                          │                        │                              │                         │\n",
          "│                          │                        │                              │                         │\n"
          " ├──────────────────────────┴────────────────────────┴──────────────────────────────┴─────────────────────────┤\n",
          "│                              Ex.: 'D2' ─ HoneCtrl │ N ─ Next Page │ 99 ─ Exit                              │\n",
          "└────────────────────────────────────────────────────────────────────────────────────────────────────────────┘")
    choose = input(": ")

    if choose == "99":
        exit()
    
    elif choose == "n" or "N":
        p1()

if __name__ == __name__:
    prep()
    p1()
