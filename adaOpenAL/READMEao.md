
Download link:
https://sourceforge.net/projects/portable-openal-sound/

-----------------------------------------------------------


# Portable Ada Sound -- using Ada tasking and OpenAL
## Sound utility for Window, OSX, & linux.


**ver 1.1.6 -- 18feb2024**

* Repaired some critical issues with program logic.
* Added volume control.


**ver 1.1.4 -- 06oct2023**

* Updated support of Mac/OSX.



## Brief Description
Cross platform sound-playing utility for Ada apps with its own binding to OpenAL.


## Full Description

This is a sound-playing utility for Ada that can play WAV files on Windows, OSX, and Linux, using Ada tasking and OpenAL libraries. It includes a partial Ada binding to OpenAL.

It provides sound-playing capabilities for Ada apps that can:

* asynchronously start and stop music/sound loops, 
* initiate transient sounds,
* allow unlimited sound concurrency.

Examples for each O.S. are included.

* Suitable for any Ada application that requires background or transient sound effects; eg. games, simulations.
* There are no software dependencies; this package is self-contained.

* I am currently using it for sound in my flagship games:
	* AdaGate
	* AdaVenture
	* RetroArcade
	* SliderPuzzles
	* RufasCube
	* Reliquarium
	* World Cup Sokerban
	* RufasSwap

...so it has been extensively tested & used.

* Note that the same utility for C++ can be found at: https://sourceforge.net/projects/portable-cpp-sound-openal/

--------------------------------------------------------
## Usage:

Unzip the archive.  

* On Linux & Windows, 7z [www.7-zip.org] works well for this. The proper command to extract the archive and maintain the directory structure is "7z x filename".

* On OSX, Keka works well for 7Z files. The command-line for Keka is:
	* /Applications/Keka.app/Contents/MacOS/Keka --cli 7z x (filename.7z)

--------------------------------------------------------

See the simple interface description in file snd4ada.ads.

Generally, when you initialize a sound or soundloop, you specify its file name and retrieve an integer "key" that is used to play it sometime later.

Note: an error occurs whenever there is something fishy about the WAV file. I always get good results with WAV files processed through "sox".

========================================================
## What is so great about this package?

This package is a non-platform-specific Ada code that compiles & runs on Windows, OSX and Linux. It is now used in my flagship games: RetroArcade, terminal SliderPuzzles, RufasCube, AdaGate and AdaVenture (on GitHub, SourceForge, itch.io, GameJolt, IndieDB). 

Open source Ada developers are welcome to help improve or extend this app.
Developer or not, send comments, suggestions or questions to:
fastrgv@gmail.com


========================================================

## Ada Examples:

See ./adaExample/two.adb

The examples come with 3 compilation scripts: 

	* lcmp.sh (for linux)
	* ocmp.sh (for OSX)
	* setpath64.bat then wcmp64.bat (for Windows)

...all of which would need slight modification to reference Ada on your system.

Windows users, please read "gnuAdaOnWindows.txt".


## C++ Examples

See ./cppExample/two.cpp

This comes with scripts for OSX, linux and Windows. It shows how to use the Ada package from a C++ main. 

---------------------------------------

## SoundFiles
mKickCC0 & choirCC3 sounds are from freesound.org, and are covered by the Creative Commons CC0/CC3 Licenses. Attribution of choirCC3.wav is "dobroide".


## Getting a free Ada (& g++) compiler
To find a recent Ada compiler;  eg. GNU-Ada...try this source:
	https://github.com/alire-project/GNAT-FSF-builds/releases


## License:


This app is covered by the GNU GPL v3 as indicated in the sources:


Copyright (C) 2024  <fastrgv@gmail.com>

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

------------------------------------------------------------------
Older development history:

**ver 1.1.3 -- 30sep2022**

* Upgraded to 64-bit GNU Ada on Windows; no mingw required.


**ver 1.1.2 -- 16sep2022**

* Corrected some details of sound licenses.
* Now using GNU Ada rather than defunct AdaCore compiler.


**ver 1.1.1 -- 26nov2021**

* Added OSX example of a CPP main calling the Ada sound package.
* Refined the build scripts in examples.

**ver 1.1.0 -- 19oct2021**

* Now builds on GPL-GNAT as well as all versions of AdaCore.

**ver 1.0.1 -- 17feb2021**

* Added important guard statement for robustness.
* Update 6nov: added DLL to example directory.
* Update 12nov: added W64,OSX build scripts + EXEs to C++ example.


