from urllib.request import urlretrieve
import sys
from time import sleep
from webbrowser import open as webopen
from os import system
from socket import create_connection, gethostbyname
from colorama import Fore, Back, Style, init
init(autoreset=True)

#TESTING! Optimized color-print function
def BPrint(prent)
    print(Fore.BLUE + prent)

def RPrint(prentr)
    print(Fore.RED + prentr)

def WPrint(prentw)
    print(Fore.WHITE + prentw)


#Progress Bar And Size Reporter
def reporter(blocknum, blocksize, totalsize):
    readsofar = blocknum * blocksize
    if totalsize > 0:
        percent = readsofar * 1e2 / totalsize
        s = "\r%5.1f%% %*d out of %d" % (
            percent, len(str(totalsize)), readsofar, totalsize)
        sys.stderr.write(s)
        if readsofar >= totalsize:
            sys.stderr.write("\n")
    else:
        sys.stderr.write("read %d\n" % (readsofar,))

#UrlRetriever
def powpow(name, repname, replink):
    system('cls')
    RPrint("[S>] Downloading "+ name +"...")
    urlretrieve(replink, repname, reporter)
    RPrint("[S>] " +name+ " Downloaded, exiting...")
    exit(sleep(3))


def is_connected():
  try:
    host = gethostbyname("github.com")
    s = create_connection((host, 80), 2)
    return 'Yes'
  except:
     pass
  return 'No'

system('cls')
RPrint("[S>] Testing Internet...")
if is_connected() == 'Yes':
    system('cls')
    RPrint("[S>] Internet is connected")
    print(" ")
    BPrint("Welcome to Xem's Iso Downloader")
    BPrint("Type 1/2/3/4/5 To Execute Selected Actions:")
    BPrint("1. USB Flasher")
    BPrint("2. Windows Editions")
    BPrint("3. Linux Distros")
    BPrint("4. Backup Iso's")
    BPrint("5. JOKE os's")
    BPrint("6. Other os's")
    BPrint("7. Credits")
    whattoinstalldwag = input("(1/2/3/4/5): ")
if is_connected() == 'No':
    system('cls')
    RPrint("No internet connected, exiting...")
    exit(sleep(5))


################## Rufus Download ##################
if whattoinstalldwag == '1':
    system('cls')
    WPrint("Type 1/2 To Execute Selected Actions:")
    BPrint("1. Rufus(For Everything)")
    BPrint("2. Balena Etcher (For Linux)")
    rufustodo = input("(1/2): ")
    if rufustodo == '1':
        powpow('Rufus', 'Rufus.exe', 'https://github.com/pbatard/rufus/releases/download/v3.18/rufus-3.18.exe')

    if rufustodo == '2':
        powpow('Balena Etcher', 'Balena.exe', 'https://github.com/balena-io/etcher/releases/download/v1.7.9/balenaEtcher-Portable-1.7.9.exe')

################## Windows Iso's ##################
if whattoinstalldwag == '2':
    system('cls')
    WPrint("Type 1/2/3/4 To Execute Selected Actions:")
    BPrint("1. Download Windows 10")
    BPrint("2. Download Windows 11")
    BPrint("3. Download Rectify11")
    BPrint("4. Download Windows 10 AME")
    winver = input("(1/2/3/4): ")
    if winver == '1':
        powpow('Windows 10', 'Windows 10.iso', 'https://backup.winiso.space/files/Windows10/pl-pl_windows_10_multi_editions_version_21h2_updated_may_2022_x64_9337a823.iso')

    if winver == '2':
        powpow('Windows 11', 'Windows 11.iso',  'https://backup.winiso.space/files/Windows11/pl-pl_windows_11_21h1_22000.651_multi_editions_updated_apr_2022_x64_782d4743.iso')

    if winver == '3':
        powpow('Rectify11', 'Rectify11.iso', 'https://download2390.mediafire.com/3ehxc3uweezg/x10ymvjd2vn2bo5/22000.318.CO_RELEASE_CLIPRO_RET_X64FRE_EN-US_RECTIFIED2.5.iso')

    if winver == '4':
        powpow('Windows 10 AME', 'Windows 10 AME.iso', 'https://archive.org/download/windows10-ame-21h1-2021-08-09/AME_21H1_%282021-08-09%29.iso')

################## Linux Iso's ##################
if whattoinstalldwag == '3':
    system('cls')
    WPrint("Type 1/2/3/4/5 To Execute Selected Actions:")
    BPrint("1. Download Linux Mint")
    BPrint("2. Download Ubuntu")
    BPrint("3. Download ArchLinux")
    BPrint("4. Download Fedora")
    BPrint("5. Download Debian")
    linver = input("(1/2/3/4/5): ")
    if linver == '1':
        powpow('Linux Mint', 'Mint.iso', 'https://mirrors.layeronline.com/linuxmint/stable/20.3/linuxmint-20.3-cinnamon-64bit.iso')

    if linver == '2':
        powpow('Ubuntu', 'Ubuntu.iso', 'https://ubuntu.task.gda.pl/ubuntu-releases/22.04/ubuntu-22.04-desktop-amd64.iso')

    if linver == '3':
        powpow('Arch Linux', 'Arch.iso', 'https://geo.mirror.pkgbuild.com/iso/2022.05.01/archlinux-2022.05.01-x86_64.iso')
    
    if linver == '4':
        powpow('Fedora', 'Fedora.iso', 'https://download.fedoraproject.org/pub/fedora/linux/releases/36/Workstation/x86_64/iso/Fedora-Workstation-Live-x86_64-36-1.5.iso')

    if linver == '5':
        powpow('Debian', 'Debian.iso', 'https://laotzu.ftp.acc.umu.se/debian-cd/current/amd64/iso-cd/debian-11.3.0-amd64-netinst.iso')

################## Repair Iso's ##################
if whattoinstalldwag == '4':
    system('cls')
    WPrint("Type 1/2/3/4/5 To Execute Selected Actions:")
    BPrint("1. Download Acronis True Image 2021")
    BPrint("2. Download Parted Magic 2013")
    BPrint("3. Download GParted")
    BPrint("4. Download Hiren's Boot PE")
    BPrint("5. Download R-Drive Image")
    repairtodo = input("(1/2/3/4/5): ")
    if repairtodo == '1':
        powpow('Acronis True Image', 'Acronis.iso', 'https://archive.org/download/acronis-true-image-2021/AcronisTrueImage2021.iso')

    if repairtodo == '2':
        powpow('Parted Magic', PMagic.iso',  'https://archive.org/download/pmagic_2013_08_01_202202/pmagic_2013_08_01.iso')

    if repairtodo == '3':
        powpow('Gparted', 'GParted.iso', 'https://netcologne.dl.sourceforge.net/project/gparted/gparted-live-stable/1.4.0-1/gparted-live-1.4.0-1-amd64.iso')

    if repairtodo == '4':
        powpow('Hirens Boot CD PE', 'HirensBoot.iso', 'https://ftp.ps.pl/dsk0/hirensbootcd.org/HBCD_PE_x64.iso')

    if repairtodo == '5':
        powpow('R-Drive Image', 'R-Drive.iso', 'https://archive.org/download/r-drive.-image-7.0.7004-oemkit/R-Drive.Image_7.0.7004_OEMKit.iso')

################## JOKE os's ##################
if whattoinstalldwag == '5':
    system('cls')
    WPrint("Type 1/2/3/4/5/6 To Execute Selected Actions:")
    BPrint("1. Download TempleOS")
    BPrint("2. Download Gobo Linux")
    BPrint("3. Download RedStarOS")
    BPrint("4. Download TinFoil Linux")
    BPrint("5. Download Satanic Ubuntu")
    BPrint("6. Download Catholic Ubuntu")
    joketodo = input("(1/2/3/4/5/6): ")
    if joketodo == '1':
        powpow('TempleOS', 'TempleOS.iso', 'https://templeos.org/Downloads/TempleOS.ISO')

    if joketodo == '2':
        powpow('Gobo Linux', 'Gobo.iso',  'https://github.com/gobolinux/LiveCD/releases/download/017/GoboLinux-017-x86_64.iso')

    if joketodo == '3':
        powpow('RedStarOS', 'RedStar.iso', 'https://archive.org/download/RedStarOS/Red%20Star%20OS%203.0%20Desktop/DESKTOP_redstar_desktop3.0_sign.iso')

    if joketodo == '4':
        powpow('TinFoil', 'TinFoil.img', 'https://archive.org/download/tinfoil2/tinfoil2.img')
        
    if joketodo == '5':
        powpow('Ubuntu Satanic Edition', 'Ubuntu Satanic.iso', 'https://jztkft.dl.sourceforge.net/project/archiveos/u/ubuntu-satanic/satanic-undead-i386-666.9.iso')

    if joketodo == '6':
        powpow('Ubuntu Catholic Edition', 'UbuntuCE.iso', 'https://deac-ams.dl.sourceforge.net/project/ubuntuce/ubuntuce-22.04.0-2022.05.12.0-desktop-amd64.iso')

if whattoinstalldwag == '5':
    system('cls')
    WPrint("Type 1/2/3 To Execute Selected Actions:")
    BPrint("1. Download OpenBSD")
    BPrint("2. Download FreeBSD")
    BPrint("3. Download ReactOS")
    othertodo = input("(1/2/3): ")
    if othertodo == '1':
        powpow('OpenBSD', 'OpenBSD.iso, 'https://cdn.openbsd.org/pub/OpenBSD/7.1/amd64/install71.iso')

    if othertodo == '2':
        powpow('FreeBSD', 'FreeBSD.iso', 'https://download.freebsd.org/releases/amd64/amd64/ISO-IMAGES/13.1/FreeBSD-13.1-RELEASE-amd64-dvd1.iso')

    if othertodo == '3':
        powpow('ReactOS', 'ReactOS.iso', 'https://jztkft.dl.sourceforge.net/project/reactos/ReactOS/0.4.14/ReactOS-0.4.14-release-15-gb6088a6-iso.zip')

################## Credits ##################
if whattoinstalldwag == '6':
    system('cls')
    RPrint("Opening Wiki And Exiting...")
    webopen('bit.ly/3G5Xli1')
    exit(sleep(4))
