
#ifndef OAL_HPP
#define OAL_HPP

#include <al.h>
#include <alc.h>

ALCdevice * opendevice(void);

ALCcontext * createcontext( ALCdevice * dev );

void makecontextcurrent( ALCcontext * con);

void genbuffers( ALuint * buf );

void bufferdata( 
	ALuint buf, 
	ALuint fmt, 
	const ALvoid * dat, 
	int sz, 
	int rt );

void gensources( ALuint * sid );

void sourcei( ALuint sid, ALuint buf );

void cleanup1( 
	ALuint * sid, 
	ALuint * buf
	);


void cleanup2( 
	ALCcontext * con, 
	ALCdevice * dev
	);



void sourceplay( ALuint sid );
void sourcestop( ALuint sid );

bool is_stopped( ALuint sid );

#endif

