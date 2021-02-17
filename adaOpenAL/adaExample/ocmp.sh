
# this compiles Ada examples on Mac/OSX

rm *.o
rm obj/*


g++ -c ../OalBinding/oal.cpp \
-std=c++11 \
-fpermissive \
-I.. \
-I../OalBinding \
-I../OalBinding/incoal



gnatmake one \
-D obj \
-I.. -I../OalBinding \
-largs \
-lc++ \
oal.o \
\
-framework CoreAudio \
-framework AudioUnit \
-framework AudioToolBox \
-framework OpenAL \
-pthread 

