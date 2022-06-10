from urllib.request import urlretrieve
import sys
import read
from webbrowser import open as webopen
from os import remove
from time import sleep
from sys import exit
from colorama import Fore, Back, Style, init
init(autoreset=True)

#set vars
yourversion = ('0.9')
fname1 = 'relver.txt'
fname2 = 'Virus.Removal.Toolkit.zip'

print(Fore.RED +"[S>] Downloading update info...")
urlretrieve('https://raw.githubusercontent.com/xemulat/Virus-Removal-Toolkit/main/newestversion.txt', fname1)
with open('relver.txt', 'r') as line:
	newver = line.read(5)

print(" ")
print(Fore.RED +"[S>] Newest version is: " + newver)
print(Fore.RED +"[S>] Your version is: " + yourversion)
remove('relver.txt')

if newver == yourversion:
    print(Fore.BLUE +"[I>] Your version is up-to-date!")
    exit(sleep(5))
if newver >= yourversion:
    print(Fore.BLUE +"[I>] Your version is outdated :(")
    print(Fore.WHITE +"[K>] Do you want to update now?")
    updates = input("(y/n): ")
    if updates == 'y':
        webopen("https://github.com/xemulat/Virus-Removal-Toolkit/releases/latest")
    if updates == 'n':
        print(Fore.RED +"[S>] Ok, exiting...")
        exit(sleep(3))
if newver <= yourversion:
    print(Fore.BLUE +"[I>] Your version is Newer than Lastest *_*")
    print(Fore.BLUE +"[I>] I Don't Know Why, Report issue at My github page!")
    print(Fore.BLUE +"[I>] Ps. github.com/xemulat/Windows-Toolkit/issues")
    exit(sleep(3))
