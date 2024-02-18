/*
--
-- Copyright (C) 2024  <fastrgv@gmail.com>
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


#include <string>
using std::string;

#include <iostream>
using std::cout;
using std::endl;

#include <al.h>
#include <alc.h>
#include <unistd.h>
#include <stdlib.h>


static const int64_t mxsnd(26);
const int64_t mx(mxsnd);
//uint32_t
unsigned int sourceid[mx], bufferid[mx];


string openAlErrorToString(int err) {
switch (err) {
	case AL_INVALID_NAME:
   	return "AL_INVALID_NAME: a bad name (ID) was passed to an OpenAL function";
   	break;
   case AL_INVALID_ENUM:
   	return "AL_INVALID_ENUM: an invalid enum value was passed to an OpenAL function";
   	break;
   case AL_INVALID_VALUE:
   	return "AL_INVALID_VALUE: an invalid value was passed to an OpenAL function";
   	break;
   case AL_INVALID_OPERATION:
   	return "AL_INVALID_OPERATION";
   	break;
   case AL_OUT_OF_MEMORY:
   	return "AL_OUT_OF_MEMORY";
   	break;
   default:
   	return "UNKNOWN AL ERROR: ";
   }
}

//////// addendum 14feb24 /////////////////////////////

void setVolume( int sid, float lvl ) {
	int error;
	alGetError(); //clear error state
	//cout<<"calling alSourcef, sid="<<sid<<", souceID="<<sourceid[sid]<<", lvl="<<lvl<<endl;
	alSourcef(sourceid[sid], AL_GAIN, lvl );
	if ((error = alGetError()) != AL_NO_ERROR) {
		cout<<"setVolume error# "<<error<<endl;
		cout<<openAlErrorToString(error)<<endl;
	}

}
////////////////////////////////////////////////////////////




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

void genbuffers( int32_t sid ) {
	ALenum err=alGetError();
	alGenBuffers(1, &bufferid[sid]);
	if((err=alGetError()) != AL_NO_ERROR) {
		cout<<"genbuffers error = "<<err<<endl;
		exit(-1);
	}
}

void bufferdata( 
	int32_t sid, 
	ALuint fmt, 
	const ALvoid * dat, 
	int sz, 
	int rt )
{
	ALenum err=alGetError();
	alBufferData(bufferid[sid],fmt,dat,sz,rt);
	if((err=alGetError()) != AL_NO_ERROR) {
		cout<<"bufferdata error = "<<err<<endl;
		exit(-1);
	}
}

void gensources( int32_t sid ) {
	ALenum err=alGetError();
	alGenSources(1,&sourceid[sid]);
	if((err=alGetError()) != AL_NO_ERROR) {
		cout<<"gensources error = "<<err<<endl;
		exit(-1);
	}
}

void sourcei(int32_t sid ) {
	ALenum err=alGetError();
	alSourcei(sourceid[sid],AL_BUFFER,bufferid[sid]);
	if((err=alGetError()) != AL_NO_ERROR) {
		cout<<"sourcei error = "<<err<<endl;
		exit(-1);
	}
}

void cleanup1(int32_t sid) 
{
	alDeleteSources(1, &sourceid[sid]);
	alDeleteBuffers(1, &bufferid[sid]);
}


void cleanup2( ALCcontext * con, ALCdevice * dev )
{
	alcDestroyContext(con);
	alcCloseDevice(dev);
}






void sourcestop( int32_t sid ) {
	alSourceStop(sourceid[sid]);
}




void sourceplay( int32_t sid ) {
	alSourcePlay(sourceid[sid]);
}

bool is_stopped( int32_t sid ) {
	ALint state;
	alGetSourcei(sourceid[sid], AL_SOURCE_STATE, &state);
	if( state==AL_STOPPED ) return true;
	else return false;
}

// helper for above ftn...avoids issue of conversion 
// from cpp-true to ada-true:
bool is_true( void ) { return true; } // 18oct21 fastrgv



