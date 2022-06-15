from urllib.request import urlretrieve
import sys
from time import sleep
from os import system
from socket import create_connection, gethostbyname
from colorama import Fore, Back, Style, init
init(autoreset=True)

#TESTING! Optimized print function
def BPrint(prent)
    print(Fore.BLUE + prent)

def RPrint(prentr)
    print(Fore.RED + prentr)

def WPrint(prentw)
    print(Fore.WHITE + prentw)

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
def powpow(name, repname, replink):
    system('cls')
    RPrint("[S>] Downloading "+ name +"...")
    urlretrieve(replink, repname, reporter)
    RPrint("[S>] " +name+ " Downloaded, exiting...")
    exit(sleep(3))

#Check Is Internet Connection
def is_connected():
  try:
    host = gethostbyname("github.com")
    s = create_connection((host, 80), 2)
    return 'Yes'
  except:
     pass
  return 'No'

#Main
system('cls')
RPrint"[S>] Testing Internet...")
if is_connected() == 'Yes':
    system('cls')
    RPrint("[S>] Internet is connected")
    print(" ")
    BPrint("Welcome to Xem's Decryptor Downloader")
    WPrint("Select Ransomware Decryptor:")
    BPrint("1. Alpha")
    BPrint("2. Aurora")
    BPrint("3. BitKangaroo")
    BPrint("4. BitStak")
    BPrint("5. BTCWare")
    BPrint("6. Crypt38")
    BPrint("7. DCry")
    BPrint("8. CryptON")
    BPrint("9. Jigsaw")
    BPrint("10. Stop / Djvu")
    BPrint("11. FilesLocker")
    BPrint("12. Gibon")
    BPrint("13. HiddenTear")
    BPrint("14. InsaneCrypt")
    BPrint("15. MirCop")
    BPrint("16. Mole02")
    BPrint("17. PowerLocky")
    BPrint("18. Striked")
    BPrint("19. Stupid")
    BPrint("20. Unlock92")
    BPrint("21. Emisoft Emergency Kit")
    BPrint("99/0. Exit")
    whattoinstalldwag = input(": ")
    
if is_connected() == 'No':
    system('cls')
    RPrint("No internet connected, exiting...")
    exit(sleep(5))
    
if whattoinstalldwag == '1':
    powpow('Alpha DCR', 'AlphaDCR.zip', 'https://github.com/xemulat/MyFilesForDDL/releases/download/decryptors/AlphaDecrypter.zip')

if whattoinstalldwag == '2':
    powpow('Aurora DCR', 'AuroraDCR.zip', 'https://github.com/xemulat/MyFilesForDDL/releases/download/decryptors/AuroraDecrypter.zip')

if whattoinstalldwag == '3':
    powpow('BitKangaroo DCR', 'BitKangarooDCR', 'https://github.com/xemulat/MyFilesForDDL/releases/download/decryptors/BitKangarooDecrypter.zip')

if whattoinstalldwag == '4':
    powpow('BitStak DCR', 'BitStakDCR.zip', 'https://github.com/xemulat/MyFilesForDDL/releases/download/decryptors/BitStakDecrypter.zip')

if whattoinstalldwag == '5':
    powpow('BTCWare DCR', 'BTCWareDCR.zip', 'https://github.com/xemulat/MyFilesForDDL/releases/download/decryptors/BTCWareDecrypter.zip')

if whattoinstalldwag == '6':
    powpow('Crypt38 Keygen', Crypt38KeyGen.zip'https://github.com/xemulat/MyFilesForDDL/releases/download/decryptors/Crypt38Keygen.zip')

if whattoinstalldwag == '7':
    powpow('DCry DCR', 'DCryDCR.zip , 'https://github.com/xemulat/MyFilesForDDL/releases/download/decryptors/DCryDecrypter.zip')

if whattoinstalldwag == '8':
    powpow('CryptON DCR', 'CryptONDCR.exe', 'https://github.com/xemulat/MyFilesForDDL/releases/download/decryptors/decrypt_CryptON.exe')

if whattoinstalldwag == '9':
    powpow('Jigsaw DCR', 'JigsawDCR.exe', 'https://github.com/xemulat/MyFilesForDDL/releases/download/decryptors/decrypt_Jigsaw.exe')

if whattoinstalldwag == '10':
    replink = 'https://github.com/xemulat/MyFilesForDDL/releases/download/decryptors/decrypt_STOPDjvu.exe'
    powpow('StopDjvuDCR', 'StopDjvuDCR.exe')

if whattoinstalldwag == '11':
    replink = 'https://github.com/xemulat/MyFilesForDDL/releases/download/decryptors/FilesLockerDecrypter.zip'
    powpow('FilesLockerDCR', 'FilesLockerDCR.exe')

if whattoinstalldwag == '12':
    replink = 'https://github.com/xemulat/MyFilesForDDL/releases/download/decryptors/GibonDecrypter.zip'
    powpow('GibbonDCR', 'GibbonDCR.zip')

if whattoinstalldwag == '13':
    replink = 'https://github.com/xemulat/MyFilesForDDL/releases/download/decryptors/hidden-tear-bruteforcer.zip'
    powpow('HiddenTearDCR', 'HiddenTearDCR.zip')

if whattoinstalldwag == '14':
    replink = 'https://github.com/xemulat/MyFilesForDDL/releases/download/decryptors/InsaneCryptDecrypter.zip'
    powpow('InsaneCryptDCR', 'InsaneCryptDCR.zip')

if whattoinstalldwag == '15':
    replink = 'https://github.com/xemulat/MyFilesForDDL/releases/download/decryptors/MirCopDecrypter.zip'
    powpow('MirCopDCR', 'MirCopDCR.zip')

if whattoinstalldwag == '16':
    replink = 'https://github.com/xemulat/MyFilesForDDL/releases/download/decryptors/Mole02Decryptor.zip'
    powpow('Mole02DCR', 'Mole02DCR.zip')

if whattoinstalldwag == '17':
    replink = 'https://github.com/xemulat/MyFilesForDDL/releases/download/decryptors/PowerLockyDecrypter.zip'
    powpow('PowerLockyDCR', 'PowerLockyDCR', )

if whattoinstalldwag == '18':
    replink = 'https://github.com/xemulat/MyFilesForDDL/releases/download/decryptors/StrikedDecrypter.zip'
    powpow('StrikedDCR', 'StrikedDCR', )

if whattoinstalldwag == '19':
    replink = 'https://github.com/xemulat/MyFilesForDDL/releases/download/decryptors/StupidDecry
    powpow('StupidDCR', 'StupidDCR', )

if whattoinstalldwag == '20':
    powpow('Unlock92DCR', 'Unlock92DCR',  'https://github.com/xemulat/MyFilesForDDL/releases/download/decryptors/Unlock92Decrypter.zip')

if whattoinstalldwag == '21':
    powpow('Emisoft Emergency Kit', 'EmisoftEmergencyKit.exe', 'https://dl.emsisoft.com/EmsisoftEmergencyKit.exe')

if whattoinstalldwag == '99' or whattoinstalldwag == '0' or whattoinstalldwag == '':
    print("")
    print("Exiting...")
    exit(sleep(6))
