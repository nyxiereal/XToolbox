HxD Hex Editor README
=====================

HxD Copyright© 2002-2021 by Maël Hörz. All rights reserved.
See also the license file.


Features
========
- Data inspector
  - interprets bytes at the current caret position into various datatypes: 
    - binary (bit sequence), integer, floats, time and date, character, GUID and disassembly (x86 and AMD64)
- Instant opening regardless of file-size
  (>4GB is no problem, if it fits on a disk/drive you can open it)
- Files opened in HxD are shared liberally but safely with other applications
  - minimal locking with caching to release the file whenever possible
- Fast searching: forward, backwards or from beginning
  - various datatypes: text, hex values, integer, floating point
  - text search supports UTF-16 Little Endian
  - search all option
- Replace function (fast even for millions of edits)
- Disk editor: RAW reading and writing of disks and drives
  - useful information like hardware id, size, or drive type for unambigious disk selection
  - automatic unmounting of relevant filesystems when saving, to grant access to many usually locked drives
- RAM editor/virtual memory editor: can read and write virtual memory of other processes
  - for 32 and 64 bit processes
  - Memory open window shows (and can sort by) PID, process name, and bitness
- Data-folding for better overview in RAM editor/virtual memory editor
- Splitting and joining files
- Safe deletion of files (shredder)
- File compare (simple version for now)
- Inserting bytes or filling a selection with a pattern
- Grouping of bytes
- Only text or only hex mode
- Importing of Intel Hex, Motorola S-Record, and ETL Extended
  - loads files with gaps, and exports them again (without filler 0 bytes)
- Exporting of data to source code (Pascal, C, C#, Java, Visual Basic .NET, PureBasic)
  or as formatted output (plain text, HTML, Richtext, TeX)
  or to hex formats
   Motorola S19 Records, Motorola S28 Records, Motorola S37 Records,
   16 Bit Intel Hex, 20 Bit Intel Hex, 32 Bit Intel Hex
- Checksum-Generator:
    Checksum-8, ..., Checksum-64, Custom checksum, CRC-16, CRC-16/CCITT-FALSE,
    CRC-32, CRC-32C, Custom CRC, SHA-1, SHA-256, SHA-384, SHA-512, MD-2, MD-4,
    MD5
- Statistical view:
    Graphical representation of the character distribution.
	Helps to identify the data-type of a selection.
- Support for Windows (ANSI), DOS/IBM-ASCII (OEM), Macintosh and EBCDIC text encodings
- Unlimited undo
- Modified data is highlighted
- Alternating colors for hex columns (configurable)
- Internet update checker
- Ghost caret: displayed around the corresponding character/hex value on the
  inactive column, the caret is placed on the active column
- Printing
- Bookmarks:
    Ctrl+Shift+Number(0-9) sets a bookmark,
    Ctrl+Number(0-9) goes to a bookmark
- Flicker free display and fast drawing
- Available in a portable and installable edition
- Unified setup that can create preconfigured portable version (including portables with a readonly config)
- Automatic administrator elevation requested where necessary
- Full 64-bit and Unicode support ("text decoding" column is limited to 8-bit text encodings)
- Translated into many languages

FAQ
===
Q: How do I make a feature request?
A: Mail me your ideas and also don't forget to tell me the benefits.
   You may also post them in the forum: https://forum.mh-nexus.de

Q: I found a bug. How should I report it?
A: Please use the "Bugs"-section in the support-forum: https://forum.mh-nexus.de
   Try to give as many details as possible, especially describe the necessary
   steps to reproduce the bug.
   
Q: I would like to translate HxD. What should I do?
A: Translations are very welcome! Please contact me and I will send you the
   necessary language files and the translation program.

Q: The RAM-Editor shows many ? (question marks), what do they mean?
A: Question marks represent inaccessible sections of the virtual memory.
   This happens either because this memory-section is not allocated or
   it is protected. Programs usually only use a small amount of the 4 GB range
   they could use. The data-folding feature should help you to navigate: it
   hides all inaccessible memory-sections by default.

Q: Why does the TeX-Exporter sometimes produce output containing errors?
A: It is very hard to tell LaTeX to set all characters of the Windows 1252
   charset as it should. I tried to fix some issues, but there are still
   characters that do not work. If you have any deeper knowledge on this,
   feel free to contact me.

Q: Will there be more printing options?
A: This depends on how much interest there is.
   If you want more features, mail me.


Maël Hörz
https://www.mh-nexus.de
