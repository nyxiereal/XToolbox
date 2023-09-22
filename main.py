# Made by Xemulated │ GPL-2
from xtools import tools, showInfo

from urllib.request import urlretrieve
from webbrowser import open as webopen
from sys import exit, argv, executable
from psutil import cpu_count, virtual_memory
from platform import release
from contextlib import closing
from os.path import isfile
from urllib.parse import urlparse
from os import remove
from hashlib import sha256
from os import system, startfile
from time import sleep
from getpass import getpass

from requests.adapters import HTTPAdapter
from requests import Session
from requests import get
from lastversion import latest
from colorama import Fore, init
from ping3 import ping
from tqdm import tqdm

from rich.progress import Progress

init(autoreset=True)

peeng = str(f"{round(ping('google.com', unit='ms'))}ms").ljust(7)

version = '2.9'

#### XENONIUM FUNCTIONS
def fwrite(run, filename, content):
    fp = open(filename, 'w')
    fp.write(content)
    fp.close()
    if run == 1: startfile(filename)

def runaspowershell(command, filename):
    fwrite(1, f"{filename}.bat", r'@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "'+command+'"')

def cls():
    system('cls')

def cl(color, text):
    if color == 1:
        return(Fore.RED + text + Fore.RESET)
    else:
        return(Fore.GREEN + text + Fore.RESET)

def get_checksum(file_path):
    def shasher(data):
        # NESTED MODULE LETS GOOOO!!!
        # Initialize the SHA-256 hash object
        sha256_hash = sha256()

        # Update the hash object with the data
        sha256_hash.update(data)

        # Return the hexadecimal digest of the hash
        return sha256_hash.hexdigest()

    # Read the file in binary mode
    with open(file_path, 'rb') as file:
        # Initialize the checksum
        checksum = b''

        # Read the file in chunks to handle large files efficiently
        chunk_size = 4096
        for chunk in iter(lambda: file.read(chunk_size), b''):
            # Update the checksum with the chunk
            checksum += chunk

    # Calculate the SHA-256 checksum of the checksum value
    checksum = shasher(checksum)
    return checksum

class Printer():
    def sys(clr, text):
        if clr == 1:
            print(Fore.GREEN + f'[+] {text}')
        else:
            print(Fore.RED + f'[-] {text}')
    def zpr(text):
        print(Fore.BLUE + f'[>] {text}')

def download(url, fnam, name):
    try:
        if name == None:
            name = fnam

        # Parse the URL and convert it to https.
        url = (urlparse(url))._replace(scheme='https').geturl()

        headers = {'Accept-Encoding': 'gzip, deflate',
                    'User-Agent': 'Mozilla/5.0',
                    'cache_control': 'max-age=600',
                    'connection': 'keep-alive'}
        
        session = Session()

        response = session.head(url, headers=headers)
        total_size = int(response.headers.get("content-length", 0))

        with Progress() as progress:
            task = progress.add_task(f"[cyan]:: Downloading [bold]{name}[/bold][/cyan]", total=total_size)

            with open(fnam, "wb") as file:

                response = session.get(url, stream=True)
                chunk_size = 1024  # You can adjust this value as needed

                # the shits that writes the data and updates the progress bar every 1kib
                for data in response.iter_content(chunk_size=chunk_size):
                    file.write(data)
                    progress.update(task, completed=file.tell())

    except KeyboardInterrupt:
        progress.stop()
        Printer.sys(0, 'Aborting!')
        remove(fnam)

#function to reduce code when using interpreter() page 97
def yn(prompt=""):
    prompt += f" {Fore.RESET}({Fore.GREEN}Y{Fore.RESET}/{Fore.RED}n{Fore.RESET}): "
    goodInput, YNvalue = False, False
    while not goodInput:
        goodInput, YNvalue = interpreter(97, prompt)
    return YNvalue

#function for multiple choice downloads interpreter() page 98
#returns the index of chosen option, it can return -1 if the user canceled selection
#tool is <Tool>, prompt is <str>
def multiChoose(tool, prompt):
    # ┌──────────< B - back >──────────┐
    # │                                │
    # │ [1] name_name_name_1           │
    # │ [2] name_name_name_name_2      │
    # │  ...                           │
    # │                                │
    # ├────────────────────────────────┤
    # │    _________Prompt_________    │
    # └────────────────────────────────┘

    #determining window size
    size = 34 # min size
    if len(prompt)+10 > size: size = len(prompt)+10 # the +10 is because of minimum space on both sides of the prompt (|          |)
    for ind in range(len(tool.dwn)):
        if len(tool.getDesc(ind))+7+len(str(ind+1)) > size: #the +7 is because of the minimum possible space in an option (│ []  │)
            size = len(tool.getDesc(ind))+7+len(str(ind+1)) #ind +1 cuz ind goes from 0 to max-1

    #ensuring symmetry
    if len(prompt)%2 == 0:
        backMessage = "< B - back >"
        if size%2==1: size+=1
    else:
        backMessage = "< back: B >"
        if size%2==0: size+=1
    
    #the top bar
    print(f"┌{'─'*int((size-2-len(backMessage))/2)}{backMessage}{'─'*int((size-2-len(backMessage))/2)}┐")

    #empty line cuz it looks nice :D
    print(f"│{' '*(size-2)}│")

    #options
    for ind in range(len(tool.dwn)):
        print(f"│ [{ind+1}] {tool.getDesc(ind)}{' '*int(size-6-len(tool.getDesc(ind))-len(str(ind+1)))}│")

    #another empty
    print(f"│{' '*(size-2)}│")

    #prompt
    print(f"├{'─'*(size-2)}┤")    
    print(f"│{' '*int((size-2-len(prompt))/2)}{prompt}{' '*int((size-2-len(prompt))/2)}│")
    print(f"└{'─'*(size-2)}┘")

    goodInput = False
    while not goodInput:
        goodInput, index = interpreter(98)
        if index > len(tool.dwn): goodInput = False

    return index

def dl(url, urlr, name):
    # make sure user understands what they are about do download
    print(f"XTBox will download an executable from:\n\t{url}")
    if not yn("Approve?"): return

    try:
        download(url, urlr, name)
        if urlr[-3:] != "iso":
            if yn(f"Run {urlr}?"): startfile(urlr)
    except:
        Printer.sys(0, "ERROR 3: Can't download file from the server...")
    
    getpass("\n... press ENTER to continue ...", stream=None)

#runaspowershell() wrapper
def pwsh(cmd, name):
    print(f"XTBox will run the following command as powershell:\n\t{cmd}")
    if not yn("Approve?"): return
    runaspowershell(cmd, name)


###### XENONIUM FUNCTIONS

xtoolboxve = cl(0, f'XToolBox {version}')
xemulated999 = cl(1, '@xemu.lated   ')
cls()

##### ^^^^ THIS HAS TO BE HERE


#function to reduce code when using interpreter() page 97
def yn(prompt=""):
    prompt += f" {Fore.RESET}({Fore.GREEN}Y{Fore.RESET}/{Fore.RED}n{Fore.RESET}): "
    goodInput, YNvalue = False, False
    while not goodInput:
        goodInput, YNvalue = interpreter(97, prompt)
    return YNvalue

def dwnTool(tool):
    index = 0
    if (len(tool.dwn)!=1):
        if tool.code[0] == "l": prompt = "Choose your Distro Type"
        else: prompt = "Choose Version"
        index = multiChoose(tool, prompt)
        if index < 0: return

    if tool.command==1:   dl(tool.getDwn(index), tool.getExec(index), tool.getName(index))
    elif tool.command==2: pwsh(tool.getDwn(index), tool.getName(index))
    elif tool.command==3: 
        print(f"XTBox will open:\n\t{tool.getDwn(index)}") #webopen is used only here so no wrapper is needed for now
        if yn("Approve?"): webopen(tool.getDwn(index))
    elif tool.command==4: 
        print(f"XTBox will retrieve data from:\n\t{tool.getDwn(index)}")
        if yn("Approve?"): urlretrieve(tool.getDwn(index), tool.getExec(index))
    elif tool.command==5:
        fwrite(tool.getDwn(index)) # this doesnt really run anything so no approval is neded

#function that interprets user input
#page is what the interface is showing and *args is additional info that may be required for some pages
#!return type is based on the page number! (if not stated otherwise, returns void)
def interpreter(page, prompt="> "):
    global lastPage
    choose = str(input(prompt)).strip().lower() # lower for easier iffing

    #if user inputs 99, exit the program
    if choose == "99":
        exit()

    #if user inputs h, open help
    if choose == "h" and page != 0 :
        # return the correct values to prevent crashes
        if page == 98 or page == 97:
            if lastPage != None: # prevent getting this message in EULA and similar functions
                print("Exit selection to access help!")
            return False, False
        else:
            while not helpe(): pass
            return

    #if user uses the Info command wrong:
    if choose == "i" and page > 0 and page < 20:
        print("'i' is not a valid command, if you want info type:")
        print("\ti <CODE>")
        print("For example: i d2")
        getpass("\n... press ENTER to continue ...", stream=None)
        return

    #page 0 (help)
    #returns true/false which indicate if helpe should close
    if page==0:
        # go back
        if choose == "b" or choose == "": 
            return True
        # elevate powershell execution policy
        if choose == "p": 
            # todo: add warning message that this command is about to be run (not every1 wants it)
            # function wrappers?
            pwsh("Set-ExecutionPolicy Unrestricted -Scope CurrentUser", "SetExecutionPolicy")
            return True
        # not valid option
        else:
            print(f"No option named {choose}")
            return False

    #for pages 1-3 (tool pickers)
    elif page >= 1 and page <= 3:
        if choose == "": pass # prevent empty prompting
        #next page
        elif choose == "n":
            if page==1: lastPage = p2
            elif page==2: lastPage = p3
            elif page==3: lastPage = p1
        #previous page
        elif choose == "b":
            if page==1: lastPage = p3
            elif page==2: lastPage = p1
            elif page==3: lastPage = p2
        #program ID entered
        elif f"{choose}-{page}" in tools:
            dwnTool(tools[f"{choose}-{page}"])
        #i + program ID entered (user wants info)
        elif (len(choose) > 2) and (choose[0:2] == "i ") and (f"{choose[2:]}-{page}" in tools):
            showInfo(tools[f"{choose[2:]}-{page}"])
        #other special options
        elif choose == "qt": quicktweaks()
        elif choose == "c6": chooseeset()
        elif choose == "c7": choosekas()
        #help for special options
        elif choose == "i qt" or choose == "i c6" or choose == "i c7":
            print(f"The specified option is a menu, type {choose[2:]} to open it")
            sleep(3)
        #bad input
        else:
            print(f"No option named {choose}")
            sleep(3)
    
    #for page 10 (quicktweaks)
    elif page == 10:
        if choose == "": pass
        if choose == "b": lastPage = p1
        elif f"{choose}-QT" in tools: 
            dwnTool(tools[f"{choose}-QT"])
        elif choose == "2":
            dwnTool(tools["2-QT-1"])
            dwnTool(tools["2-QT-2"])
        elif (len(choose) > 2) and (choose[0:2] == "i ") and (f"{choose[2:]}-QT" in tools): 
            showInfo(tools[f"{choose[2:]}-QT"])
        elif choose == "i 2":
            showInfo(tools["2-QT-1"])
            showInfo(tools["2-QT-2"])
        else:
            print(f"No option named {choose}")
            sleep(3)

    #page 11 (ESET)
    elif page == 11:
        if choose == "": pass
        if choose == "b": lastPage = p1
        elif f"{choose}-ESET" in tools:
            dwnTool(tools[f"{choose}-ESET"])
        elif (len(choose) > 2) and (choose[0:2] == "i ") and (f"{choose[2:]}-ESET" in tools): 
            showInfo(tools[f"{choose[2:]}-ESET"])   
        else:
            print(f"No option named {choose}")
            sleep(3)

    #page 12 (Kaspersky)
    elif page == 12:
        if choose == "": pass
        if choose == "b": lastPage = p1
        elif f"{choose}-KAS" in tools:
            dwnTool(tools[f"{choose}-KAS"])
        elif (len(choose) > 2) and (choose[0:2] == "i ") and (f"{choose[2:]}-KAS" in tools): 
            showInfo(tools[f"{choose[2:]}-KAS"])
        else:
            print(f"No option named {choose}")
            sleep(3)

    #page 97 (y/n)
    #returns 2 bool args: correct/incorrect input, and y/n answer
    elif page == 97:
        if choose == "y": return True, True
        elif choose == "n": return True, False
        elif choose == "": return True, True
        else:
            print(f"No option named {choose}")
            return False, False

    #page 98 (multiple choice download)
    #returns 2 args: correct/incorrect input (bool), and the chosen option (int)
    #if user wants to exit selection, the second return value becomes negative
    elif page==98:
        # cancel (index < 0)
        if choose == "b": return True, -1
        # user choice
        elif choose.isnumeric() and int(choose) > 0:
            return True, int(choose)-1
        else:
            print(f"No option named {choose}")
            return False, 0

def updater():
    if version < str(latest('xemulat/XToolbox')):
        dl('https://github.com/xemulat/XToolbox/releases/latest/download/XTBox.exe', f'XTBox.{version}.exe', f'XTBox v{version}')
    else:
        Printer.sys(1, 'You just got an ultra-rare error, this means that your version of XTB is somehow newer than the latest GitHub release... Interesting.')
        sleep(6)
        pass

def add_spaces(string):
    while len(string) < 28:
        string += " "
    return string

def xget(ide):
    try:
        if ide in ['t1-1', 'm6-2', 'm7-2', 't3-2', 'l4-3', 'g2-3', 'c6-3']:
            return(cl(1, add_spaces(f" [{(ide.split('-')[0])[1:]}] {tools[ide].name} DNG")))
        else:
            return(add_spaces(f" [{(ide.split('-')[0])[1:]}] {tools[ide].name}"))
    except:
        return('                            ')

#help function is page 0
#returns if it should close
def helpe():
    cls()
    print(f"┌─────────────────────────────────────────────────────────────┐\n"
          f"│  Keybind  │ Command                                         │\n"
          f"│     H     │ Help Page (this page)                           │\n"
          f"│     N     │ Next Page                                       │\n"
          f"│     B     │ Previous Page (back)                            │\n"
          f"│     99    │ Exit                                            │\n"
          f"├─────────────────────────────────────────────────────────────┤\n"
          f"│ Color     │ Meaning                                         │\n"
          f"│ {cl(1, 'RED')}       │ Dangerous Option                                │\n"
          f"│ {cl(0, 'GREEN')}     │ Recommended Option                              │\n"
          f"├─────────────────────────────────────────────────────────────┤\n"
          f"│ Error code │ Explanation                                    │\n"
          f"│      1     │ File already exists                            │\n"
          f"│      2     │ Can't check for file overwrite                 │\n"
          f"│      3     │ Can't download file from the server            │\n"
          f"├─────────────────────────────────────────────────────────────┤\n"
          f"│ If scripts won't execute, press P                           │\n"
          f"├─────────────────────────────────────────────────────────────┤\n"
          f"│                  Press ENTER/B to go back.                  │\n"
          f"└─────────────────────────────────────────────────────────────┘\n")
    return interpreter(0)

#QuickTweaks is page 10
def quicktweaks():
    global lastPage; lastPage = quicktweaks
    cls()
    # god is dead
    print(f"┌────────────────────────────┬──────────────────────────┐\n"
          f"│ [1] {cl(0, 'AntiTrackTime')}          │ [7] NoXboxBloat         R│\n"
          f"│ [2] NoNetworkAuto-Tune     │ [8] {cl(1, 'Limit QoS')}            R│\n"
          f"│ [3] {cl(0, 'Optimize SSD')}          R│ [9] XanderTweak         R│\n"
          f"│ [4] NoActionCenter        R│ [10] AddCopyPath        R│\n"
          f"│ [5] NoNews                R│ [11] DarkMode           R│\n"
          f"│ [6] NoOneDrive             │ [12] AddTakeOwnership   R│\n"
          f"│                            │                          │\n"
          f"├────┬───────────────────────┼──────────┬──────────┬────┤\n"
          f"│    │ Choose your Tweaks :D │ I ─ Info │ B ─ Back │    │\n"
          f"└────┴───────────────────────┴──────────┴──────────┴────┘\n")
    interpreter(10)

#ESET is page 11
def chooseeset():
    global lastPage; lastPage = chooseeset
    cls()
    print(f"┌────────────────────────────────────────────────────────────────────┐\n"
          f"│ [1] ESET Smart Security Premium                                    │\n"
          f"│ [2] ESET Internet Security                                         │\n"
          f"│ [3] ESET NOD32 Antivirus                                           │\n"
          f"│ [4] ESET NOD32 Antivirus Gamer Edition                             │\n"
          f"│ [5] ESET Security for Small Office                                 │\n"
          f"│                                                                    │\n"
          f"├─────────┬──────────────────────────┬──────────┬──────────┬─────────┤\n"
          f"│         │ Choose your ESET version │ I ─ Info │ B ─ Back │         │\n"
          f"└─────────┴──────────────────────────┴──────────┴──────────┴─────────┘\n")
    interpreter(11)

#Kaspersky is page 12
def choosekas():
    global lastPage; lastPage = choosekas
    cls()
    print(f"┌─────────────────────────────────────────────────────────────────────┐\n"
          f"│ [1] Kaspersky Internet Security                                     │\n"
          f"│ [2] Kaspersky Anti-Virus                                            │\n"
          f"│ [3] Kaspersky Total Security                                        │\n"
          f"│                                                                     │\n"
          f"├───────┬───────────────────────────────┬──────────┬──────────┬───────┤\n"
          f"│       │ Choose your Kaspersky version │ I ─ Info │ B ─ Back │       │\n"
          f"└───────┴───────────────────────────────┴──────────┴──────────┴───────┘\n")
    interpreter(12)

def p1():
    global lastPage; lastPage = p1
    cls()
    print(f"┌────────────────────────────┬────────────────────────────┬────────────────────────────┬────────────────────────────┐\n"
          f"│ {xtoolboxve}               │ Made by {xemulated999}     │ Ping: {peeng}              │ {cl(1, 'discord.gg/rwZtqj6HqZ')}      │\n"
          f"├────────────────────────────┼────────────────────────────┼────────────────────────────┼────────────────────────────┤\n"
          f"│ [D] Debloat                │ [T] Tweaks                 │ [A] Apps                   │ [C] Cleaning / Antiviruses │\n"
          f"├────────────────────────────┼────────────────────────────┼────────────────────────────┼────────────────────────────┤\n"
          f"│{xget('d1-1')              }│{xget('t1-1')              }│{xget('a1-1')              }│{xget('c1-1')              }│\n"
          f"│{xget('d2-1')              }│{xget('t2-1')              }│{xget('a2-1')              }│{xget('c2-1')              }│\n"
          f"│{xget('d3-1')              }│{xget('t3-1')              }│{xget('a3-1')              }│{xget('c3-1')              }│\n"
          f"│{xget('d4-1')              }│{xget('t4-1')              }│{xget('a4-1')              }│{xget('c4-1')              }│\n"
          f"│{xget('d5-1')              }│{xget('t5-1')              }│{xget('a5-1')              }│{xget('c5-1')              }│\n"
          f"│{xget('d6-1')              }│{xget('t6-1')              }│{xget('a6-1')              }│ [6] ESET                   │")
    print(f"│{xget('d7-1')              }│{xget('t7-1')              }│{xget('a7-1')              }│ [7] Kaspersky              │\n"
          f"│{xget('d8-1')              }│{xget('t8-1')              }│{xget('a8-1')              }│{xget('c8-1')              }│\n"
          f"│{xget('d9-1')              }│{xget('t9-1')              }│{xget('a9-1')              }│{xget('c9-1')              }│\n"
          f"│{xget('d10-1')             }│{xget('t10-1')             }│{xget('a10-1')             }│{xget('c10-1')             }│\n"
          f"│{xget('d11-1')             }│{xget('t11-1')             }│{xget('a11-1')             }│{xget('c11-1')             }│\n"
          f"│{xget('d12-1')             }│{xget('t12-1')             }│{xget('a12-1')             }│{xget('c12-1')             }│\n"
          f"│{xget('d13-1')             }│{xget('t13-1')             }│{xget('a13-1')             }│{xget('c13-1')             }│\n"
          f"│{xget('d14-1')             }│{xget('t14-1')             }│{xget('a14-1')             }│{xget('c14-1')             }│\n"
          f"│{xget('d15-1')             }│ [QT] Quick Tweaks          │{xget('a15-1')             }│{xget('c15-1')             }│\n"
          f"│{xget('d16-1')             }│                            │{xget('a16-1')             }│{xget('c16-1')             }│\n"
          f"├────────────────────────────┴────────────────────────────┴────────────────────────────┴────────────────────────────┤\n"
          f"│                      Ex.: 'D2' ─ HoneCtrl │ N ─ Next Page │ ^C ─ Exit │ H ─ Help │ I ─ Info                   1/3 │\n"
          f"└───────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘")
    interpreter(1)

def p2():
    global lastPage; lastPage = p2
    cls()
    print(f"┌────────────────────────────┬────────────────────────────┬────────────────────────────┬────────────────────────────┐\n"
          f"│ {xtoolboxve}               │ Made by {xemulated999}     │ Ping: {peeng}              │ {cl(1, 'discord.gg/rwZtqj6HqZ')}      │\n"
          f"├────────────────────────────┼────────────────────────────┼────────────────────────────┼────────────────────────────┤\n"
          f"│ [L] Linux Distros          │ [W] Windows versions       │ [M] Modded Windows Isos    │ [T] Tools                  │\n"
          f"├────────────────────────────┼────────────────────────────┼────────────────────────────┼────────────────────────────┤\n"
          f"│{xget('l1-2')              }│{xget('w1-2')              }│{xget('m1-2')              }│{xget('t1-2')              }│\n"
          f"│{xget('l2-2')              }│{xget('w2-2')              }│{xget('m2-2')              }│{xget('t2-2')              }│\n"
          f"│{xget('l3-2')              }│{xget('w3-2')              }│{xget('m3-2')              }│{xget('t3-2')              }│\n"
          f"│{xget('l4-2')              }│{xget('w4-2')              }│{xget('m4-2')              }│{xget('t4-2')              }│\n"
          f"│{xget('l5-2')              }│{xget('w5-2')              }│{xget('m5-2')              }│{xget('t5-2')              }│\n"
          f"│{xget('l6-2')              }│{xget('w6-2')              }│{xget('m6-2')              }│{xget('t6-2')              }│")
    print(f"│{xget('l7-2')              }├────────────────────────────┤{xget('m7-2')              }├────────────────────────────┤\n"
          f"│{xget('l8-2')              }│ [O] Other                  │{xget('m8-2')              }│ [A] Apps                   │\n"
          f"│{xget('l9-2')              }├────────────────────────────┤{xget('m9-2')              }├────────────────────────────┤\n"
          f"│{xget('l10-2')             }│{xget('o1-2')              }│{xget('m10-2')             }│{xget('a1-2')              }│\n"
          f"│{xget('l11-2')             }│{xget('o2-2')              }│{xget('m11-2')             }│{xget('a2-2')              }│\n"
          f"│{xget('l12-2')             }│{xget('o3-2')              }│{xget('m12-2')             }│{xget('a3-2')              }│\n"
          f"│{xget('l13-2')             }│{xget('o4-2')              }│{xget('m13-2')             }│{xget('a4-2')              }│\n"
          f"│{xget('l14-2')             }│{xget('o5-2')              }│{xget('m14-2')             }│{xget('a5-2')              }│\n"
          f"│{xget('l15-2')             }│{xget('o6-2')              }│{xget('m15-2')             }│{xget('a6-2')              }│\n"
          f"│{xget('l16-2')             }│{xget('o7-2')              }│{xget('m16-2')             }│{xget('a7-2')              }│\n"
          f"├────────────────────────────┴────────────────────────────┴────────────────────────────┴────────────────────────────┤\n"
          f"│                      Ex.: 'D2' ─ HoneCtrl │ N ─ Next Page │ ^C ─ Exit │ H ─ Help │ I ─ Info                   2/3 │\n"
          f"└───────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘")
    interpreter(2)

def p3():
    global lastPage; lastPage = p3
    cls()
    print(f"┌────────────────────────────┬────────────────────────────┬────────────────────────────┬────────────────────────────┐\n"
          f"│ {xtoolboxve}               │ Made by {xemulated999}     │ Ping: {peeng}              │ {cl(1, 'discord.gg/rwZtqj6HqZ')}      │\n"
          f"├────────────────────────────┼────────────────────────────┼────────────────────────────┼────────────────────────────┤\n"
          f"│ [L] Minecraft Launchers    │ [G] Game Launchers         │ [C] Minecraft Clients      │ [I] Misc                   │\n"
          f"├────────────────────────────┼────────────────────────────┼────────────────────────────┼────────────────────────────┤\n"
          f"│{xget('l1-3')              }│{xget('g1-3')              }│{xget('c1-3')              }│{xget('i1-3')              }│\n"
          f"│{xget('l2-3')              }│{xget('g2-3')              }│{xget('c2-3')              }│{xget('i2-3')              }│\n"
          f"│{xget('l3-3')              }│{xget('g3-3')              }│{xget('c3-3')              }│{xget('i3-3')              }│\n"
          f"│{xget('l4-3')              }│{xget('g4-3')              }│{xget('c4-3')              }│{xget('i4-3')              }│\n"
          f"│{xget('l5-3')              }│{xget('g5-3')              }│{xget('c5-3')              }│{xget('i5-3')              }│\n"
          f"│{xget('l6-3')              }│{xget('g6-3')              }│{xget('c6-3')              }│{xget('i6-3')              }│")
    print(f"│{xget('l7-3')              }│{xget('g7-3')              }│{xget('c7-3')              }├────────────────────────────┤\n"
          f"│{xget('l8-3')              }│{xget('g8-3')              }│{xget('c8-3')              }│ [T] Tools                  │\n"
          f"│{xget('l9-3')              }│{xget('g9-3')              }│{xget('c9-3')              }├────────────────────────────┤\n"
          f"│{xget('l10-3')             }│{xget('g10-3')             }│{xget('c10-3')             }│{xget('t1-3')              }│\n"
          f"│{xget('l11-3')             }│{xget('g11-3')             }│{xget('c11-3')             }│{xget('t2-3')              }│\n"
          f"│{xget('l12-3')             }│{xget('g12-3')             }│{xget('c12-3')             }│{xget('t3-3')              }│\n"
          f"│{xget('l13-3')             }│{xget('g13-3')             }│{xget('c13-3')             }│{xget('t4-3')              }│\n"
          f"│{xget('l14-3')             }│{xget('g14-3')             }│{xget('c14-3')             }│{xget('t5-3')              }│\n"
          f"│{xget('l15-3')             }│{xget('g15-3')             }│{xget('c15-3')             }│{xget('t6-3')              }│\n"
          f"│{xget('l16-3')             }│{xget('g16-3')             }│{xget('c16-3')             }│{xget('t7-3')              }│\n"
          f"├────────────────────────────┴────────────────────────────┴────────────────────────────┴────────────────────────────┤\n"
          f"│                      Ex.: 'D2' ─ HoneCtrl │ N ─ Next Page │ ^C ─ Exit │ H ─ Help │ I ─ Info                   3/3 │\n"
          f"└───────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘")
    interpreter(3)

# Security and integrity checks.

# File hash check.
Printer.zpr('Performing security checks...')
if '-f' not in argv:
    if isfile('bypass.xtb') == False:

        Printer.zpr('Checking File hash...')
        response = get('https://raw.githubusercontent.com/xemulat/XToolbox/main/hash.json')
        data = response.json()
        if (data[version]).lower() == get_checksum(executable):
            Printer.sys(1, 'File hash match!')
        else:
            Printer.sys(0, "File hash doesn't match!")
            print("File hash doesn't match the official hash for XTBox, this means the file could be tampered with. Download the program using the displayed url.")
            webopen('https://github.com/xemulat/XToolbox/releases/latest')
            print('Continue anyways?')
            if not yn(): exit()

        Printer.zpr('Checking Ping...')
        if ping('google.com', unit='ms') > 200:
            Printer.sys(0, 'Your ping is too high, continue anyways?')
            if not yn(): exit()
        else:
            Printer.sys(1, 'Ping check passed!')

        Printer.zpr('Checking for updates...')
        if str(latest('xemulat/XToolbox')) == version:
            Printer.sys(1, 'XTB is up to date!')
        else:
            Printer.sys(0, 'XTB is outdated, launching the updater...')
            updater()

        Printer.zpr('Checking software requirements...')
        if int(release())<10:
            Printer.sys(0, "Your Windows version is older than 10, this program won't run. Upgrade to Windows 10/11 if you want to use this program.")
            exit(sleep(15))
        else:
            Printer.sys(1, "Your Windows version is compatible with XTB")

        # KILL KILL KILL KILL KILL KILL KILL KILL
        Printer.zpr('Checking hardware requirements...')
        if not cpu_count(logical=True)<2:
            Printer.sys(1, 'CPU core count requirements met!')
        else:
            Printer.sys(0, 'Your CPU core count is too low to run XTB, continue anyways?')
            if not yn(): exit()

        if not virtual_memory().total/1073741824<2:
            Printer.sys(1, 'RAM requirements met!')
        else:
            Printer.sys(0, 'You have too little RAM in your PC to run XTB, continue anyways?')
            if not yn(): exit()

else:
    Printer.sys(1, 'Checks skipped.')

try:
    p1()
    while True:
        #global variable declared in page functions
        lastPage() 
except KeyboardInterrupt:
    print('bye!')
    exit()
