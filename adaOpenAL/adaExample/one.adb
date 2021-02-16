with text_io; use text_io;
with snd4ada;
with interfaces.c;
with interfaces.c.strings;
with ada.command_line;

procedure one is

	-- plays WAV file given on command line

	subtype glint is interfaces.c.int;

	linestr: string(1..80);
	last: natural;
	music: glint;

begin

if ada.command_line.argument_count = 1 then

	declare
		title : string := Ada.Command_Line.Argument(1);
	begin --declare


		snd4ada.initSnds;

		music:=snd4ada.initLoop( 
			interfaces.c.Strings.New_string(title));


		put_line("Hit <enter> to begin");
		get_line(linestr,last);

		snd4ada.playLoop(music);

		put_line("hit <enter> to end");
		get_line(linestr,last);

		snd4ada.stopLoop(music);

		snd4ada.termSnds;

	end; --declare

end if;
end one;
