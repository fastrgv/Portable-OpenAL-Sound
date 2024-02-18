pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
--limited 
with alc_h;
with al_h;
with System;
with Interfaces.C.Extensions;

package oal_hpp is

  ----
  ---- Copyright (C) 2024  <fastrgv@gmail.com>
  ----
  ---- This program is free software: you can redistribute it and/or modify
  ---- it under the terms of the GNU General Public License as published by
  ---- the Free Software Foundation, either version 3 of the License, or
  ---- (at your option) any later version.
  ----
  ---- This program is distributed in the hope that it will be useful,
  ---- but WITHOUT ANY WARRANTY; without even the implied warranty of
  ---- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  ---- GNU General Public License for more details.
  ----
  ---- You may read the full text of the GNU General Public License
  ---- at <http://www.gnu.org/licenses/>.
  ----
  -- 

   function opendevice return access alc_h.ALCdevice  -- oal.hpp:28
   with Import => True, 
        Convention => CPP, 
        External_Name => "_Z10opendevicev";

   function createcontext (dev : access alc_h.ALCdevice) return access alc_h.ALCcontext  -- oal.hpp:30
   with Import => True, 
        Convention => CPP, 
        External_Name => "_Z13createcontextP16ALCdevice_struct";

   procedure makecontextcurrent (con : access alc_h.ALCcontext)  -- oal.hpp:32
   with Import => True, 
        Convention => CPP, 
        External_Name => "_Z18makecontextcurrentP17ALCcontext_struct";

   procedure genbuffers (sid : int)  -- oal.hpp:34
   with Import => True, 
        Convention => CPP, 
        External_Name => "_Z10genbuffersi";

   procedure bufferdata
     (sid : int;
      fmt : al_h.ALuint;
      dat : System.Address;
      sz : int;
      rt : int)  -- oal.hpp:36
   with Import => True, 
        Convention => CPP, 
        External_Name => "_Z10bufferdataijPKvii";

   procedure gensources (sid : int)  -- oal.hpp:43
   with Import => True, 
        Convention => CPP, 
        External_Name => "_Z10gensourcesi";

   procedure sourcei (sid : int)  -- oal.hpp:45
   with Import => True, 
        Convention => CPP, 
        External_Name => "_Z7sourceii";

   procedure cleanup1 (sid : int)  -- oal.hpp:47
   with Import => True, 
        Convention => CPP, 
        External_Name => "_Z8cleanup1i";

   procedure cleanup2 (con : access alc_h.ALCcontext; dev : access alc_h.ALCdevice)  -- oal.hpp:51
   with Import => True, 
        Convention => CPP, 
        External_Name => "_Z8cleanup2P17ALCcontext_structP16ALCdevice_struct";

   procedure sourceplay (sid : int)  -- oal.hpp:58
   with Import => True, 
        Convention => CPP, 
        External_Name => "_Z10sourceplayi";

   procedure sourcestop (sid : int)  -- oal.hpp:59
   with Import => True, 
        Convention => CPP, 
        External_Name => "_Z10sourcestopi";

   function is_stopped (sid : int) return Extensions.bool  -- oal.hpp:61
   with Import => True, 
        Convention => CPP, 
        External_Name => "_Z10is_stoppedi";

  -- 18oct21 fastrgv
   function is_true return Extensions.bool  -- oal.hpp:63
   with Import => True, 
        Convention => CPP, 
        External_Name => "_Z7is_truev";

  --////// experiment 14feb24 /////////////////////////////
  -- lvl>=0.0
   procedure setVolume (sid : int; lvl : float)  -- oal.hpp:69
   with Import => True, 
        Convention => CPP, 
        External_Name => "_Z9setVolumeif";

end oal_hpp;
