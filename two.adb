with text_io; use text_io;
with snd4ada;
with interfaces.c;
with interfaces.c.strings;



procedure two is

	-- play 2 loops concurrently

	linestr: string(1..80);
	last: natural;
	choir, kick: interfaces.c.int;
	title: constant string := "choir.wav";
	titl2: constant string := "kick.wav";

begin

	snd4ada.initSnds;

	choir:=snd4ada.initLoop( interfaces.c.Strings.New_string(title) );
	kick:=snd4ada.initLoop( interfaces.c.Strings.New_string(titl2) );

	put_line("Hit <enter> to begin");
	get_line(linestr,last);

	snd4ada.playLoop(kick);
	snd4ada.playLoop(choir);

	put_line("hit <enter> to end kick");
	get_line(linestr,last);

	snd4ada.stopLoop(kick);

	put_line("hit <enter> to end choir");
	get_line(linestr,last);

	snd4ada.stopLoop(choir);

	snd4ada.termSnds;

end two;



