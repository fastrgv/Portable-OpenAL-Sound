
12nov20:
.) latest gnu EXEs are from SL78.


Cpp example for using the AdaOpenAL package
from a Cpp main.
================================================

Here the 2 mains are: 1) one.cpp;	2) two.cpp;

Build instructions...script sequences:

linux two:
	lcmp0.sh
	lcmp.sh two

--------------------------------------------------

osx two:
	ocmp0.sh
	ocmp.sh two

--------------------------------------------------

windows two:
	wcmp0.bat
	wcmp.bat two

======================================================
Notice that there is a small amount of extra
coding baggage within the Cpp main programs:

1) declaring a namespace that summarizes the Cpp
	interface visible from snd4ada.ads;

2) enclosing the Cpp code between calls to
	1) adainit();
	2) adafinal();

and that is pretty much all there is to it. The
confusing part is setting up the build-script
sequence.

