from urllib.request import urlretrieve
from time import sleep
from os import startfile, getlogin, system
from colorama import Fore, Back, Style, init
import sys
init(autoreset=True)

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

def cls():
    system('cls')

def powpow():
    print(Fore.RED +"[S>] Downloading "+ name +"...")
    urlretrieve(replink, repname, reporter)
    print(Fore.RED +"[S>] " +name+ " Downloaded!")
    startfile(repname)

cls()
print(Fore.BLUE +"[I>] Welcome " + getlogin() + "!")
print(Fore.BLUE +"[I>] This script will download selected software")
print(Fore.WHITE +"[K>] Do you wanna install python?")
pyinstall = input("(y/n): ")
print(Fore.WHITE +"[K>] Do you wanna install LibreWolf?")
libreinstall = input("(y/n): ")
print(Fore.WHITE +"[K>] Do you wanna install BasicRedists?")
redistinstall = input("(y/n): ")
cls()

if pyinstall == 'y':
    replink = 'https://www.python.org/ftp/python/3.10.5/python-3.10.5-amd64.exe'
    repname = 'Python 3.10.5 Setup.exe'
    name = 'Python'
    powpow()
if redistinstall == 'y':
    replink = 'https://github.com/xemulat/MyFilesForDDL/releases/download/BasicRedists/BasicRedists.exe'
    repname = 'BasicRedists 2.0 SFX.exe'
    name = 'BasicRedists v2.0'
    powpow()
if libreinstall == 'y':
    replink = 'https://gitlab.com/librewolf-community/browser/windows/uploads/fe06739b1a26002dae45b4b48f38aad2/librewolf-101.0-2.en-US.win64-setup.exe'
    repname = 'LibreWolf 101.0.2 Setup.exe'
    name = 'LibreWolf'
    powpow()
if libreinstall == 'n' and redistinstall == 'n' and pyinstall == 'n':
    print(Fore.RED +"[S>] Nothing Was Downloaded, Exiting...")
    exit(sleep(6))