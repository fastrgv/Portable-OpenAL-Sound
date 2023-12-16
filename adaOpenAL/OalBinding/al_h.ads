pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;

package al_h is

   --  unsupported macro: AL_API extern
   --  unsupported macro: ALAPI AL_API
   --  unsupported macro: ALAPIENTRY AL_APIENTRY
   AL_INVALID : constant := (-1);  --  incoal/al.h:29
   --  unsupported macro: AL_ILLEGAL_ENUM AL_INVALID_ENUM
   --  unsupported macro: AL_ILLEGAL_COMMAND AL_INVALID_OPERATION

   AL_NONE : constant := 0;  --  incoal/al.h:80

   AL_FALSE : constant := 0;  --  incoal/al.h:83

   AL_TRUE : constant := 1;  --  incoal/al.h:86

   AL_SOURCE_RELATIVE : constant := 16#202#;  --  incoal/al.h:97

   AL_CONE_INNER_ANGLE : constant := 16#1001#;  --  incoal/al.h:108

   AL_CONE_OUTER_ANGLE : constant := 16#1002#;  --  incoal/al.h:118

   AL_PITCH : constant := 16#1003#;  --  incoal/al.h:128

   AL_POSITION : constant := 16#1004#;  --  incoal/al.h:144

   AL_DIRECTION : constant := 16#1005#;  --  incoal/al.h:154

   AL_VELOCITY : constant := 16#1006#;  --  incoal/al.h:163

   AL_LOOPING : constant := 16#1007#;  --  incoal/al.h:173

   AL_BUFFER : constant := 16#1009#;  --  incoal/al.h:182

   AL_GAIN : constant := 16#100A#;  --  incoal/al.h:196

   AL_MIN_GAIN : constant := 16#100D#;  --  incoal/al.h:206

   AL_MAX_GAIN : constant := 16#100E#;  --  incoal/al.h:216

   AL_ORIENTATION : constant := 16#100F#;  --  incoal/al.h:228

   AL_SOURCE_STATE : constant := 16#1010#;  --  incoal/al.h:235

   AL_INITIAL : constant := 16#1011#;  --  incoal/al.h:238
   AL_PLAYING : constant := 16#1012#;  --  incoal/al.h:239
   AL_PAUSED : constant := 16#1013#;  --  incoal/al.h:240
   AL_STOPPED : constant := 16#1014#;  --  incoal/al.h:241

   AL_BUFFERS_QUEUED : constant := 16#1015#;  --  incoal/al.h:250

   AL_BUFFERS_PROCESSED : constant := 16#1016#;  --  incoal/al.h:262

   AL_REFERENCE_DISTANCE : constant := 16#1020#;  --  incoal/al.h:274

   AL_ROLLOFF_FACTOR : constant := 16#1021#;  --  incoal/al.h:286

   AL_CONE_OUTER_GAIN : constant := 16#1022#;  --  incoal/al.h:297

   AL_MAX_DISTANCE : constant := 16#1023#;  --  incoal/al.h:309

   AL_SEC_OFFSET : constant := 16#1024#;  --  incoal/al.h:312

   AL_SAMPLE_OFFSET : constant := 16#1025#;  --  incoal/al.h:314

   AL_BYTE_OFFSET : constant := 16#1026#;  --  incoal/al.h:316

   AL_SOURCE_TYPE : constant := 16#1027#;  --  incoal/al.h:331

   AL_STATIC : constant := 16#1028#;  --  incoal/al.h:334
   AL_STREAMING : constant := 16#1029#;  --  incoal/al.h:335
   AL_UNDETERMINED : constant := 16#1030#;  --  incoal/al.h:336

   AL_FORMAT_MONO8 : constant := 16#1100#;  --  incoal/al.h:339
   AL_FORMAT_MONO16 : constant := 16#1101#;  --  incoal/al.h:340
   AL_FORMAT_STEREO8 : constant := 16#1102#;  --  incoal/al.h:341
   AL_FORMAT_STEREO16 : constant := 16#1103#;  --  incoal/al.h:342

   AL_FREQUENCY : constant := 16#2001#;  --  incoal/al.h:345

   AL_BITS : constant := 16#2002#;  --  incoal/al.h:347

   AL_CHANNELS : constant := 16#2003#;  --  incoal/al.h:349

   AL_SIZE : constant := 16#2004#;  --  incoal/al.h:351

   AL_UNUSED : constant := 16#2010#;  --  incoal/al.h:358
   AL_PENDING : constant := 16#2011#;  --  incoal/al.h:359
   AL_PROCESSED : constant := 16#2012#;  --  incoal/al.h:360

   AL_NO_ERROR : constant := 0;  --  incoal/al.h:364

   AL_INVALID_NAME : constant := 16#A001#;  --  incoal/al.h:367

   AL_INVALID_ENUM : constant := 16#A002#;  --  incoal/al.h:370

   AL_INVALID_VALUE : constant := 16#A003#;  --  incoal/al.h:373

   AL_INVALID_OPERATION : constant := 16#A004#;  --  incoal/al.h:376

   AL_OUT_OF_MEMORY : constant := 16#A005#;  --  incoal/al.h:379

   AL_VENDOR : constant := 16#B001#;  --  incoal/al.h:383

   AL_VERSION : constant := 16#B002#;  --  incoal/al.h:385

   AL_RENDERER : constant := 16#B003#;  --  incoal/al.h:387

   AL_EXTENSIONS : constant := 16#B004#;  --  incoal/al.h:389

   AL_DOPPLER_FACTOR : constant := 16#C000#;  --  incoal/al.h:400

   AL_DOPPLER_VELOCITY : constant := 16#C001#;  --  incoal/al.h:408

   AL_SPEED_OF_SOUND : constant := 16#C003#;  --  incoal/al.h:420

   AL_DISTANCE_MODEL : constant := 16#D000#;  --  incoal/al.h:441

   AL_INVERSE_DISTANCE : constant := 16#D001#;  --  incoal/al.h:445
   AL_INVERSE_DISTANCE_CLAMPED : constant := 16#D002#;  --  incoal/al.h:446
   AL_LINEAR_DISTANCE : constant := 16#D003#;  --  incoal/al.h:447
   AL_LINEAR_DISTANCE_CLAMPED : constant := 16#D004#;  --  incoal/al.h:448
   AL_EXPONENT_DISTANCE : constant := 16#D005#;  --  incoal/al.h:449
   AL_EXPONENT_DISTANCE_CLAMPED : constant := 16#D006#;  --  incoal/al.h:450

  --* Deprecated macro.  
  --* Supported AL version.  
  --* 8-bit boolean  
   subtype ALboolean is char;  -- incoal/al.h:38

  --* character  
   subtype ALchar is char;  -- incoal/al.h:41

  --* signed 8-bit 2's complement integer  
   subtype ALbyte is signed_char;  -- incoal/al.h:44

  --* unsigned 8-bit integer  
   subtype ALubyte is unsigned_char;  -- incoal/al.h:47

  --* signed 16-bit 2's complement integer  
   subtype ALshort is short;  -- incoal/al.h:50

  --* unsigned 16-bit integer  
   subtype ALushort is unsigned_short;  -- incoal/al.h:53

  --* signed 32-bit 2's complement integer  
   subtype ALint is int;  -- incoal/al.h:56

  --* unsigned 32-bit integer  
   subtype ALuint is unsigned;  -- incoal/al.h:59

  --* non-negative 32-bit binary integer size  
   subtype ALsizei is int;  -- incoal/al.h:62

  --* enumerated 32-bit value  
   subtype ALenum is int;  -- incoal/al.h:65

  --* 32-bit IEEE754 floating-point  
   subtype ALfloat is float;  -- incoal/al.h:68

  --* 64-bit IEEE754 floating-point  
   subtype ALdouble is double;  -- incoal/al.h:71

  --* void type (for opaque pointers only)  
   subtype ALvoid is System.Address;  -- incoal/al.h:74

  -- Enumerant values begin at column 50. No tabs.  
  --* "no distance model" or "no buffer"  
  --* Boolean False.  
  --* Boolean True.  
  --*
  -- * Relative source.
  -- * Type:    ALboolean
  -- * Range:   [AL_TRUE, AL_FALSE]
  -- * Default: AL_FALSE
  -- *
  -- * Specifies if the Source has relative coordinates.
  --  

  --*
  -- * Inner cone angle, in degrees.
  -- * Type:    ALint, ALfloat
  -- * Range:   [0 - 360]
  -- * Default: 360
  -- *
  -- * The angle covered by the inner cone, where the source will not attenuate.
  --  

  --*
  -- * Outer cone angle, in degrees.
  -- * Range:   [0 - 360]
  -- * Default: 360
  -- *
  -- * The angle covered by the outer cone, where the source will be fully
  -- * attenuated.
  --  

  --*
  -- * Source pitch.
  -- * Type:    ALfloat
  -- * Range:   [0.5 - 2.0]
  -- * Default: 1.0
  -- *
  -- * A multiplier for the frequency (sample rate) of the source's buffer.
  --  

  --*
  -- * Source or listener position.
  -- * Type:    ALfloat[3], ALint[3]
  -- * Default: {0, 0, 0}
  -- *
  -- * The source or listener location in three dimensional space.
  -- *
  -- * OpenAL, like OpenGL, uses a right handed coordinate system, where in a
  -- * frontal default view X (thumb) points right, Y points up (index finger), and
  -- * Z points towards the viewer/camera (middle finger).
  -- *
  -- * To switch from a left handed coordinate system, flip the sign on the Z
  -- * coordinate.
  --  

  --*
  -- * Source direction.
  -- * Type:    ALfloat[3], ALint[3]
  -- * Default: {0, 0, 0}
  -- *
  -- * Specifies the current direction in local space.
  -- * A zero-length vector specifies an omni-directional source (cone is ignored).
  --  

  --*
  -- * Source or listener velocity.
  -- * Type:    ALfloat[3], ALint[3]
  -- * Default: {0, 0, 0}
  -- *
  -- * Specifies the current velocity in local space.
  --  

  --*
  -- * Source looping.
  -- * Type:    ALboolean
  -- * Range:   [AL_TRUE, AL_FALSE]
  -- * Default: AL_FALSE
  -- *
  -- * Specifies whether source is looping.
  --  

  --*
  -- * Source buffer.
  -- * Type:  ALuint
  -- * Range: any valid Buffer.
  -- *
  -- * Specifies the buffer to provide sound samples.
  --  

  --*
  -- * Source or listener gain.
  -- * Type:  ALfloat
  -- * Range: [0.0 - ]
  -- *
  -- * A value of 1.0 means unattenuated. Each division by 2 equals an attenuation
  -- * of about -6dB. Each multiplicaton by 2 equals an amplification of about
  -- * +6dB.
  -- *
  -- * A value of 0.0 is meaningless with respect to a logarithmic scale; it is
  -- * silent.
  --  

  --*
  -- * Minimum source gain.
  -- * Type:  ALfloat
  -- * Range: [0.0 - 1.0]
  -- *
  -- * The minimum gain allowed for a source, after distance and cone attenation is
  -- * applied (if applicable).
  --  

  --*
  -- * Maximum source gain.
  -- * Type:  ALfloat
  -- * Range: [0.0 - 1.0]
  -- *
  -- * The maximum gain allowed for a source, after distance and cone attenation is
  -- * applied (if applicable).
  --  

  --*
  -- * Listener orientation.
  -- * Type: ALfloat[6]
  -- * Default: {0.0, 0.0, -1.0, 0.0, 1.0, 0.0}
  -- *
  -- * Effectively two three dimensional vectors. The first vector is the front (or
  -- * "at") and the second is the top (or "up").
  -- *
  -- * Both vectors are in local space.
  --  

  --*
  -- * Source state (query only).
  -- * Type:  ALint
  -- * Range: [AL_INITIAL, AL_PLAYING, AL_PAUSED, AL_STOPPED]
  --  

  --* Source state value.  
  --*
  -- * Source Buffer Queue size (query only).
  -- * Type: ALint
  -- *
  -- * The number of buffers queued using alSourceQueueBuffers, minus the buffers
  -- * removed with alSourceUnqueueBuffers.
  --  

  --*
  -- * Source Buffer Queue processed count (query only).
  -- * Type: ALint
  -- *
  -- * The number of queued buffers that have been fully processed, and can be
  -- * removed with alSourceUnqueueBuffers.
  -- *
  -- * Looping sources will never fully process buffers because they will be set to
  -- * play again for when the source loops.
  --  

  --*
  -- * Source reference distance.
  -- * Type:    ALfloat
  -- * Range:   [0.0 - ]
  -- * Default: 1.0
  -- *
  -- * The distance in units that no attenuation occurs.
  -- *
  -- * At 0.0, no distance attenuation ever occurs on non-linear attenuation models.
  --  

  --*
  -- * Source rolloff factor.
  -- * Type:    ALfloat
  -- * Range:   [0.0 - ]
  -- * Default: 1.0
  -- *
  -- * Multiplier to exaggerate or diminish distance attenuation.
  -- *
  -- * At 0.0, no distance attenuation ever occurs.
  --  

  --*
  -- * Outer cone gain.
  -- * Type:    ALfloat
  -- * Range:   [0.0 - 1.0]
  -- * Default: 0.0
  -- *
  -- * The gain attenuation applied when the listener is outside of the source's
  -- * outer cone.
  --  

  --*
  -- * Source maximum distance.
  -- * Type:    ALfloat
  -- * Range:   [0.0 - ]
  -- * Default: +inf
  -- *
  -- * The distance above which the source is not attenuated any further with a
  -- * clamped distance model, or where attenuation reaches 0.0 gain for linear
  -- * distance models with a default rolloff factor.
  --  

  --* Source buffer position, in seconds  
  --* Source buffer position, in sample frames  
  --* Source buffer position, in bytes  
  --*
  -- * Source type (query only).
  -- * Type:  ALint
  -- * Range: [AL_STATIC, AL_STREAMING, AL_UNDETERMINED]
  -- *
  -- * A Source is Static if a Buffer has been attached using AL_BUFFER.
  -- *
  -- * A Source is Streaming if one or more Buffers have been attached using
  -- * alSourceQueueBuffers.
  -- *
  -- * A Source is Undetermined when it has the NULL buffer attached using
  -- * AL_BUFFER.
  --  

  --* Source type value.  
  --* Buffer format specifier.  
  --* Buffer frequency (query only).  
  --* Buffer bits per sample (query only).  
  --* Buffer channel count (query only).  
  --* Buffer data size (query only).  
  --*
  -- * Buffer state.
  -- *
  -- * Not for public use.
  --  

  --* No error.  
  --* Invalid name paramater passed to AL call.  
  --* Invalid enum parameter passed to AL call.  
  --* Invalid value parameter passed to AL call.  
  --* Illegal AL call.  
  --* Not enough memory.  
  --* Context string: Vendor ID.  
  --* Context string: Version.  
  --* Context string: Renderer ID.  
  --* Context string: Space-separated extension list.  
  --*
  -- * Doppler scale.
  -- * Type:    ALfloat
  -- * Range:   [0.0 - ]
  -- * Default: 1.0
  -- *
  -- * Scale for source and listener velocities.
  --  

   procedure alDopplerFactor (value : ALfloat)  -- incoal/al.h:401
   with Import => True, 
        Convention => C, 
        External_Name => "alDopplerFactor";

  --*
  -- * Doppler velocity (deprecated).
  -- *
  -- * A multiplier applied to the Speed of Sound.
  --  

   procedure alDopplerVelocity (value : ALfloat)  -- incoal/al.h:409
   with Import => True, 
        Convention => C, 
        External_Name => "alDopplerVelocity";

  --*
  -- * Speed of Sound, in units per second.
  -- * Type:    ALfloat
  -- * Range:   [0.0001 - ]
  -- * Default: 343.3
  -- *
  -- * The speed at which sound waves are assumed to travel, when calculating the
  -- * doppler effect.
  --  

   procedure alSpeedOfSound (value : ALfloat)  -- incoal/al.h:421
   with Import => True, 
        Convention => C, 
        External_Name => "alSpeedOfSound";

  --*
  -- * Distance attenuation model.
  -- * Type:    ALint
  -- * Range:   [AL_NONE, AL_INVERSE_DISTANCE, AL_INVERSE_DISTANCE_CLAMPED,
  -- *           AL_LINEAR_DISTANCE, AL_LINEAR_DISTANCE_CLAMPED,
  -- *           AL_EXPONENT_DISTANCE, AL_EXPONENT_DISTANCE_CLAMPED]
  -- * Default: AL_INVERSE_DISTANCE_CLAMPED
  -- *
  -- * The model by which sources attenuate with distance.
  -- *
  -- * None     - No distance attenuation.
  -- * Inverse  - Doubling the distance halves the source gain.
  -- * Linear   - Linear gain scaling between the reference and max distances.
  -- * Exponent - Exponential gain dropoff.
  -- *
  -- * Clamped variations work like the non-clamped counterparts, except the
  -- * distance calculated is clamped between the reference and max distances.
  --  

   procedure alDistanceModel (distanceModel : ALenum)  -- incoal/al.h:442
   with Import => True, 
        Convention => C, 
        External_Name => "alDistanceModel";

  --* Distance model value.  
  --* Renderer State management.  
   procedure alEnable (capability : ALenum)  -- incoal/al.h:453
   with Import => True, 
        Convention => C, 
        External_Name => "alEnable";

   procedure alDisable (capability : ALenum)  -- incoal/al.h:454
   with Import => True, 
        Convention => C, 
        External_Name => "alDisable";

   function alIsEnabled (capability : ALenum) return ALboolean  -- incoal/al.h:455
   with Import => True, 
        Convention => C, 
        External_Name => "alIsEnabled";

  --* State retrieval.  
   function alGetString (param : ALenum) return access ALchar  -- incoal/al.h:458
   with Import => True, 
        Convention => C, 
        External_Name => "alGetString";

   procedure alGetBooleanv (param : ALenum; values : access ALboolean)  -- incoal/al.h:459
   with Import => True, 
        Convention => C, 
        External_Name => "alGetBooleanv";

   procedure alGetIntegerv (param : ALenum; values : access ALint)  -- incoal/al.h:460
   with Import => True, 
        Convention => C, 
        External_Name => "alGetIntegerv";

   procedure alGetFloatv (param : ALenum; values : access ALfloat)  -- incoal/al.h:461
   with Import => True, 
        Convention => C, 
        External_Name => "alGetFloatv";

   procedure alGetDoublev (param : ALenum; values : access ALdouble)  -- incoal/al.h:462
   with Import => True, 
        Convention => C, 
        External_Name => "alGetDoublev";

   function alGetBoolean (param : ALenum) return ALboolean  -- incoal/al.h:463
   with Import => True, 
        Convention => C, 
        External_Name => "alGetBoolean";

   function alGetInteger (param : ALenum) return ALint  -- incoal/al.h:464
   with Import => True, 
        Convention => C, 
        External_Name => "alGetInteger";

   function alGetFloat (param : ALenum) return ALfloat  -- incoal/al.h:465
   with Import => True, 
        Convention => C, 
        External_Name => "alGetFloat";

   function alGetDouble (param : ALenum) return ALdouble  -- incoal/al.h:466
   with Import => True, 
        Convention => C, 
        External_Name => "alGetDouble";

  --*
  -- * Error retrieval.
  -- *
  -- * Obtain the first error generated in the AL context since the last check.
  --  

   function alGetError return ALenum  -- incoal/al.h:473
   with Import => True, 
        Convention => C, 
        External_Name => "alGetError";

  --*
  -- * Extension support.
  -- *
  -- * Query for the presence of an extension, and obtain any appropriate function
  -- * pointers and enum values.
  --  

   function alIsExtensionPresent (extname : access ALchar) return ALboolean  -- incoal/al.h:481
   with Import => True, 
        Convention => C, 
        External_Name => "alIsExtensionPresent";

   function alGetProcAddress (fname : access ALchar) return System.Address  -- incoal/al.h:482
   with Import => True, 
        Convention => C, 
        External_Name => "alGetProcAddress";

   function alGetEnumValue (ename : access ALchar) return ALenum  -- incoal/al.h:483
   with Import => True, 
        Convention => C, 
        External_Name => "alGetEnumValue";

  --* Set Listener parameters  
   procedure alListenerf (param : ALenum; value : ALfloat)  -- incoal/al.h:487
   with Import => True, 
        Convention => C, 
        External_Name => "alListenerf";

   procedure alListener3f
     (param : ALenum;
      value1 : ALfloat;
      value2 : ALfloat;
      value3 : ALfloat)  -- incoal/al.h:488
   with Import => True, 
        Convention => C, 
        External_Name => "alListener3f";

   procedure alListenerfv (param : ALenum; values : access ALfloat)  -- incoal/al.h:489
   with Import => True, 
        Convention => C, 
        External_Name => "alListenerfv";

   procedure alListeneri (param : ALenum; value : ALint)  -- incoal/al.h:490
   with Import => True, 
        Convention => C, 
        External_Name => "alListeneri";

   procedure alListener3i
     (param : ALenum;
      value1 : ALint;
      value2 : ALint;
      value3 : ALint)  -- incoal/al.h:491
   with Import => True, 
        Convention => C, 
        External_Name => "alListener3i";

   procedure alListeneriv (param : ALenum; values : access ALint)  -- incoal/al.h:492
   with Import => True, 
        Convention => C, 
        External_Name => "alListeneriv";

  --* Get Listener parameters  
   procedure alGetListenerf (param : ALenum; value : access ALfloat)  -- incoal/al.h:495
   with Import => True, 
        Convention => C, 
        External_Name => "alGetListenerf";

   procedure alGetListener3f
     (param : ALenum;
      value1 : access ALfloat;
      value2 : access ALfloat;
      value3 : access ALfloat)  -- incoal/al.h:496
   with Import => True, 
        Convention => C, 
        External_Name => "alGetListener3f";

   procedure alGetListenerfv (param : ALenum; values : access ALfloat)  -- incoal/al.h:497
   with Import => True, 
        Convention => C, 
        External_Name => "alGetListenerfv";

   procedure alGetListeneri (param : ALenum; value : access ALint)  -- incoal/al.h:498
   with Import => True, 
        Convention => C, 
        External_Name => "alGetListeneri";

   procedure alGetListener3i
     (param : ALenum;
      value1 : access ALint;
      value2 : access ALint;
      value3 : access ALint)  -- incoal/al.h:499
   with Import => True, 
        Convention => C, 
        External_Name => "alGetListener3i";

   procedure alGetListeneriv (param : ALenum; values : access ALint)  -- incoal/al.h:500
   with Import => True, 
        Convention => C, 
        External_Name => "alGetListeneriv";

  --* Create Source objects.  
   procedure alGenSources (n : ALsizei; sources : access ALuint)  -- incoal/al.h:504
   with Import => True, 
        Convention => C, 
        External_Name => "alGenSources";

  --* Delete Source objects.  
   procedure alDeleteSources (n : ALsizei; sources : access ALuint)  -- incoal/al.h:506
   with Import => True, 
        Convention => C, 
        External_Name => "alDeleteSources";

  --* Verify a handle is a valid Source.  
   function alIsSource (source : ALuint) return ALboolean  -- incoal/al.h:508
   with Import => True, 
        Convention => C, 
        External_Name => "alIsSource";

  --* Set Source parameters.  
   procedure alSourcef
     (source : ALuint;
      param : ALenum;
      value : ALfloat)  -- incoal/al.h:511
   with Import => True, 
        Convention => C, 
        External_Name => "alSourcef";

   procedure alSource3f
     (source : ALuint;
      param : ALenum;
      value1 : ALfloat;
      value2 : ALfloat;
      value3 : ALfloat)  -- incoal/al.h:512
   with Import => True, 
        Convention => C, 
        External_Name => "alSource3f";

   procedure alSourcefv
     (source : ALuint;
      param : ALenum;
      values : access ALfloat)  -- incoal/al.h:513
   with Import => True, 
        Convention => C, 
        External_Name => "alSourcefv";

   procedure alSourcei
     (source : ALuint;
      param : ALenum;
      value : ALint)  -- incoal/al.h:514
   with Import => True, 
        Convention => C, 
        External_Name => "alSourcei";

   procedure alSource3i
     (source : ALuint;
      param : ALenum;
      value1 : ALint;
      value2 : ALint;
      value3 : ALint)  -- incoal/al.h:515
   with Import => True, 
        Convention => C, 
        External_Name => "alSource3i";

   procedure alSourceiv
     (source : ALuint;
      param : ALenum;
      values : access ALint)  -- incoal/al.h:516
   with Import => True, 
        Convention => C, 
        External_Name => "alSourceiv";

  --* Get Source parameters.  
   procedure alGetSourcef
     (source : ALuint;
      param : ALenum;
      value : access ALfloat)  -- incoal/al.h:519
   with Import => True, 
        Convention => C, 
        External_Name => "alGetSourcef";

   procedure alGetSource3f
     (source : ALuint;
      param : ALenum;
      value1 : access ALfloat;
      value2 : access ALfloat;
      value3 : access ALfloat)  -- incoal/al.h:520
   with Import => True, 
        Convention => C, 
        External_Name => "alGetSource3f";

   procedure alGetSourcefv
     (source : ALuint;
      param : ALenum;
      values : access ALfloat)  -- incoal/al.h:521
   with Import => True, 
        Convention => C, 
        External_Name => "alGetSourcefv";

   procedure alGetSourcei
     (source : ALuint;
      param : ALenum;
      value : access ALint)  -- incoal/al.h:522
   with Import => True, 
        Convention => C, 
        External_Name => "alGetSourcei";

   procedure alGetSource3i
     (source : ALuint;
      param : ALenum;
      value1 : access ALint;
      value2 : access ALint;
      value3 : access ALint)  -- incoal/al.h:523
   with Import => True, 
        Convention => C, 
        External_Name => "alGetSource3i";

   procedure alGetSourceiv
     (source : ALuint;
      param : ALenum;
      values : access ALint)  -- incoal/al.h:524
   with Import => True, 
        Convention => C, 
        External_Name => "alGetSourceiv";

  --* Play, replay, or resume (if paused) a list of Sources  
   procedure alSourcePlayv (n : ALsizei; sources : access ALuint)  -- incoal/al.h:528
   with Import => True, 
        Convention => C, 
        External_Name => "alSourcePlayv";

  --* Stop a list of Sources  
   procedure alSourceStopv (n : ALsizei; sources : access ALuint)  -- incoal/al.h:530
   with Import => True, 
        Convention => C, 
        External_Name => "alSourceStopv";

  --* Rewind a list of Sources  
   procedure alSourceRewindv (n : ALsizei; sources : access ALuint)  -- incoal/al.h:532
   with Import => True, 
        Convention => C, 
        External_Name => "alSourceRewindv";

  --* Pause a list of Sources  
   procedure alSourcePausev (n : ALsizei; sources : access ALuint)  -- incoal/al.h:534
   with Import => True, 
        Convention => C, 
        External_Name => "alSourcePausev";

  --* Play, replay, or resume a Source  
   procedure alSourcePlay (source : ALuint)  -- incoal/al.h:537
   with Import => True, 
        Convention => C, 
        External_Name => "alSourcePlay";

  --* Stop a Source  
   procedure alSourceStop (source : ALuint)  -- incoal/al.h:539
   with Import => True, 
        Convention => C, 
        External_Name => "alSourceStop";

  --* Rewind a Source (set playback postiton to beginning)  
   procedure alSourceRewind (source : ALuint)  -- incoal/al.h:541
   with Import => True, 
        Convention => C, 
        External_Name => "alSourceRewind";

  --* Pause a Source  
   procedure alSourcePause (source : ALuint)  -- incoal/al.h:543
   with Import => True, 
        Convention => C, 
        External_Name => "alSourcePause";

  --* Queue buffers onto a source  
   procedure alSourceQueueBuffers
     (source : ALuint;
      nb : ALsizei;
      buffers : access ALuint)  -- incoal/al.h:546
   with Import => True, 
        Convention => C, 
        External_Name => "alSourceQueueBuffers";

  --* Unqueue processed buffers from a source  
   procedure alSourceUnqueueBuffers
     (source : ALuint;
      nb : ALsizei;
      buffers : access ALuint)  -- incoal/al.h:548
   with Import => True, 
        Convention => C, 
        External_Name => "alSourceUnqueueBuffers";

  --* Create Buffer objects  
   procedure alGenBuffers (n : ALsizei; buffers : access ALuint)  -- incoal/al.h:552
   with Import => True, 
        Convention => C, 
        External_Name => "alGenBuffers";

  --* Delete Buffer objects  
   procedure alDeleteBuffers (n : ALsizei; buffers : access ALuint)  -- incoal/al.h:554
   with Import => True, 
        Convention => C, 
        External_Name => "alDeleteBuffers";

  --* Verify a handle is a valid Buffer  
   function alIsBuffer (buffer : ALuint) return ALboolean  -- incoal/al.h:556
   with Import => True, 
        Convention => C, 
        External_Name => "alIsBuffer";

  --* Specifies the data to be copied into a buffer  
   procedure alBufferData
     (buffer : ALuint;
      format : ALenum;
      data : System.Address;
      size : ALsizei;
      freq : ALsizei)  -- incoal/al.h:559
   with Import => True, 
        Convention => C, 
        External_Name => "alBufferData";

  --* Set Buffer parameters,  
   procedure alBufferf
     (buffer : ALuint;
      param : ALenum;
      value : ALfloat)  -- incoal/al.h:562
   with Import => True, 
        Convention => C, 
        External_Name => "alBufferf";

   procedure alBuffer3f
     (buffer : ALuint;
      param : ALenum;
      value1 : ALfloat;
      value2 : ALfloat;
      value3 : ALfloat)  -- incoal/al.h:563
   with Import => True, 
        Convention => C, 
        External_Name => "alBuffer3f";

   procedure alBufferfv
     (buffer : ALuint;
      param : ALenum;
      values : access ALfloat)  -- incoal/al.h:564
   with Import => True, 
        Convention => C, 
        External_Name => "alBufferfv";

   procedure alBufferi
     (buffer : ALuint;
      param : ALenum;
      value : ALint)  -- incoal/al.h:565
   with Import => True, 
        Convention => C, 
        External_Name => "alBufferi";

   procedure alBuffer3i
     (buffer : ALuint;
      param : ALenum;
      value1 : ALint;
      value2 : ALint;
      value3 : ALint)  -- incoal/al.h:566
   with Import => True, 
        Convention => C, 
        External_Name => "alBuffer3i";

   procedure alBufferiv
     (buffer : ALuint;
      param : ALenum;
      values : access ALint)  -- incoal/al.h:567
   with Import => True, 
        Convention => C, 
        External_Name => "alBufferiv";

  --* Get Buffer parameters.  
   procedure alGetBufferf
     (buffer : ALuint;
      param : ALenum;
      value : access ALfloat)  -- incoal/al.h:570
   with Import => True, 
        Convention => C, 
        External_Name => "alGetBufferf";

   procedure alGetBuffer3f
     (buffer : ALuint;
      param : ALenum;
      value1 : access ALfloat;
      value2 : access ALfloat;
      value3 : access ALfloat)  -- incoal/al.h:571
   with Import => True, 
        Convention => C, 
        External_Name => "alGetBuffer3f";

   procedure alGetBufferfv
     (buffer : ALuint;
      param : ALenum;
      values : access ALfloat)  -- incoal/al.h:572
   with Import => True, 
        Convention => C, 
        External_Name => "alGetBufferfv";

   procedure alGetBufferi
     (buffer : ALuint;
      param : ALenum;
      value : access ALint)  -- incoal/al.h:573
   with Import => True, 
        Convention => C, 
        External_Name => "alGetBufferi";

   procedure alGetBuffer3i
     (buffer : ALuint;
      param : ALenum;
      value1 : access ALint;
      value2 : access ALint;
      value3 : access ALint)  -- incoal/al.h:574
   with Import => True, 
        Convention => C, 
        External_Name => "alGetBuffer3i";

   procedure alGetBufferiv
     (buffer : ALuint;
      param : ALenum;
      values : access ALint)  -- incoal/al.h:575
   with Import => True, 
        Convention => C, 
        External_Name => "alGetBufferiv";

  --* Pointer-to-function type, useful for dynamically getting AL entry points.  
   type LPALENABLE is access procedure (arg1 : ALenum)
   with Convention => C;  -- incoal/al.h:578

   type LPALDISABLE is access procedure (arg1 : ALenum)
   with Convention => C;  -- incoal/al.h:579

   type LPALISENABLED is access function (arg1 : ALenum) return ALboolean
   with Convention => C;  -- incoal/al.h:580

   type LPALGETSTRING is access function (arg1 : ALenum) return access ALchar
   with Convention => C;  -- incoal/al.h:581

   type LPALGETBOOLEANV is access procedure (arg1 : ALenum; arg2 : access ALboolean)
   with Convention => C;  -- incoal/al.h:582

   type LPALGETINTEGERV is access procedure (arg1 : ALenum; arg2 : access ALint)
   with Convention => C;  -- incoal/al.h:583

   type LPALGETFLOATV is access procedure (arg1 : ALenum; arg2 : access ALfloat)
   with Convention => C;  -- incoal/al.h:584

   type LPALGETDOUBLEV is access procedure (arg1 : ALenum; arg2 : access ALdouble)
   with Convention => C;  -- incoal/al.h:585

   type LPALGETBOOLEAN is access function (arg1 : ALenum) return ALboolean
   with Convention => C;  -- incoal/al.h:586

   type LPALGETINTEGER is access function (arg1 : ALenum) return ALint
   with Convention => C;  -- incoal/al.h:587

   type LPALGETFLOAT is access function (arg1 : ALenum) return ALfloat
   with Convention => C;  -- incoal/al.h:588

   type LPALGETDOUBLE is access function (arg1 : ALenum) return ALdouble
   with Convention => C;  -- incoal/al.h:589

   type LPALGETERROR is access function return ALenum
   with Convention => C;  -- incoal/al.h:590

   type LPALISEXTENSIONPRESENT is access function (arg1 : access ALchar) return ALboolean
   with Convention => C;  -- incoal/al.h:591

   type LPALGETPROCADDRESS is access function (arg1 : access ALchar) return System.Address
   with Convention => C;  -- incoal/al.h:592

   type LPALGETENUMVALUE is access function (arg1 : access ALchar) return ALenum
   with Convention => C;  -- incoal/al.h:593

   type LPALLISTENERF is access procedure (arg1 : ALenum; arg2 : ALfloat)
   with Convention => C;  -- incoal/al.h:594

   type LPALLISTENER3F is access procedure
        (arg1 : ALenum;
         arg2 : ALfloat;
         arg3 : ALfloat;
         arg4 : ALfloat)
   with Convention => C;  -- incoal/al.h:595

   type LPALLISTENERFV is access procedure (arg1 : ALenum; arg2 : access ALfloat)
   with Convention => C;  -- incoal/al.h:596

   type LPALLISTENERI is access procedure (arg1 : ALenum; arg2 : ALint)
   with Convention => C;  -- incoal/al.h:597

   type LPALLISTENER3I is access procedure
        (arg1 : ALenum;
         arg2 : ALint;
         arg3 : ALint;
         arg4 : ALint)
   with Convention => C;  -- incoal/al.h:598

   type LPALLISTENERIV is access procedure (arg1 : ALenum; arg2 : access ALint)
   with Convention => C;  -- incoal/al.h:599

   type LPALGETLISTENERF is access procedure (arg1 : ALenum; arg2 : access ALfloat)
   with Convention => C;  -- incoal/al.h:600

   type LPALGETLISTENER3F is access procedure
        (arg1 : ALenum;
         arg2 : access ALfloat;
         arg3 : access ALfloat;
         arg4 : access ALfloat)
   with Convention => C;  -- incoal/al.h:601

   type LPALGETLISTENERFV is access procedure (arg1 : ALenum; arg2 : access ALfloat)
   with Convention => C;  -- incoal/al.h:602

   type LPALGETLISTENERI is access procedure (arg1 : ALenum; arg2 : access ALint)
   with Convention => C;  -- incoal/al.h:603

   type LPALGETLISTENER3I is access procedure
        (arg1 : ALenum;
         arg2 : access ALint;
         arg3 : access ALint;
         arg4 : access ALint)
   with Convention => C;  -- incoal/al.h:604

   type LPALGETLISTENERIV is access procedure (arg1 : ALenum; arg2 : access ALint)
   with Convention => C;  -- incoal/al.h:605

   type LPALGENSOURCES is access procedure (arg1 : ALsizei; arg2 : access ALuint)
   with Convention => C;  -- incoal/al.h:606

   type LPALDELETESOURCES is access procedure (arg1 : ALsizei; arg2 : access ALuint)
   with Convention => C;  -- incoal/al.h:607

   type LPALISSOURCE is access function (arg1 : ALuint) return ALboolean
   with Convention => C;  -- incoal/al.h:608

   type LPALSOURCEF is access procedure
        (arg1 : ALuint;
         arg2 : ALenum;
         arg3 : ALfloat)
   with Convention => C;  -- incoal/al.h:609

   type LPALSOURCE3F is access procedure
        (arg1 : ALuint;
         arg2 : ALenum;
         arg3 : ALfloat;
         arg4 : ALfloat;
         arg5 : ALfloat)
   with Convention => C;  -- incoal/al.h:610

   type LPALSOURCEFV is access procedure
        (arg1 : ALuint;
         arg2 : ALenum;
         arg3 : access ALfloat)
   with Convention => C;  -- incoal/al.h:611

   type LPALSOURCEI is access procedure
        (arg1 : ALuint;
         arg2 : ALenum;
         arg3 : ALint)
   with Convention => C;  -- incoal/al.h:612

   type LPALSOURCE3I is access procedure
        (arg1 : ALuint;
         arg2 : ALenum;
         arg3 : ALint;
         arg4 : ALint;
         arg5 : ALint)
   with Convention => C;  -- incoal/al.h:613

   type LPALSOURCEIV is access procedure
        (arg1 : ALuint;
         arg2 : ALenum;
         arg3 : access ALint)
   with Convention => C;  -- incoal/al.h:614

   type LPALGETSOURCEF is access procedure
        (arg1 : ALuint;
         arg2 : ALenum;
         arg3 : access ALfloat)
   with Convention => C;  -- incoal/al.h:615

   type LPALGETSOURCE3F is access procedure
        (arg1 : ALuint;
         arg2 : ALenum;
         arg3 : access ALfloat;
         arg4 : access ALfloat;
         arg5 : access ALfloat)
   with Convention => C;  -- incoal/al.h:616

   type LPALGETSOURCEFV is access procedure
        (arg1 : ALuint;
         arg2 : ALenum;
         arg3 : access ALfloat)
   with Convention => C;  -- incoal/al.h:617

   type LPALGETSOURCEI is access procedure
        (arg1 : ALuint;
         arg2 : ALenum;
         arg3 : access ALint)
   with Convention => C;  -- incoal/al.h:618

   type LPALGETSOURCE3I is access procedure
        (arg1 : ALuint;
         arg2 : ALenum;
         arg3 : access ALint;
         arg4 : access ALint;
         arg5 : access ALint)
   with Convention => C;  -- incoal/al.h:619

   type LPALGETSOURCEIV is access procedure
        (arg1 : ALuint;
         arg2 : ALenum;
         arg3 : access ALint)
   with Convention => C;  -- incoal/al.h:620

   type LPALSOURCEPLAYV is access procedure (arg1 : ALsizei; arg2 : access ALuint)
   with Convention => C;  -- incoal/al.h:621

   type LPALSOURCESTOPV is access procedure (arg1 : ALsizei; arg2 : access ALuint)
   with Convention => C;  -- incoal/al.h:622

   type LPALSOURCEREWINDV is access procedure (arg1 : ALsizei; arg2 : access ALuint)
   with Convention => C;  -- incoal/al.h:623

   type LPALSOURCEPAUSEV is access procedure (arg1 : ALsizei; arg2 : access ALuint)
   with Convention => C;  -- incoal/al.h:624

   type LPALSOURCEPLAY is access procedure (arg1 : ALuint)
   with Convention => C;  -- incoal/al.h:625

   type LPALSOURCESTOP is access procedure (arg1 : ALuint)
   with Convention => C;  -- incoal/al.h:626

   type LPALSOURCEREWIND is access procedure (arg1 : ALuint)
   with Convention => C;  -- incoal/al.h:627

   type LPALSOURCEPAUSE is access procedure (arg1 : ALuint)
   with Convention => C;  -- incoal/al.h:628

   type LPALSOURCEQUEUEBUFFERS is access procedure
        (arg1 : ALuint;
         arg2 : ALsizei;
         arg3 : access ALuint)
   with Convention => C;  -- incoal/al.h:629

   type LPALSOURCEUNQUEUEBUFFERS is access procedure
        (arg1 : ALuint;
         arg2 : ALsizei;
         arg3 : access ALuint)
   with Convention => C;  -- incoal/al.h:630

   type LPALGENBUFFERS is access procedure (arg1 : ALsizei; arg2 : access ALuint)
   with Convention => C;  -- incoal/al.h:631

   type LPALDELETEBUFFERS is access procedure (arg1 : ALsizei; arg2 : access ALuint)
   with Convention => C;  -- incoal/al.h:632

   type LPALISBUFFER is access function (arg1 : ALuint) return ALboolean
   with Convention => C;  -- incoal/al.h:633

   type LPALBUFFERDATA is access procedure
        (arg1 : ALuint;
         arg2 : ALenum;
         arg3 : System.Address;
         arg4 : ALsizei;
         arg5 : ALsizei)
   with Convention => C;  -- incoal/al.h:634

   type LPALBUFFERF is access procedure
        (arg1 : ALuint;
         arg2 : ALenum;
         arg3 : ALfloat)
   with Convention => C;  -- incoal/al.h:635

   type LPALBUFFER3F is access procedure
        (arg1 : ALuint;
         arg2 : ALenum;
         arg3 : ALfloat;
         arg4 : ALfloat;
         arg5 : ALfloat)
   with Convention => C;  -- incoal/al.h:636

   type LPALBUFFERFV is access procedure
        (arg1 : ALuint;
         arg2 : ALenum;
         arg3 : access ALfloat)
   with Convention => C;  -- incoal/al.h:637

   type LPALBUFFERI is access procedure
        (arg1 : ALuint;
         arg2 : ALenum;
         arg3 : ALint)
   with Convention => C;  -- incoal/al.h:638

   type LPALBUFFER3I is access procedure
        (arg1 : ALuint;
         arg2 : ALenum;
         arg3 : ALint;
         arg4 : ALint;
         arg5 : ALint)
   with Convention => C;  -- incoal/al.h:639

   type LPALBUFFERIV is access procedure
        (arg1 : ALuint;
         arg2 : ALenum;
         arg3 : access ALint)
   with Convention => C;  -- incoal/al.h:640

   type LPALGETBUFFERF is access procedure
        (arg1 : ALuint;
         arg2 : ALenum;
         arg3 : access ALfloat)
   with Convention => C;  -- incoal/al.h:641

   type LPALGETBUFFER3F is access procedure
        (arg1 : ALuint;
         arg2 : ALenum;
         arg3 : access ALfloat;
         arg4 : access ALfloat;
         arg5 : access ALfloat)
   with Convention => C;  -- incoal/al.h:642

   type LPALGETBUFFERFV is access procedure
        (arg1 : ALuint;
         arg2 : ALenum;
         arg3 : access ALfloat)
   with Convention => C;  -- incoal/al.h:643

   type LPALGETBUFFERI is access procedure
        (arg1 : ALuint;
         arg2 : ALenum;
         arg3 : access ALint)
   with Convention => C;  -- incoal/al.h:644

   type LPALGETBUFFER3I is access procedure
        (arg1 : ALuint;
         arg2 : ALenum;
         arg3 : access ALint;
         arg4 : access ALint;
         arg5 : access ALint)
   with Convention => C;  -- incoal/al.h:645

   type LPALGETBUFFERIV is access procedure
        (arg1 : ALuint;
         arg2 : ALenum;
         arg3 : access ALint)
   with Convention => C;  -- incoal/al.h:646

   type LPALDOPPLERFACTOR is access procedure (arg1 : ALfloat)
   with Convention => C;  -- incoal/al.h:647

   type LPALDOPPLERVELOCITY is access procedure (arg1 : ALfloat)
   with Convention => C;  -- incoal/al.h:648

   type LPALSPEEDOFSOUND is access procedure (arg1 : ALfloat)
   with Convention => C;  -- incoal/al.h:649

   type LPALDISTANCEMODEL is access procedure (arg1 : ALenum)
   with Convention => C;  -- incoal/al.h:650

  -- extern "C"  
end al_h;
