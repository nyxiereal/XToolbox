import wget
import time
import os
import colorama
from colorama import Fore, Back, Style
colorama.init(autoreset=True)

libname = 'LibreWolf 100.0.1 Setup.exe'
pyname = 'Python 3.10.4 Setup.exe'
redistname = 'BasicRedists 1.0 SFX.exe'

print(Fore.BLUE +"[I>] Welcome " + os.getlogin() + "!")
print(Fore.BLUE +"[I>] This script will download selected software")
print(Fore.WHITE +"[K>] Do you wanna install python?")
pyinstall = input("(y/n): ")
print(Fore.WHITE +"[K>] Do you wanna install LibreWolf?")
libreinstall = input("(y/n): ")
print(Fore.WHITE +"[K>] Do you wanna install BasicRedists?")
redistinstall = input("(y/n): ")

if pyinstall == 'y':
    print(Fore.RED +"[S>] Downloading Python 3.10.4")
    wget.download('https://www.python.org/ftp/python/3.10.4/python-3.10.4-amd64.exe', pyname)
    print(" ")
    print(Fore.RED +"[S>] Python Downloaded!")
if redistinstall == 'y':
    print(Fore.RED +"[S>] Downloading BasicRedists...")
    wget.download('https://github.com/xemulat/Basic-Redists/releases/download/1/basic.redists.exe', redistname)
    print(" ")
    print(Fore.RED +"[S>] BasicRedists downloaded!")
if libreinstall == 'y':
    print(Fore.RED +"[S>] Downloading LibreWolf...")
    wget.download('https://gitlab.com/librewolf-community/browser/windows/uploads/a3bf5f8c45de37868fec4b20984a1442/librewolf-100.0.1-1.en-US.win64-setup.exe', libname)
    print(" ")
    print(Fore.RED +"[S>] LibreWolf downloaded!")
else:
    print(Fore.RED +"[S>] Nothing was done, exiting...")
    time.sleep(2)
    exit()
if pyinstall == 'y':
    print(Fore.RED +"[S>] Executing Python Installer...")
    os.startfile(pyname)
if redistinstall == 'y':
    print(Fore.RED +"[S>] Executing BasicRedists Installer...")
    os.startfile(redistname)
if libreinstall == 'y':
    print(Fore.RED +"[S>] Executing LibreWolf Installer...")
    os.startfile(libname)
