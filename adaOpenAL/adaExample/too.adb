with text_io; use text_io;
with snd4ada; --use snd4ada;
with interfaces.c;
with interfaces.c.strings;



procedure too is

	--attempt to play 2 sounds concurrently

	linestr: string(1..80);
	last: natural;
	choir, kick: interfaces.c.int;
	title: constant string := "choir.wav";
	titl2: constant string := "kick.wav";

begin

	snd4ada.initSnds;

	choir:=snd4ada.initLoop( interfaces.c.Strings.New_string(title) );
	kick:=snd4ada.initSnd( interfaces.c.Strings.New_string(titl2) );

	put_line("Hit <enter> to begin kick + choir");
	get_line(linestr,last);

	snd4ada.playSnd(kick);
	snd4ada.playLoop(choir);



	put_line("hit <enter> to kick + terminate");
	get_line(linestr,last);

	snd4ada.playSnd(kick);
	snd4ada.stopLoop(choir);

	delay 1.0;

	snd4ada.termSnds;

end too;



