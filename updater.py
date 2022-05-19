import wget
import read


#set vars
yourversion = "0.0.2 "
fname1 = 'relver.txt'
fname2 = 'Virus.Removal.Toolkit.zip'


print("Downloading update info...")
wget.download('https://raw.githubusercontent.com/xemulat/Virus-Removal-Toolkit/main/newestversion.txt', fname1)
f=open("relver.txt", "r")
if f.mode == 'r':
    contents =f.read()


latesturl = 'https://github.com/xemulat/Virus-Removal-Toolkit/releases/download/v0.0.2/Virus.Removal.Toolkit.exe'
print (latesturl)
    

print(" ")
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
        print ("Downloading latest update (as .zip)...")
        wget.download(latesturl, fname2)
        print(" ")
        print("Downloaded, exiting...")
        exit()
    
    if answer[0] == "n":
        print("Okey, exiting")
        exit()

    else:
        exit()

    if yes_or_no("Ayy?"):
        print("Lmao :D")
    else:
        print(":(")
