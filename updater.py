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


latesturl = 'https://objects.githubusercontent.com/github-production-release-asset-2e65be/491394711/b6e7872c-a6bb-4883-a0ac-1a77900391f2?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20220518%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20220518T192451Z&X-Amz-Expires=300&X-Amz-Signature=b373eed96a56d5bad95de137471483bbd8dff9a9d0ccc8f4ce182911f9a7180f&X-Amz-SignedHeaders=host&actor_id=98595166&key_id=0&repo_id=491394711&response-content-disposition=attachment%3B%20filename%3DVirus.Removal.Toolkit.zip&response-content-type=application%2Foctet-stream'
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
