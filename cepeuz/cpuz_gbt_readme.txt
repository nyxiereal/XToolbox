
CPU-Z Gigabyte Readme file
----------------------

Version 2.01
April 2022
Contact : cpuz@cpuid.com
Web page: https://www.cpuid.com/softwares/cpu-z.html
Validation page : https://valid.x86.fr/
Hall of Fame : https://valid.x86.fr/records.php
CPUID SDK : http://www.cpuid-pro.com/products-services.php


Configuration file (cpuz.ini)
------------------------------

The configuration file must be named cpuz.ini and be present at the same directory level
as cpuz.exe. It contains the following :

[CPU-Z]
VERSION=x.x.x.x
TextFontName=
TextFontSize=14
TextFontColor=000080
LabelFontName=
LabelFontSize=14
ACPI=1
PCI=1
MaxPCIBus=256
DMI=1
Sensor=1
SMBus=1
Display=1
UseDisplayAPI=1
BusClock=1
Chipset=1
SPD=1
XOC=0
CheckUpdates=1


- TextFontName : Font used for the information boxes. 
- TextFontSize : Size of the font used for the information boxes. 
- TextFontColor : Color of the font used for the information boxes. Value is expressed in hexadecimal, and consists in a classic Red/Green/Blue color code : RRGGBB 
- LabelFontName : Font used for the label boxes. 
- LabelFontSize : Size of the font used for the label boxes. 
- Sensor : Set to OFF (or 0) disables sensor chip detection and voltages measurement. 1 to enable.
- PCI : Set to OFF (or 0) disables the PCI information. This disables chipset, SPD and, depending on the hardware, sensoring information. 1 to enable.
- MaxPCIBus : Sets the maximum PCI bus to scan. Default value is 256.
- DMI : Set to OFF (or 0) disables the DMI (Desktop Management Interface) information. This concerns BIOS vendor and version, motherboard vendor and revision. 1 to enable. 
- SMBus : Set to OFF (or 0) disables SMBus information : SPD, and, depending on the hardware, sensoring information. 1 to enable.
- Display : Set to OFF (or 0) disables the video card information reported in the validator. 1 to enable.
- UseDisplayAPI : Set to 1, uses the display driver to read the display adapters information.
- BusClock : Set to 1, uses the bus clock as primary clock source. Set to 0 to use an alternate method.
- Chipset : set to OFF (or 0) disables the memory controller and southbridge information. 1 to enable.
- SPD : set to 0 to disable SPD reading. 1 to enable.
- XOC : eXtreme Overclock Mode : runs CPU-Z with as little system load as possible. Your system won't be fully validated before it is manually checked. Requires to restart CPU-Z.
- CheckUpdates : set to 0 to disable the new version checker at startup. 1 to enable.

Parameters
----------

-txt=filename : Launch CPU-Z in ghost mode (no interface appears) and generates the register dump file (.txt) 
in the same directory as the exe file.

-html=filename : Same as "-txt" except it generates the html report.

-core=id : Displays clock speed of core #id (id can be set from 0 to Number of cores minus one).

-bench : runs CPU-Z without interface, runs the benchmark, and saves the result in a TXT file named like the machine.

Keys
----

F5 : save the current tab in a bmp file
F6 : save the current tab in the clipboard
F7 : save cvf file in the current directory


Cache Latency Tool
------------------

The cache latency tool can be downloaded at that address : http://download.cpuid.com/misc/latency.zip


History
-------
--------------------------------------------------------------------------------------------------
2.01 - April 2022
- Glenfly Arise-GT10C0 GPU.
- Intel Core i9-12900T, Core i5-12600T (35W).
- Intel Atom x6427FE, x6425RE, x6425E, x6414RE, x6413E, x6212RE, x6211E, x6200FE (Elkhart Lake, FCBGA1493).
- Intel Pentium J6425, N6415 (Elkhart Lake, FCBGA1493).
- Intel Celeron J6413, N6211 (Elkhart Lake, FCBGA1493).
- Preliminary support for Intel ARC 3/5/7 (DG2).
- Preliminary support for Intel Raptor Lake (13th gen).
- AMD Ryzen 7 5700X, Ryzen 5 5600/5500.
- AMD Ryzen 3 5300GE, Ryzen 3 PRO 5350GE, Ryzen 5 PRO 5650GE, Ryzen 7 PRO 5750GE (Cezanne).
- AMD Ryzen 9 6980HX, 6900HX, Ryzen 7 6800H, Ryzen 5 6600H (45W).
- AMD Ryzen 9 6980HS, 6900HS, Ryzen 7 6800HS, Ryzen 5 6600HS (35W).
- AMD Ryzen 7 6800U, Ryzen 5 6600U (15-28W).
- AMD Ryzen 7 5825U, Ryzen 5 5625U, Ryzen 3 5425U (15W).
- AMD Rembrandt & Raphael APUs (RDNA2).
- AMD Mendocino APU (Zen2 + RDNA2).
- AMD Radeon RX 6850M XT GPU (NAVI22).
- AMD RX 6800S, RX 6700S, RX 6650M, RX 6650M XT GPUs (NAVI23).
- NVIDIA GeForce RTX 3090 Ti GPU (GA102-350, 450W).
- Improved information accuracy when core isolation is enabled.
- Improved validation process for high clock submissions (>6GHz).

--------------------------------------------------------------------------------------------------
1.99 - January 2022
- Intel Core i5 12700H, 12500, 12400, Core i3 12300, 12100 CPUs.
- AMD CCD/CCX topology bug fix.
- AMX instruction set support.
- AMD 4700S processor.
- Improved validation process for Alder Lake records.
- Improved support for AMD Cezanne 5600G/5700G APUs.
- Improved DDR5 SPD information report.

--------------------------------------------------------------------------------------------------
1.97 - September 2021
- Intel Core i9 12900K, Core i7 12700K and Core i5 12600K "Alder Lake" CPUs and Intel Z6xx platform.
- DDR5 memory SPD and XMP 3.0 support.
- AMD Radeon 6600XT GPU.

--------------------------------------------------------------------------------------------------
1.96.1 - May 2021
- NVIDIA RTX 30 LHR (1.96.1).
- Intel Iris Xe GPU (DG1) (1.96.1).
- Improved support of Centaur CHA processor (1.96.1).
- Preliminary support of Intel Alder Lake and Z6xx platform.
- Preliminary support of DDR5 memory.
- AMD Ryzen 5700G, 5600G and 5300G APUs.
- AMD Radeon RX 6900 XT, 6800 (& XT), 6700 XT GPUs.

--------------------------------------------------------------------------------------------------
1.95 - January 2021
- AMD "Cezanne" and "Lucienne" APUs.
- AMD Threadripper PRO 3xxx processors.
- Intel Core 11th generation "Rocket Lake".
- Intel Tiger Lake-U and Tiger Lake-H.
- Intel Z590.
- AMD Radeon 6800 & 6800 XT GPUs.
- NVIDIA RTX 3070 GPU.
- Mainboard PCI-Express generation report (Mainboard tab).
- Graphics Interface Link current speed and max speed (Mainboard tab).
- NVIDIA GPU base and boost clocks (Graphics tab).

--------------------------------------------------------------------------------------------------
1.94 - October 2020
- AMD Ryzen 5000 Vermeer preliminary support.
- Intel Rocket Lake preliminary support.
- GPU TDP.

--------------------------------------------------------------------------------------------------
1.93 - August 2020
- AMD Ryzen 7 PRO 4750G, Ryzen 5 PRO 4650G, Ryzen 3 PRO 4350G.
- Intel Tiger Lake platform.

--------------------------------------------------------------------------------------------------
1.92 - April 2020
- Intel Z490/W480/B460 Comet Lake platform support.
- AMD "Renoir" Ryzen APU.
- AMD Ryzen 3 3100 & 3300X.
- Windows 10 on ARM processor preliminary support.

--------------------------------------------------------------------------------------------------
1.91 - December 2019
- AMD Ryzen Threadripper 3960X, 3970X and 3990X.
- Intel Core 10xxx Comet Lake processors.
- Centaur Haul CHA w/ AI hardware preliminary support.

--------------------------------------------------------------------------------------------------
1.90 - August 2019
- AMD Ryzen Threadripper 3000 preliminary support.
- Intel Ice-Lake preliminary support.
- NVIDIA RTX 2070 and 2080 Super.

--------------------------------------------------------------------------------------------------
1.89 - June 2019
- Preliminary support of AMD Ryzen 3000 (1.89.1)
- Intel Cascade Lake processors (1.89.1)
- Zhaoxin ZX-5000 and ZX-6000 processors families support.
- AMD APU Ryzen Picasso detection fix.

--------------------------------------------------------------------------------------------------
1.88 - March 2019
- Intel 9400F, 9600KF, 9700KF and 9900KF and 9th gen R0 stepping.
- AMD APU Ryzen Picasso preliminary support.
- DDR4 SDRAM chips manufacturer.
- AMD Radeon VII (Vega 20).
- NVIDIA GTX 1660 and 1660 Ti.

--------------------------------------------------------------------------------------------------
1.87 - November 2018
- Intel Basin Falls Skylake-X refresh.
- NVIDIA GeForce RTX serie 20.
- New AVX2 and AVX512 benchmarks (beta versions).

--------------------------------------------------------------------------------------------------
1.86 - August 2018
- Intel 9th generation Core family (Coffee Lake 9900K, 9700K, 9600K, 9600, 9500 and 9400).
- Intel Coffee Lake-U processors.
- AMD Threadripper 2000 processors.

--------------------------------------------------------------------------------------------------
1.85 - May 2018
- AMD AGESA version report in BIOS information.
- Increased clocks refresh rate.
- Fix initialization error on Windows XP and 7.

--------------------------------------------------------------------------------------------------
1.84 - March 2018
- Intel new Coffee Lake desktop and mobile processors.
- New timers tool.
- New "-bench" parameter.

--------------------------------------------------------------------------------------------------
1.82 - January 2018
- Windows 10 Build 16299 (1.82.2)
- AMD Raven Ridge processors support (1.82.1)
- Intel Xeon Phi Knight Landing preliminary support.
- Fix BCLK fluctuations on SKL-X.
- The benchmark does now support systems with more than 64 CPUs.

--------------------------------------------------------------------------------------------------
1.81 - October 2017
- Intel Coffee Lake processors and Z370 platform.
- Intel Skylake-X HCC processors.
- Intel Xeon Skylake-SP and Xeon W Skylake processors.

--------------------------------------------------------------------------------------------------
1.80.1 - August 2017
- Intel Core X processors (KBL-X and SKL-X).
- Preferred core(s) display in clocks dialog.

--------------------------------------------------------------------------------------------------
1.79.1 - May 2017
- Intel X299 (1.79.1).
- AMD ThreadRipper (1.79.1).
- AMD Ryzen 5 and Ryzen 3.
- Fix lockup at loading on Ryzen systems with RAID.
- New benchmark version (17.01).

--------------------------------------------------------------------------------------------------
1.78 - November 2016
- Intel Kaby Lake processors.
- AMD Embedded G and R-series processors.
- DMP Vortex86 DX3.
- Tons of bug fixes.

--------------------------------------------------------------------------------------------------
1.77 - August 2016
- New benchmark "submit and compare" feature.
- New clocks dialog reporting all system's clock speeds in real-time.
- Preliminary support for Intel Kaby 

--------------------------------------------------------------------------------------------------
1.76 - April 2016
- Intel Broadwell-E/EP processors.
- AVX512 instruction set report.
- Fixed several bugs (missing SPD on some systems).

--------------------------------------------------------------------------------------------------
1.75 - January 2016
- Intel Skylake Pentium and Celeron support.
- Intel Broadwell-E preliminary support.
- AMD A10-7890K APU.

--------------------------------------------------------------------------------------------------
1.74 - October 2015
- Improved CPU benchmark.
- AMD Carrizo APUs.
- eDRAM detection on Slylake CPUs.

--------------------------------------------------------------------------------------------------
1.73 - August 2015
- New validation.
- eXtreme Overclock Mode with light CPU load.
- New tab : CPU Benchmark.
- Added L4 cache frequency (cache tab).
- Added Windows 10 editions.

--------------------------------------------------------------------------------------------------
1.72.1 - May 2015
- Intel Skylake and Broadwell support (1.72.1)
- Preliminary support for Intel Skylake.
- Fixed support for Windows 10 build 9926.

--------------------------------------------------------------------------------------------------
1.71.1 - November 2014
- Intel Core M processors (1.71.1)
- New CPU-Z logo (1.71.1)
- AMD Athlon X2 450, Athlon X4 840 and Athlon X4 860K (Kaveri).
- AMD FX-8370, FX-8370E, FX-8320E (Vishera).
- Improved support for Intel X99 chipset.
- Support for Microsoft Windows 10. 

--------------------------------------------------------------------------------------------------
1.70 - July 2014
- Intel i7-5960X, i7-5930K, i7-5820K, i7-4790K, i5-4690K, Pentium G3258.
- TSX instructions set support (including RTM and HLE subparts).

--------------------------------------------------------------------------------------------------
1.69 - March 2014
- Intel Haswell-E processors (1.69.2)
- Preliminary support for DDR4 memory (1.69.2)
- AMD FCH detection improved (1.69.2)
- AMD A6-6420K, A4-6320, A4-4020.
- AMD Athlon 5350 & 5150, Sempron 3850 & 2650 Kabini.
- Intel Core i7-4770R and Core i5-4570R Crystal Well.

--------------------------------------------------------------------------------------------------
1.68 - January 2014
- AMD Kaveri APUs (A10-7850K, A10-7800, A10-7700K, A8-7600, A6-7400K, A4-7300).
- Intel i7-4790, i5-4690, i5-4590, i5-4460 (Haswell refresh).
- Intel Celeron Haswell (G1830, G1820).
- Intel serie 9 chipset (Z97).
- Nuvoton NCT6106 and SMSC SCH5636 SIOs (Fujitsu mainboards).

--------------------------------------------------------------------------------------------------
1.67.1 - November 2013
- Improved support of Intel Silvermont.
- New validation.

--------------------------------------------------------------------------------------------------
1.66 - August 2013
- Intel Core i7-4xxx MQ/MX processors (1.66.1)
- Fixed BCLK jump bug and validation issue (1.66.1)
- Intel Xeon E5-2600 V2, Core i3-4xxx, Core i7-3910K processors.
- Intel Atom Bay Trail-T preliminary support.
- Intel Ivy Bridge-E/EP/EX support improved.
- AMD Opteron 3200 and 3300 series.
- ITE IT8603 and IT8623 SIOs (Asus FM2+ mainboards).
- Microsoft Windows 8.1 (Windows Blue). 
- New version checker.

--------------------------------------------------------------------------------------------------
1.65 - July 2013
- AMD Opteron X1150 and X2150.
- AMD FX-9590 and FX-9370.
- Intel 4xxxHQ "Crystalwell" CPUs.
- Intel Pentium "Haswell" G3430, G3420, G3220.

--------------------------------------------------------------------------------------------------
1.64 - May 2013
- Intel Atom Cloverview.
- Intel Ivy Bridge-E/EP/EX.
- AMD Richland APUs.

--------------------------------------------------------------------------------------------------
1.63 - February 2013
- Intel Pentium & Celeron "Ivy Bridge" CPUs.
- AMD Athlon X4 750K.
- FMA3 & 4 instructions sets.
- Support for systems with more than 64 CPUs.
- Report TDP in validation pages.

--------------------------------------------------------------------------------------------------
1.62 - October 2012
- AMD "Vishera" processors.
- Intel Haswell & Ivy Bridge E/EP preliminary support.
- Reduce CPU utilization.
- Improved validation process.

--------------------------------------------------------------------------------------------------
1.61.3 - July 2012
- Intel CedarTrail platform.
- VIA VX11 chipset.
- Intel Xeon E5 processors.
- Fix wrong CPU clock speed under Win8.

--------------------------------------------------------------------------------------------------
1.59.2 - January 2012
- Intel Core i5 2550K, 2450P and 2380P with no GPU.
- Intel Ivy Bridge models (37xx, 35xx, 34xx and 33xx).
- Intel Z77 platform.

--------------------------------------------------------------------------------------------------
1.59 - November 2011
- AMD Opteron Interlagos and Valencia (Bulldozer).
- AMD SR56x0 I/O bridge and SP5100 southbridge (Maranello).
- Intel Core i7-3960X, 3930K and 3820 (SandyBridge-E).
- Intel X79 chipset (Jaketown).
- VIA Nano 1000/2000/3000, Eden X2, Nano X2/X3, QuadCore.
- Support for Windows 8.

--------------------------------------------------------------------------------------------------
1.58.4 - September 2011
- AMD FX "Bulldozer" processors family (K15).
- AMD Llano processors family (K12).
- Intel Sandy Bridge-E/EP processors.

--------------------------------------------------------------------------------------------------
1.57.2 - March 2011
- Asus Rampage III Black Edition.
- Added TDP and southbridge revision.

--------------------------------------------------------------------------------------------------
1.57.1 - January 2011
- Improved support of Sandy Bridge processors.
- Bug fixes.

--------------------------------------------------------------------------------------------------
1.56 - October 2010
- Intel Core i3/i5/i7 "2000" serie processors (Sandy Bridge) with new logos.
- Intel Core i7 970 "Gulftown".
- Intel P67 chipset.
- AMD Phenom II, Athlon II and Sempron II "Caspian" processors.

--------------------------------------------------------------------------------------------------
1.55 - July 2010
- VIA VX900/VX900M and VN1000/VN1000M chipsets.
- Intel Core i5-760, Core i7-875K and Core i5-655K processors.
- Intel Core i7-940XM, 840QM, 740QM mobile processors.
- Intel Core i5-450M, 540UM, 430UM, Core i3-370M mobile processors.
- Intel Pentium P6000 processor.
- New parameter in cpuz.ini : UseDisplayAPI

--------------------------------------------------------------------------------------------------
1.54 - March 2010
- Intel Core i7-880, Core i5-680, Core i3-550 processors.
- Intel Xeon 5600 line (32nm) processors.
- AMD Phenom II X6, Sempron II, Turion II, Turion II Ultra and Athlon II Mobile "Caspian" processors.
- NVIDIA GeForce 320M chipset.
- AMD 870/880G/890GX + SB800/SB850 chipset.
- Introduction of validation rooms.

--------------------------------------------------------------------------------------------------
1.53 - December 2009
- Fix validation issue with AMD Phenom processors (1.53.1).
- Preliminary support for Intel Pinetrail platform (1.53.1).
- Intel Core i7 930 & 950, Core i7 980X "Gulftown", Xeon W3565.
- Intel Mobile Core i7/i5/i3 "Arrendale" (LV and ULV).
- Intel "Clarkdale" platform improved support. 
- AMD Phenom FX-5000, Athlon II X2/X3/X4, Athlon L110.
- AMD AM3 socket detection improved.
- VIA VX800 and VX855 chipsets support.
- ATI Radeon 2100 and Radeon X1250 support. 
- DirectX 11 detection fix.
- Hardware virtualization support now reported as instructions set.
- New HTML report with less information.

--------------------------------------------------------------------------------------------------
1.52 - July 2009
- Fix Core i7 clock bug (1.52.2)
- New design with "Graphics" tab.
- NVIDIA nForce 980a chipset support.
- Intel Core i5 and Core i3 processors.
- Intel Atom Z530, Pentium DC E6300 (2.8GHz) and Core 2 Solo processors.
- Intel P55 and US15W chipsets preliminary support.
- AMD Phenom TWKR support.
- AMD Phenom X2 "Callisto" and Athlon X2 "Regor" processors.
- AMD Opteron 6-core "Istanbul" processor.
- Improved support for Windows 7.
- New Intel logos.

MD5 checksum : please refer to http://www.cpuid.com/cpuz.php#history


--------------------------------------------------------------------------------------------------
1.51 - April 2009
- New version with installer.
- NVIDIA ION platform.
- Intel "Clarkdale" processor preliminary support.

MD5 checksum : please refer to http://www.cpuid.com/cpuz.php#history

--------------------------------------------------------------------------------------------------
1.50 - February 2009
- Improved support for AMD Phenom II processor.
- Support for NVIDIA 740i chipset.
- Several bug fixes.

MD5 cpuz.exe (1.50) : E1C827C54F527404EDDA6D65DA0280D8

--------------------------------------------------------------------------------------------------
1.49 - December 2008
- AMD Phenom II processor.
- New Intel Core 2 models.
- Improved loading time.
- New online validation process.

MD5 cpuz.exe (1.49) : B836E86B40D7AFAF99D9C512E8CC9FEF

--------------------------------------------------------------------------------------------------
1.48 - October 2008
- Improved support for Intel Core i7 (Bloomfield & Gainestown).
- Intel Atom dual-core version support.
- AMD Athlon "Kuma" processor support.
- Alternate clock computation method based on "duty cycles" for Intel Core 2 processors (see ShowDutyCycles in cpuz.ini)

MD5 cpuz.exe (1.48) : DB78FBF1F99B7709240B495E59758CCE

--------------------------------------------------------------------------------------------------
1.47 - August 2008
- Intel Core i7 processor.
- Intel Core 2 Duo S Mobile processors.
- NVIDIA MCP79/7A chipset.
- AMD 790GX / SB750 chipset. 

MD5 cpuz.exe (1.47) : A7484EFA3C32BC968C248CB1237FF493

--------------------------------------------------------------------------------------------------
1.46 - June 2008
- AMD Puma platform (Turion & Turion Ultra "Griffin");
- AMD Black Edition processors.
- Intel Xeon EX "Dunnington".

MD5 cpuz.exe (1.46) : C47432C41EC26156128F7B8E09E884CF

--------------------------------------------------------------------------------------------------
1.45 - May 2008
- Intel Atom Z500/Z510/Z520/Z530/Z540 processors.
- Intel Core 2 Duo E7x00 processor.
- AMD 45 nm Phenom (Dened & Shanghai) processors.
- Intel P45 chipset.

MD5 cpuz.exe (1.45) : DD4E540C04297CF93DC721166C13446E

--------------------------------------------------------------------------------------------------
1.44.2 - Mars 2008
- NVIDIA 650i, 680i, 750a/780a, 750i, 780i, 790i chipsets (1.44.2)
- Intel G35 chipset (1.44.2)
- Updated support for VIA chipsets (1.44.2)
- Support for the new validator (1.44.1)
- Preliminary support for VIA Isaiah processor.
- Support for all VIA Model D processors: VIA C7-M, VIA C7-D, VIA Eden, VIA Eden.
- Memory timings on Intel 5400A/B MCH (Skulltrail).
- Fix AMD Phenom detection issue on Windows Vista 64.

MD5 (1.44.2) : 81FB48A6EC7355E8D0DD71ADC2157CF6

--------------------------------------------------------------------------------------------------
1.43 - January 2008
- Intel Skulltrail platform support (Core 2 Extreme QX9775 + 5400B MCH).
- Intel X48 chipset detection.
- AMD Athlon 64-LE 1600 and 1620 support.
- Fix detection issues on unlocked Phenom (ES/BE).

--------------------------------------------------------------------------------------------------
1.42 - November 2007
- Intel Wolfdale/Yorkfield/Penryn CPUs support.
- AMD Phenom and Opteron Barcelona support improved.
- Current core selection menu (right click on the CPU page).
- Loading progress.

--------------------------------------------------------------------------------------------------
1.41 - September 2007
- New CPU voltage monitoring.
- Intel Xeon Tigerton support.
- Intel IA64 CPUs support (Itanium / Itanium2)(special thanks to Rami Radi and Ray Hinchliffe).
- AMD K10 Phenom preliminary support.
- NVIDIA MCP73 support.
- Intel XMP profiles support.
- Memory modules nominal voltage.

--------------------------------------------------------------------------------------------------
1.40.5 - July 2007
- NVIDIA nForce 560 chipset support.
- Intel Dynamic FSB technology support.
- Athlon 64 X2 BE & Sempron LE (TDP 45W).
- SiS671/FX/DX/MX northbridge support.
- SiS968 southbridge support.

--------------------------------------------------------------------------------------------------
1.40 - May 2007
- VIA P4M800CE chipset support.
- Preliminary support for Intel Penryn CPUs family (45 nm).
- Intel Core 2 Duo E6x20, Pentium E2140/2160 processors recognition.
- Intel P35, G33, G31, Q35, Q33, X38 chipsets support.
- Intel GL960/GM965/PM965 chipsets support.
- AMD Athlon 64 "Lima" processor support.
- AMD Geode LX processor support.
- NVIDIA nForce 520 chipset support.
- New parameter "-console" to generate output in a command prompt (Windows XP only).
- New icon.

--------------------------------------------------------------------------------------------------
1.39 - February 2007
- Windows Vista 64 support.
- VIA CX700/VX700 chipset.	
- Added Merom XE (X7900/X7800)
- Added "PCI" and "MaxPCIBus" in the ini file to configure PCI scanning.
- Added "-core" parameter to display the clock speed of the specified core.
- Lot of bug fixes.

--------------------------------------------------------------------------------------------------
1.38 - November 2006
- VIA P4M890 and P4M900 chipsets.
- NVIDIA 650i and 680i chipset.
- AMD Athlon 64 FX-7x processor.
- Core 2 Duo E6850, E6750, E6650 processors.
- socket 775 Xeon processor.
- New parameters "-txt" and "-html" (see above).
- Lot of bug fixes.

--------------------------------------------------------------------------------------------------
1.37 - October 2006
- Intel Core 2 Quad, Celeron 360, Mobile Core 2 Duo T5200 support.
- Changed SSE4 to SSSE3 (Supplemental SSE3).
- Added VIA VT8237A southbridge.
- New HTML report.
- Several bug fixes.

--------------------------------------------------------------------------------------------------
1.36 - August 2006
- New processor information display.
- Intel 5000X/P/Z/V SPD support.
- Intel Pentium D 925 & 945.

--------------------------------------------------------------------------------------------------
1.35 - June 2006
- ATI RS350, RS400, RS480/RX480, RS482, RD580/RX580, RS600/RD600, RS690, RS700 chipsets support.
- ATI SB600 southbridge support.
- Intel P965 chipset support.
- Engineering samples Core based CPUs report.
- Windows Vista product line report.

--------------------------------------------------------------------------------------------------
1.34.1 - May 2006
- AMD socket AM2/S1/F (rev F.) CPUs support.
- Enhanced Performance Profile (EPP) memory information report.
- Added Trc (bank cycle time) in DDR2 SPD report.
- Added Trc (bank cycle time) on i925, i945, i955, i975 chipsets.
- FB-DIMM DDR2 SPD information report.
- Core 2 Duo names and logos added.
- Turion 64 X2 logo added.
- Several bug fixed.

--------------------------------------------------------------------------------------------------
1.33.1 - April 2006
- Intel i965 chipset support added.
- Fix SPD detection problem on SiS 964/965/966 southbridges.
- ODC (Odd Divisor Correct) for Athlon64 rev E.

--------------------------------------------------------------------------------------------------
1.33 - April 2006
- Memory Command Rate timing added.
- Improved support for Intel Conroe/Merom CPUs.
- Celeron M 420/430 Yonah.
- Xeon Dual core Dempsey.
- VIA C7-M CPU detection added.
- VIA PT880, PT880 Pro, K8T900 chipsets support.
- nVidia nForce 550/560/570 (MCP55) chipset support.
- VIA VT8251 southbridge support.
- Fixed HyperTransport information misreports (in dump file).
- Added K6-2 and K6-III logos.

--------------------------------------------------------------------------------------------------
1.32.1 - March 2006
- New Intel logos.
- Added Pentium D 925, Pentium EE 965.
- Several bugs fixed.

--------------------------------------------------------------------------------------------------
1.32 - February 2006
- Athlon FX-60 detection added.
- Athlon64 new memory dividers.
- Celeron 35x Cedar Mill, Pentium D 805.
- Core Solo & Core Duo detection improved.
- VIA C7 CPU detection added.
- Intel i975X, i945GT chipsets support.
- ATI RD580 chipset support.
- ULi smbus support improved.
- Fix smbus conflict with ClockGen.

--------------------------------------------------------------------------------------------------
1.31 - November 2005
- Improved support for ATI RS480/482 chipsets.
- GeForce 6100/6150 (nForce 410/430) chipsets support.
- Intel E7520 chipset support.
- New CPUs support : AMD Opteron socket 939, Intel Pentium 4 Cedar Mill and Presler,
Intel Xeon Paxville, Intel Pentium M Yonah SC & DC.
- Several bug fixed.

--------------------------------------------------------------------------------------------------
1.30 - August 2005
- Latest Sempron and Turion support improved.
- Intel Xeon Potomac, Pentium M 780 support.
- Improved Windows version report.
- Support for SMBus on latest SiS bridges (964, 965, 966) and ULi bridges.
- Increased clocks refresh rate.
- Several bug fixed.

--------------------------------------------------------------------------------------------------
1.29 - June 2005
- New PCI devices report.
- Switch for VCore report in .ini file.
- VCore report on some uGuru mainboards.
- Improved clocks computation.
- Improved support for latest AMD CPUs, Celeron D 3x1 (EM64T).
- Improved support for SiS 649, 650 and 656 chipsets, Intel 915PM chipset.
- Improved stability when several instances of CPU-Z are running in the same time.
- Restored html report in ghost mode (see "Parameters" chapter above).

--------------------------------------------------------------------------------------------------
1.28.6 - March 2005
- Support for Athlon 64 X2 CPUs
- Support for i955X chipset
- Bunch of bugs

--------------------------------------------------------------------------------------------------
1.28 - March 2005
- Support for SiS chipsets improved : 648FX, 649, 655FX, 655TX, 656
- Support for nVidia nForce4 SLI Intel Edition
- Support for Intel Pentium D, Pentium XE, AMD Turion, Opteron 252
- New F7 key to simplifiy the creation of the validation file

--------------------------------------------------------------------------------------------------
1.27 - February 2005
- Support for Intel Pentium 4 6xx CPUs.
- New validation system.
- Hundred of bug fixes.

--------------------------------------------------------------------------------------------------
1.26 - December 2004
- VCore display on Pentium M CPUs.
- New CPU clock computation.
- Improved support of Transmeta CPUs.
- Several bugs fixed.

--------------------------------------------------------------------------------------------------
1.25 - November 2004
- nVidia nForce4 chipset support
- Intel Pentium 4J support
- New button to refresh memory timings
- Several bugs fixed

--------------------------------------------------------------------------------------------------
1.24 - September 2004
- AMD Sempron support
- New memory SPD page
- PCI-Express graphic interface support
- Configuration file
- External cache latency tool
- Restored html report
- Fix several bugs

--------------------------------------------------------------------------------------------------
1.23 - June 2004
- Intel i915P/G, i925X chipsets support
- Intel LGA775 CPUs support
- Intel's CPU number display
- New AMD Athlon 64 steppings
- New report in one file

--------------------------------------------------------------------------------------------------
1.22 - April 2004
- New CPUs : Xeon Nocona, Celeron Prescott
- DDR2 memory support
- Clock mode when iconized

--------------------------------------------------------------------------------------------------
1.21 -  January 2004
- one file package
- Windows 64 support
- new chipsets support
- new CPU support : Celeron M, Pentium 4 "Prescott"

--------------------------------------------------------------------------------------------------
1.20a -  October 2003
- memory frequency and ratio on nForce2
- KT600 support
- W83627THF VRM mode
- SPD read improvement
- Fix some memory leaks (DMI)
- Fix memory size report
- Fix AGP side band status

--------------------------------------------------------------------------------------------------