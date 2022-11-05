from os import startfile, system # Standard Python3 libs
from urllib.request import urlretrieve
from os.path import isfile
from time import sleep
from sys import exit
try:
    # Custom / Community made libs
    from psutil import cpu_count, cpu_percent, disk_usage, virtual_memory
    from XeLib import cls, printer, download, color, getmyping
    from colorama import init, Fore, Back
    from lastversion import latest
except:
    printer.lprint("Installing required libraries, please wait...")
    system("pip install -U XeLib lastversion colorama psutil")
    printer.lprint("Libraries installed successfully!")
def prep():
    cls()
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
            try:
                printer.lprint("Downloading " + "XTBox "+str(latest("xemulat/XToolbox")) + " ...")
                urlretrieve("https://github.com/xemulat/XToolbox/releases/download/v"+str(latest("xemulat/XToolbox"))+"/XTBox.exe", "XTBox"+str(latest("xemulat/XToolbox"))+".exe")
                printer.lprint("XTBox "+str(latest("xemulat/XToolbox")) + ' Downloaded!')
                print("This program will exit in 3s...")
                sleep(3)
                startfile("XTBox"+str(latest("xemulat/XToolbox"))+".exe")
                exit()
            except:
                printer.lprint("Can't complete updates, aborting...") ; sleep(4)
        else:
            print(doupdate + " Isn't an option, try again.") ; sleep(2)

def dl(org, url, urlr, name):
    try:
        if isfile(urlr) == True:
            printer.lprint("ERROR 1 - File " + urlr + " already exists!")
            chose = input("Overwrite? (Y/n): ")
            if chose == "Y" or chose == "y":
                pass
            elif chose == "N" or chose == "n":
                if org == 1: p1()
                if org == 2: p2()
                if org == "3": p3()
    except:
        printer.lprint("ERROR 2: Can't check for file overwrite. Missing file premissions?")
        sleep(6)
    
    try:
        download(url, urlr, name)
        if urlr != "WindowsOnReins.ps1":
            startfile(urlr)
        if org == 1: p1()
    except:
        printer.lprint("ERROR 3: Can't download file from the server...")
        sleep(3)

def runaspowershell(command, filename):
    fp = open(filename+".bat", 'w')
    fp.write(r'@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "'+command+'"')
    fp.close()
    startfile(filename+".bat")

def eula():
    cls()
    z = True
    readityoucanacceptin5sorels = Fore.RED + "Read it, You can accept in 5s" + Fore.WHITE
    while z == True:
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
        agree = input("Do you agree? ("+Fore.GREEN+"Y"+Fore.WHITE+"/"+Fore.RED+"n"+Fore.WHITE + "): ")
        if agree == "y" or agree == "Y":
            print("You agreed to the EULA.")
            fp = open('EULA.XTB', 'w')
            fp.write('True')
            fp.close()
            z = False
        elif agree == "n" or agree == "N":
            print("Ok, come back if you change your mind.")
            exit(sleep(3))
        else:
            print("That wasn't one of the options...")
            sleep(2)
            cls()
    del z

def helpe(origin):
    cls()
    e = Back.RED+"Red"+Back.RESET
    ng = Back.RED+"DNGR"+Back.RESET
    ree = Back.GREEN+"Green"+Back.RESET
    print(" ┌─────────────────────────────────────────────────────────────┐\n",
           "│ Keybind │ Command                                           │\n",
           "│    H    │ Help Page (this page)                             │\n",
           "│    N    │ Next Page                                         │\n",
           "│    B    │ Back                                              │\n",
           "│    UN   │ Uninstalls The Program                            │\n",
           "│    99   │ Exit                                              │\n",
           "│    PC   │ PC Stats                                          │\n",
           "├─────────────────────────────────────────────────────────────┤\n",
           "│ Color   │ Meaning                                           │\n",
          f"│ {e}     │ Dangerous Option                                  │\n",
          f"│ {ng}    │ Option that can f*ck up your PC                   │\n",
          f"│ {ree}   │ Recommended Option                                │\n",
           "├─────────────────────────────────────────────────────────────┤\n",
           "│ Error code │ Explanation                                    │\n",
           "│      1     │ File already exists                            │\n",
           "│      2     │ Can't check for file overwrite                 │\n",
           "│      3     │ Can't download file from the server            │\n",
           "├─────────────────────────────────────────────────────────────┤\n",
           "│ If scrips won't execute, run this in PowerShell press P     │\n",
           "├─────────────────────────────────────────────────────────────┤\n",
           "│                   Press ENTER to go back.                   │\n",
           "└─────────────────────────────────────────────────────────────┘\n")
    d = input("> ")
    if d == "p" or d == "P": runaspowershell("Set-ExecutionPolicy Unrestricted -Scope CurrentUser", "SetExecutionPolicy")
    if origin == 1:   p1()
    elif origin == 2: p2()
    elif origin == 3: p3()

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
        if choose == "1": dl(1, "https://liveinstaller.eset.systems/odc/4e8c5ac2-4b04-4580-b453-45e209c6850d/eset_smart_security_premium_live_installer.exe", "ESETSmartSecurity.exe", "ESET Smart Security Premium")
        elif choose == "2": dl(1, "https://liveinstaller.eset.systems/odc/a2fae1b5-a31e-4f3a-a0c9-242f9f0cf51b/eset_internet_security_live_installer.exe", "ESETInternetSecurity.exe", "ESET Internet Security")
        elif choose == "3": dl(1, "https://liveinstaller.eset.systems/odc/f41b6af0-4718-4e4e-9ae5-ddf25b3ba713/eset_nod32_antivirus_live_installer.exe", "ESETNOD32.exe", "ESET NOD32 Antivirus")
        elif choose == "4": dl(1, "https://liveinstaller.eset.systems/odc/a9233029-a9e4-4a49-9005-82e4b994f765/eset_nod32_antivirus_live_installer.exe", "ESETNOD32Gamer.exe", "ESET NOD32 Antivirus Gamer Edition")
        elif choose == "5": dl(1, "https://liveinstaller.eset.systems/odc/0af63a7b-d4e0-4e5c-a4dc-c58fed3d6b78/eset_smart_security_premium_live_installer.exe", "ESETForSmallOffice.exe", "ESET Security for Small Office")
        elif choose == "B" or chooseeset == "b": p1()
        elif choose == "99": exit()
        else: print("No option named " + chooseeset) ; sleep(3)

def quicktweaks():
    while True:
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

        if choose == "1": dl(99, "https://raw.githubusercontent.com/xemulat/Windows-Toolkit/main/files/AntiTrackTime.bat", "AntiTrackTime.bat", "AntiTrackTime")
        elif choose == "2": urlretrieve("https://raw.githubusercontent.com/xemulat/Windows-Toolkit/main/files/Enable%20Window%20Network%20Auto-Tuning.bat", "NoNetworkAutotuneREVERT.bat") ;  dl(99, "https://raw.githubusercontent.com/xemulat/Windows-Toolkit/main/files/Disable%20Window%20Network%20Auto-Tuning.bat", "NoNetworkAutoTune.bat", "NoNetworkAutoTune")
        elif choose == "3": dl(99, "https://raw.githubusercontent.com/tcja/Windows-10-tweaks/master/SSD_Optimizations.reg", "OptimizeSSD.reg", "OptimizeSSD")
        elif choose == "4": dl(99, "https://raw.githubusercontent.com/tcja/Windows-10-tweaks/master/Disable_Action_Center.reg", "NoActionCenter.reg", "NoActionCenter")
        elif choose == "5": dl(99, "https://raw.githubusercontent.com/tcja/Windows-10-tweaks/master/Disable_News_and_Interests_on_taskbar_feature_for_all_users.reg", "NoNews.reg", "NoNews")
        elif choose == "6": dl(99, "https://raw.githubusercontent.com/tcja/Windows-10-tweaks/master/OneDrive_Uninstaller_v1.2.bat", "NoOneDrive.bat", "NoOneDrive")
        elif choose == "7": dl(99, "https://raw.githubusercontent.com/tcja/Windows-10-tweaks/master/RemoveXboxAppsBloat.bat", "NoXboxBloat.bat", "NoXboxBloat")
        elif choose == "8": dl(99, "https://raw.githubusercontent.com/tcja/Windows-10-tweaks/master/QoS_Limiter.reg", "LimitQoS.reg", "LimitQoS")
        elif choose == "9": dl(99, "https://raw.githubusercontent.com/tcja/Windows-10-tweaks/master/other_scripts/XanderBaatzTweaks.reg", "XanderTweak.reg", "Xander Tweak")
        elif choose == "10": dl(99, "https://raw.githubusercontent.com/tcja/Windows-10-tweaks/master/Add_Copy_path_to_context_menu.reg", "AddCopyPath.reg", "AddCopyPath")
        elif choose == "11": dl(99, "https://raw.githubusercontent.com/tcja/Windows-10-tweaks/master/darkmodetoggle/darkmodeON.reg", "DarkModeON.reg", "DarkMode")
        elif choose == "12": dl(99, r"https://raw.githubusercontent.com/couleurm/couleurstoolbox/main/3%20Windows%20Tweaks/0%20Quality%20of%20life%20tweaks/Take%20Ownership%20in%20context%20menu/Add%20Take%20Ownership.reg", "AddTakeOwnership.reg", "AddTakeOwnership")
        elif choose == "B" or choose == "b": p1()
        elif choose == "99": exit()
        else: print("No option named " + choose) ; sleep(3)

# Set variables for later use
class Setvars():
    def rama():
        # RAM / VMEM percent
        vmp = str(virtual_memory().percent).split(".", 1)[0]
        checkram =  len(vmp)
        if checkram == 1:   helpline1 = "  "
        elif checkram == 2: helpline1 = " "
        elif checkram == 3: helpline1 = ""
        else: helpline1 = ""
        if float(vmp) > 60:
            return color(vmp + "%", 2) + " / 100%"+helpline1
        else:
            return  vmp + "% / 100%"+helpline1

    def c():
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
            return color(lf + "C / " + lt.replace(".0", "") + "T"+helpline0+helpline6, 2)
        else:
            return lf + "C / " + lt.replace(".0", "") + "T"+helpline0+helpline6

    def cpup():
        # CPU utiliation
        cpup = str(cpu_percent()).replace("%", "").split(".", 1)[0]
        checkcpu = len(cpup)
        if checkcpu == 1:   helpline2 = " "
        elif checkcpu == 2: helpline2 = ""
        else: helpline2 = ""
        if int(cpup) > 60:
            return color(cpup, 2) + "% / 100%" + helpline2
        else:
            return cpup + "% / 100%" + helpline2

    def dusage():
        # C:/ Disk usage
        dusa = str(disk_usage("/").total/1073741824)
        duss = str(disk_usage("/").used/1073741824)
        checkdisk =  len(str(duss.split(".", 1)[0]))
        if checkdisk == 2:   helpline3 = "   "
        elif checkdisk == 3: helpline3 = "  "
        elif checkdisk == 4: helpline3 = " "
        else: helpline2 = ""
        if (int(dusa.split(".", 1)[0]))/(int(duss.split(".", 1)[0])) < 0.5:
            return color(duss.split(".", 1)[0] + "GB", 2) + " / " + dusa.split(".", 1)[0] + "GB" + helpline3
        else:
            return duss.split(".", 1)[0] + "GB" + " / " + dusa.split(".", 1)[0] + "GB" + helpline3

    def qwert():
        #Check ping DON'T TOUCH IT!!!
        checkping = len(str(getmyping().replace("ms", "").replace(Fore.RED or Fore.GREEN, "")))
        if checkping == 6:   helpline4 = "    "
        elif checkping == 7: helpline4 = "   "
        elif checkping == 8: helpline4 = "  "
        else: helpline4 = ""
        return getmyping()+Fore.RESET+helpline4


def pcstats(origin):
    printer.lprint("Checking Your PC...")
    ram = Setvars.rama()
    cpupercent = Setvars.cpup()
    diskusage = Setvars.dusage()
    ping = Setvars.qwert()
    cpu = Setvars.c()
    printer.lprint("PC Check done!")
    cls()
    print(" ┌───────┬───────────\n",
          f"│ Ping  │ {ping}\n",
          f"│ Disk  │ {diskusage}\n",
          f"│ CPU   │ {cpu}\n",
          f"│ CPUP  │ {cpupercent}\n",
          f"│ RAM   │ {ram}\n",
           "└───────┴───────────")
    input("> ")
    if origin == 1:   p1()
    elif origin == 2: p2()
    

def p1():
    windowsonreinddddd = color("WindowsOnReins  DNGR", 2)
    posttweaksjfjfjf = color("PostTweaks    DNGR", 2)
    ohdwindowwwwwwwww = color("OHD Windows    DNGR", 2)
    neCtrl = color("HoneCtrl", 1)
    malwarebyt = color("Malwarebytes", 1)
    rav = color("Brave", 1)
    firef = color("Firefox", 1)
    sweetyli = color("SweetyLite", 1)
    quicktwea = color("QuickTweaks", 1)

    while True:
        cls()
        print(f" ┌───────────────────────────────────────────────────┬─────────────────────────────────────────────────────────────────┐\n", 
               f"│ {xtoolboxvv1asdfghjzz}                            │ Made by {xemulatddddd} For {a} │ Internet: {qwert}              │\n",
               f"│ Update Status: {Errorhd} │ RAM: {ramavailz}       │ CPU: {cpuavailifffff} | {c}    │ Disk: {dusagehebeded}          │\n",
               f"├──────────────────────────┼────────────────────────┼────────────────────────────────┼────────────────────────────────┤\n", 
               f"│ [D] Debloat              │ [T] Tweaks             │ [A] Apps                       │ [C] Cleaning / Antiviruses     │\n",
               f"├──────────────────────────┼────────────────────────┼────────────────────────────────┼────────────────────────────────┤\n", 
               f"│ [1] EchoX                │ [1] {posttweaksjfjfjf} │ [1] Chocholatey                │ [1] ADW Cleaner                │\n",
               f"│ [2] {neCtrl}             │ [2] Insider Enroller   │ [2] {rav}                      │ [2] ATF Cleaner                │\n",
               f"│ [3] ShutUp10             │ [3] Windows11Fixer     │ [3] {firef}                    │ [3] Defraggler                 │\n",
               f"│ [4] Optimizer            │ [4] Activator          │ [4] Lively Wallpaper           │ [4] {malwarebyt}               │\n",
               f"│ [5] PyDebloatX           │ [5] AntiRoundCorners   │ [5] LibreWolf                  │ [5] ESET Online Scanner        │\n",
               f"│ [6] {windowsonreinddddd} │ [6] FixDrag&Drop       │ [6] qBittorrent                │ [6] ESET                       │")
        print(f" │ [7] QuickBoost           │ [7] Winaero Tweaker    │ [7] Rainmeter                  │                                │\n",
               f"│ [8] Win10Debloater       │ [8] CTT WinUtil        │ [8] 7-Zip                      │                                │\n",
               f"│ [9] SadCoy               │                        │ [9] Memory Cleaner             │                                │\n",
               f"│ [10] {sweetyli}          │ [QT] {quicktwea}       │                                │                                │\n",
               f"│ [11] {ohdwindowwwwwwwww} │                        │                                │                                │\n",
               f"│ [12] WindowsSpyBlocker   │                        │                                │                                │\n",
               f"│ [13] PrivateZilla        │                        │                                │                                │\n",
               f"│ [14] ZusierAIO           │                        │                                │                                │\n",
               f"│ [15] Azurite             │                        │                                │                                │\n",
               f"│                          │                        │                                │                                │\n",
               f"├──────────────────────────┴────────────────────────┴────────────────────────────────┴────────────────────────────────┤\n",
               f"│             Ex.: 'D2' ─ HoneCtrl │ N ─ Next Page │ 99 ─ Exit │ H - Help │ UN - Uninstall │ PC - PcStats             │\n",
               f"└─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘")
        choose = input("> ")

        # =============< Debloat
        if   choose == "D1" or choose == "d1":   dl(1, "https://raw.githubusercontent.com/UnLovedCookie/EchoX/main/EchoX.bat", "EchoX.bat", "EchoX")
        elif choose == "D2" or choose == "d2":   dl(1, "https://raw.githubusercontent.com/auraside/HoneCtrl/main/HoneCtrl.bat", "HoneCtrl.bat", "HoneCtrl")
        elif choose == "D3" or choose == "d3":   dl(1, "https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe", "ShutUp10.exe", "ShutUp10")
        elif choose == "D4" or choose == "d4":   dl(1, "https://github.com/hellzerg/optimizer/releases/download/" + str(latest("hellzerg/optimizer")) + "/Optimizer-" + str(latest("hellzerg/optimizer")) + ".exe", "Optimizer.exe", "Optimizer")
        elif choose == "D5" or choose == "d5":   dl(1, "https://github.com/Teraskull/PyDebloatX/releases/download/" + str(latest("Teraskull/PyDebloatX")) + "/PyDebloatX_portable.exe", "PyDebloatX.exe", "PyDebloatX")
        elif choose == "D6" or choose == "d6":   dl(1, "https://raw.githubusercontent.com/gordonbay/Windows-On-Reins/master/wor.ps1", "WindowsOnReins.ps1", "WindowsOnReins")
        elif choose == "D7" or choose == "d7":   dl(1, "https://github.com/SanGraphic/QuickBoost/releases/download/" + str(latest("SanGraphic/QuickBoost")) + "/QuickBoost.exe", "QuickBoost.exe", "QuickBoost")
        elif choose == "D8" or choose == "d8":   runaspowershell("iwr -useb https://git.io/debloat|iex", "Win10Debloat")
        elif choose == "D9" or choose == "d9":   dl(1, "https://github.com/Jisll/Sadcoy/releases/download/v" + str(latest("Jisll/Sadcoy")) + "/Sadcoy.exe", "Sadcoy.exe", "Sadcoy")
        elif choose == "D10" or choose == "d10": dl(1, "https://cdn.discordapp.com/attachments/953004468503461948/1031289678013411368/SweetyLite2.bat", "SweetyLite.bat", "SweetyLite")
        elif choose == "D11" or choose == "d11": runaspowershell("iwr -useb 'https://simeononsecurity.ch/scripts/windowsoptimizeandharden.ps1'|iex", "OHDWindows")
        elif choose == "d12" or choose == "D12": dl(1, "https://github.com/crazy-max/WindowsSpyBlocker/releases/download/" + str(latest("crazy-max/WindowsSpyBlocker")) + "/WindowsSpyBlocker.exe", "WindowsSpyBlocker.exe", "WindowsSpyBlocker")
        elif choose == "d13" or choose == "D13": dl(1, "https://github.com/builtbybel/privatezilla/releases/download/" + str(latest("builtbybel/privatezilla")) + "/privatezilla.zip", "PrivateZilla.zip", "PrivateZilla")
        elif choose == "d14" or choose == "D14": dl(1, "https://raw.githubusercontent.com/Zusier/Zusiers-optimization-Batch/master/Zusier%20AIO.bat", "ZusierAIO.bat", "ZusierAIO")
        elif choose == "d15" or choose == "D15": dl(1, r"https://archive.org/download/azurite-v1.1.7-setup/Azurite%20Setup%201.1.7.exe", "Azurite.exe", "Azurite")

        # =============< Tweaks
        elif choose == "T1" or choose == "t1":   dl(1, "https://raw.githubusercontent.com/ArtanisInc/Post-Tweaks/main/PostTweaks.bat", "PostTweaks.bat", "PostTweaks")
        elif choose == "T2" or choose == "t2":   dl(1, "https://github.com/Jathurshan-2019/Insider-Enroller/releases/download/v" + str(latest("Jathurshan-2019/Insider-Enroller")) + "/Insider_Enrollerv" + str(latest("Jathurshan-2019/Insider-Enroller")) + ".zip", "InsiderEnroller.zip", "InsiderEnroller")
        elif choose == "T3" or choose == "t3":   dl(1, "https://github.com/99natmar99/Windows-11-Fixer/releases/download/v" + str(latest("99natmar99/Windows-11-Fixer")) + "/Windows.11.Fixer.v" + str(latest("99natmar99/Windows-11-Fixer")) + ".Portable.zip", "Windows11Fixer.zip", "Windows11Fixer")
        elif choose == "T4" or choose == "t4":   runaspowershell("iwr -useb https://massgrave.dev/get | iex", "MAS")
        elif choose == "T5" or choose == "t5":   dl(1, "https://github.com/valinet/Win11DisableRoundedCorners/releases/download/" + str(latest("valinet/Win11DisableRoundedCorners")) + "/Win11DisableOrRestoreRoundedCorners.exe", "AntiRoundCorners.exe", "AntiRoundCorners")
        elif choose == "T6" or choose == "t6":   dl(1, "https://github.com/HerMajestyDrMona/Windows11DragAndDropToTaskbarFix/releases/download/v." + str(latest("HerMajestyDrMona/Windows11DragAndDropToTaskbarFix")) + "-release/Windows11DragAndDropToTaskbarFix.exe", "FixDragAndDrop.exe", "Fix Drag&Drop")
        elif choose == "T7" or choose == "t7":   dl(1, "https://winaero.com/downloads/winaerotweaker.zip", "WinaeroTweaker.zip", "Winaero Tweaker")
        elif choose == "T8" or choose == "t8":   runaspowershell("irm christitus.com/win | iex", "CTT")
        elif choose == "QT" or choose == "qt" or choose == "Qt" or choose == "qT": quicktweaks()

        # =============< Apps
        elif choose == "A1" or choose == "a1":  dl(1, "https://raw.githubusercontent.com/xemulat/Windows-Toolkit/main/files/choco.bat", "choco.bat", "Choco")
        elif choose == "A2" or choose == "a2":  dl(1, "https://referrals.brave.com/latest/BraveBrowserSetup.exe", "Brave.exe", "Brave Browser")
        elif choose == "A3" or choose == "a3":  dl(1, "https://download-installer.cdn.mozilla.net/pub/firefox/releases/105.0.3/win32/en-US/Firefox%20Installer.exe", "Firefox.exe", "Firefox")
        elif choose == "A4" or choose == "a4":  dl(1, "https://github.com/rocksdanister/lively/releases/download/v" + str(latest("rocksdanister/lively")) + "/lively_setup_x86_full_v" + str(latest("rocksdanister/lively")).replace(".", "") + ".exe", "LivelyWallpaper.exe", "Lively Wallpaper")
        elif choose == "A5" or choose == "a5":  dl(1, "https://gitlab.com/librewolf-community/browser/windows/uploads/f5c35c96a94b78ac847f19f6c3d3e49e/librewolf-105.0.3-1.en-US.win64-setup.exe", "LibreWolf.exe", "LibreWolf")
        elif choose == "A6" or choose == "a6":  dl(1, "https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases/download/release-" + str(latest("c0re100/qBittorrent-Enhanced-Edition")) + "/qbittorrent_enhanced_" + str(latest("c0re100/qBittorrent-Enhanced-Edition")) + "_Qt6_setup.exe", "qBittorrent.exe", "qBittorrent")
        elif choose == "A7" or choose == "a7":  dl(1, "https://github.com/rainmeter/rainmeter/releases/download/v4.5.16.3687/Rainmeter-4.5.16.exe", "Rainmeter.exe", "Rainmeter")
        elif choose == "A8" or choose == "a8":  dl(1, "https://www.7-zip.org/a/7z2201-x64.exe", "7Zip.exe", "7-Zip")
        elif choose == "A9" or choose == "a9":  dl(1, "https://www.koshyjohn.com/software/MemClean.exe", "MemoryCleaner.exe", "Memory Cleaner")

        # =============< Cleanup
        elif choose == "C1" or choose == "c1":  dl(1, "https://adwcleaner.malwarebytes.com/adwcleaner?channel=release", ".exe", "ADW Cleaner")
        elif choose == "C2" or choose == "c2":  dl(1, "https://files1.majorgeeks.com/10afebdbffcd4742c81a3cb0f6ce4092156b4375/drives/ATF-Cleaner.exe", "ATF-Cleaner.exe", "ATF Cleaner")
        elif choose == "C3" or choose == "c3":  dl(1, "https://download.ccleaner.com/dfsetup222.exe", "Defraggler.exe", "Defraggler")
        elif choose == "C4" or choose == "c4":  dl(1, "https://www.malwarebytes.com/api/downloads/mb-windows?filename=MBSetup-37335.37335.exe", "Malwarebytes.exe", "Malwarebytes")
        elif choose == "C5" or choose == "c5":  dl(1, "https://download.eset.com/com/eset/tools/online_scanner/latest/esetonlinescanner.exe", "ESETOnlineScanner.exe", "ESET Online Scanner")
        elif choose == "C6" or choose == "c6":  chooseeset()

        # =============< QOL Lines
        elif choose == "n" or choose == "N": p2()
        elif choose == "b" or choose == "B": p3()
        elif choose == "h" or choose == "H": helpe(1)
        elif choose == "PC" or choose == "Pc" or choose == "pc" or choose == "pC": pcstats(1)
        if choose == "99": exit()
        elif choose == "un" or choose == "Un" or choose == "uN" or choose == "UN":
            real = input("Are you sure (Y/n): ")
            if real == "y" or real == "Y":
                fp = open('delxtb.bat', 'w')
                fp.write('del XTBox.exe\n'
                         'del EULA.XTB\n'
                        'start /b "" cmd /c del "%~f0"&exit /b')
                fp.close()
                startfile("delxtb.bat")
                exit()
        else: print("No option named " + choose); sleep(3)

def tuxdl(line1ddddddd, line2ddddddd, line3ddddddd, distro):
    while True:
        print(f" ┌───────────────────────────────┐\n",
               f'│ {line1ddddddd}                │\n',
               f"│ {line2ddddddd}                │\n",
               f"│ {line3ddddddd}                │\n",
               f"│                               │\n",
               f"├───────────────────────────────┤\n",
               f"│    Choose your Distro Type    │\n",
               f"└───────────────────────────────┘\n")
        choose = input("> ")

        if   distro == 1: # Linux Mint 21 - Vanessa
            if   choose == "1":  dl(2, "https://mirror.rackspace.com/linuxmint/iso/stable/21/linuxmint-21-cinnamon-64bit.iso", "LinuxMint-21.3-Cinnamon.iso", "Linux Mint Cinnamon")
            elif choose == "2":  dl(2, "https://mirror.rackspace.com/linuxmint/iso/stable/21/linuxmint-21-mate-64bit.iso", "LinuxMint-21.3-MATE.iso", "Linux Mint MATE")
            elif choose == "3":  dl(2, "https://mirror.rackspace.com/linuxmint/iso/stable/21/linuxmint-21-xfce-64bit.iso", "LinuxMint-21.3-Xfce.iso", "Linux Mint Xfce")
            else: print("No option named" + choose); sleep(4)

        elif distro == 2: # Pop!_OS - 22.04
            if   choose == "1":  dl(2, "https://iso.pop-os.org/22.04/amd64/nvidia/16/pop-os_22.04_amd64_nvidia_16.iso", "PopOS-Nvidia.iso", "Pop!_OS Nvidia")
            elif choose == "2":  dl(2, "https://iso.pop-os.org/22.04/arm64/raspi/2/pop-os_22.04_arm64_raspi_2.img.xz", "PopOS-RPI4.img.xz", "Pop!_OS RPI 4 Tech Previwe")
            elif choose == "3":  dl(2, "https://iso.pop-os.org/22.04/amd64/intel/16/pop-os_22.04_amd64_intel_16.iso", "PopOS-LTS.iso", "Pop!_OS LTS")
            else: print("No option named" + choose); sleep(4)

        elif distro == 3: # Ubuntu - 22.10 Kinetic Kudu
            if   choose == "1":  dl(2, "https://releases.ubuntu.com/22.10/ubuntu-22.10-desktop-amd64.iso", "Ubuntu.iso", "Ubuntu")
            elif choose == "2":  dl(2, "https://cdimage.ubuntu.com/kubuntu/releases/22.10/release/kubuntu-22.10-desktop-amd64.iso", "Kubuntu.iso", "Kubuntu")
            elif choose == "3":  dl(2, "https://cdimage.ubuntu.com/lubuntu/releases/22.10/release/lubuntu-22.10-desktop-amd64.iso", "Lubuntu.iso", "Lubuntu")
            else: print("No option named" + choose); sleep(4)

        elif distro == 4: # Arch Linux - 2022.10.01
            if   choose == "1":  dl(2, "https://mirror.rackspace.com/archlinux/iso/2022.10.01/archlinux-2022.10.01-x86_64.iso", "Arch-2022.10.iso", "Arch 2022.10")
            elif choose == "2":  dl(2, "https://mirror.rackspace.com/archlinux/iso/2022.10.01/archlinux-x86_64.iso", "Arch-Old.iso", "")
            else: print("No option named" + choose); sleep(4)

        elif distro == 5: # Artix Linux OpenRC - 20220713
            if   choose == "1":  dl(2, "https://mirrors.dotsrc.org/artix-linux/iso/artix-plasma-openrc-20220713-x86_64.iso", "Artix-Plasma.iso", "Artix Plasma")
            elif choose == "2":  dl(2, "https://mirrors.dotsrc.org/artix-linux/iso/artix-xfce-openrc-20220713-x86_64.iso", "Artix-Xfce.iso", "Artix Xfce")
            elif choose == "3":  dl(2, "https://mirrors.dotsrc.org/artix-linux/iso/artix-mate-openrc-20220713-x86_64.iso", "Artix-MATE.iso", "Artix MATE")
            else: print("No option named" + choose); sleep(4)

        elif distro == 6: # Solus - 4.3
            if   choose == "1":  dl(2, "https://mirrors.rit.edu/solus/images/4.3/Solus-4.3-Budgie.iso", "Solus-Budgie.iso", "Solus Budgie")
            elif choose == "2":  dl(2, "https://mirrors.rit.edu/solus/images/4.3/Solus-4.3-Plasma.iso", "Solus-Plasma.iso", "Solus Plasma")
            elif choose == "3":  dl(2, "https://mirrors.rit.edu/solus/images/4.3/Solus-4.3-GNOME.iso", "Solus-GNOME.iso", "Solus GNOME")
            else: print("No option named" + choose); sleep(4)

        elif distro == 7: # Debian - 11.5.0
            if   choose == "1":  dl(2, "https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-11.5.0-amd64-netinst.iso", "Debian-NetInst.iso", "Debian NetInstall")
            else: print("No option named" + choose); sleep(4)

        elif distro == 8: # Garuda Linux - Auto-Updates
            if   choose == "1":  dl(2, "https://iso.builds.garudalinux.org/iso/latest/garuda/dr460nized-gaming/latest.iso?fosshost=1", "Garuda-DR460NIZED.iso", "Garuda DR460NIZED Gaming")
            elif choose == "2":  dl(2, "https://iso.builds.garudalinux.org/iso/latest/garuda/gnome/latest.iso?fosshost=1", "Garuda-GNOME.iso", "Garuda GNOME")
            elif choose == "3":  dl(2, "https://iso.builds.garudalinux.org/iso/latest/garuda/xfce/latest.iso?fosshost=1", "Garuda-Xfce.iso", "Garuda Xfce")
            else: print("No option named" + choose); sleep(4)
        
        elif distro == 9: # Zorin OS - 16.2
            if   choose == "1":  dl(2, "https://mirrors.edge.kernel.org/zorinos-isos/16/Zorin-OS-16.2-Core-64-bit.iso", "ZorinOS-Core.iso", "Zorin OS Core")
            elif choose == "2":  dl(2, "https://mirrors.edge.kernel.org/zorinos-isos/16/Zorin-OS-16.2-Lite-64-bit.iso", "ZorinOS-Lite.iso", "Zorin OS Lite")
            else: print("No option named" + choose); sleep(4)

def muulter(org, file1, name1, namez1, fname1, 
                 file2, name2, namez2, fname2,
                 file3, name3, namez3, fname3):
    print("Version:\n"
         f"[1] {name1}\n"
         f"[2] {name2}")
    if name3 and file3 and namez3 and fname3 != False: print(f"[3] {name3}") ; f3 = False
    choose = input("> ")
    if choose == "1": dl(org, file1, fname1, namez1)
    elif choose == "2": dl(org, file2, fname2, namez2)
    elif choose == "3" and f3 == True: dl(org, file3, fname3, namez3)
    else: print("No option named " + choose) ; sleep(3)


def multidl(file):
    if   file == "ReviOS": muulter(2, "https://archive.org/download/revi-os-11-22.10/ReviOS-11-22.10.iso", "ReviOS 11", "ReviOS 11", "ReviOS-11.iso", 
                                      "https://archive.org/download/revi-os-10-22.10/ReviOS-10-22.10.iso", "ReviOS 10", "ReviOS 10", "ReviOS-10.iso", False, False, False, False)

    elif file == "AtlasOS": muulter(2, "https://github.com/Atlas-OS/atlas-releases/releases/download/20H2-v0.5.2/Atlas_v0.5.2_21H2.iso", "21H2 + Faceit", "AtlasOS 21H2", "AtlasOS-21H2.iso",
                                       "https://github.com/Atlas-OS/atlas-releases/releases/download/20H2-v0.5.2/Atlas_v0.5.2.iso", "20H2 + Better than Old", "AtlasOS 20H2", "AtlasOS-20H2.iso",
                                       "https://github.com/Atlas-OS/atlas-releases/releases/download/1803/Atlas_1803_v0.2.iso", "1803 + Old version", "AtlasOS 1803", "AtlasOS-1803.iso")

    elif file == "SimplifyWindows": muulter(2, "https://github.com/WhatTheBlock/WindowsSimplify/releases/download/iso/22621.525_221014.iso", "1.66GB - Extreme Lite with Store", "WindowsSimplify-1.66GB", "WindowsStimplfy-1.iso", 
                                               "https://github.com/WhatTheBlock/WindowsSimplify/releases/download/iso/22623.746_221018.iso", "1.73GB - No Windows Update", "WindowsSimplify-1.73GB", "WindowsSimplify-2.iso",
                                               "https://archive.org/download/simplify-windows-v2/22621.317_220811-2.iso", "1.83GB - Max Debloat", "WindowsSimplify-1.83GB", "WindowsStimplfy-3.iso")

    elif file == "Prism": muulter(3, "https://github.com/PrismLauncher/PrismLauncher/releases/download/"+str(latest("PrismLauncher/PrismLauncher"))+"/PrismLauncher-Windows-Portable-"+str(latest("PrismLauncher/PrismLauncher"))+".zip", "PrismLauncher Portable", "Portable", "PrismLauncher-Portable.zip", 
                                     "https://github.com/PrismLauncher/PrismLauncher/releases/download/"+str(latest("PrismLauncher/PrismLauncher"))+"/PrismLauncher-Windows-Setup-"+str(latest("PrismLauncher/PrismLauncher"))+".exe", "PrismLauncher Setup", "Setup", "PrismLauncher-Setup.exe", False, False, False, False)
    
    elif file == "GDLauncher": muulter(3, "https://github.com/gorilla-devs/GDLauncher/releases/download/v"+str(latest("gorilla-devs/GDLauncher"))+"/GDLauncher-win-portable.zip", "GDLauncher Portable", "Portable", "GDLauncher-Portable.zip", 
                                          "https://github.com/gorilla-devs/GDLauncher/releases/download/v"+str(latest("gorilla-devs/GDLauncher"))+"/GDLauncher-win-setup.exe", "GDLauncher Setup", "Setup", "GDLauncher-Setup.exe", False, False, False, False)

    elif file == "OpenAsar":
        fp = open('openasar.bat', 'w')
        fp.write('@echo off\n'
                 r'C:\Windows\System32\TASKKILL.exe /f /im Discord.exe' + "\n"
                 r'C:\Windows\System32\TASKKILL.exe /f /im Discord.exe' + "\n"
                 r'C:\Windows\System32\TASKKILL.exe /f /im Discord.exe' + "\n"
                 r'C:\Windows\System32\TIMEOUT.exe /t 5 /nobreak' + "\n"
                 r'copy /y "%localappdata%\Discord\app-1.0.9007\resources\app.asar" "%localappdata%\Discord\app-1.0.9007\resources\app.asar.backup"' + "\n"
                 r'powershell -Command "Invoke-WebRequest https://github.com/GooseMod/OpenAsar/releases/download/nightly/app.asar -OutFile \"$Env:LOCALAPPDATA\Discord\app-1.0.9007\resources\app.asar\""' + "\n"
                 r'start "" "%localappdata%\Discord\Update.exe" --processStart Discord.exe' + "\n"
                 r'goto 2>nul & del "%~f0"')
        fp.close()
        startfile("openasar.bat")
    
def linuxdl(distro):
    cls()
    if   distro == 1: tuxdl("[1] Cinnamon  ", "[2] MATE      ", "[3] Xfce      ", distro) # Linux Mint 21 - Vanessa
    elif distro == 2: tuxdl("[1] Nvidia    ", "[2] RPI4      ", "[3] LTS       ", distro) # Pop!_OS - 22.
    elif distro == 3: tuxdl("[1] Ubuntu    ", "[2] Kubuntu   ", "[3] Lubuntu   ", distro) # Ubuntu - 22.10 Kinetic Kudu
    elif distro == 4: tuxdl("[1] 2022.10   ", "[2] Bootstrap ", "              ", distro) # Arch Linux - 2022.10.01
    elif distro == 5: tuxdl("[1] Plasma    ", "[2] Xfce      ", "[3] MATE      ", distro) # Artix Linux OpenRC - 20220713
    elif distro == 6: tuxdl("[1] Budgie    ", "[2] Plasma    ", "[3] GNOME     ", distro) # Solus - 4.3
    elif distro == 7: tuxdl("[1] NetInst   ", "              ", "              ", distro) # Debian - 11.5.0
    elif distro == 8: tuxdl("[1] DR460NIZED", "[2] GNOME     ", "[3] Xfce      ", distro) # Garuda Linux - Auto-Updates
    elif distro == 9: tuxdl("[1] Core      ", "[2] Lite      ", "              ", distro) # Zorin OS - 16.2

def p2():
    window11 = color("Windows 11", 1)
    minttuxe = color("Linux Mint", 1)
    zorino = color("Zorin OS", 1)
    rectify = color("Rectify11", 1)
    atlaso = color("Atlas OS", 1)
    ruf = color("Rufus", 1)
    unetboot = color("UNetBootin", 2)
    windowssimpli = color("WindowsSimplify", 2)
    aero = color("Aero10", 2)
    while True:
        cls()
        print(f" ┌───────────────────────────────────────────────────┬────────────────────────────────┬────────────────────────────────┐\n", 
               f"│ {xtoolboxvv1asdfghjzz}                            │ Made by {xemulatddddd} For {a} │ Internet: {qwert}              │\n",
               f"│ Update Status: {Errorhd} │ RAM: {ramavailz}       │ CPU: {cpuavailifffff} | {c}    │ Disk: {dusagehebeded}          │\n",
               f"├──────────────────────────┼────────────────────────┼────────────────────────────────┼────────────────────────────────┤\n", 
               f"│ [L] Linux Distros        │ [W] Windows versions   │ [M] Modded Windows versions    │ [T] Tools                      │\n",
               f"├──────────────────────────┼────────────────────────┼────────────────────────────────┼────────────────────────────────┤\n", 
               f"│ [1] {minttuxe}           │ [1] {window11}         │ [1] {rectify}                  │ [1] {ruf}                      │\n",
               f"│ [2] Pop!_OS              │ [2] Windows 10         │ [2] {atlaso}                   │ [2] Balena Etcher              │\n",
               f"│ [3] Ubuntu               │ [3] Windows 8.1        │ [3] Ghost Spectre              │ [3] {unetboot}                 │")
        print(f" │ [4] Arch Linux           │ [4] Windows 8          │ [4] ReviOS                     │ [4] HeiDoc Iso Downloader      │\n",
               f"│ [5] Artix Linux          │ [5] Windows 7          │ [5] GGOS                       │                                │\n",
               f"│ [6] Solus                │                        │ [6] {windowssimpli}            │                                │\n",
               f"│ [7] Debian               │                        │ [7] {aero}                     │                                │\n",
               f"│ [8] Garuda               │                        │ [8] Tiny10                     │                                │\n",
               f"│ [9] {zorino}             │                        │ [9] KernelOS                   │                                │\n",
               f"│                          │                        │ [10] Windows 7 Super Nano      │                                │\n",
               f"│                          │                        │ [11] Windows 11 Debloated      │                                │\n",
               f"│                          │                        │                                │                                │\n",
               f"│                          │                        │                                │                                │\n",
               f"│                          │                        │                                │                                │\n",
               f"│                          │                        │                                │                                │\n",
               f"│                          │                        │                                │                                │\n",
               f"├──────────────────────────┴────────────────────────┴────────────────────────────────┴────────────────────────────────┤\n",
               f"│                     Ex.: 'D2' ─ HoneCtrl │ N ─ Next Page │ 99 ─ Exit │ H - Help │ PC - PcStats                      │\n",
               f"└─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘")
        choose = input("> ")

        # =============< TUX BLOCK
        if   choose == "l1" or choose == "L1": linuxdl(1) # Linux Mint 21 - Vanessa
        elif choose == "l2" or choose == "L2": linuxdl(2) # Pop!_OS - 22.04
        elif choose == "l3" or choose == "L3": linuxdl(3) # Ubuntu - 22.10 Kinetic Kudu
        elif choose == "l4" or choose == "L4": linuxdl(4) # Arch Linux - 2022.10.01
        elif choose == "l5" or choose == "L5": linuxdl(5) # Artix Linux OpenRC - 20220713
        elif choose == "l6" or choose == "L6": linuxdl(6) # Solus - 4.3
        elif choose == "l7" or choose == "L7": linuxdl(7) # Debian - 11.5.0
        elif choose == "l8" or choose == "L8": linuxdl(8) # Garuda Linux - Auto-Updates
        elif choose == "l9" or choose == "L9": linuxdl(9) # Zorin OS - 16.2

        # =============< Windows isos
        elif choose == "w1" or choose == "W1": dl(2, r"https://software.download.prss.microsoft.com/dbazure/Win11_22H2_EnglishInternational_x64v1.iso?t=3d974f1b-41e2-498d-8f99-77de72bf8786&e=1667248289&h=666d856a07511e309a27d6c8bcda83731278dc4e8f09a3b0b7e9a6e71830a484", "Windows-11.iso", "Windows 11")
        elif choose == "w2" or choose == "W2": dl(2, r"https://software.download.prss.microsoft.com/dbazure/Win10_22H2_EnglishInternational_x64.iso?t=7ec8b9b3-28fd-450a-8318-8577e6c17b12&e=1667248241&h=041331f504341b6f9a242563152566872829eccc22b6b60a66f70e4ac843c589", "Windows-10.iso", "Windows 10")
        elif choose == "w3" or choose == "W3": dl(2, r"https://archive.org/download/w8.1.vpro/W8.1.vPro.iso", "Windows-8.1.iso", "Windows 8.1")
        elif choose == "w4" or choose == "W4": dl(2, r"https://archive.org/download/windows-8_202210/Windows%208.iso", "Windows-8.iso", "Windows 8")
        elif choose == "w5" or choose == "W5": dl(2, r"https://archive.org/download/windows-7-x64-2/Windows%207%20%28x64%29.iso", "Windows-7.iso", "Windows 7")

        # =============< Modded isos
        elif choose == "m1" or choose == "M1": dl(2, r"https://archive.org/download/rectify-11-v-2/Rectify11%20%28v2%29.iso", "Rectify11.iso", "Rectify11 v2")
        elif choose == "m2" or choose == "M2": multidl("AtlasOS")
        elif choose == "m3" or choose == "M3": dl(2, r"https://download2390.mediafire.com/kpvhnmu3vfng/2z30tuoy3ojsp3h/WIN10.PRO.20H2.SUPERLITE%2BCOMPACT.U3.X64.GHOSTSPECTRE.%28W%29.iso", "GhostSpectre.iso", "Ghost Spectre")
        elif choose == "m4" or choose == "M4": multidl("ReviOS")
        elif choose == "m5" or choose == "M5": dl(2, r"https://archive.org/download/ggos-0.8.20/ggos-0.8.20.iso", "GGOS.iso", "GGOS 0.8.20")
        elif choose == "m6" or choose == "M6": multidl("SimplifyWindows")
        elif choose == "m7" or choose == "M7": dl(2, "https://archive.org/download/aero-10/Aero10.iso", "Aero10.iso", "Aero10")
        elif choose == "m8" or choose == "M8": dl(2, "https://archive.org/download/tiny-10_202210/Tiny%2010.iso", "Tiny10.iso", "Tiny10")
        elif choose == "m9" or choose == "M9": dl(2, "https://archive.org/download/kernel-os-22-h-2-beta/KernelOS%2022H2%20BETA.iso", "KernelOS.iso", "KernelOS")
        elif choose == "m10" or choose == "M10": dl(2, r"https://archive.org/download/windows-7-super-nano-2/Windows%207%20%28SuperNano%29.iso", "Windows-7-SuperNano.iso", "Windows 7 Super Nano")
        elif choose == "m11" or choose == "M11": dl(2, r"", "Windows-11-Debloated.iso", "Windows 11 Debloated")

        # =============< Tools
        elif choose == "t1" or choose == "T1": dl(2, "https://github.com/pbatard/rufus/releases/download/v"+str(latest("pbatard/rufus"))+"/rufus-"+str(latest("pbatard/rufus"))+".exe", "Rufus.exe", "Rufus")
        elif choose == "t2" or choose == "T2": dl(2, "https://github.com/balena-io/etcher/releases/download/v"+str(latest("balena-io/etcher"))+"/balenaEtcher-Portable-"+str(latest("balena-io/etcher"))+".exe", "Etcher-Portable.exe", "Balena Etcher")
        elif choose == "t3" or choose == "T3": dl(2, "https://github.com/unetbootin/unetbootin/releases/download/"+str(latest("unetbootin/unetbootin"))+"/unetbootin-windows-"+str(latest("unetbootin/unetbootin"))+".exe", "UNetBootin.exe", "UNetBootin")
        elif choose == "t4" or choose == "T4": dl(2, "https://www.heidoc.net/php/Windows-ISO-Downloader.exe", "HeiDoc-ISO-Downloader.exe", "HeiDoc Ios Downloader")

        # =============< QOL
        elif choose == "99": exit()
        elif choose == "n" or choose == "N": p3()
        elif choose == "b" or choose == "B": p1()
        elif choose == "h" or choose == "H": helpe(2)
        elif choose == "PC" or choose == "Pc" or choose == "pc" or choose == "pC": pcstats(2)
        else: print("No option named " + choose) ; sleep(3)

def p3():
    # GREEN color
    prismlaunch = color("PrismLauncher", 1)
    ste = color("Steam", 1)
    feath = color("Feather", 1)
    lunarclien = color("Lunar Client", 1)
    disco = color("Discord", 1)
    openas = color("OpenAsar", 1)
    # RED color
    offici = color("Official", 2)
    hm = color("HMCL", 2)
    upl = color("Uplay", 2)
    cheatbreake = color("Cheat Breaker", 2)
    
    while True:
        cls()
        print(f" ┌───────────────────────────────────────────────────┬────────────────────────────────┬────────────────────────────────┐\n", 
               f"│ {xtoolboxvv1asdfghjzz}                            │ Made by {xemulatddddd} For {a} │ Internet: {qwert}              │\n",
               f"│ Update Status: {Errorhd} │ RAM: {ramavailz}       │ CPU: {cpuavailifffff} | {c}    │ Disk: {dusagehebeded}          │\n",
               f"├──────────────────────────┼────────────────────────┼────────────────────────────────┼────────────────────────────────┤\n", 
               f"│ [L] Minecraft Launchers  │ [G] Game Launchers     │ [C] Minecraft Clients          │ [I] Misc                       │\n",
               f"├──────────────────────────┼────────────────────────┼────────────────────────────────┼────────────────────────────────┤\n", 
               f"│ [1] {offici}             │ [1] {ste}              │ [1] Tecknix                    │ [1] Achivment Watcher          │\n",
               f"│ [2] {prismlaunch}        │ [2] {upl}              │ [2] Salwyrr                    │ [2] {disco}                    │\n",
               f"│ [3] ATLaucnher           │ [3] Origin             │ [3] LabyMod                    │ [3] Spotify                    │\n",
               f"│ [4] {hm}                 │ [4] Epic Games         │ [4] {feath}                    │ [4] {openas}                   │\n",
               f"│ [5] XMCL                 │ [5] GOG Galaxy         │ [5] {lunarclien}               │                                │\n",
               f"│ [6] GDLauncher           │ [6] Paradox            │ [6] {cheatbreake}              │                                │\n",
               f"│                          │ [7] Roblox             │ [7] Badlion                    │                                │")
        print(f" │                          │                        │ [8] Crystal Client             │                                │\n",
               f"│                          │                        │                                │                                │\n",
               f"│                          │                        │                                │                                │\n",
               f"│                          │                        │                                │                                │\n",
               f"│                          │                        │                                │                                │\n",
               f"│                          │                        │                                │                                │\n",
               f"│                          │                        │                                │                                │\n",
               f"│                          │                        │                                │                                │\n",
               f"│                          │                        │                                │                                │\n",
               f"├──────────────────────────┴────────────────────────┴────────────────────────────────┴────────────────────────────────┤\n",
               f"│                     Ex.: 'D2' ─ HoneCtrl │ N ─ Next Page │ 99 ─ Exit │ H - Help │ PC - PcStats                      │\n",
               f"└─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘")
        choose = input("> ")

        # =============< Minecraft Launchers
        if   choose == "l1" or choose == "L1": dl(3, "https://launcher.mojang.com/download/MinecraftInstaller.exe", "MinecraftInstaller.exe", "Minecraft Launcher")
        elif choose == "l2" or choose == "L2": multidl("Prism")
        elif choose == "l3" or choose == "L3": dl(3, "https://github.com/ATLauncher/ATLauncher/releases/download/v"+str(latest("ATLauncher/ATLauncher"))+"/ATLauncher-"+str(latest("ATLauncher/ATLauncher"))+".exe", "ATLauncher.exe", "ATLauncher")
        elif choose == "l4" or choose == "L4": dl(3, "https://github.com/huanghongxun/HMCL/releases/download/v"+str(latest("huanghongxun/HMCL"))+"/HMCL-"+str(latest("huanghongxun/HMCL"))+".exe", "HMCL.exe", "HMCL")
        elif choose == "l5" or choose == "L5": dl(3, "https://github.com/Voxelum/x-minecraft-launcher/releases/download/v"+str(latest("Voxelum/x-minecraft-launcher"))+"/xmcl-"+str(latest("Voxelum/x-minecraft-launcher"))+"-win32-x64.zip", "XMCL.zip", "XMCL")
        elif choose == "l6" or choose == "L6": multidl("GDLauncher")

        # =============< Game Launchers
        elif choose == "g1" or choose == "G1": dl(3, "https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe", "Steam.exe", "Steam")
        elif choose == "g2" or choose == "G2": dl(3, "https://ubistatic3-a.akamaihd.net/orbit/launcher_installer/UbisoftConnectInstaller.exe", "Uplay.exe", "Uplay")
        elif choose == "g3" or choose == "G3": dl(3, "https://origin-a.akamaihd.net/EA-Desktop-Client-Download/installer-releases/EAappInstaller.exe", "Origin.exe", "Origin")
        elif choose == "g4" or choose == "G4": dl(3, "https://launcher-public-service-prod06.ol.epicgames.com/launcher/api/installer/download/EpicGamesLauncherInstaller.msi", "Epic-Games.msi", "Epic Games")
        elif choose == "g5" or choose == "G5": dl(3, "https://webinstallers.gog-statics.com/download/GOG_Galaxy_2.0.exe", "GOG-Galaxy.exe", "GOG Galaxy")
        elif choose == "g6" or choose == "G6": dl(3, "https://launcher.paradoxinteractive.com/v2/paradox-launcher-installer-2022_12.msi", "Paradox.msi", "Paradox")
        elif choose == "g7" or choose == "G7": dl(3, "https://setup.roblox.com/Roblox.exe", "Roblox.exe", "Roblox")

        # =============< Minecraft Clients
        elif choose == "c1" or choose == "C1": dl(3, "https://tecknix.com/client/TecknixClient.exe", "", "Tecknix Client")
        elif choose == "c2" or choose == "C2": dl(3, r"https://www.salwyrr.com/4/download/Salwyrr%20Launcher%20Installer.exe", "Salwyrr.exe", "Salwyrr CLients")
        elif choose == "c3" or choose == "C3": dl(3, "https://dl.labymod.net/latest/install/LabyMod3_Installer.exe", "LabyMod.exe", "LabyMod")
        elif choose == "c4" or choose == "C4": dl(3, r"https://launcher.feathercdn.net/dl/Feather%20Launcher%20Setup%201.4.4.exe", "FeatherLauncher.exe", "Feather Launcher")
        elif choose == "c5" or choose == "C5": dl(3, r"https://launcherupdates.lunarclientcdn.com/Lunar%20Client%20v2.14.0.exe", "LunarClient.exe", "Lunar Client")
        elif choose == "c6" or choose == "C6": dl(3, "https://github.com/Offline-CheatBreaker/Launcher/releases/download/"+str(latest("Offline-CheatBreaker/Launcher"))+"/Offline_CheatBreaker_Setup.exe", "Offline-CheatBreaker.exe", "Offline CheatBreaker")
        elif choose == "c7" or choose == "C7": dl(3, r"https://client-updates-cdn77.badlion.net/Badlion%20Client%20Setup%203.12.0.exe", "BadlionClient.exe", "Badlion Client")
        elif choose == "c8" or choose == "C8": dl(3, "https://github.com/Crystal-Development-LLC/launcher-releases/releases/download/v"+str(latest("Crystal-Development-LLC/launcher-releases"))+"/crystal-client-launcher-setup.exe", "CrystalClient.exe", "Crystal Client")
        
        # =============< Misc
        elif choose == "i1" or choose == "I1": dl(3, "https://github.com/xan105/Achievement-Watcher/releases/download/"+str(latest("xan105/Achievement-Watcher"))+"/Achievement.Watcher.Setup.exe", "Achievement-Watcher.exe", "Achievement Watcher")
        elif choose == "i2" or choose == "I2": dl(3, "https://discord.com/api/downloads/distributions/app/installers/latest?channel=stable&platform=win&arch=x86", "Discord.exe", "Discord")
        elif choose == "i3" or choose == "I3": dl(3, "https://download.scdn.co/SpotifySetup.exe", "Spotify.exe", "Spotify")
        elif choose == "i4" or choose == "I4": multidl("OpenAsar")

        # =============< QOL
        elif choose == "99": exit()
        elif choose == "n" or choose == "N": p1()
        elif choose == "b" or choose == "B": p2()
        elif choose == "h" or choose == "H": helpe(2)
        elif choose == "PC" or choose == "Pc" or choose == "pc" or choose == "pC": pcstats(2)
        else: print("No option named " + choose) ; sleep(3)

# Basically main^2
cls()
if isfile("EULA.XTB") == False:
    eula()
prep()

printer.lprint("Running Pre-Startup tasks...")
# Set vars pre startup
pre = "-PRE.PROD"
version = "1.8"
if pre == "":
    pre = "         "
# Updater
printer.lprint("Checking updates...")
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
printer.lprint("Setting color vars...")
# Set color vars
xtoolboxvv1asdfghjzz = color("XToolBox v"+version, 2)
ramavailz = Setvars.rama()
cpuavailifffff = Setvars.cpup()
dusagehebeded = Setvars.dusage()
qwert = Setvars.qwert()
c = Setvars.c()
xemulatddddd = color("xemulated#2622", 2)
Errorhd = Errorhd
a = color("Dan", 1)
# Run normal UI (Page 1)
printer.lprint("Tasks completed!")
p1()
