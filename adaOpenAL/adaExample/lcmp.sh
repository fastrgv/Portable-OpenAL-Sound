
# this compiles Ada examples on Linux

rm *.o
rm obj/*


# first, create oal.o:
g++ ../OalBinding/oal.cpp -c \
-D obj \
-I.. \
-I../OalBinding \
-I../OalBinding/incoal


gnatmake $1 -o $1_gnu \
-D obj \
-O3 -gnat12 -I.. -I../OalBinding \
-largs \
oal.o \
-lstdc++ \
-lopenal -lpthread


