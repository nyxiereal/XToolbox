from urllib.request import urlretrieve
import sys
import read
from webbrowser import open as webopen
from os import remove
from time import sleep
from sys import exit
from colorama import Fore, Back, Style, init
init(autoreset=True)

#TESTING! Optimized print function
def BPrint(prent):
    print(Fore.BLUE + prent)
def RPrint(prentr):
    print(Fore.RED + prentr)
def WPrint(prentw):
    print(Fore.WHITE + prentw)

#set vars
yourversion = ('1.1')

RPrint("[S>] Downloading update info...")
urlretrieve('https://raw.githubusercontent.com/xemulat/Virus-Removal-Toolkit/main/newestversion.txt', 'relver.txt')
with open('relver.txt', 'r') as line:
	newver = line.read(5)

print(" ")
RPrint("[S>] Newest version is: " + newver)
RPrint("[S>] Your version is: " + yourversion)
remove('relver.txt')

if newver == yourversion:
    BPrint("[I>] Your version is up-to-date!")
    exit(sleep(5))
if newver >= yourversion:
    BPrint("[I>] Your version is outdated :(")
    WPrint("[K>] Do you want to update now?")
    updates = input("(y/n): ")
    if updates == 'y':
        webopen("https://github.com/xemulat/Virus-Removal-Toolkit/releases/latest")
    if updates == 'n':
        RPrint("[S>] Ok, exiting...")
        exit(sleep(3))
if newver <= yourversion:
    BPrint("[I>] Your version is Newer than Lastest *_*")
    BPrint("[I>] If You don't know why it happend report issue at My github page!")
    BPrint("[I>] Ps. github.com/xemulat/Windows-Toolkit/issues")
    exit(sleep(6))
