
#include <iostream>
using std::cout;
using std::cerr;
using std::endl;
using std::cin;

#include <string>
using std::string;


namespace play {

	//#ifdef __linux__

	extern "C"
	{

		void termSnds();
		int initSnds();

		int initSnd( char* pc );

		int initLoop( char* pc );

		void playSnd( int nbuf );
		void playLoop( int nbuf );

		void stopLoops();

		void stopLoop( int nbuf );

		/////////////////////////////

		void adainit ();
		void adafinal ();

	}

	//#endif

} // end namespace play


#include <stdio.h>

int main( int argc, char**argv)
{
	using namespace play;

	int c;
	char ch;
	int choir;
	char title[] = "choir.wav";

	adainit();

	initSnds();

	choir=initLoop( title );

	cout<<"hit <enter> to begin"<<endl;
	c=getchar();

	playLoop(choir);

	cout<<"hit <enter> to end"<<endl;
	c=getchar();

	stopLoop(choir);

	termSnds();

	adafinal();

	return 0;

} //end one;

