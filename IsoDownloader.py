from urllib.request import urlretrieve
from time import sleep
from webbrowser import open as webopen
from os import system
import sys
from colorama import Fore, Back, Style, init
init(autoreset=True)

#Progress Bar And Size Reporter
def reporter(blocknum, blocksize, totalsize):
    readsofar = blocknum * blocksize
    if totalsize > 0:
        percent = readsofar * 1e2 / totalsize
        s = "\r%5.1f%% %*d / %d" % (
            percent, len(str(totalsize)), readsofar, totalsize)
        sys.stderr.write(s)
        if readsofar >= totalsize:
            sys.stderr.write("\n")
    else:
        sys.stderr.write("read %d\n" % (readsofar,))

#UrlRetriever
def powpow():
    system('cls')
    print(Fore.RED +"[S>] Downloading "+ name +"...")
    urlretrieve(replink, repname, reporter)
    print(Fore.RED +"[S>] " +name+ " Downloaded, exiting...")
    exit(sleep(3))

system('cls')
print(Fore.BLUE +"Welcome to Xem's Iso Downloader")
print(Fore.WHITE +"Type 1/2/3/4/5 To Execute Selected Actions:")
print(Fore.BLUE +"1. Rufus")
print(Fore.BLUE +"2. Windows Editions")
print(Fore.BLUE +"3. Linux Distros")
print(Fore.BLUE +"4. Backup Iso's")
print(Fore.BLUE +"5. JOKE os's")
print(Fore.BLUE +"6. Other os's")
print(Fore.BLUE +"7. Credits")
whattoinstalldwag = input("(1/2/3/4/5): ")

################## Rufus Download ##################
if whattoinstalldwag == '1':
    replink = 'https://github.com/pbatard/rufus/releases/download/v3.18/rufus-3.18.exe'
    repname = 'Rufus.exe'
    name = 'Rufus'
    powpow()

################## Windows Iso's ##################
if whattoinstalldwag == '2':
    system('cls')
    print(Fore.WHITE +"What Windows Version To Download?")
    print(Fore.BLUE +"1. Download Windows 10")
    print(Fore.BLUE +"2. Download Windows 11")
    print(Fore.BLUE +"3. Download Rectify11")
    print(Fore.BLUE +"4. Download Windows 10 AME")
    winver = input("(1/2/3/4): ")
    if winver == '1':
        replink = 'https://backup.winiso.space/files/Windows10/pl-pl_windows_10_multi_editions_version_21h2_updated_may_2022_x64_9337a823.iso'
        repname = 'Windows 10.iso'
        name = 'Windows 10'
        powpow()

    if winver == '2':
        replink = 'https://backup.winiso.space/files/Windows11/pl-pl_windows_11_21h1_22000.651_multi_editions_updated_apr_2022_x64_782d4743.iso'
        repname = 'Windows 11.iso'
        name = 'Windows 11'
        powpow()

    if winver == '3':
        name = 'Rectify11'
        replink = 'https://download2390.mediafire.com/3ehxc3uweezg/x10ymvjd2vn2bo5/22000.318.CO_RELEASE_CLIPRO_RET_X64FRE_EN-US_RECTIFIED2.5.iso'
        repname = 'Rectify11.iso'
        powpow()

    if winver == '4':
        name = 'Windows 10 AME'
        replink = 'https://archive.org/download/windows10-ame-21h1-2021-08-09/AME_21H1_%282021-08-09%29.iso'
        repname = 'Windows 10 AME.iso'

################## Linux Iso's ##################
if whattoinstalldwag == '3':
    system('cls')
    print(Fore.BLUE +"Type 1/2/3 To Execute Selected Actions:")
    print(Fore.BLUE +"1. Download Linux Mint")
    print(Fore.BLUE +"2. Download Ubuntu")
    print(Fore.BLUE +"3. Download ArchLinux")
    print(Fore.BLUE +"4. Download Fedora")
    print(Fore.BLUE +"5. Download Debian")
    linver = input("(1/2/3/4/5): ")
    if linver == '1':
        repname = 'Mint.iso'
        replink = 'https://mirrors.layeronline.com/linuxmint/stable/20.3/linuxmint-20.3-cinnamon-64bit.iso'
        name = 'Linux Mint'
        powpow()

    if linver == '2':
        repname = 'Ubuntu.iso'
        replink = 'https://ubuntu.task.gda.pl/ubuntu-releases/22.04/ubuntu-22.04-desktop-amd64.iso'
        name = 'Ubuntu'
        powpow()

    if linver == '3':
        repname = 'ArchLinux.iso'
        replink = 'https://geo.mirror.pkgbuild.com/iso/2022.05.01/archlinux-2022.05.01-x86_64.iso'
        name = 'Arch Linux'
        powpow()
    
    if linver == '4':
        repname = 'Fedora.iso'
        replink = 'https://download.fedoraproject.org/pub/fedora/linux/releases/36/Workstation/x86_64/iso/Fedora-Workstation-Live-x86_64-36-1.5.iso'
        name = 'Fedora'
        powpow()

    if linver == '5':
        repname = 'Debian.iso'
        replink = 'https://laotzu.ftp.acc.umu.se/debian-cd/current/amd64/iso-cd/debian-11.3.0-amd64-netinst.iso'
        name = 'Debian'
        powpow()

################## Repair Iso's ##################
if whattoinstalldwag == '4':
    system('cls')
    print(Fore.BLUE +"Type 1/2/3 To Execute Selected Actions:")
    print(Fore.BLUE +"1. Download Acronis True Image 2021")
    print(Fore.BLUE +"2. Download Parted Magic 2013")
    print(Fore.BLUE +"3. Download GParted")
    print(Fore.BLUE +"4. Download Hiren's Boot PE")
    print(Fore.BLUE +"5. Download R-Drive Image")
    repairtodo = input("(1/2/3/4): ")
    if repairtodo == '1':
        repname = 'Acronis.iso'
        replink = 'https://archive.org/download/acronis-true-image-2021/AcronisTrueImage2021.iso'
        name = ''
        powpow()

    if repairtodo == '2':
        repname = 'PMagic.iso'
        replink = 'https://archive.org/download/pmagic_2013_08_01_202202/pmagic_2013_08_01.iso'
        name = 'Parted Magic'
        powpow()

    if repairtodo == '3':
        repname = 'GParted.iso'
        replink = 'https://netcologne.dl.sourceforge.net/project/gparted/gparted-live-stable/1.4.0-1/gparted-live-1.4.0-1-amd64.iso'
        name = 'GParted'
        powpow()

    if repairtodo == '4':
        repname = 'HirensBoot.iso'
        replink = 'https://ftp.ps.pl/dsk0/hirensbootcd.org/HBCD_PE_x64.iso'
        name = 'Hirens Boot CD PE'
        powpow()

    if repairtodo == '5':
        repname = 'R-Drive.iso'
        replink = 'https://archive.org/download/r-drive.-image-7.0.7004-oemkit/R-Drive.Image_7.0.7004_OEMKit.iso'
        name = 'R-Drive Image'
        powpow()

################## JOKE os's ##################
if whattoinstalldwag == '5':
    system('cls')
    print(Fore.BLUE +"Type 1/2/3 To Execute Selected Actions:")
    print(Fore.BLUE +"1. Download TempleOS")
    print(Fore.BLUE +"2. Download Gobo Linux")
    print(Fore.BLUE +"3. Download RedStarOS")
    print(Fore.BLUE +"4. Download TinFoil Linux")
    print(Fore.BLUE +"5. Download Satanic Ubuntu")
    print(Fore.BLUE +"6. Download Catholic Ubuntu")
    joketodo = input("(1/2/3/4/5/6): ")
    if joketodo == '1':
        replink = 'https://templeos.org/Downloads/TempleOS.ISO'
        repname = 'TempleOS.iso'
        name = 'TempleOS'
        powpow()

    if joketodo == '2':
        replink = 'https://github.com/gobolinux/LiveCD/releases/download/017/GoboLinux-017-x86_64.iso'
        repname = 'Gobo.iso'
        name = 'Gobo Linux'
        powpow()

    if joketodo == '3':
        replink = 'https://archive.org/download/RedStarOS/Red%20Star%20OS%203.0%20Desktop/DESKTOP_redstar_desktop3.0_sign.iso'
        repname = 'RedStarOS.iso'
        name = 'RedStarOS'
        powpow()

    if joketodo == '4':
        replink = 'https://archive.org/download/tinfoil2/tinfoil2.img'
        repname = 'TinFoil.iso'
        name = 'TinFoil'
        powpow()
        
    if joketodo == '5':
        replink = 'https://jztkft.dl.sourceforge.net/project/archiveos/u/ubuntu-satanic/satanic-undead-i386-666.9.iso'
        repname = 'Ubuntu Satanic.iso'
        name = 'Ubuntu Satanic Edition'
        powpow()

    if joketodo == '6':
        replink = 'https://deac-ams.dl.sourceforge.net/project/ubuntuce/ubuntuce-22.04.0-2022.05.12.0-desktop-amd64.iso'
        repname = 'UbuntuCE.iso'
        name = 'Ubuntu Catholic Edition'
        powpow()

if whattoinstalldwag == '5':
    system('cls')
    print(Fore.BLUE +"Type 1/2/3 To Execute Selected Actions:")
    print(Fore.BLUE +"1. Download OpenBSD")
    print(Fore.BLUE +"2. Download FreeBSD")
    print(Fore.BLUE +"3. Download OpenBSD")
    othertodo = input("(1/2/3/4/5/6): ")
    if othertodo == '1':
        name = 'OpenBSD'
        replink = 'https://cdn.openbsd.org/pub/OpenBSD/7.1/amd64/install71.iso'
        repname = 'OpenBSD.iso'
        powpow()

    if othertodo == '2':
        name = 'FreeBSD'
        replink = 'https://download.freebsd.org/releases/amd64/amd64/ISO-IMAGES/13.1/FreeBSD-13.1-RELEASE-amd64-dvd1.iso'
        repname = 'FreeBSD.iso'
        powpow()

    if othertodo == '3':
        name = 'ReactOS'
        replink = 'https://jztkft.dl.sourceforge.net/project/reactos/ReactOS/0.4.14/ReactOS-0.4.14-release-15-gb6088a6-iso.zip'
        repname = 'ReactOS.iso.zip'
        powpow()

################## Credits ##################
if whattoinstalldwag == '6':
    system('cls')
    print(Fore.RED +"Opening Wiki And Exiting...")
    webopen('bit.ly/3G5Xli1')
    exit(sleep(4))