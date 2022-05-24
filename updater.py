from wget import download
import read
import webbrowser
from time import sleep
from sys import exit
from colorama import Fore, Back, Style, init
init(autoreset=True)

#set vars
yourversion = ('0.0.5')
fname1 = 'relver.txt'
fname2 = 'Virus.Removal.Toolkit.zip'

print(Fore.RED +"[S>] Downloading update info...")
download('https://raw.githubusercontent.com/xemulat/Virus-Removal-Toolkit/main/newestversion.txt', fname1)
with open('relver.txt', 'r') as line:
	newver = line.read(5)

print(" ")
print(Fore.BLUE +"[I>] You need to remove relver.txt file!")
print(Fore.RED +"[S>] Newest version is: " + newver)
print(Fore.RED +"[S>] Your version is: " + yourversion)

if newver == yourversion:
    print(Fore.BLUE +"[I>] Your version is up-to-date!")
    exit(sleep(5))
if newver >= yourversion:
    print(Fore.BLUE +"[I>] Your version is outdated :(")
    print(Fore.WHITE +"[K>] Do you want to update now?")
    updates = input("(y/n): ")
    if updates == 'y':
        webbrowser.open("https://github.com/xemulat/Virus-Removal-Toolkit/releases/latest")
    if updates == 'n':
        print(Fore.RED +"[S>] Ok, exiting...")
        exit(sleep(3))