
del *.o
del *.ali

rem create snd4ada.o:
c:\gnat64\2020\bin\gnatmake ^
	-c ../snd4ada -I.. ^
	-I../OalBinding/incoal ^
	-I../OalBinding


rem create oal.o:
c:\gnat64\2020\bin\g++ ^
	-c ../OalBinding/oal.cpp ^
	-I.. -I../OalBinding -I../OalBinding/incoal


