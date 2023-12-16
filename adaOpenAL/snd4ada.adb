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





with sndloop;
with snd;
with text_io; 
with Interfaces.C; 
with Interfaces.C.Strings; 
with ada.direct_io;
with system;
with oal_hpp;
with alc_h;
with al_h;




package body snd4ada is

use text_io;
use Interfaces.C;
use Interfaces.C.Strings;


	subtype namerng is integer range 1..80;
	type nametype is new string(namerng);

	maxbuf : constant int := 26;
	subtype bufrng is int range 0..maxbuf;
	tbuf: bufrng := 0;

	tsk : array(bufrng) of sndloop.iplaytask;
	itask : array(bufrng) of snd.iplayonce;

	isloop,running : array(bufrng) of boolean := (others=>false);

	device : access alc_h.ALCdevice;
	context: access alc_h.ALCcontext;



	-- need some system setup here:
   procedure initSnds is
	begin
		device:=oal_hpp.opendevice;
		context := oal_hpp.createcontext(device);
		oal_hpp.makecontextcurrent(context);
	end initSnds;

	--specify wav-file of transient sound effect:
   function initSnd (
		pc : Interfaces.C.Strings.chars_ptr ) return int is

		lt: constant size_t := Strlen(pc);
		ln: constant namerng := namerng(lt);
	begin

		tbuf:=tbuf+1;
		itask(tbuf).Init( value(pc) );

		return tbuf;

	end initSnd;


	--transient sound...play Once:
   procedure playSnd (nbuf : int) is
	begin
		if (nbuf>=1 and nbuf<=tbuf) and then not isloop(nbuf) then
			itask(nbuf).start;
		end if; -- guard added 19nov20
	end playSnd;

	--specify wav-file for sound-loop, eg. music, background-sound:
   function initLoop (
		pc : Interfaces.C.Strings.chars_ptr ) return int is
	begin

		tbuf:=tbuf+1;
		isloop(tbuf):=true;
		running(tbuf):=false;
		tsk(tbuf).Init( value(pc) ); 
		-- "value" returns string
		return tbuf;

		exception
			when others =>
				put_line("snd4ada.initLoop error");
				raise;

	end initLoop;


	--sound loop...play Many using task:
   procedure playLoop (nbuf : int) is
	begin

		if nbuf>=1 and nbuf<=tbuf then
			if isloop(nbuf) and not running(nbuf) then
				running(nbuf):=true;
				tsk(nbuf).start;
			end if;
		end if;

		exception
			when others =>
				put_line("snd4ada.playLoop error");
				raise;
	end playLoop;


	--stop specified soundloop:
   procedure stopLoop (nbuf : int) is
	begin

		if nbuf>=1 and nbuf<=tbuf then
			if isloop(nbuf) and running(nbuf) then
				tsk(nbuf).stop;
				running(nbuf):=false;
			end if;
		end if;

		exception
			when others =>
				put_line("snd4ada.stopLoop error");
				raise;

	end stopLoop;

	--stop all soundloops:
	procedure stopLoops is
	begin
		for i in bufrng range 1..tbuf loop
			stopLoop(i);
		end loop;
	end stopLoops;

	-- terminate sounds; end tasks:
   procedure termSnds is
	begin
		stopLoops;
		for nbuf in bufrng range 1..tbuf loop
		if isloop(nbuf) then
			tsk(nbuf).quit;
			while not tsk(nbuf)'Terminated loop
				delay 0.2;
			end loop;

		else
			itask(nbuf).quit;
			while not itask(nbuf)'Terminated loop
				delay 0.2;
			end loop;

		end if;
		end loop;
		oal_hpp.cleanup2( context, device );
	end termSnds;



end snd4ada;
