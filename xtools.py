# Standard library imports
from re import findall, search

# Third-party imports
from lastversion import latest
from getpass import getpass
from rich.console import Console
from requests import get
from bs4 import BeautifulSoup

c = Console()


class iScrape:
    """Class for scraping information."""

    def ubuntu():
        # URL of the Ubuntu releases page
        url = "https://releases.ubuntu.com/"

        # Send an HTTP GET request to the URL
        response = get(url)

        # Parse the HTML content of the page
        soup = BeautifulSoup(response.text, "html.parser")

        # Find the latest version from the page
        latest_versions = soup.findAll("a", class_="p-link--inverted")

        numbers_only = []
        for version in latest_versions:
            version_text = version.text  # Extract text from the Tag object
            numbers = findall(r"\d+\.\d+\.*\d*", version_text)
            numbers_only.extend(numbers)

        max_item = max(numbers_only)
        return max_item

    def popOS(ver):
        if ver == "raspi":
            arch = "arm64"
        else:
            arch = "amd64"
        r = get(f"https://api.pop-os.org/builds/22.04/{ver}?arch={arch}")
        return r.json()["url"]

    def mint():
        r = get("https://linuxmint.com/download.php")
        soup = BeautifulSoup(r.text, "html.parser")
        return findall(
            r"[\d\.]+",
            (
                soup.find(
                    "h1",
                    class_="font-weight-bold display-5 display-lg-4 mb-2 mb-md-n0 mt-title",
                ).text
            ),
        )[0]

    def artix(ver):
        r = get("https://artixlinux.org/download.php")
        soup = BeautifulSoup(r.text, "html.parser")
        txt = soup.findAll("td")

        x = []
        for i in txt:
            if i.text.endswith(".iso"):
                if "openrc" in i.text:
                    if ver in i.text:
                        return f"https://iso.artixlinux.org/iso/{i.text}"

    def solus(ver):
        r = get("https://getsol.us/download")
        soup = BeautifulSoup(r.text, "html.parser")
        txt = soup.findAll("a", class_="button")

        for i in txt:
            if ver in i.get("href"):
                return i.get("href")

    def debian():
        r = get("https://www.debian.org/download")
        soup = BeautifulSoup(r.text, "html.parser")
        txt = soup.findAll("a")

        for i in txt:
            if "amd64-netinst.iso" in i.get("href"):
                return i.get("href")

    def endeavour():
        r = get("https://mirror.moson.org/endeavouros/iso/")
        soup = BeautifulSoup(r.text, "html.parser")
        txt = soup.findAll("a")

        pattern = r"(\d{4}\.\d{2}\.\d{2})"

        # Initialize variables to store the latest version and filename
        latest_version = ""

        # Loop through the filenames to find the latest version
        for i in txt:
            match = search(pattern, i.get("href"))
            if match:
                version = match.group(1)
                if version > latest_version:
                    latest_version = version
                    return i.get("href")

    def cachy():
        r = get(
            "https://cachyos.org/download/",
            headers={
                "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"
            },
        )
        # find every case matching https:\/\/cdn77.cachyos.org\/ISO\/handheld\/[0-9]+\/
        txt = findall(r"https:\/\/cdn77.cachyos.org\/ISO\/handheld\/[0-9]+\/", r.text)

        return txt[0].split("handheld/")[1].split("/")[0]

    def ghostSpectre():
        headers = {
            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3"
        }

        s1 = get("https://ghostclouds.xyz/wp/w10-pro-aio-x64/")
        soup = BeautifulSoup(s1.text, "html.parser")
        txt = soup.findAll("a")

        x = []

        for i in txt:
            if (
                (("w10" in str(i.get("href"))) or ("win10" in str(i.get("href"))))
                and ("aio" in str(i.get("href")))
                and ("download" in str(i.get("href")))
            ):
                x.append(i.get("href"))

        s2 = get(x[0])
        soup = BeautifulSoup(s2.text, "html.parser")
        txt = soup.findAll(
            "a", class_="wpdm-download-link download-on-click btn btn-primary"
        )
        s3 = txt[0]["data-downloadurl"]

        r = get(s3, headers=headers)
        soup = BeautifulSoup(r.text, "html.parser")
        docsurl = soup.find("meta", attrs={"property": "og:url"})["content"]

        # search for https:\/\/pixeldrain.com\/u\/[a-z|A-Z|0-9]+  as regex in the response
        s4 = get(docsurl, headers=headers)
        pattern = r"Pixel:[a-z|\\|0-9]+http:\/\/tinyurl.com\/[a-z|A-Z|0-9]+ "
        return "http://" + (findall(pattern, s4.text)[0].split("http://"))[1]


class Dwn:
    """Class for storing download data on individual download links."""

    # since the urls can change with updates, this class accepts 1 or more stationary url parts
    # later when the assembleUrl() is called, the changeable url part is added between
    # the result gets saved into self.url which is by default empty
    # each download link may be slightly different with the name and executable of the program that is downloaded
    # that is why those parameters are provided in the constructor
    def __init__(self, name, description, executable, *url_parts):
        self.name = name
        if description == "":
            self.description = name
        else:
            self.description = description
        self.executable = executable
        self.url_parts = list(url_parts)
        self.url = ""

    def assembleUrl(self, missing):
        for i in range(len(self.url_parts)):
            if i + 1 == len(self.url_parts):
                self.url += self.url_parts[i]
            else:
                self.url += self.url_parts[i] + missing


def showInfo(tool: str) -> None:
    """Display information on a specific tool."""
    # print basic info
    c.print(f"Name: {tool.name}")
    if tool.command == 1:
        c.print("Download links:")
    elif tool.command == 2:
        c.print("Powershell commands:")
    elif tool.command == 3:
        c.print("Links that will open:")
    elif tool.command == 4:
        c.print("Links that will be retrieved:")
    elif tool.command == 5:
        c.print("Will be written to a new file:")
    for i in range(len(tool.dwn)):
        c.print(f"\t{tool.getDwn(i)}")

    # check if tool.info leads to a website, if not, print it

    c.print("Additional info:")
    if tool.info == "":
        c.print("\tWhoopsies, we dont have any additional info on this tool :/")
    else:
        c.print(f"\t{tool.info}")

    getpass("\n... press ENTER to continue ...", stream=None)


class Tool:
    """Class for storing tools."""

    # name: the name of the tool, code: unique tool idetity
    # command type: 1-dl, 2-runaspowershell, 3-webopen, 4-urlretrieve, 5-fwrite
    # gotlatest: a bool that checks if self.latest is yet to be updated
    # latestfn: function to run to get data on latest version and save it to self.latest
    # info: additional information on a tool
    # dwn: list of Dwn objects that allows a tool to have multiple download links
    def __init__(self, name, code, command, gotLatest, latestfn, info, dwn):
        self.name = name
        self.code = code
        self.command = command

        self.gotlatest = gotLatest
        self.latestfn = latestfn
        self.latest = ""

        self.info = info
        self.dwn = dwn

    def getLatest(self):
        if not self.gotlatest:
            c.print("Checking for latest version...")
            self.latest = self.latestfn()
            c.print(f"Found it: {self.latest}")
            self.gotlatest = True

    def getDwn(self, num):
        self.getLatest()
        if num >= len(self.dwn) or num < 0:
            raise IndexError("Tool.getDwn: out of bounds!")
        if self.dwn[num].url == "":
            self.dwn[num].assembleUrl(self.latest)
        return self.dwn[num].url

    def getExec(self, num):
        if num >= len(self.dwn) or num < 0:
            raise IndexError("Tool.getDwn: out of bounds!")
        return self.dwn[num].executable

    def getName(self, num):
        if num >= len(self.dwn) or num < 0:
            raise IndexError("Tool.getDwn: out of bounds!")
        return self.dwn[num].name

    def getDesc(self, num):
        if num >= len(self.dwn) or num < 0:
            raise IndexError("Tool.getDwn: out of bounds!")
        return self.dwn[num].description


tools = {
    "d1-1": Tool(
        "EchoX",
        "d1-1",
        1,
        True,
        lambda: "",
        r"https://github.com/UnLovedCookie/EchoX",
        [
            Dwn(
                "EchoX",
                "",
                "EchoX.bat",
                r"https://github.com/UnLovedCookie/EchoX/releases/latest/download/EchoX.bat",
            )
        ],
    ),
    "d2-1": Tool(
        "Hone",
        "d2-1",
        1,
        True,
        lambda: "",
        r"https://hone.gg",
        [
            Dwn(
                "Hone ⚠️ CONTAINS ADS ⚠️",
                "",
                "HoneInstaller.exe",
                r"https://download.overwolf.com/installer/prod/cfbc7eeb79ab95eb3f553c4344a186ee/Hone%20-%20Installer.exe",
            ),
            Dwn(
                "HoneCTRL",
                "",
                "HoneCtrl.bat",
                r"https://raw.githubusercontent.com/luke-beep/HoneCTRL/main/HoneCtrl.bat",
            ),
        ],
    ),
    "d3-1": Tool(
        "ShutUp10++",
        "d3-1",
        1,
        True,
        lambda: "",
        r"https://www.oo-software.com/shutup10",
        [
            Dwn(
                "ShutUp10++",
                "",
                "ShutUp10.exe",
                r"https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe",
            )
        ],
    ),
    "d4-1": Tool(
        "Optimizer",
        "d4-1",
        1,
        False,
        lambda: str(latest("hellzerg/optimizer")),
        r"https://github.com/hellzerg/optimizer",
        [
            Dwn(
                "Optimizer",
                "",
                "Optimizer.exe",
                r"https://github.com/hellzerg/optimizer/releases/latest/download/Optimizer-",
                r".exe",
            )
        ],
    ),
    "d5-1": Tool(
        "PyDebloatX",
        "d5-1",
        1,
        True,
        lambda: "",
        r"https://github.com/Teraskull/PyDebloatX",
        [
            Dwn(
                "PyDebloatX",
                "",
                "PyDebloatX-Portable.exe",
                r"https://github.com/Teraskull/PyDebloatX/releases/latest/download/PyDebloatX_portable.exe",
            )
        ],
    ),
    "d6-1": Tool(
        "QuickBoost",
        "d6-1",
        1,
        True,
        lambda: "",
        r"https://github.com/SanGraphic/QuickBoost",
        [
            Dwn(
                "QuickBoost",
                "",
                "QuickBoost.exe",
                r"https://github.com/SanGraphic/QuickBoost/releases/latest/download/QuickBoost.exe",
            )
        ],
    ),
    "d7-1": Tool(
        "WindowsSpyBlocker",
        "d7-1",
        1,
        True,
        lambda: "",
        r"https://github.com/crazy-max/WindowsSpyBlocker",
        [
            Dwn(
                "WindowsSpyBlocker",
                "",
                "WindowsSpyBlocker.exe",
                r"https://github.com/crazy-max/WindowsSpyBlocker/releases/latest/download/WindowsSpyBlocker.exe",
            )
        ],
    ),
    "d8-1": Tool(
        "PrivateZilla",
        "d8-1",
        1,
        True,
        lambda: "",
        r"https://github.com/builtbybel/privatezilla",
        [
            Dwn(
                "PrivateZilla",
                "",
                "PrivateZilla.zip",
                r"https://github.com/builtbybel/privatezilla/releases/latest/download/privatezilla.zip",
            )
        ],
    ),
    "d9-1": Tool(
        "ZusierAIO",
        "d9-1",
        1,
        True,
        lambda: "",
        r"https://github.com/Zusier/Zusiers-optimization-Batch",
        [
            Dwn(
                "ZusierAIO",
                "",
                "ZusierAIO.bat",
                r"https://raw.githubusercontent.com/Zusier/Zusiers-optimization-Batch/master/Zusier%20AIO.bat",
            )
        ],
    ),
    "d10-1": Tool(
        "CoutX",
        "d10-1",
        1,
        True,
        lambda: "",
        r"https://github.com/UnLovedCookie/CoutX",
        [
            Dwn(
                "CoutX",
                "",
                "CoutX-Setup.exe",
                r"https://github.com/UnLovedCookie/CoutX/releases/latest/download/CoutX-Setup.exe",
            )
        ],
    ),
    "d11-1": Tool(
        "WPD",
        "d11-1",
        1,
        True,
        lambda: "",
        r"https://wpd.app/",
        [Dwn("WPD", "", "WPD.zip", r"https://wpd.app/get/latest.zip")],
    ),
    "t1-1": Tool(
        "InsiderEnroller",
        "t1-1",
        1,
        False,
        lambda: str(latest("Jathurshan-2019/Insider-Enroller")),
        r"https://github.com/Jathurshan-2019/Insider-Enroller",
        [
            Dwn(
                "InsiderEnroller",
                "",
                "InsiderEnroller.zip",
                r"https://github.com/Jathurshan-2019/Insider-Enroller/releases/latest/download/Insider_Enrollerv",
                r".zip",
            )
        ],
    ),
    "t2-1": Tool(
        "Windows11Fixer",
        "t2-1",
        1,
        False,
        lambda: str(latest("99natmar99/Windows-11-Fixer")),
        r"https://github.com/99natmar99/Windows-11-Fixer",
        [
            Dwn(
                "Windows11Fixer",
                "",
                "Windows11Fixer.zip",
                r"https://github.com/99natmar99/Windows-11-Fixer/releases/latest/download/Windows.11.Fixer.v",
                r".Portable.zip",
            )
        ],
    ),
    "t3-1": Tool(
        "NoRoundedCorners",
        "t3-1",
        1,
        True,
        lambda: "",
        r"https://github.com/valinet/Win11DisableRoundedCorners",
        [
            Dwn(
                "AntiRoundCorners",
                "",
                "AntiRoundCorners.exe",
                r"https://github.com/valinet/Win11DisableRoundedCorners/releases/latest/download/Win11DisableOrRestoreRoundedCorners.exe",
            )
        ],
    ),
    "t4-1": Tool(
        "Fix Drag&Drop",
        "t4-1",
        1,
        True,
        lambda: "",
        r"https://github.com/HerMajestyDrMona/Windows11DragAndDropToTaskbarFix",
        [
            Dwn(
                "Fix Drag&Drop",
                "",
                "FixDragAndDrop.exe",
                r"https://github.com/HerMajestyDrMona/Windows11DragAndDropToTaskbarFix/releases/latest/download/Windows11DragAndDropToTaskbarFix.exe",
            )
        ],
    ),
    "t5-1": Tool(
        "Winaero Tweaker",
        "t5-1",
        1,
        True,
        lambda: "",
        r"https://winaero.com/winaero-tweaker/",
        [
            Dwn(
                "Winaero Tweaker",
                "",
                "WinaeroTweaker.zip",
                r"https://winaerotweaker.com/download/winaerotweaker.zip",
            )
        ],
    ),
    "t6-1": Tool(
        "CTT",
        "t6-1",
        2,
        True,
        lambda: "",
        r"https://github.com/ChrisTitusTech/winutil/blob/main/winutil.ps1",
        [Dwn("CTT", "", "", r"irm christitus.com/win | iex")],
    ),
    "t7-1": Tool(
        "REAL",
        "t7-1",
        1,
        True,
        lambda: "",
        r"https://github.com/miniant-git/REAL",
        [
            Dwn(
                "REAL",
                "",
                "REAL.exe",
                r"https://github.com/miniant-git/REAL/releases/latest/download/REAL.exe",
            )
        ],
    ),
    "t8-1": Tool(
        "NVCleanstall",
        "t8-1",
        3,
        True,
        lambda: "",
        r"",
        [
            Dwn(
                "NVCleanstall",
                "",
                "",
                r"https://www.techpowerup.com/download/techpowerup-nvcleanstall/",
            )
        ],
    ),
    "t9-1": Tool(
        "SophiApp",
        "t9-1",
        1,
        False,
        lambda: str(latest("Sophia-Community/SophiApp")),
        r"https://github.com/Sophia-Community/SophiApp",
        [
            Dwn(
                "SophiApp",
                "",
                "SophiApp.zip",
                r"https://github.com/Sophia-Community/SophiApp/releases/download/",
                r"/SophiApp.zip",
            )
        ],
    ),
    "t10-1": Tool(
        "PrivacySexy",
        "t10-1",
        1,
        False,
        lambda: str(latest("undergroundwires/privacy.sexy")),
        r"https://privacy.sexy/",
        [
            Dwn(
                "PrivacySexy",
                "",
                "PrivacySexy-setup.exe",
                r"https://github.com/undergroundwires/privacy.sexy/releases/latest/download/privacy.sexy-Setup-",
                r".exe",
            )
        ],
    ),
    "a1-1": Tool(
        "Choco",
        "a1-1",
        1,
        True,
        lambda: "",
        r"https://github.com/xemulat/XToolbox/blob/main/files/choco.bat",
        [
            Dwn(
                "Choco",
                "",
                "choco.bat",
                r"https://raw.githubusercontent.com/xemulat/XToolBox/main/files/choco.bat",
            )
        ],
    ),
    "a2-1": Tool(
        "Brave Browser",
        "a2-1",
        1,
        True,
        lambda: "",
        r"https://brave.com/",
        [
            Dwn(
                "Brave Browser",
                "",
                "Brave-Setup.exe",
                r"https://referrals.brave.com/latest/BraveBrowserSetup.exe",
                r"",
            )
        ],
    ),
    "a3-1": Tool(
        "Firefox Setup",
        "a3-1",
        1,
        True,
        lambda: "",
        r"https://www.mozilla.org/firefox",
        [
            Dwn(
                "Firefox Setup",
                "",
                "Firefox-Setup.exe",
                r"https://download.mozilla.org/?product=firefox-stub&os=win&lang=en-US",
            )
        ],
    ),
    "a4-1": Tool(
        "Lively Wallpaper",
        "a4-1",
        1,
        False,
        lambda: str(latest("rocksdanister/lively")).replace(".", ""),
        r"https://github.com/rocksdanister/lively",
        [
            Dwn(
                "Lively Wallpaper",
                "",
                "LivelyWallpaper-Setup.exe",
                r"https://github.com/rocksdanister/lively/releases/latest/download/lively_setup_x86_full_v",
                r".exe",
            )
        ],
    ),
    "a5-1": Tool(
        "Floorp",
        "a5-1",
        1,
        True,
        lambda: "",
        r"https://floorp.app/",
        [
            Dwn(
                "Floorp",
                "",
                "Floorp-Setup.exe",
                r"https://github.com/Floorp-Projects/Floorp/releases/latest/download/floorp-stub.installer.exe",
            )
        ],
    ),
    "a6-1": Tool(
        "qBittorrent EE",
        "a6-1",
        1,
        False,
        lambda: str(latest("c0re100/qBittorrent-Enhanced-Edition")),
        r"https://github.com/c0re100/qBittorrent-Enhanced-Edition",
        [
            Dwn(
                "qBittorrent Enhanced Edition",
                "",
                "qBittorrent-EE-Setup.exe",
                r"https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases/latest/download/qbittorrent_enhanced_",
                r"_qt6_x64_setup.exe",
            )
        ],
    ),
    "a7-1": Tool(
        "Rainmeter",
        "a7-1",
        1,
        True,
        lambda: "",
        r"https://github.com/rainmeter/rainmeter",
        [
            Dwn(
                "Rainmeter",
                "",
                "Rainmeter-Setup.exe",
                r"https://github.com/rainmeter/rainmeter/releases/download/v4.5.17.3700/Rainmeter-4.5.17.exe",
            )
        ],
    ),
    "a8-1": Tool(
        "7-Zip ZSTD",
        "a8-1",
        1,
        True,
        lambda: "",
        r"https://github.com/mcmilk/7-Zip-zstd",
        [
            Dwn(
                "7-Zip",
                "",
                "7Zip-zstd.exe",
                r"https://github.com/mcmilk/7-Zip-zstd/releases/download/v22.01-v1.5.5-R3/7z22.01-zstd-x64.exe",
            )
        ],
    ),
    "a9-1": Tool(
        "Memory Cleaner",
        "a9-1",
        1,
        True,
        lambda: "",
        r"https://www.koshyjohn.com/software/memclean/",
        [
            Dwn(
                "Memory Cleaner",
                "",
                "MemoryCleaner.exe",
                r"https://www.koshyjohn.com/software/MemClean.exe",
            )
        ],
    ),
    "a10-1": Tool(
        "Nilesoft Shell",
        "a10-1",
        1,
        False,
        lambda: "",
        r"https://nilesoft.org/",
        [
            Dwn(
                "Nilesoft Shell",
                "",
                "Shell-Setup.exe",
                r"https://nilesoft.org/download/shell/1.9/setup.exe",
            )
        ],
    ),
    "a11-1": Tool(
        "SimpleDnsCrypt",
        "a11-1",
        1,
        False,
        lambda: str(latest("instantsc/SimpleDnsCrypt")),
        r"https://github.com/instantsc/SimpleDnsCrypt",
        [
            Dwn(
                "SimpleDnsCrypt",
                "",
                "SimpleDNSCrypt-Setup.msi",
                r"https://github.com/instantsc/SimpleDnsCrypt/releases/latest/download/SimpleDNSCrypt_",
                r".msi",
            )
        ],
    ),
    "c1-1": Tool(
        "ADW Cleaner",
        "c1-1",
        1,
        True,
        lambda: "",
        r"https://www.malwarebytes.com/adwcleaner",
        [
            Dwn(
                "ADW Cleaner",
                "",
                "ADW-Cleaner.exe",
                r"https://adwcleaner.malwarebytes.com/adwcleaner?channel=release",
            )
        ],
    ),
    "c2-1": Tool(
        "ATF Cleaner",
        "c2-1",
        1,
        True,
        lambda: "",
        r"https://www.majorgeeks.com/files/details/atf_cleaner.html",
        [
            Dwn(
                "ATF Cleaner",
                "",
                "ATF-Cleaner.exe",
                r"https://files1.majorgeeks.com/10afebdbffcd4742c81a3cb0f6ce4092156b4375/drives/ATF-Cleaner.exe",
            )
        ],
    ),
    "c3-1": Tool(
        "Defraggler",
        "c3-1",
        1,
        True,
        lambda: "",
        r"https://www.ccleaner.com/defraggler",
        [
            Dwn(
                "Defraggler",
                "",
                "Defraggler-Setup.exe",
                r"https://download.ccleaner.com/dfsetup222.exe",
            )
        ],
    ),
    "c4-1": Tool(
        "Malwarebytes",
        "c4-1",
        1,
        True,
        lambda: "",
        r"https://www.malwarebytes.com/",
        [
            Dwn(
                "Malwarebytes",
                "",
                "Malwarebytes.exe",
                r"https://www.malwarebytes.com/api/downloads/mb-windows?filename=MBSetup.exe",
            )
        ],
    ),
    "c5-1": Tool(
        "Emsisoft EK",
        "c5-1",
        1,
        True,
        lambda: "",
        r"https://www.emsisoft.com/en/emergency-kit/",
        [
            Dwn(
                "Emsisoft Emergency Kit",
                "",
                "EmsisoftEmergencyKit.exe",
                r"https://dl.emsisoft.com/EmsisoftEmergencyKit.exe",
            )
        ],
    ),
    "c6-1": Tool(
        "CleanmgrPlus",
        "c6-1",
        1,
        True,
        lambda: "",
        r"https://github.com/builtbybel/CleanmgrPlus",
        [
            Dwn(
                "CleanmgrPlus",
                "",
                "CleanmgrPlus.zip",
                r"https://github.com/builtbybel/CleanmgrPlus/releases/latest/download/cleanmgrplus.zip",
            )
        ],
    ),
    "c7-1": Tool(
        "Glary Utilities",
        "c7-1",
        1,
        True,
        lambda: "",
        r"https://www.glarysoft.com/",
        [
            Dwn(
                "Glary Utilities",
                "",
                "GlaryUtilities.exe",
                r"https://download.glarysoft.com/gu5setup.exe",
            )
        ],
    ),
    "c8-1": Tool(
        "ESET",
        "c8-1",
        1,
        True,
        lambda: "",
        r"https://www.eset.com/int/home/free-trial/",
        [
            Dwn(
                "ESET Home Security Premium",
                "",
                "ESETHomeSecurityPremium.exe",
                r"https://download.eset.com/com/eset/tools/installers/live_essp/latest/eset_smart_security_premium_live_installer.exe",
            ),
            Dwn(
                "ESET Home Security Essential",
                "",
                "ESETHomeSecurityEssential.exe",
                r"https://download.eset.com/com/eset/tools/installers/live_eis/latest/eset_internet_security_live_installer.exe",
            ),
            Dwn(
                "ESET Online Scanner",
                "",
                "ESETOnlineScanner.exe",
                r"https://download.eset.com/com/eset/tools/online_scanner/latest/esetonlinescanner.exe",
            ),
        ],
    ),
    "c9-1": Tool(
        "Kaspersky",
        "c9-1",
        3,
        True,
        lambda: "",
        r"https://www.kaspersky.com/downloads/",
        [
            Dwn("Kaspersky Plus", "", "", r"https://www.kaspersky.com/downloads/plus"),
            Dwn(
                "Kaspersky Standard",
                "",
                "",
                r"https://www.kaspersky.com/downloads/standard",
            ),
            Dwn(
                "Kaspersky Premium",
                "",
                "",
                r"https://www.kaspersky.com/downloads/premium",
            ),
        ],
    ),
    "l1-2": Tool(
        "Linux Mint",
        "l1-2",
        1,
        True,
        lambda: "",
        r"https://linuxmint.com/",
        [
            Dwn(
                "Linux Mint Cinnamon",
                "Cinnamon",
                "LinuxMint-Cinnamon.iso",
                r"https://mirror.rackspace.com/linuxmint/iso/stable/%MINTVERSION%/linuxmint-%MINTVERSION%-cinnamon-64bit.iso",
            ),
            Dwn(
                "Linux Mint MATE",
                "MATE",
                "LinuxMint-MATE.iso",
                r"https://mirror.rackspace.com/linuxmint/iso/stable/%MINTVERSION%/linuxmint-%MINTVERSION%-mate-64bit.iso",
            ),
            Dwn(
                "Linux Mint Xfce",
                "Xfce",
                "LinuxMint-Xfce.iso",
                r"https://mirror.rackspace.com/linuxmint/iso/stable/%MINTVERSION%/linuxmint-%MINTVERSION%-xfce-64bit.iso",
            ),
        ],
    ),
    "l2-2": Tool(
        "Pop!_OS",
        "l2-2",
        1,
        True,
        lambda: "",
        r"https://pop.system76.com/",
        [
            Dwn("Pop!_OS Nvidia", "Nvidia", "PopOS-Nvidia.iso", r"%POP%,nvidia"),
            Dwn("Pop!_OS RPI", "RPI4", "PopOS-RPI.img.xz", r"%POP%,raspi"),
            Dwn("Pop!_OS LTS", "LTS", "PopOS-LTS.iso", r"%POP%,intel"),
        ],
    ),
    "l3-2": Tool(
        "Ubuntu",
        "l3-2",
        1,
        True,
        lambda: "",
        r"https://ubuntu.com/",
        [
            Dwn(
                "Ubuntu",
                "",
                "Ubuntu.iso",
                r"https://cdimage.ubuntu.com/ubuntu/releases/%UBUNTUVERSION%/release/ubuntu-%UBUNTUVERSION%-desktop-legacy-amd64.iso",
            ),
            Dwn(
                "Kubuntu",
                "",
                "Kubuntu.iso",
                r"https://cdimage.ubuntu.com/kubuntu/releases/%UBUNTUVERSION%/release/kubuntu-%UBUNTUVERSION%-desktop-amd64.iso",
            ),
            Dwn(
                "Lubuntu",
                "",
                "Lubuntu.iso",
                r"https://cdimage.ubuntu.com/xubuntu/releases/%UBUNTUVERSION%/release/xubuntu-%UBUNTUVERSION%-desktop-amd64.iso",
            ),
        ],
    ),
    "l4-2": Tool(
        "Arch Linux",
        "l4-2",
        1,
        True,
        lambda: "",
        r"https://archlinux.org/",
        [
            Dwn(
                "ArchLinux.iso",
                "Latest",
                "ArchLinux.iso",
                r"https://mirror.rackspace.com/archlinux/iso/latest/archlinux-x86_64.iso",
            )
        ],
    ),
    "l5-2": Tool(
        "Atrix Linux",
        "l5-2",
        1,
        True,
        lambda: "",
        r"https://artixlinux.org/",
        [
            Dwn("Artix Plasma", "Plasma", "Artix-Plasma.iso", r"%ARTIX%,plasma"),
            Dwn("Atrix Xfce", "Xfce", "Artix-Xfce.iso", r"%ARTIX%,xfce"),
            Dwn(
                "Artix Cinnamon", "Cinnamon", "Artix-Cinnamon.iso", r"%ARTIX%,cinnamon"
            ),
        ],
    ),
    "l6-2": Tool(
        "Solus",
        "l6-2",
        1,
        True,
        lambda: "",
        r"https://getsol.us/",
        [
            Dwn("Solus Budgie", "Budgie", "Solus-Budgie.iso", r"%SOLUS%,Budgie"),
            Dwn("Solus Plasma", "Plasma", "Solus-Plasma.iso", r"%SOLUS%,Plasma"),
            Dwn("Solus GNOME", "GNOME", "Solus-GNOME.iso", r"%SOLUS%,GNOME"),
        ],
    ),
    "l7-2": Tool(
        "Debian",
        "l7-2",
        1,
        True,
        lambda: "",
        r"https://www.debian.org/",
        [Dwn("Debian NetInstall", "NetInst", "Debian-NetInst.iso", r"%DEBIAN%")],
    ),
    "l8-2": Tool(
        "Garuda Linux",
        "l8-2",
        1,
        True,
        lambda: "",
        r"https://garudalinux.org/",
        [
            Dwn(
                "Garuda DR460NIZED Gaming",
                "DR460NIZED",
                "Garuda-DR460NIZED.iso",
                r"https://iso.builds.garudalinux.org/iso/latest/garuda/dr460nized-gaming/latest.iso?r2=1",
            ),
            Dwn(
                "Garuda GNOME",
                "GNOME",
                "Garuda-GNOME.iso",
                r"https://iso.builds.garudalinux.org/iso/latest/garuda/gnome/latest.iso?r2=1",
            ),
            Dwn(
                "Garuda Xfce",
                "Xfce",
                "Garuda-Xfce.iso",
                r"https://iso.builds.garudalinux.org/iso/latest/garuda/xfce/latest.iso?r2=1",
            ),
        ],
    ),
    "l9-2": Tool(
        "EndeavourOS",
        "l9-2",
        1,
        True,
        lambda: "",
        r"https://zorin.com/os/",
        [
            Dwn(
                "EndeavourOS",
                "",
                "EndeavourOS.iso",
                r"https://mirror.moson.org/endeavouros/iso/%ENDEAVOUR%",
            )
        ],
    ),
    "l10-2": Tool(
        "CachyOS",
        "l10-2",
        1,
        True,
        lambda: "",
        r"https://cachyos.org/",
        [
            Dwn(
                "CachyOS Desktop",
                "Desktop",
                "CachyOS-Desktop.iso",
                r"https://cdn77.cachyos.org/ISO/desktop/%CACHYVERSION%/cachyos-desktop-linux-%CACHYVERSION%.iso",
            ),
            Dwn(
                "CachyOS Handheld",
                "Handheld",
                "CachyOS-Handheld.iso",
                r"https://cdn77.cachyos.org/ISO/desktop/%CACHYVERSION%/cachyos-desktop-linux-%CACHYVERSION%.iso",
            ),
        ],
    ),
    "w1-2": Tool(
        "Windows 11",
        "w1-2",
        1,
        True,
        lambda: "",
        r"Windows 11",
        [
            Dwn(
                "Windows 11 x64",
                "",
                "Windows11-x64.iso",
                # TODO: port from https://msdl.gravesoft.dev/#3113
                r"https://dl.bobpony.com/windows/11/en-us_windows_11_23h2_x64.iso",
            ),
            Dwn(
                "Windows 11 LTSC",
                "",
                "Windows11-LTSC.iso",
                r"https://drive.massgrave.dev/en-us_windows_11_iot_enterprise_ltsc_2024_x64_dvd_f6b14814.iso",
            ),
        ],
    ),
    "w2-2": Tool(
        "Windows 10",
        "w2-2",
        1,
        True,
        lambda: "",
        r"Windows 10",
        [
            Dwn(
                "Windows 10 x64",
                "",
                "Windows10-x64.iso",
                r"https://drive.massgrave.dev/en-gb_windows_10_consumer_editions_version_22h2_updated_nov_2024_x64_dvd_3eeacab9.iso",
            ),
            Dwn(
                "Windows 10 LTSC (recommended)",
                "",
                "Windows10-LTSC.iso",
                r"https://drive.massgrave.dev/en-us_windows_10_iot_enterprise_ltsc_2021_x64_dvd_257ad90f.iso",
            ),
        ],
    ),
    "w3-2": Tool(
        "Windows 8.1",
        "w4-2",
        1,
        True,
        lambda: "",
        r"Windows 8.1",
        [
            Dwn(
                "Windows 8.1",
                "",
                "Windows8.1-x64.iso",
                r"https://dl.bobpony.com/windows/8.x/8.1/en_windows_8.1_enterprise_with_update_x64_dvd_6054382.iso",
            ),
            Dwn(
                "Windows 8.1",
                "",
                "Windows8.1-x86.7z",
                r"https://dl.bobpony.com/windows/8.x/8.1/en_windows_8.1_enterprise_with_update_x86_dvd_6050710.7z",
            ),
        ],
    ),
    "w4-2": Tool(
        "Windows 8",
        "w5-2",
        1,
        True,
        lambda: "",
        r"Windows 8",
        [
            Dwn(
                "Windows 8 x64",
                "",
                "Windows8-x64.iso",
                r"https://dl.bobpony.com/windows/8.x/8.0/en_windows_8_x64_dvd_915440.iso",
            ),
            Dwn(
                "Windows 8 x86",
                "",
                "Windows8-x86.iso",
                r"https://dl.bobpony.com/windows/8.x/8.0/en_windows_8_x86_dvd_915417.iso",
            ),
        ],
    ),
    "w5-2": Tool(
        "Windows 7",
        "w6-2",
        1,
        True,
        lambda: "",
        r"Windows 7",
        [
            Dwn(
                "Windows 7 x64",
                "",
                "Windows7-x64.7z",
                r"https://dl.bobpony.com/windows/7/updated/7601.24214.180801-1700.win7sp1_ldr_escrow_CLIENT_PROFESSIONAL_x64FRE_en-us.7z",
            ),
            Dwn(
                "Windows 7 x86",
                "",
                "Windows7-x86.7z",
                r"https://dl.bobpony.com/windows/7/updated/7601.24214.180801-1700.win7sp1_ldr_escrow_CLIENT_PROFESSIONAL_x86FRE_en-us.7z",
            ),
        ],
    ),
    "m1-2": Tool(
        "AME Wizard",
        "m1-2",
        1,
        True,
        lambda: "",
        r"https://ameliorated.io/",
        [
            Dwn(
                "AME Wizard",
                "",
                "AMEWizard.zip",
                r"https://download.ameliorated.io/AME%20Wizard%20Beta.zip",
            )
        ],
    ),
    "m2-2": Tool(
        "ReviOS",
        "m2-2",
        1,
        False,
        lambda: str(latest("meetrevision/playbook")),
        r"https://revi.cc/",
        [
            Dwn(
                "ReviOS Playbook",
                "",
                "ReviOS.apbx",
                r"https://github.com/meetrevision/playbook/releases/download/",
                r"/Revi-PB-",
                r".apbx",
            )
        ],
    ),
    "m3-2": Tool(
        "AtlasOS",
        "m3-2",
        1,
        False,
        lambda: str(latest("Atlas-OS/Atlas")),
        r"https://github.com/Atlas-OS/Atlas",
        [
            Dwn(
                "AtlasOS Playbook",
                "",
                "AtlasPlaybook.zip",
                r"https://github.com/Atlas-OS/Atlas/releases/latest/download/AtlasPlaybook_v",
                r".apbx",
            )
        ],
    ),
    "m4-2": Tool(
        "AME Playbook",
        "m4-2",
        1,
        True,
        lambda: "",
        r"https://ameliorated.io/",
        [
            Dwn(
                "AME 10",
                "",
                "AME10.apbx",
                r"https://download.ameliorated.io/AME%2010%20Beta.apbx",
            ),
            Dwn(
                "AME 11",
                "",
                "AME11.apbx",
                r"https://download.ameliorated.io/AME%2011%20Beta.apbx",
            ),
        ],
    ),
    "m5-2": Tool(
        "Rectify11",
        "m5-2",
        1,
        True,
        lambda: "",
        r"https://github.com/Rectify11/Installer",
        [
            Dwn(
                "Rectify11 Installer",
                "",
                "Rectify11Installer.exe",
                r"https://github.com/Rectify11/Installer/releases/latest/download/Rectify11Installer.exe",
            )
        ],
    ),
    "m6-2": Tool(
        "Ghost Spectre",
        "m6-2",
        3,
        True,
        lambda: "",
        r"https://ghostclouds.xyz/wp/w10-pro-aio-x64/",
        [Dwn("Ghost Spectre", "", "GhostSpectre.WPE64", r"%GHOSTSPECTRE%")],
    ),
    "a1-2": Tool(
        "Rufus",
        "a1-2",
        1,
        False,
        lambda: str(latest("pbatard/rufus")),
        r"https://github.com/pbatard/rufus",
        [
            Dwn(
                "Rufus",
                "",
                "Rufus.exe",
                r"https://github.com/pbatard/rufus/releases/latest/download/rufus-",
                r".exe",
            )
        ],
    ),
    "a2-2": Tool(
        "Balena Etcher",
        "a2-2",
        1,
        True,
        lambda: "",
        r"https://github.com/balena-io/etcher",
        [
            Dwn(
                "Balena Etcher",
                "",
                "Etcher-Portable.exe",
                r"https://github.com/balena-io/etcher/releases/download/v1.18.11/balenaEtcher-Portable-1.18.11.exe",
            )
        ],
    ),
    "a3-2": Tool(
        "HeiDoc Iso Dwnlder",
        "a3-2",
        1,
        True,
        lambda: "",
        r"https://www.heidoc.net/joomla/technology-science/microsoft/67-microsoft-windows-and-office-iso-download-tool",
        [
            Dwn(
                "HeiDoc Iso Downloader",
                "",
                "HeiDoc-ISO-Downloader.exe",
                r"https://www.heidoc.net/php/Windows-ISO-Downloader.exe",
            )
        ],
    ),
    "a4-2": Tool(
        "KeePassXC",
        "a4-2",
        1,
        False,
        lambda: str(latest("keepassxreboot/keepassxc")),
        r"https://github.com/keepassxreboot/keepassxc",
        [
            Dwn(
                "KeePassXC",
                "",
                "KeePassXC-Setup.msi",
                r"https://github.com/keepassxreboot/keepassxc/releases/latest/download/KeePassXC-",
                r"-Win64.msi",
            )
        ],
    ),
    "a5-2": Tool(
        "PowerToys",
        "a5-2",
        1,
        False,
        lambda: (str(latest("microsoft/PowerToys"))).replace("v", ""),
        r"https://github.com/microsoft/PowerToys",
        [
            Dwn(
                "PowerToys",
                "",
                "PowerToys-Setup.exe",
                r"https://github.com/microsoft/PowerToys/releases/latest/download/PowerToysSetup-",
                r"-x64.exe",
            )
        ],
    ),
    "a6-2": Tool(
        "Alacritty",
        "a6-2",
        1,
        False,
        lambda: str(latest("alacritty/alacritty")),
        r"https://github.com/alacritty/alacritty",
        [
            Dwn(
                "Alacritty",
                "",
                "Alacritty-Setup.exe",
                r"https://github.com/alacritty/alacritty/releases/latest/download/Alacritty-",
                r"-installer.msi",
            )
        ],
    ),
    "a7-2": Tool(
        "PowerShell 7",
        "a7-2",
        1,
        False,
        lambda: (str(latest("PowerShell/PowerShell"))).replace("v", ""),
        r"https://github.com/PowerShell/PowerShell",
        [
            Dwn(
                "PowerShell",
                "",
                "PowerShell-Setup.msi",
                r"https://github.com/PowerShell/PowerShell/releases/latest/download/PowerShell-",
                r"-win-x64.msi",
            )
        ],
    ),
    "a8-2": Tool(
        "Motrix",
        "a8-2",
        1,
        False,
        lambda: (str(latest("agalwood/Motrix"))).replace("v", ""),
        r"https://github.com/agalwood/Motrix",
        [
            Dwn(
                "Motrix",
                "",
                "Motrix-Setup.exe",
                r"https://github.com/agalwood/Motrix/releases/latest/download/Motrix-Setup-",
                r".exe",
            )
        ],
    ),
    "a9-2": Tool(
        "Files",
        "a9-2",
        1,
        True,
        lambda: "",
        r"https://files.community/",
        [
            Dwn(
                "Files",
                "",
                "Files.appinstaller",
                r"https://files.community/appinstallers/Files.preview.appinstaller",
            )
        ],
    ),
    "a10-2": Tool(
        "VSCode",
        "a10-2",
        1,
        False,
        lambda: str(latest("VSCodium/vscodium")),
        r"https://vscodium.com/",
        [
            Dwn(
                "VSCodium",
                "",
                "VSCodium-Setup.msi",
                r"https://github.com/VSCodium/vscodium/releases/download/",
                r"/VSCodium-x64-",
                r".msi",
            ),
            Dwn(
                "VSCode",
                "",
                "VSCode-Setup.exe",
                r"https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user",
            ),
        ],
    ),
    "l1-3": Tool(
        "PrismLauncher",
        "l1-3",
        1,
        False,
        lambda: str(latest("PrismLauncher/PrismLauncher")),
        r"https://github.com/PrismLauncher/PrismLauncher",
        [
            Dwn(
                "Prism Launcher Setup",
                "",
                "PrismLauncher-Setup.exe",
                r"https://github.com/PrismLauncher/PrismLauncher/releases/download/",
                r"/PrismLauncher-Windows-MSVC-Setup-",
                r".exe",
            )
        ],
    ),
    "l2-3": Tool(
        "Minecraft Launcher",
        "l2-3",
        1,
        True,
        lambda: "",
        r"https://www.minecraft.net",
        [
            Dwn(
                "Minecraft Launcher",
                "",
                "MinecraftInstaller.exe",
                r"https://launcher.mojang.com/download/MinecraftInstaller.exe",
            )
        ],
    ),
    "l3-3": Tool(
        "ATLauncher",
        "l3-3",
        1,
        False,
        lambda: str(latest("ATLauncher/ATLauncher")),
        r"https://github.com/ATLauncher/ATLauncher",
        [
            Dwn(
                "ATLauncher",
                "",
                "ATLauncher-Setup.exe",
                r"https://github.com/ATLauncher/ATLauncher/releases/latest/download/ATLauncher-",
                r".exe",
            )
        ],
    ),
    "l4-3": Tool(
        "GDLauncher",
        "l4-3",
        1,
        False,
        lambda: str(latest("gorilla-devs/GDLauncher")),
        r"https://github.com/gorilla-devs/GDLauncher",
        [
            Dwn(
                "Portable",
                "GDLauncher Portable",
                "GDLauncher-Portable.zip",
                r"https://github.com/gorilla-devs/GDLauncher/releases/download/v"
                r"/GDLauncher-win-portable.zip",
            ),
            Dwn(
                "Setup",
                "GDLauncher Setup",
                "GDLauncher-Setup.exe",
                r"https://github.com/gorilla-devs/GDLauncher/releases/download/v"
                r"/GDLauncher-win-setup.exe",
            ),
        ],
    ),
    "l5-3": Tool(
        "Lunar Client",
        "l5-3",
        1,
        True,
        lambda: "",
        r"https://www.lunarclient.com/",
        [
            Dwn(
                "Lunar Client",
                "",
                "LunarClient-Setup.exe",
                r"https://launcherupdates.lunarclientcdn.com/Lunar%20Client%20v3.2.3.exe",
            )
        ],
    ),
    "l6-3": Tool(
        "LabyMod",
        "l6-3",
        1,
        True,
        lambda: "",
        r"https://www.labymod.net/",
        [
            Dwn(
                "LabyMod",
                "",
                "LabyMod-Setup.exe",
                r"https://releases.r2.labymod.net/launcher/win32/x64/LabyModLauncherSetup-latest.exe",
            )
        ],
    ),
    "l7-3": Tool(
        "Tecknix Client",
        "l7-3",
        1,
        True,
        lambda: "",
        r"https://tecknix.com/",
        [
            Dwn(
                "Tecknix Client",
                "",
                "Tecknix-Setup.exe",
                r"https://tecknix.com/client/TecknixClient.exe",
            )
        ],
    ),
    "l8-3": Tool(
        "Salwyrr CLient",
        "l8-3",
        1,
        True,
        lambda: "",
        r"https://www.salwyrr.com/",
        [
            Dwn(
                "Salwyrr CLients",
                "",
                "Salwyrr-Setup.exe",
                r"https://download.overwolf.com/setup/electron/ehdhabenpndnlfhfchfacfmnkhmnmigdjjlkeimc",
            )
        ],
    ),
    "l9-3": Tool(
        "Feather Launcher",
        "l9-3",
        1,
        True,
        lambda: "",
        r"https://feathermc.com/",
        [
            Dwn(
                "Feather Launcher",
                "",
                "FeatherLauncher-Setup.exe",
                r"https://launcher.feathercdn.net/dl/Feather%20Launcher%20Setup%201.5.9.exe",
            )
        ],
    ),
    "l10-3": Tool(
        "Badlion Client",
        "l10-3",
        1,
        True,
        lambda: "",
        r"https://client.badlion.net/",
        [
            Dwn(
                "Badlion Client",
                "",
                "BadlionClient-Setup.exe",
                r"https://www.badlion.net/download/client/latest/windows",
            )
        ],
    ),
    "g1-3": Tool(
        "Steam",
        "g1-3",
        1,
        True,
        lambda: "",
        r"https://store.steampowered.com/",
        [
            Dwn(
                "Steam",
                "",
                "Steam-Setup.exe",
                r"https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe",
            )
        ],
    ),
    "g2-3": Tool(
        "Rare",
        "g2-3",
        1,
        False,
        lambda: str(latest("RareDevs/Rare")),
        r"https://github.com/RareDevs/Rare",
        [
            Dwn(
                "Rare",
                "",
                "Rare-Setup.exe",
                r"https://github.com/RareDevs/Rare/releases/download/",
                r"/Rare-",
                r".msi",
            )
        ],
    ),
    "g3-3": Tool(
        "Origin",
        "g3-3",
        1,
        True,
        lambda: "",
        r"https://www.ea.com/ea-app",
        [
            Dwn(
                "Origin",
                "",
                "Origin-Setup.exe",
                r"https://origin-a.akamaihd.net/EA-Desktop-Client-Download/installer-releases/EAappInstaller.exe",
            )
        ],
    ),
    "g4-3": Tool(
        "Epic Games",
        "g4-3",
        1,
        True,
        lambda: "",
        r"https://store.epicgames.com",
        [
            Dwn(
                "Epic Games",
                "",
                "Epic-Games-Setup.msi",
                r"https://launcher-public-service-prod06.ol.epicgames.com/launcher/api/installer/download/EpicGamesLauncherInstaller.msi",
            )
        ],
    ),
    "g5-3": Tool(
        "GOG Galaxy",
        "g5-3",
        1,
        True,
        lambda: "",
        r"https://www.gog.com/galaxy",
        [
            Dwn(
                "GOG Galaxy",
                "",
                "GOG-Galaxy-Setup.exe",
                r"https://webinstallers.gog-statics.com/download/GOG_Galaxy_2.0.exe",
            )
        ],
    ),
    "g6-3": Tool(
        "Paradox",
        "g6-3",
        1,
        True,
        lambda: "",
        r"https://www.paradoxinteractive.com/our-games/launcher",
        [
            Dwn(
                "Paradox",
                "",
                "Paradox-Setup.msi",
                r"https://launcher.paradoxinteractive.com/v2/paradox-launcher-installer-windows",
            )
        ],
    ),
    "g7-3": Tool(
        "Bloxstrap",
        "g7-3",
        1,
        False,
        lambda: str(latest("pizzaboxer/bloxstrap")),
        r"https://github.com/pizzaboxer/bloxstrap",
        [
            Dwn(
                "Bloxstrap",
                "",
                "Bloxstrap-Setup.exe",
                r"https://github.com/pizzaboxer/bloxstrap/releases/download/v",
                r"/Bloxstrap-v",
                r".exe",
            )
        ],
    ),
    "r1-3": Tool(
        "DirectX",
        "r1-3",
        1,
        True,
        lambda: "",
        r"https://www.microsoft.com/en-us/download/details.aspx?id=35",
        [
            Dwn(
                "DirectX",
                "",
                "DirectX.exe",
                r"https://download.microsoft.com/download/1/7/1/1718CCC4-6315-4D8E-9543-8E28A4E18C4C/dxwebsetup.exe",
            )
        ],
    ),
    "r2-3": Tool(
        "VCRedists",
        "r2-3",
        1,
        True,
        lambda: "",
        r"https://github.com/abbodi1406/vcredist",
        [
            Dwn(
                "VisualCppRedistAIO",
                "",
                "VCRedists.exe",
                r"https://github.com/abbodi1406/vcredist/releases/latest/download/VisualCppRedist_AIO_x86_x64.exe",
            )
        ],
    ),
    "r3-3": Tool(
        "XNA Framework",
        "r3-3",
        1,
        True,
        lambda: "",
        r"https://www.microsoft.com/en-us/download/details.aspx?id=20914",
        [
            Dwn(
                "XNA Framework",
                "",
                "xnafx.msi",
                r"https://download.microsoft.com/download/A/C/2/AC2C903B-E6E8-42C2-9FD7-BEBAC362A930/xnafx40_redist.msi",
            )
        ],
    ),
    "r4-3": Tool(
        ".NET Framework",
        "r4-3",
        1,
        True,
        lambda: "",
        r"https://dotnet.microsoft.com/en-us/download/dotnet/8.0",
        [
            Dwn(
                "ASP.NET Core 8.0 Runtime",
                "",
                "ASPDotNet-Installer.exe",
                r"https://download.visualstudio.microsoft.com/download/pr/4b805b84-302c-42e3-b57e-665d0bb7b1f0/3a0965017f98303c7fe1ab1291728e07/aspnetcore-runtime-8.0.1-win-x64.exe",
            ),
            Dwn(
                ".NET Desktop 8.0 Runtime",
                "",
                "DotNetDesktop-Installer.exe",
                r"https://download.visualstudio.microsoft.com/download/pr/f18288f6-1732-415b-b577-7fb46510479a/a98239f751a7aed31bc4aa12f348a9bf/windowsdesktop-runtime-8.0.1-win-x64.exe",
            ),
            Dwn(
                ".NET Runtime 8.0 Runtime",
                "",
                "DotNetRuntime-Installer.exe",
                r"https://download.visualstudio.microsoft.com/download/pr/cede7e69-dbd4-4908-9bfb-12fa4660e2b9/d9ed17179d0275abee5afd29d5460b48/dotnet-runtime-8.0.1-win-x64.exe",
            ),
        ],
    ),
    "r5-3": Tool(
        "Node.js",
        "r5-3",
        1,
        True,
        lambda: "",
        r"https://nodejs.org/",
        [
            Dwn(
                "Node.js 20.12.0 LTS",
                "",
                "Node-Installer.msi",
                r"https://nodejs.org/dist/v20.12.0/node-v20.12.0-x64.msi",
            )
        ],
    ),
    "r6-3": Tool(
        "Python",
        "r6-3",
        1,
        True,
        lambda: "",
        r"https://python.org/",
        [
            Dwn(
                "Python 3.12",
                "",
                "Python312-Installer.msi",
                r"https://www.python.org/ftp/python/3.12.2/python-3.12.2-amd64.exe",
            ),
            Dwn(
                "Python 3.11",
                "",
                "Python311-Installer.msi",
                r"https://www.python.org/ftp/python/3.11.8/python-3.11.8-amd64.exe",
            ),
            Dwn(
                "Python 3.10",
                "",
                "Python310-Installer.msi",
                r"https://www.python.org/ftp/python/3.10.11/python-3.10.11-amd64.exe",
            ),
        ],
    ),
    "a1-3": Tool(
        "Achievement Watcher",
        "a1-3",
        1,
        True,
        lambda: "",
        r"https://github.com/xan105/Achievement-Watcher",
        [
            Dwn(
                "Achievement Watcher",
                "",
                "Achievement-Watcher.exe",
                r"https://github.com/xan105/Achievement-Watcher/releases/latest/download/Achievement.Watcher.Setup.exe",
            )
        ],
    ),
    "a2-3": Tool(
        "Spotify",
        "a2-3",
        1,
        True,
        lambda: "",
        r"https://open.spotify.com/",
        [
            Dwn(
                "Spotify",
                "",
                "Spotify.exe",
                r"https://download.scdn.co/SpotifySetup.exe",
            )
        ],
    ),
    "a3-3": Tool(
        "Spicefy",
        "a3-3",
        2,
        True,
        lambda: "",
        r"https://spicetify.app/",
        [
            Dwn(
                "Spicefy",
                "",
                "",
                r"iwr -useb https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.ps1 | iex && iwr -useb https://raw.githubusercontent.com/spicetify/spicetify-marketplace/main/resources/install.ps1 | iex",
            )
        ],
    ),
    "a4-3": Tool(
        "Discord",
        "a4-3",
        1,
        True,
        lambda: "",
        r"https://discord.com/",
        [
            Dwn(
                "Discord",
                "",
                "Discord-Setup.exe",
                r"https://discord.com/api/downloads/distributions/app/installers/latest?channel=stable&platform=win&arch=x86",
            )
        ],
    ),
    "a5-3": Tool(
        "Vesktop",
        "a5-3",
        1,
        False,
        lambda: "",
        r"https://github.com/Vencord/Vesktop/",
        [
            Dwn(
                "Vesktop",
                "",
                "Vesktop-Setup.exe",
                r"https://github.com/Vencord/Vesktop/releases/download/v",
                r"/Vesktop-Setup-",
                r".exe",
            )
        ],
    ),
    "a6-3": Tool(
        "ArmCord",
        "a6-3",
        1,
        False,
        lambda: str(latest("ArmCord/ArmCord")),
        r"https://github.com/ArmCord/ArmCord/",
        [
            Dwn(
                "ArmCord",
                "",
                "ArmCord-Setup.exe",
                r"https://github.com/ArmCord/ArmCord/releases/download/v",
                r"/ArmCord.Setup.",
                r".exe",
            )
        ],
    ),
    "a7-3": Tool(
        "Vencord",
        "a7-3",
        1,
        True,
        lambda: "",
        r"https://github.com/Vencord/Installer",
        [
            Dwn(
                "Vencord",
                "",
                "Vencord.exe",
                r"https://github.com/Vencord/Installer/releases/latest/download/VencordInstaller.exe",
            )
        ],
    ),
    "a8-3": Tool(
        "BetterDiscord",
        "a8-3",
        1,
        True,
        lambda: "",
        r"https://github.com/BetterDiscord",
        [
            Dwn(
                "BetterDiscord",
                "",
                "BetterDiscord-Setup.exe",
                r"https://github.com/BetterDiscord/Installer/releases/latest/download/BetterDiscord-Windows.exe",
            )
        ],
    ),
    "a9-3": Tool(
        "Replugged",
        "a9-3",
        1,
        True,
        lambda: "",
        r"https://github.com/replugged-org",
        [
            Dwn(
                "Replugged",
                "",
                "Replugged-Installer.exe",
                r"https://github.com/replugged-org/tauri-installer/releases/latest/download/replugged-installer-windows.exe",
            )
        ],
    ),
}
