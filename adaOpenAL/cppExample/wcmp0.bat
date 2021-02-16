
del *.o
del *.ali

rem create snd4ada.o:
gnatmake ^
	-c ../snd4ada -I.. ^
	-I../OalBinding/incoal ^
	-I../OalBinding


rem create oal.o:
g++ ^
	-c ../OalBinding/oal.cpp ^
	-I.. -I../OalBinding -I../OalBinding/incoal


