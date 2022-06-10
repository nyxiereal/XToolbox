from urllib.request import urlretrieve
import sys
from time import sleep
from os import system
import socket
from colorama import Fore, Back, Style, init
init(autoreset=True)

#Progress Bar And Size Reporter
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

#UrlRetriever
def powpow():
    system('cls')
    print(Fore.RED +"[S>] Downloading "+ name +"...")
    urlretrieve(replink, repname, reporter)
    print(Fore.RED +"[S>] " +name+ " Downloaded, exiting...")
    exit(sleep(3,5))

#Check Is Internet Connection
def is_connected():
  try:
    host = socket.gethostbyname("github.com")
    s = socket.create_connection((host, 80), 2)
    return 'Yes'
  except:
     pass
  return 'No'

#Main
system('cls')
print(Fore.RED +"[S>] Testing Internet...")
if is_connected() == 'Yes':
    system('cls')
    print(Fore.RED +"[S>] Internet is connected")
    print(" ")
    print(Fore.BLUE +"Welcome to Xem's Decryptor Downloader")
    print(Fore.WHITE +"Select Ransomware Decryptor:")
    print(Fore.BLUE +"1. Alpha")
    print(Fore.BLUE +"2. Aurora")
    print(Fore.BLUE +"3. BitKangaroo")
    print(Fore.BLUE +"4. BitStak")
    print(Fore.BLUE +"5. BTCWare")
    print(Fore.BLUE +"6. Crypt38")
    print(Fore.BLUE +"7. DCry")
    print(Fore.BLUE +"8. CryptON")
    print(Fore.BLUE +"9. Jigsaw")
    print(Fore.BLUE +"10. Stop / Djvu")
    print(Fore.BLUE +"11. FilesLocker")
    print(Fore.BLUE +"12. Gibon")
    print(Fore.BLUE +"13. HiddenTear")
    print(Fore.BLUE +"14. InsaneCrypt")
    print(Fore.BLUE +"15. MirCop")
    print(Fore.BLUE +"16. Mole02")
    print(Fore.BLUE +"17. PowerLocky")
    print(Fore.BLUE +"18. Striked")
    print(Fore.BLUE +"19. Stupid")
    print(Fore.BLUE +"20. Unlock92")
    print(Fore.BLUE +"21. Emisoft Emergency Kit")
    print(Fore.BLUE +"99/0. Exit")
    whattoinstalldwag = input(": ")
    
if is_connected() == 'No':
    system('cls')
    print("No internet connected, exiting...")
    exit(sleep(5))
    
if whattoinstalldwag == '1':
    repname = 'Alpha.zip'
    replink = 'https://github.com/xemulat/MyFilesForDDL/releases/download/decryptors/AlphaDecrypter.zip'
    name = ''
    powpow()

if whattoinstalldwag == '2':
    repname = 'Aurora.zip'
    replink = 'https://github.com/xemulat/MyFilesForDDL/releases/download/decryptors/AuroraDecrypter.zip'
    name = ''
    powpow()

if whattoinstalldwag == '3':
    repname = 'BitKangaroo.zip'
    replink = 'https://github.com/xemulat/MyFilesForDDL/releases/download/decryptors/BitKangarooDecrypter.zip'
    name = ''
    powpow()

if whattoinstalldwag == '4':
    repname = 'BitStak.zip'
    replink = 'https://github.com/xemulat/MyFilesForDDL/releases/download/decryptors/BitStakDecrypter.zip'
    name = ''
    powpow()

if whattoinstalldwag == '5':
    repname = 'BTCWare.zip'
    replink = 'https://github.com/xemulat/MyFilesForDDL/releases/download/decryptors/BTCWareDecrypter.zip'
    name = ''
    powpow()

if whattoinstalldwag == '6':
    repname = 'Crypt38.zip'
    replink = 'https://github.com/xemulat/MyFilesForDDL/releases/download/decryptors/Crypt38Keygen.zip'
    name = ''
    powpow()

if whattoinstalldwag == '7':
    repname = 'DCry.zip'
    replink = 'https://github.com/xemulat/MyFilesForDDL/releases/download/decryptors/DCryDecrypter.zip'
    name = ''
    powpow()

if whattoinstalldwag == '8':
    repname = 'CryptON.exe'
    replink = 'https://github.com/xemulat/MyFilesForDDL/releases/download/decryptors/decrypt_CryptON.exe'
    name = ''
    powpow()

if whattoinstalldwag == '9':
    repname = 'Jigsaw.exe'
    replink = 'https://github.com/xemulat/MyFilesForDDL/releases/download/decryptors/decrypt_Jigsaw.exe'
    name = ''
    powpow()

if whattoinstalldwag == '10':
    repname = 'StopDjvu.exe'
    replink = 'https://github.com/xemulat/MyFilesForDDL/releases/download/decryptors/decrypt_STOPDjvu.exe'
    name = ''
    powpow()

if whattoinstalldwag == '11':
    repname = 'FilesLocker.zip'
    replink = 'https://github.com/xemulat/MyFilesForDDL/releases/download/decryptors/FilesLockerDecrypter.zip'
    name = ''
    powpow()

if whattoinstalldwag == '12':
    repname = 'Gibbon.zip'
    replink = 'https://github.com/xemulat/MyFilesForDDL/releases/download/decryptors/GibonDecrypter.zip'
    name = ''
    powpow()

if whattoinstalldwag == '13':
    repname = 'HiddenTear.zip'
    replink = 'https://github.com/xemulat/MyFilesForDDL/releases/download/decryptors/hidden-tear-bruteforcer.zip'
    name = ''
    powpow()

if whattoinstalldwag == '14':
    repname = 'InsaneCrypt.zip'
    replink = 'https://github.com/xemulat/MyFilesForDDL/releases/download/decryptors/InsaneCryptDecrypter.zip'
    name = ''
    powpow()

if whattoinstalldwag == '15':
    repname = 'MirCop.zip'
    replink = 'https://github.com/xemulat/MyFilesForDDL/releases/download/decryptors/MirCopDecrypter.zip'
    name = ''
    powpow()

if whattoinstalldwag == '16':
    repname = 'Mole02.zip'
    replink = 'https://github.com/xemulat/MyFilesForDDL/releases/download/decryptors/Mole02Decryptor.zip'
    name = ''
    powpow()

if whattoinstalldwag == '17':
    repname = 'PowerLocky.zip'
    replink = 'https://github.com/xemulat/MyFilesForDDL/releases/download/decryptors/PowerLockyDecrypter.zip'
    name = ''
    powpow()

if whattoinstalldwag == '18':
    repname = 'Striked.zip'
    replink = 'https://github.com/xemulat/MyFilesForDDL/releases/download/decryptors/StrikedDecrypter.zip'
    name = ''
    powpow()

if whattoinstalldwag == '19':
    repname = 'Stupid.zip'
    replink = 'https://github.com/xemulat/MyFilesForDDL/releases/download/decryptors/StupidDecrypter.zip'
    name = ''
    powpow()

if whattoinstalldwag == '20':
    repname = 'Unlock92.zip'
    replink = 'https://github.com/xemulat/MyFilesForDDL/releases/download/decryptors/Unlock92Decrypter.zip'
    name = ''
    powpow()

if whattoinstalldwag == '21':
    repname = 'EmisoftEmergencyKit.exe'
    replink = 'https://dl.emsisoft.com/EmsisoftEmergencyKit.exe'
    name = 'Emisoft Emergency Kit'
    powpow()

if whattoinstalldwag == '99' or whattoinstalldwag == '0' or whattoinstalldwag == '':
    print("")
    print("Exiting...")
    exit(sleep(6))
