![screenshot](https://github.com/fastrgv/Portable-Sound/blob/main/lovelaceClef.png)

Here is a link to the latest release, including all source, examples & resources:

https://github.com/fastrgv/Portable-OpenAL-Sound/releases/download/v1.1.0/adaOal19oct21.7z


Type "7z x filename.7z" to extract the archive.

### Note to github downloaders: Please ignore the "Source code" zip & tar.gz files. (They are auto-generated by GitHub). Click on the large 7z file under releases to download all source & binaries (Windows,Mac & Linux). Then, type "7z x filename" to extract the archive. 



-------------------------------------------------------------------------------------------



# Portable Sound -- using Ada tasking and OpenAL



**ver 1.1.1 -- 26nov2021**

* Added OSX example of a CPP main calling the Ada sound package.
* Refined the build scripts in examples.

**ver 1.1.0 -- 19oct2021**

* Now builds on GPL-GNAT as well as all versions of AdaCore.

**ver 1.0.1 -- 17feb2021**

* Added important guard statement for robustness.
* Update 6nov: added DLL to example directory.
* Update 12nov: added W64,OSX build scripts + EXEs to C++ example.


## Description

This is an Ada utility that can play WAV files on Windows, OSX, and Linux, using 
Ada tasking and OpenAL libraries. It includes a partial Ada binding to OpenAL.

It provides sound-playing capabilities for Ada apps to:

* asynchronously start and stop music/sound loops, 
* initiate transient sounds,
* allow unlimited sound concurrency.

Examples for each O.S. are included.

* Suitable for any Ada application that requires background or transient sound effects; eg. games, simulations.
* There are no software dependencies; this package is self-contained.

--------------------------------------------------------
## Usage:

The proper command to extract the archive and maintain the directory structure is "7z x filename".

See the simple interface description in file snd4ada.ads.

Generally, when you initialize a sound or soundloop, you specify its file name and retrieve an integer "key" that is used to play it sometime later.

Note: an error occurs whenever there is something fishy about the WAV file. I always get good results with WAV files processed through "sox".

========================================================
## What is so great about this package?

This package is a non-platform-specific Ada code that compiles & runs on Windows, OSX and Linux. It is now used in my two flagship games: AdaGate and AdaVenture (on GitHub, SourceForge, itch.io, GameJolt, IndieDB). 


========================================================

## Ada Examples:

See ./adaExample/two.adb

The examples come with 6 compilation scripts: 

	* lcmp.sh, gcmp.sh (for linux)
	* ocmpAC.sh, ocmpGN.sh (for OSX)
	* wcmp32.bat, wcmp64.bat (for Windows)

## C++ Examples

See ./cppExample/two.cpp

This comes with scripts for OSX, linux and Windows. It shows how to use the Ada package from a C++ main. 

---------------------------------------

## SoundFiles
Kick & choir sound is from freesound.org, so is covered by the Creative Commons Noncommercial License;  see
http://creativecommons.org/licenses/by-nc/3.0/legalcode/



## License:


This app is covered by the GNU GPL v3 as indicated in the sources:


Copyright (C) 2021  <fastrgv@gmail.com>

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

