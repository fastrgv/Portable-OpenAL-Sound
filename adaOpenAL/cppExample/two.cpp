
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
	int choir, kick;
	char title[] = "choir.wav";
	char titl2[] = "kick.wav";

	adainit();

	initSnds();

	choir=initLoop( title );
	kick=initLoop( titl2 );

	cout<<"hit <enter> to begin"<<endl;
	c=getchar();

	playLoop(choir);
	playLoop(kick);

	cout<<"hit <enter> to end kick"<<endl;
	c=getchar();

	stopLoop(kick);

	cout<<"hit <enter> to end"<<endl;
	c=getchar();

	stopLoop(choir);


	termSnds();

	adafinal();

	return 0;

} //end myplay;

