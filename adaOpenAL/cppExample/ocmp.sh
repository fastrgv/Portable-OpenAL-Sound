

export PATH=$HOME/opt/GNAT/2020/bin:$PATH



# create $1.o from $1.cpp
g++ -c \
$1.cpp \
-std=c++11 \
-fpermissive \
-I.


gnatbind -n snd4ada


# create $1_osx:
gnatlink snd4ada -o $1_osx \
--LINK=g++ \
$1.o oal.o \
-lc++ \
\
-framework CoreAudio \
-framework AudioUnit \
-framework AudioToolBox \
-framework OpenAL \
-pthread 

