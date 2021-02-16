pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;

package alc_h is

   --  unsupported macro: ALC_API extern
   --  unsupported macro: ALCAPI ALC_API
   --  unsupported macro: ALCAPIENTRY ALC_APIENTRY
   ALC_INVALID : constant := 0;  --  incoal/alc.h:28

   ALC_VERSION_0_1 : constant := 1;  --  incoal/alc.h:31

   ALC_FALSE : constant := 0;  --  incoal/alc.h:81

   ALC_TRUE : constant := 1;  --  incoal/alc.h:84

   ALC_FREQUENCY : constant := 16#1007#;  --  incoal/alc.h:87

   ALC_REFRESH : constant := 16#1008#;  --  incoal/alc.h:90

   ALC_SYNC : constant := 16#1009#;  --  incoal/alc.h:93

   ALC_MONO_SOURCES : constant := 16#1010#;  --  incoal/alc.h:96

   ALC_STEREO_SOURCES : constant := 16#1011#;  --  incoal/alc.h:99

   ALC_NO_ERROR : constant := 0;  --  incoal/alc.h:102

   ALC_INVALID_DEVICE : constant := 16#A001#;  --  incoal/alc.h:105

   ALC_INVALID_CONTEXT : constant := 16#A002#;  --  incoal/alc.h:108

   ALC_INVALID_ENUM : constant := 16#A003#;  --  incoal/alc.h:111

   ALC_INVALID_VALUE : constant := 16#A004#;  --  incoal/alc.h:114

   ALC_OUT_OF_MEMORY : constant := 16#A005#;  --  incoal/alc.h:117

   ALC_MAJOR_VERSION : constant := 16#1000#;  --  incoal/alc.h:121
   ALC_MINOR_VERSION : constant := 16#1001#;  --  incoal/alc.h:122

   ALC_ATTRIBUTES_SIZE : constant := 16#1002#;  --  incoal/alc.h:125
   ALC_ALL_ATTRIBUTES : constant := 16#1003#;  --  incoal/alc.h:126

   ALC_DEFAULT_DEVICE_SPECIFIER : constant := 16#1004#;  --  incoal/alc.h:129

   ALC_DEVICE_SPECIFIER : constant := 16#1005#;  --  incoal/alc.h:136

   ALC_EXTENSIONS : constant := 16#1006#;  --  incoal/alc.h:138

   ALC_EXT_CAPTURE : constant := 1;  --  incoal/alc.h:142

   ALC_CAPTURE_DEVICE_SPECIFIER : constant := 16#310#;  --  incoal/alc.h:149

   ALC_CAPTURE_DEFAULT_DEVICE_SPECIFIER : constant := 16#311#;  --  incoal/alc.h:151

   ALC_CAPTURE_SAMPLES : constant := 16#312#;  --  incoal/alc.h:153

   ALC_ENUMERATE_ALL_EXT : constant := 1;  --  incoal/alc.h:157

   ALC_DEFAULT_ALL_DEVICES_SPECIFIER : constant := 16#1012#;  --  incoal/alc.h:159

   ALC_ALL_DEVICES_SPECIFIER : constant := 16#1013#;  --  incoal/alc.h:166

  --* Deprecated macro.  
  --* Supported ALC version?  
  --* Opaque device handle  
   type ALCdevice_struct is null record;   -- incomplete struct

   subtype ALCdevice is ALCdevice_struct;  -- incoal/alc.h:34

  --* Opaque context handle  
   type ALCcontext_struct is null record;   -- incomplete struct

   subtype ALCcontext is ALCcontext_struct;  -- incoal/alc.h:36

  --* 8-bit boolean  
   subtype ALCboolean is char;  -- incoal/alc.h:39

  --* character  
   subtype ALCchar is char;  -- incoal/alc.h:42

  --* signed 8-bit 2's complement integer  
   subtype ALCbyte is signed_char;  -- incoal/alc.h:45

  --* unsigned 8-bit integer  
   subtype ALCubyte is unsigned_char;  -- incoal/alc.h:48

  --* signed 16-bit 2's complement integer  
   subtype ALCshort is short;  -- incoal/alc.h:51

  --* unsigned 16-bit integer  
   subtype ALCushort is unsigned_short;  -- incoal/alc.h:54

  --* signed 32-bit 2's complement integer  
   subtype ALCint is int;  -- incoal/alc.h:57

  --* unsigned 32-bit integer  
   subtype ALCuint is unsigned;  -- incoal/alc.h:60

  --* non-negative 32-bit binary integer size  
   subtype ALCsizei is int;  -- incoal/alc.h:63

  --* enumerated 32-bit value  
   subtype ALCenum is int;  -- incoal/alc.h:66

  --* 32-bit IEEE754 floating-point  
   subtype ALCfloat is float;  -- incoal/alc.h:69

  --* 64-bit IEEE754 floating-point  
   subtype ALCdouble is double;  -- incoal/alc.h:72

  --* void type (for opaque pointers only)  
   subtype ALCvoid is System.Address;  -- incoal/alc.h:75

  -- Enumerant values begin at column 50. No tabs.  
  --* Boolean False.  
  --* Boolean True.  
  --* Context attribute: <int> Hz.  
  --* Context attribute: <int> Hz.  
  --* Context attribute: AL_TRUE or AL_FALSE.  
  --* Context attribute: <int> requested Mono (3D) Sources.  
  --* Context attribute: <int> requested Stereo Sources.  
  --* No error.  
  --* Invalid device handle.  
  --* Invalid context handle.  
  --* Invalid enum parameter passed to an ALC call.  
  --* Invalid value parameter passed to an ALC call.  
  --* Out of memory.  
  --* Runtime ALC version.  
  --* Context attribute list properties.  
  --* String for the default device specifier.  
  --*
  -- * String for the given device's specifier.
  -- *
  -- * If device handle is NULL, it is instead a null-char separated list of
  -- * strings of known device specifiers (list ends with an empty string).
  --  

  --* String for space-separated list of ALC extensions.  
  --* Capture extension  
  --*
  -- * String for the given capture device's specifier.
  -- *
  -- * If device handle is NULL, it is instead a null-char separated list of
  -- * strings of known capture device specifiers (list ends with an empty string).
  --  

  --* String for the default capture device specifier.  
  --* Number of sample frames available for capture.  
  --* Enumerate All extension  
  --* String for the default extended device specifier.  
  --*
  -- * String for the given extended device's specifier.
  -- *
  -- * If device handle is NULL, it is instead a null-char separated list of
  -- * strings of known extended device specifiers (list ends with an empty string).
  --  

  --* Context management.  
   function alcCreateContext (device : access ALCdevice; attrlist : access ALCint) return access ALCcontext  -- incoal/alc.h:170
   with Import => True, 
        Convention => C, 
        External_Name => "alcCreateContext";

   function alcMakeContextCurrent (context : access ALCcontext) return ALCboolean  -- incoal/alc.h:171
   with Import => True, 
        Convention => C, 
        External_Name => "alcMakeContextCurrent";

   procedure alcProcessContext (context : access ALCcontext)  -- incoal/alc.h:172
   with Import => True, 
        Convention => C, 
        External_Name => "alcProcessContext";

   procedure alcSuspendContext (context : access ALCcontext)  -- incoal/alc.h:173
   with Import => True, 
        Convention => C, 
        External_Name => "alcSuspendContext";

   procedure alcDestroyContext (context : access ALCcontext)  -- incoal/alc.h:174
   with Import => True, 
        Convention => C, 
        External_Name => "alcDestroyContext";

   function alcGetCurrentContext return access ALCcontext  -- incoal/alc.h:175
   with Import => True, 
        Convention => C, 
        External_Name => "alcGetCurrentContext";

   function alcGetContextsDevice (context : access ALCcontext) return access ALCdevice  -- incoal/alc.h:176
   with Import => True, 
        Convention => C, 
        External_Name => "alcGetContextsDevice";

  --* Device management.  
   function alcOpenDevice (devicename : access ALCchar) return access ALCdevice  -- incoal/alc.h:179
   with Import => True, 
        Convention => C, 
        External_Name => "alcOpenDevice";

   function alcCloseDevice (device : access ALCdevice) return ALCboolean  -- incoal/alc.h:180
   with Import => True, 
        Convention => C, 
        External_Name => "alcCloseDevice";

  --*
  -- * Error support.
  -- *
  -- * Obtain the most recent Device error.
  --  

   function alcGetError (device : access ALCdevice) return ALCenum  -- incoal/alc.h:188
   with Import => True, 
        Convention => C, 
        External_Name => "alcGetError";

  --*
  -- * Extension support.
  -- *
  -- * Query for the presence of an extension, and obtain any appropriate
  -- * function pointers and enum values.
  --  

   function alcIsExtensionPresent (device : access ALCdevice; extname : access ALCchar) return ALCboolean  -- incoal/alc.h:196
   with Import => True, 
        Convention => C, 
        External_Name => "alcIsExtensionPresent";

   function alcGetProcAddress (device : access ALCdevice; funcname : access ALCchar) return System.Address  -- incoal/alc.h:197
   with Import => True, 
        Convention => C, 
        External_Name => "alcGetProcAddress";

   function alcGetEnumValue (device : access ALCdevice; enumname : access ALCchar) return ALCenum  -- incoal/alc.h:198
   with Import => True, 
        Convention => C, 
        External_Name => "alcGetEnumValue";

  --* Query function.  
   function alcGetString (device : access ALCdevice; param : ALCenum) return access ALCchar  -- incoal/alc.h:201
   with Import => True, 
        Convention => C, 
        External_Name => "alcGetString";

   procedure alcGetIntegerv
     (device : access ALCdevice;
      param : ALCenum;
      size : ALCsizei;
      values : access ALCint)  -- incoal/alc.h:202
   with Import => True, 
        Convention => C, 
        External_Name => "alcGetIntegerv";

  --* Capture function.  
   function alcCaptureOpenDevice
     (devicename : access ALCchar;
      frequency : ALCuint;
      format : ALCenum;
      buffersize : ALCsizei) return access ALCdevice  -- incoal/alc.h:205
   with Import => True, 
        Convention => C, 
        External_Name => "alcCaptureOpenDevice";

   function alcCaptureCloseDevice (device : access ALCdevice) return ALCboolean  -- incoal/alc.h:206
   with Import => True, 
        Convention => C, 
        External_Name => "alcCaptureCloseDevice";

   procedure alcCaptureStart (device : access ALCdevice)  -- incoal/alc.h:207
   with Import => True, 
        Convention => C, 
        External_Name => "alcCaptureStart";

   procedure alcCaptureStop (device : access ALCdevice)  -- incoal/alc.h:208
   with Import => True, 
        Convention => C, 
        External_Name => "alcCaptureStop";

   procedure alcCaptureSamples
     (device : access ALCdevice;
      buffer : System.Address;
      samples : ALCsizei)  -- incoal/alc.h:209
   with Import => True, 
        Convention => C, 
        External_Name => "alcCaptureSamples";

  --* Pointer-to-function type, useful for dynamically getting ALC entry points.  
   type LPALCCREATECONTEXT is access function (arg1 : access ALCdevice; arg2 : access ALCint) return access ALCcontext
   with Convention => C;  -- incoal/alc.h:212

   type LPALCMAKECONTEXTCURRENT is access function (arg1 : access ALCcontext) return ALCboolean
   with Convention => C;  -- incoal/alc.h:213

   type LPALCPROCESSCONTEXT is access procedure (arg1 : access ALCcontext)
   with Convention => C;  -- incoal/alc.h:214

   type LPALCSUSPENDCONTEXT is access procedure (arg1 : access ALCcontext)
   with Convention => C;  -- incoal/alc.h:215

   type LPALCDESTROYCONTEXT is access procedure (arg1 : access ALCcontext)
   with Convention => C;  -- incoal/alc.h:216

   type LPALCGETCURRENTCONTEXT is access function return access ALCcontext
   with Convention => C;  -- incoal/alc.h:217

   type LPALCGETCONTEXTSDEVICE is access function (arg1 : access ALCcontext) return access ALCdevice
   with Convention => C;  -- incoal/alc.h:218

   type LPALCOPENDEVICE is access function (arg1 : access ALCchar) return access ALCdevice
   with Convention => C;  -- incoal/alc.h:219

   type LPALCCLOSEDEVICE is access function (arg1 : access ALCdevice) return ALCboolean
   with Convention => C;  -- incoal/alc.h:220

   type LPALCGETERROR is access function (arg1 : access ALCdevice) return ALCenum
   with Convention => C;  -- incoal/alc.h:221

   type LPALCISEXTENSIONPRESENT is access function (arg1 : access ALCdevice; arg2 : access ALCchar) return ALCboolean
   with Convention => C;  -- incoal/alc.h:222

   type LPALCGETPROCADDRESS is access function (arg1 : access ALCdevice; arg2 : access ALCchar) return System.Address
   with Convention => C;  -- incoal/alc.h:223

   type LPALCGETENUMVALUE is access function (arg1 : access ALCdevice; arg2 : access ALCchar) return ALCenum
   with Convention => C;  -- incoal/alc.h:224

   type LPALCGETSTRING is access function (arg1 : access ALCdevice; arg2 : ALCenum) return access ALCchar
   with Convention => C;  -- incoal/alc.h:225

   type LPALCGETINTEGERV is access procedure
        (arg1 : access ALCdevice;
         arg2 : ALCenum;
         arg3 : ALCsizei;
         arg4 : access ALCint)
   with Convention => C;  -- incoal/alc.h:226

   type LPALCCAPTUREOPENDEVICE is access function
        (arg1 : access ALCchar;
         arg2 : ALCuint;
         arg3 : ALCenum;
         arg4 : ALCsizei) return access ALCdevice
   with Convention => C;  -- incoal/alc.h:227

   type LPALCCAPTURECLOSEDEVICE is access function (arg1 : access ALCdevice) return ALCboolean
   with Convention => C;  -- incoal/alc.h:228

   type LPALCCAPTURESTART is access procedure (arg1 : access ALCdevice)
   with Convention => C;  -- incoal/alc.h:229

   type LPALCCAPTURESTOP is access procedure (arg1 : access ALCdevice)
   with Convention => C;  -- incoal/alc.h:230

   type LPALCCAPTURESAMPLES is access procedure
        (arg1 : access ALCdevice;
         arg2 : System.Address;
         arg3 : ALCsizei)
   with Convention => C;  -- incoal/alc.h:231

end alc_h;
