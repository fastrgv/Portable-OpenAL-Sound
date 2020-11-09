
rem uses 64-bit AdaCore GNAT compiler in default location

del *.o
del obj\*

rem build oal.o:
c:\gnat64\2020\bin\g++ ^
	-c ..\OalBinding\oal.cpp ^
 -std=c++11 ^
 -fpermissive ^
 -I.. -I..\OalBinding ^
 -I..\OalBinding\incoal


c:\gnat64\2020\bin\gnatmake %1 ^
 -D obj ^
 -m64 ^
 -I.. -I..\OalBinding ^
 -I..\OalBinding\incoal ^
 -largs oal.o openal32.dll ^
 libstdc++-6.dll ^
 -lwinmm


