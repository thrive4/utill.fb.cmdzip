## cmdzip
commandline zip packer / unpacker util written in freebasic with libzip
\
Allows for recursively packing to zip archive.
\
The -t option illustrates passing text string (data) directly\
from freebasic to a created zip file
\
See included help, or tutorial.txt in data folder, for more details\
cmdzip.exe /?  (or -h, -help, etc)\
Note: [folder] [filespec] folders are scanned recursively for filespec

## usage
- basic\
extract:\
cmdzip.exe [archive].zip [folder]\
example: cmdzip.exe test.zip test
\
add:\
cmdzip.exe [path or file] [archive].zip\
example: cmdzip.exe g:\data\text\*.txt text.zip\
adds all the .txt files in g:\data\text to the archive text.zip

## configuration
[application]\
' options verbose, full\
logtype         = full\
' used for debug build\
usecons         = false\
' currently en, de and fr\
locale          = en
\
[output]\
' preserve path file to archive\
preservepath  = false\
' preserve datetime stamp file from and to archive\
preservedate  = true
\
! set usecons to true for feedback in console\
note use false when using piping '>' results\
to a file

## info
compress and decompress archive zip\
supported file type .zip\
-p (preserves file path) example:
\
cmdzip.exe g:\data\text\*.txt text.zip\
adds all .txt files in g:\data\text to archive text.zip\
archive structure text.zip :\
file01.txt\
file02.txt\
...
\
cmdzip.exe g:\data\text*.txt text.zip -p\
adds all .txt files in g:\data\text to archive text.zip\
and preserves the files path.\
archive structure text.zip :\
g:\data\text\file01.txt\
g:\data\text\file02.txt\
...
\
Note : preserve in conf.ini can be set as default !

## requirements
libzip 1.10.1 or up\
https://github.com/nih-at/libzip\
note: getting the dlls precompiled for windows is messy....\
for now the windows (32bit / 64bit) dlls can be found at:\
https://www.freebasic.net/forum/viewtopic.php?p=300696\
a possible alternative could be (not tested and only 32bits):\
https://github.com/ctabin/libzippp/releases

## performance (archive and data size dependent)
windows 7 / windows 10(1903)\
ram usage ~10MB / 10MB \
handles   ~30 / ~50\
threads   1 / 3\
cpu       ~1 (low) / ~2\
tested on intel i5-6600T

## special thanks
tips on commandline parsing via:\
https://www.freebasic.net/forum/viewtopic.php?t=31889 code by coderJeff\
with courtesy to srvaldez for providing dlls windows 32bit / 64bit\
see https://www.freebasic.net/forum/viewtopic.php?p=300605&hilit=open+zip#p3006\
unixtime:\
courtesy adeyblue\
see https://www.freebasic.net/forum/viewtopic.php?p=267242&hilit=ctime&sid=353b783c321fe1c8bf4d23a9708ebd8c#p267242\
and michaelw https://www.freebasic.net/forum/viewtopic.php?p=164305