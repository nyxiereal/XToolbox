# User interface
from rich.console import Console
from rich.table import Table
from rich.text import Text

# Downloader
from requests.adapters import HTTPAdapter
from os import remove, system, startfile
from urllib.request import urlretrieve
from urllib.parse import urlparse
from requests import Session
from tqdm import tqdm

# Opening web pages
from webbrowser import open as webopen

# Helpers, tools and data
from tools import chooseQuotes, footers, columns
from xtools import tools, showInfo, iScrape

# User input and cooldowns
from time import sleep
from getpass import getpass

# Updater
from lastversion import latest

# Exiting from the program
from sys import exit

c = Console()

VERSION = "4.0"

# Write and start (or not) a file
def fWrite(run, filename, content):
    fp = open(filename, 'w')
    fp.write(content)
    fp.close()
    if run == 1: startfile(filename)

# Run a command as powershell
def runAsPowershell(command, filename):
    fWrite(1, f"{filename}.bat", r'@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "'+command+'"')

# Clear the display
def cls():
    system('cls')

# Print text in a color
def cl(color, text):
    if color == 1:
        return(f'[red]{text}[/red]')
    else:
        return(f'[green]{text}[/green]')

# Printing helper
class Printer():
    def sys(clr, text):
        if clr == 1:
            c.print(f'[green][✓] {text}[/green]')
        else:
            c.print(f'[red][✗] {text}[/red]')
    def zpr(text):
        c.print(f'[blue][>] {text}[/blue]')

# Very cool and good looking downloader
def download(url, fnam, name):
    try: # noice
        if name == None:
            name = fnam

        # Parse the URL and convert it to https.
        url = (urlparse(url))._replace(scheme='https').geturl()
        # nice
        adapter = HTTPAdapter(max_retries=3,
                              pool_connections=20,
                              pool_maxsize=10)

        # Add headers to bypass simple robots.txt blocking
        headers = {'Accept-Encoding': 'gzip, deflate',
                   'User-Agent': 'Mozilla/5.0',
                   'cache_control': 'max-age=600',
                   'connection': 'keep-alive'}

        # Create a session and make a head request using it
        session = Session()

        # Mount the HTTP adapter to the session.
        session.mount('https://', adapter)

        response = session.head(url, headers=headers)

        # Get the total size of the file
        total_size = int(response.headers.get("content-length", 0))

        r = session.get(url, stream=True, headers=headers)

        progress_bar = tqdm(total=total_size, unit='iB', unit_scale=True, bar_format='{desc}: {percentage:3.0f}% │ {bar} │ {n_fmt} / {total_fmt} ║ {elapsed} ─ {remaining} │ {rate_fmt}')

        with open(fnam, 'wb') as file:
            for data in r.iter_content(4096):
                progress_bar.update(len(data))
                file.write(data)

            # Close the progress bar and print a message when the download is complete.
            progress_bar.close()

    except KeyboardInterrupt:
        progress_bar.close()
        Printer.sys(0,'Aborting!')
        remove(fnam)

def updater():
    up = latest("xemulat/XToolBox")
    if VERSION < str(up):
        Printer.zpr(f'New version available: {up}, do you want to update?')
        if yn():
            download('https://github.com/xemulat/XToolBox/releases/latest/download/XTBox.exe', f'XTBox.{up}.exe', 'XToolBox Update')
            Printer.sys(1, 'Done!')
            exit(startfile(f'XTBox.{up}.exe'))

# function to reduce code when using interpreter() page 97
def yn(prompt=""):
    prompt += f"([green]Y[/green]/[red]n[/red]): "
    goodInput, YNvalue = False, False
    while not goodInput:
        goodInput, YNvalue = interpreter(97, prompt)
    return YNvalue

# function for multiple choice downloads interpreter() page 98
# returns the index of chosen option, it can return -1 if the user canceled selection
# tool is <Tool>, prompt is <str>
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

    # determining window size
    size = 34 # min size
    if len(prompt)+10 > size: size = len(prompt)+10 # the +10 is because of minimum space on both sides of the prompt (|          |)
    for ind in range(len(tool.dwn)):
        if len(tool.getDesc(ind))+7+len(str(ind+1)) > size: # the +7 is because of the minimum possible space in an option (│ []  │)
            size = len(tool.getDesc(ind))+7+len(str(ind+1)) # ind +1 cuz ind goes from 0 to max-1

    # ensuring symmetry
    if len(prompt)%2 == 0:
        backMessage = "< B - back >"
        if size%2==1: size+=1
    else:
        backMessage = "< back: B >"
        if size%2==0: size+=1
    
    # the top bar
    c.print(f"┌{'─'*int((size-2-len(backMessage))/2)}{backMessage}{'─'*int((size-2-len(backMessage))/2)}┐")

    # empty line cuz it looks nice :D
    c.print(f"│{' '*(size-2)}│")

    # options
    for ind in range(len(tool.dwn)):
        c.print(f"│ [{ind+1}] {tool.getDesc(ind)}{' '*int(size-6-len(tool.getDesc(ind))-len(str(ind+1)))}│")

    # another empty
    c.print(f"│{' '*(size-2)}│")

    # prompt
    c.print(f"├{'─'*(size-2)}┤")    
    c.print(f"│{' '*int((size-2-len(prompt))/2)}{prompt}{' '*int((size-2-len(prompt))/2)}│")
    c.print(f"└{'─'*(size-2)}┘")

    goodInput = False
    while not goodInput:
        goodInput, index = interpreter(98)
        if index > len(tool.dwn): goodInput = False

    return index

def dl(url, urlr, name):
    # Before downloading files, check if the url contains a version-code
    if '%UBUNTUVERSION%' in url:
        url = url.replace('%UBUNTUVERSION%', iScrape.ubuntu())

    elif '%POP%' in url:
        url = iScrape.popOS(url.split(',')[1])

    elif '%MINTVERSION%' in url:
        url = url.replace('%MINTVERSION%', iScrape.mint())

    elif '%ARTIX%' in url:
        url = iScrape.artix(url.split(',')[1])
        
    elif '%SOLUS%' in url:
        url = iScrape.solus(url.split(',')[1])
        
    elif '%DEBIAN%' in url:
        url = iScrape.debian()
    
    elif r'%ENDEAVOUR%' in url:
        url = url.replace(r'%ENDEAVOUR%', iScrape.endeavour())
        
    elif '%CACHYVERSION%' in url:
        url = url.replace('%CACHYVERSION%', iScrape.cachy())

    # make sure user understands what they are about do download
    c.print(f"XTBox will download an executable from:\n\t{url}")
    if not yn("Approve?"): 
        return

    try:
        download(url, urlr, name)
        if urlr[-3:] != "iso":
            if yn(f"Run {urlr}?"): 
                startfile(urlr)
    except:
        Printer.sys(0, "ERROR 3: Can't download file from the server...")
    
    getpass("\n... press ENTER to continue ...", stream=None)
    pageDisplay(last)

# runAsPowershell() wrapper
def pwsh(cmd, name):
    c.print(f"XTBox will run the following command as powershell:\n\t{cmd}")
    if not yn("Approve?"): return
    runAsPowershell(cmd, name)

###### random stuff
cls()

def checkforlinks(inp):
    if r'%GHOSTSPECTRE%' in inp:
        return(iScrape.ghostSpectre())
    else:
        return(inp)

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
        i = checkforlinks(tool.getDwn(index))
        c.print(f"XTBox will open:\n\t{i}") #webopen is used only here so no wrapper is needed for now
        if yn("Approve?"): webopen(i)
    elif tool.command==4: 
        c.print(f"XTBox will retrieve data from:\n\t{tool.getDwn(index)}")
        if yn("Approve?"): urlretrieve(tool.getDwn(index), tool.getExec(index))
    elif tool.command==5:
        fWrite(tool.getDwn(index)) # this doesnt really run anything so no approval is neded

def helpe():
    cls()
    c.print(f"┌─────────────────────────────────────────────────────────────┐\n"
            f"│  Keybind  │ Command                                         │\n"
            f"│     H     │ Help Page (this page)                           │\n"
            f"│     N     │ Next Page                                       │\n"
            f"│     B     │ Previous Page (back)                            │\n"
            f"│     99    │ Exit                                            │\n"
            f"├─────────────────────────────────────────────────────────────┤\n"
            f"│   Color   │ Meaning                                         │\n"
            f"│ {cl(1, 'YELLOW')}    │ Advanced Option                                 │\n"
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

# function that interprets user input
# page is what the interface is showing and *args is additional info that may be required for some pages
# !return type is based on the page number! (if not stated otherwise, returns void)
def interpreter(page, prompt="> "):
    global lastPage
    choose = str(c.input(prompt)).strip().lower() # lower for easier iffing

    # if user inputs 99, exit the program
    if choose == "99":
        exit()

    # if user inputs h, open help
    if choose == "h" and page != 0 :
        # return the correct values to prevent crashes
        if page == 98 or page == 97:
            if lastPage != None: # prevent getting this message in EULA and similar functions
                c.print("Exit selection to access help!")
            return False, False
        else:
            while not helpe(): pass
            return

    # if user uses the Info command wrong:
    if choose == "i" and page > 0 and page < 20:
        c.print("'i' is not a valid command, if you want info type:")
        c.print("\ti <CODE>")
        c.print("For example: i d2")
        getpass("\n... press ENTER to continue ...", stream=None)
        pageDisplay(page)

    # page 0 (help)
    # returns true/false which indicate if helpe should close
    if page==0:
        # go back
        if choose == "b" or choose == "": 
            pageDisplay(last)
        # elevate powershell execution policy
        if choose == "p": 
            # todo: add warning message that this command is about to be run (not every1 wants it)
            # function wrappers?
            pwsh("Set-ExecutionPolicy Unrestricted -Scope CurrentUser", "SetExecutionPolicy")
            return True
        # not valid option
        else:
            c.print(f"No option named {choose}")
            return False

    #for pages 1-3 (tool pickers)
    elif page >= 1 and page <= 4:
        if choose == "": pass # prevent empty prompting
        # next page
        elif choose == "n":
            if page == 1: lastPage = pageDisplay(2)
            if page == 2: lastPage = pageDisplay(3)
            if page == 3: lastPage = pageDisplay(1)
        # previous page
        elif choose == "b":
            if page == 1: lastPage = pageDisplay(3)
            if page == 2: lastPage = pageDisplay(1)
            if page == 3: lastPage = pageDisplay(2)
        # program ID entered
        elif f"{choose}-{page}" in tools:
            dwnTool(tools[f"{choose}-{page}"])
            pageDisplay(page)
        # i + program ID entered (user wants info)
        elif (len(choose) > 2) and (choose[0:2] == "i ") and (f"{choose[2:]}-{page}" in tools):
            showInfo(tools[f"{choose[2:]}-{page}"])
            pageDisplay(page)
        # bad input
        else:
            c.print(f"No option named {choose}")
            sleep(3)
            pageDisplay(page)

    # page 97 (y/n)
    # returns 2 bool args: correct/incorrect input, and y/n answer
    elif page == 97:
        if choose == "y": return True, True
        elif choose == "n": return True, False
        elif choose == "": return True, True
        else:
            c.print(f"No option named {choose}")
            return False, False

    # page 98 (multiple choice download)
    # returns 2 args: correct/incorrect input (bool), and the chosen option (int)
    # if user wants to exit selection, the second return value becomes negative
    elif page==98:
        # cancel (index < 0)
        if choose == "b": return True, -1
        # user choice
        elif choose.isnumeric() and int(choose) > 0:
            return True, int(choose)-1
        else:
            c.print(f"No option named {choose}")
            return False, 0

def xget(ide):
    try:
        first = (f'[bold][[/bold][blue][bold]{(ide.split('-')[0])[1:]}[/blue][/bold][bold]][/bold] {Text(tools[ide].name)}')
        if ide in ['t1-1', 'm6-2', 'm7-2', 't3-2', 'l4-3', 'g2-3', 'c6-3']:
            return(f'{first} [yellow]ADV[/yellow]')
        else:
            return(first)
    except:
        return('')

def pageDisplay(page):
    global last, welcome
    last = page
    cls()
    if welcome == 0:
        table = Table(title=f"XToolBox | v{VERSION}, Made by Xemulated.", show_footer=True)
        welcome = 1
    else:
        table = Table(title=f"XToolBox | {chooseQuotes()}", show_footer=True)

    table.add_column(f"[[blue]{(columns[page][0][0]).capitalize()}[/blue]] {columns[page][0][1]}", footers[0], justify='left',min_width=24)
    table.add_column(f"[[blue]{(columns[page][1][0]).capitalize()}[/blue]] {columns[page][1][1]}", footers[1], justify='left',min_width=24)
    table.add_column(f"[[blue]{(columns[page][2][0]).capitalize()}[/blue]] {columns[page][2][1]}", footers[2], justify='left',min_width=24)
    table.add_column(f"[[blue]{(columns[page][3][0]).capitalize()}[/blue]] {columns[page][3][1]}", f'[blue]{page}/{len(columns)-1}[/blue]', min_width=24)

    for i in range(15):
        if i != 0:
            table.add_row(xget(f'{columns[page][0][0]}{i}-{page}'), xget(f'{columns[page][1][0]}{i}-{page}'), xget(f'{columns[page][2][0]}{i}-{page}'), xget(f'{columns[page][3][0]}{i}-{page}'))

    c.print(table)
    interpreter(page)

# init
updater()
welcome = 0
while True:
    try:
        pageDisplay(1)
    except KeyboardInterrupt: # NICE
        print('bye!')
        exit()