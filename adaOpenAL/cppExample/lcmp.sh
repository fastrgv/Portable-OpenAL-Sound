

export PATH=$HOME/opt/GNAT/2020/bin:$PATH



# create $1.o
g++ -c \
$1.cpp \
-std=c++11 \
-fpermissive \
-I.



gnatbind -n snd4ada



gnatlink snd4ada -o $1_gnu \
--LINK=g++ \
$1.o oal.o \
-lm -lpthread -lopenal



