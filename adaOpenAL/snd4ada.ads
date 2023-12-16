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



with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;

package snd4ada is

	--Note:  export pragmas allow use by C++ apps.

   procedure termSnds;
	pragma export(c,termSnds,"termSnds");

   procedure initSnds;
	pragma export(c,initSnds,"initSnds");

   function initSnd 
	( pc : Interfaces.C.Strings.chars_ptr ) return int;
	pragma export(c,initSnd,"initSnd");
		
   function initLoop 
	( pc : Interfaces.C.Strings.chars_ptr ) return int;
	pragma export(c,initLoop,"initLoop");

   procedure playSnd (nbuf : int);
	pragma export(c,playSnd,"playSnd");

   procedure playLoop (nbuf : int);
	pragma export(c,playLoop,"playLoop");

	procedure stopLoops;
	pragma export(c,stopLoops,"stopLoops");


   procedure stopLoop (nbuf : int);
	pragma export(c,stopLoop,"stopLoop");

end snd4ada;
