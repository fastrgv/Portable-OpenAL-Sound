

rem create %1.o from %1.cpp:
g++ ^
	-c %1.cpp -I.


gnatbind -n snd4ada


rem create %1.exe:
gnatlink ^
	snd4ada -o %1 -m64 ^
	--LINK=g++ ^
	%1.o oal.o ^
	openal32.dll  ^
	-lwinmm

