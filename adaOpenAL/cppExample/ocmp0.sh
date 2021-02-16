
rm *.o
rm *.ali

export PATH=$HOME/opt/GNAT/2020/bin:$PATH

# create snd4ada.o:
gnatmake -c ../snd4ada -I.. \
-I../OalBinding/incoal \
-I../OalBinding


# create oal.o:
g++ -c \
../OalBinding/oal.cpp \
-std=c++11 \
-fpermissive \
-I.. \
-I../OalBinding \
-I../OalBinding/incoal


