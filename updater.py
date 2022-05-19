import wget
import read
import webbrowser


#set vars
yourversion = "0.0.3 "
fname1 = 'relver.txt'
fname2 = 'Virus.Removal.Toolkit.zip'


print("Downloading update info...")
wget.download('https://raw.githubusercontent.com/xemulat/Virus-Removal-Toolkit/main/newestversion.txt', fname1)
f=open("relver.txt", "r")
if f.mode == 'r':
    contents =f.read()



latesturl = 'https://github.com/xemulat/Virus-Removal-Toolkit/releases/latest'


print(" ")
print("You need to remove relver.txt file!")
print("Newest version is: " + contents)
print("Your version is: " + yourversion)
if (contents == yourversion):
    print("Your version is up-to-date!")
    exit()
elif (contents >= yourversion):
    print("Your version is outdated :(")
    print("Do you want to update now?")
    answer = input("update: " + "(y/n): ").lower().strip()
    print("")
    while not(answer == "y" or answer == "yes" or \
    answer == "n" or answer == "no"):
        print("Input yes or no")
        answer = input(question + "(y/n):").lower().strip()
        print("")
    
    if answer[0] == "y":
        print ("Opening latest update in browser...")
        webbrowser.open(latesturl, new=2)
        print("Opened, exiting...")
        exit()
    
    if answer[0] == "n":
        print("Okey, exiting")
        exit()

    else:
        exit()