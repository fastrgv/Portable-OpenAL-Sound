![screenshot](https://github.com/fastrgv/Portable-Sound/blob/main/lovelaceClef.png)

Here is a link to the latest release, including all source:

https://github.com/fastrgv/Portable-Sound/releases/download/v1.0.0/aoa6nov20.7z



# Portable Sound -- using Ada tasking and OpenAL



**ver 1.0.0 -- 05nov2020**

* Initial release.

* Update 6nov: added DLL to example directory.


## Description

This is a cross-platform sound-playing package for Ada apps that can asynchronously start and stop music loops, as well as initiate transient sounds.

It plays WAV files, via OpenAL, on Windows, OSX, and linux platforms.

It is suitable for any Ada application that needs music, sound loops or transient sound effects; eg. games.

--------------------------------------------------------
## Usage:

See the simple interface description in file snd4ada.ads.

Generally, when you initialize a sound or soundloop, you specify its file name and retrieve an integer "key" that is used to play it sometime later.

Note: an error occurs if there is something fishy about the WAV file. I always get good results with WAV files output from, or processed through "sox".

========================================================
## What is so great about this package?

It seems Windows does not support C++ std::thread so it is very difficult to get the cross-platform OpenAL libraries [or any other concurrent or asyncronous tasks] working via non-platform-specific C++ code. This is exactly where Ada shines. This package is a non-platform-specific Ada code that compiles on Windows as well as OSX and Linux.

========================================================

## Examples:

See ./adaExample/one.adb
See ./adaExample/two.adb

The examples come with 3 compilation scripts: lcmp.sh, ocmp.sh, wcmp.bat

--------------------------
## License:


This app is covered by the GNU GPL v3 as indicated in the sources:


 Copyright (C) 2020  <fastrgv@gmail.com>

 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You may read the full text of the GNU General Public License
 at <http://www.gnu.org/licenses/>.


