--
-- Copyright (C) 2023  <fastrgv@gmail.com>
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






with text_io;
with ada.direct_io;
with interfaces.C;
with interfaces.C.strings;
with system;
with al_h;
with alc_h;
with oal_hpp;

with unchecked_deallocation;

with ada.strings.unbounded;
use  ada.strings.unbounded;


package body snd is


task body iplayonce is

	use alc_h;
	use al_h;
	use text_io;
	use interfaces.c; --expose "int"
	use interfaces.C.strings;


	procedure myassert( 
		condition : boolean;  
		flag: integer:=0;
		msg: string := ""
		) is
	begin
	  if condition=false then
			put("ASSERTION Failed!  ");
			if flag /= 0 then
				put( "@ " & integer'image(flag) &" : " );
			end if;
			put_line(msg);
			new_line;
			raise program_error;
	  end if;
	end myassert;




----------------------------------------------------
	package wio is new ada.direct_io(char);
	use wio;
	ifid: wio.file_type;
	sz: wio.count;
	ch, ch1,ch2,ch3,ch4: char;

	formoffset : constant wio.positive_count := 20;--(short=2)
	chanoffset : constant wio.positive_count := 22;--(short=2)
	rateoffset : constant wio.positive_count := 24;--sampRate(int=4)
	byteoffset : constant wio.positive_count := 28;--bytesPerSec(int=4)
	bitsoffset : constant wio.positive_count := 34;--bitsPerSample(short=2)
	sizeoffset : constant wio.positive_count := 40;
	dataoffset : constant wio.positive_count := 44;
	nchan,  bitsPerSample, bytePerSec, datasize: natural;
-----------------------------------------------

	--convert char to integer:
	function c2i( ch: char ) return integer is
	begin
		return character'pos( character(ch) );
	end;

	--convert integer to unsigned:
	function i2u( i: integer ) return unsigned is
	begin
		return unsigned(i);
	end;



	pcm: integer;

	usfil: unbounded_string;


	type abuftype is access char_array;
	data: abuftype;

	procedure dfree is new unchecked_deallocation( char_array, abuftype );

	fmt: al_h.ALuint;
	bufid, sid : aliased al_h.ALuint;
	samprate: al_h.ALint;

	isamprate: integer;
	dsize: int;

begin --iplaytask

select -- outer : init or terminate

accept init( sfil: string ) do


	usfil:=to_unbounded_string(sfil);
	wio.open(ifid, wio.in_file, sfil);
	sz := wio.size(ifid);


	-- get/check format flag
	wio.set_index(ifid, formoffset+1);
	wio.read( ifid, ch ); --first byte is 1 or ?
	pcm := c2i(ch);
	if 
		(pcm /= 1)   --wav_fmt_pcm
		and
		(pcm /= 254) --wav_fmt_extensible
	then --?compression used?
		put(", pcm="&integer'image(pcm));
		put_line(" : cannot decode compressed files");
		raise program_error;
	end if;



	-- determine nchan [1 or 2]:
	wio.set_index(ifid, chanoffset+1);
	wio.read( ifid, ch ); --first byte is 1 or 2
	nchan := c2i(ch);


	-- determine sample rate:
	wio.set_index(ifid, rateoffset+1);
	wio.read( ifid, ch1 ); -- byte1
	wio.read( ifid, ch2 ); -- byte2
	wio.read( ifid, ch3 ); -- byte3
	wio.read( ifid, ch4 ); -- byte4

	--now, convert LittleEndian to integer
	isampRate := c2i(ch1)+256*( c2i(ch2) + 256*( c2i(ch3) + 256*c2i(ch4)));
	sampRate := int( isampRate );


	-- get BytesPerSecond:
	wio.set_index(ifid, byteoffset+1);
	wio.read( ifid, ch1 ); -- byte1
	wio.read( ifid, ch2 ); -- byte2
	wio.read( ifid, ch3 ); -- byte3
	wio.read( ifid, ch4 ); -- byte4

	--now, convert LittleEndian to integer
	bytePerSec := c2i(ch1)+256*( c2i(ch2) + 256*( c2i(ch3) + 256*c2i(ch4)));


	-- get bitsPerSample:
	wio.set_index(ifid, bitsoffset+1);
	wio.read( ifid, ch1 ); -- byte1
	wio.read( ifid, ch2 ); -- byte2
	bitsPerSample := c2i(ch1); -- 8, 16, 24 ...

	if nchan=1 then
		if bitsPerSample=8 then fmt:=AL_FORMAT_MONO8;
		else fmt:=AL_FORMAT_MONO16; end if;
	elsif nchan=2 then
		if bitsPerSample=8 then fmt:=AL_FORMAT_STEREO8;
		else fmt:=AL_FORMAT_STEREO16; end if;
	end if;


	wio.set_index(ifid, sizeoffset+1); 
	--next 4 bytes is size (#bytes of data)
	wio.read( ifid, ch1 ); -- byte1
	wio.read( ifid, ch2 ); -- byte2
	wio.read( ifid, ch3 ); -- byte3
	wio.read( ifid, ch4 ); -- byte4
	--now, convert LittleEndian to integer
	datasize := c2i(ch1)+256*( c2i(ch2) + 256*( c2i(ch3) + 256*c2i(ch4)));
	dsize := int(datasize);


	data := new char_array( 0..size_t(datasize) );

	wio.set_index(ifid, dataoffset+1);

	for j in 0..size_t(datasize-1) loop
		wio.read(ifid, data(j) );
	end loop;
	data( size_t(datasize) ) := interfaces.c.nul;

	wio.close(ifid);


end init; -- end  accept init block
-- note that the above accept-block is
-- "protected" and runs "single-threaded"


	oal_hpp.genbuffers(bufid'access);
	oal_hpp.bufferdata(
		bufid,
		fmt, 
		data.all'address, 
		dsize, 
		samprate);
	oal_hpp.gensources(sid'access);
	oal_hpp.sourcei( sid, bufid );





	outer:loop
------------------------outerloop----------------------------------------------

		select -- middle : start or quit

			accept Start; --middle select choice 1
				oal_hpp.sourceplay(sid);

		or -- middle select

			accept Quit; --middle select choice 2
				exit outer;

		end select; --middle

------------------------outerloop----------------------------------------------
	end loop outer;


	oal_hpp.cleanup1(sid'access,bufid'access);

	dfree( data ); -- deallocate



or -- outer select
	terminate; -- (in case we never init)

end select; --outer

exception
	when others =>
		put("iplayonce error playing: ");
		put_line( to_string(usfil) );
		raise;

end iplayonce; -- task body

end snd; -- package body

