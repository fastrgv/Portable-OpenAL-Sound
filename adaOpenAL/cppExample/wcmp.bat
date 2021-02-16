

rem create %1.o from %1.cpp:
c:\gnat64\2020\bin\g++ ^
	-c %1.cpp -I.


c:\gnat64\2020\bin\gnatbind -n snd4ada


rem create %1.exe:
c:\gnat64\2020\bin\gnatlink ^
	snd4ada -o %1 -m64 ^
	--LINK=g++ ^
	%1.o oal.o ^
	openal32.dll  ^
	-lwinmm

