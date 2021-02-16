/*
--
-- Copyright (C) 2020  <fastrgv@gmail.com>
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You may read the full text of the GNU General Public License
-- at <http://www.gnu.org/licenses/>.
--
*/



#include <iostream>
using std::cout;
using std::endl;

#include <al.h>
#include <alc.h>
#include <unistd.h>
#include <stdlib.h>

ALCdevice * opendevice(void) {
	return alcOpenDevice(NULL);
}

ALCcontext * createcontext( ALCdevice * dev ) {
	int attrlist[] = { ALC_SYNC, AL_FALSE, 0 };
	return alcCreateContext(dev,attrlist); //NO help
	//return alcCreateContext(dev,NULL);
}

void makecontextcurrent( ALCcontext * con) {
	alcMakeContextCurrent(con);
}

void genbuffers( ALuint * buf ) {
	ALenum err=alGetError();
	alGenBuffers(1, buf);
	if((err=alGetError()) != AL_NO_ERROR) {
		cout<<"genbuffers error = "<<err<<endl;
		exit(-1);
	}
}

void bufferdata( 
	ALuint buf, 
	ALuint fmt, 
	const ALvoid * dat, 
	int sz, 
	int rt )
{
	ALenum err=alGetError();
	alBufferData(buf,fmt,dat,sz,rt);
	if((err=alGetError()) != AL_NO_ERROR) {
		cout<<"bufferdata error = "<<err<<endl;
		exit(-1);
	}
}

void gensources( ALuint * sid ) {
	ALenum err=alGetError();
	alGenSources(1,sid);
	if((err=alGetError()) != AL_NO_ERROR) {
		cout<<"gensources error = "<<err<<endl;
		exit(-1);
	}
}

void sourcei( ALuint sid, ALuint buf ) {
	ALenum err=alGetError();
	alSourcei(sid,AL_BUFFER,buf);
	if((err=alGetError()) != AL_NO_ERROR) {
		cout<<"sourcei error = "<<err<<endl;
		exit(-1);
	}
}

void cleanup1( 
	ALuint * sid, 
	ALuint * buf
	)
{
	alDeleteSources(1,sid);
	alDeleteBuffers(1,buf);
}


void cleanup2( 
	ALCcontext * con, 
	ALCdevice * dev
	)
{
	alcDestroyContext(con);
	alcCloseDevice(dev);
}






void sourcestop( ALuint sid ) {
	alSourceStop(sid);
}




void sourceplay( ALuint sid ) {
	alSourcePlay(sid);
}

bool is_stopped( ALuint sid ) {
	ALint state;
	alGetSourcei(sid, AL_SOURCE_STATE, &state);
	if( state==AL_STOPPED ) return true;
	else return false;
}


