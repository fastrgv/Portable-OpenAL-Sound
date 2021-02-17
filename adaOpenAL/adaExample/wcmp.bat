
rem This compiles Ada examples on Windows.
rem uses 64-bit AdaCore GNAT compiler in default location

del *.o
del obj\*

rem build oal.o:
g++ ^
	-c ..\OalBinding\oal.cpp ^
 -std=c++11 ^
 -fpermissive ^
 -I.. -I..\OalBinding ^
 -I..\OalBinding\incoal


gnatmake %1 ^
 -D obj ^
 -I.. -I..\OalBinding ^
 -I..\OalBinding\incoal ^
 -largs oal.o openal32.dll ^
 libstdc++-6.dll ^
 -lwinmm


