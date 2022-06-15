from urllib.request import urlretrieve
from time import sleep
from os import startfile, getlogin, system
from colorama import Fore, Back, Style, init
import sys
init(autoreset=True)

#TESTING! Optimized print functiond
def BPrint(prent)
    print(Fore.BLUE + prent)

def RPrint(prentr)
    print(Fore.RED + prentr)

def WPrint(prentw)
    print(Fore.WHITE + prentw)

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

#UrlRetriever
def powpow(name, repname, replink):
    system('cls')
    RPrint("[S>] Downloading "+ name +"...")
    urlretrieve(replink, repname, reporter)
    RPrint("[S>] " +name+ " Downloaded, exiting...")
    exit(sleep(3))

cls()
BPrint("[I>] Welcome " + getlogin() + "!")
BPrint("[I>] This script will download selected software")
WPrint("[K>] Do you wanna install python?")
pyinstall = input("(y/n): ")
WPrint("[K>] Do you wanna install LibreWolf?")
libreinstall = input("(y/n): ")
WPrint("[K>] Do you wanna install BasicRedists?")
redistinstall = input("(y/n): ")
cls()

if pyinstall == 'y':
    powpow('Python', 'Python Setup.exe', 'https://www.python.org/ftp/python/3.10.5/python-3.10.5-amd64.exe')

if redistinstall == 'y':
    powpow('BasicRedists v2.0', 'BasicRedists v2.0 SFX.exe', 'https://github.com/xemulat/MyFilesForDDL/releases/download/BasicRedists/BasicRedists.exe')

if libreinstall == 'y':
    powpow('LibreWolf', 'LibreWolf 101.0.2 Setup.exe', 'https://gitlab.com/librewolf-community/browser/windows/uploads/fe06739b1a26002dae45b4b48f38aad2/librewolf-101.0-2.en-US.win64-setup.exe')

if libreinstall == 'n' and redistinstall == 'n' and pyinstall == 'n':
    print(Fore.RED +"[S>] Nothing Was Downloaded, Exiting...")
    exit(sleep(6))
