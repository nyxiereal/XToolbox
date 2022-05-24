from urllib.request import urlretrieve
from time import sleep as s
from webbrowser import open as w
from os import system
import sys
def r(blocknum, blocksize, totalsize):
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
def z():
    system('cls')
    print("Downloading")
    urlretrieve(b, a, r)
    print("Downloaded, exiting")
    exit(s(3))
system('cls')
print("Welcome to Xem's Iso Downloader")
print("Type 1/2/3/4/5 To Execute Selected Actions:")
print("1. Rufus")
print("2. Windows Editions")
print("3. Linux Distros")
print("4. Backup Iso's")
print("5. JOKE os's")
print("6. Other os's")
print("7. Credits")
m = input("(1/2/3/4/5): ")
if m == '1':
    system('cls')
    print("Type 1/2 To Execute Selected Actions:")
    print("1. Rufus (For Everything)")
    print("2. Balena Etcher (For Linux)")
    h = input("(1/2): ")
    if h == '1':
        b = 'https://github.com/pbatard/rufus/releases/download/v3.18/rufus-3.18.exe'
        a = 'Rufus.exe'
        z()
    if h == '2':
        b = 'https://github.com/balena-io/etcher/releases/download/v1.7.9/balenaEtcher-Portable-1.7.9.exe'
        a = 'Balena.exe'
        z()
if m == '2':
    system('cls')
    print("What Windows Version To Download?")
    print("1. Windows 10")
    print("2. Windows 11")
    print("3. Rectify11")
    print("4. Windows 10 AME")
    v = input("(1/2/3/4): ")
    if v == '1':
        b = 'https://backup.winiso.space/files/Windows10/pl-pl_windows_10_multi_editions_version_21h2_updated_may_2022_x64_9337a823.iso'
        a = 'Windows 10.iso'
        z()
    if v == '2':
        b = 'https://backup.winiso.space/files/Windows11/pl-pl_windows_11_21h1_22000.651_multi_editions_updated_apr_2022_x64_782d4743.iso'
        a = 'Windows 11.iso'
        z()
    if v == '3':
        c = 'Rectify11'
        b = 'https://download2390.mediafire.com/3ehxc3uweezg/x10ymvjd2vn2bo5/22000.318.CO_RELEASE_CLIPRO_RET_X64FRE_EN-US_RECTIFIED2.5.iso'
        z()
    if v == '4':
        c = 'Windows 10 AME'
        b = 'https://archive.org/download/windows10-ame-21h1-2021-08-09/AME_21H1_%282021-08-09%29.iso'
if m == '3':
    system('cls')
    print("Type 1/2/3 To Execute Selected Actions:")
    print("1. Linux Mint")
    print("2. Ubuntu")
    print("3. ArchLinux")
    print("4. Fedora")
    print("5. Debian")
    n = input("(1/2/3/4/5): ")
    if n == '1':
        a = 'Mint.iso'
        b = 'https://mirrors.layeronline.com/linuxmint/stable/20.3/linuxmint-20.3-cinnamon-64bit.iso'
        z()
    if n == '2':
        a = 'Ubuntu.iso'
        b = 'https://ubuntu.task.gda.pl/ubuntu-releases/22.04/ubuntu-22.04-desktop-amd64.iso'
        z()
    if n == '3':
        a = 'ArchLinux.iso'
        b = 'https://geo.mirror.pkgbuild.com/iso/2022.05.01/archlinux-2022.05.01-x86_64.iso'
        z()
    if n == '4':
        a = 'Fedora.iso'
        b = 'https://download.fedoraproject.org/pub/fedora/linux/releases/36/Workstation/x86_64/iso/Fedora-Workstation-Live-x86_64-36-1.5.iso'
        z()
    if n == '5':
        a = 'Debian.iso'
        b = 'https://laotzu.ftp.acc.umu.se/debian-cd/current/amd64/iso-cd/debian-11.3.0-amd64-netinst.iso'
        z()
if m == '4':
    system('cls')
    print("Type 1/2/3 To Execute Actions:")
    print("1. Acronis True Image")
    print("2. Parted Magic")
    print("3. GParted")
    print("4. Hirens Boot")
    print("5. RDrive Image")
    x = input("(1/2/3/4): ")
    if x == '1':
        a = 'Acronis.iso'
        b = 'https://archive.org/download/acronis-true-image-2021/AcronisTrueImage2021.iso'
        z()
    if x == '2':
        a = 'PMagic.iso'
        b = 'https://archive.org/download/pmagic_2013_08_01_202202/pmagic_2013_08_01.iso'
        z()
    if x == '3':
        a = 'GParted.iso'
        b = 'https://netcologne.dl.sourceforge.net/project/gparted/gparted-live-stable/1.4.0-1/gparted-live-1.4.0-1-amd64.iso'
        z()
    if x == '4':
        a = 'HirensBoot.iso'
        b = 'https://ftp.ps.pl/dsk0/hirensbootcd.org/HBCD_PE_x64.iso'
        z()
    if x == '5':
        a = 'RDrive.iso'
        b = 'https://archive.org/download/r-drive.-image-7.0.7004-oemkit/R-Drive.Image_7.0.7004_OEMKit.iso'
        z()
if m == '5':
    system('cls')
    print("Type 1/2/3 To Execute Selected Actions:")
    print("1. TempleOS")
    print("2. Gobo Linux")
    print("3. RedStarOS")
    print("4. TinFoil Linux")
    print("5. Satanic Ubuntu")
    print("6. Catholic Ubuntu")
    k = input("(1/2/3/4/5/6): ")
    if k == '1':
        b = 'https://templeos.org/Downloads/TempleOS.ISO'
        a = 'TempleOS.iso'
        z()
    if k == '2':
        b = 'https://github.com/gobolinux/LiveCD/releases/download/017/GoboLinux-017-x86_64.iso'
        a = 'Gobo.iso'
        z()
    if k == '3':
        b = 'https://archive.org/download/RedStarOS/Red%20Star%20OS%203.0%20Desktop/DESKTOP_redstar_desktop3.0_sign.iso'
        a = 'RedStarOS.iso'
        z()
    if k == '4':
        b = 'https://archive.org/download/tinfoil2/tinfoil2.img'
        a = 'TinFoil.iso'
        z()
    if k == '5':
        b = 'https://jztkft.dl.sourceforge.net/project/archiveos/u/ubuntu-satanic/satanic-undead-i386-666.9.iso'
        a = 'Ubuntu Satanic.iso'
        z()
    if k == '6':
        b = 'https://deac-ams.dl.sourceforge.net/project/ubuntuce/ubuntuce-22.04.0-2022.05.12.0-desktop-amd64.iso'
        a = 'UbuntuCE.iso'
        z()
if m == '5':
    system('cls')
    print("Type 1/2/3 To Execute Selected Actions:")
    print("1. OpenBSD")
    print("2. FreeBSD")
    print("3. OpenBSD")
    g = input("(1/2/3/4/5/6): ")
    if g == '1':
        c = 'OpenBSD'
        b = 'https://cdn.openbsd.org/pub/OpenBSD/7.1/amd64/install71.iso'
        z()
    if g == '2':
        c = 'FreeBSD'
        b = 'https://download.freebsd.org/releases/amd64/amd64/ISO-IMAGES/13.1/FreeBSD-13.1-RELEASE-amd64-dvd1.iso'
        z()
    if g == '3':
        c = 'ReactOS'
        b = 'https://jztkft.dl.sourceforge.net/project/reactos/ReactOS/0.4.14/ReactOS-0.4.14-release-15-gb6088a6-iso.zip'
        z()
if m == '6':
    system('cls')
    print("Opening Wiki And Exiting")
    w('bit.ly/3G5Xli1')
    exit(s(4))