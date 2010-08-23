#! /usr/bin/perl
$file = "$ENV{'HOME'}/.dictionary/meanings";
$tmp =  "$ENV{'HOME'}/.dictionary/tmp";
open(fr,"$file");
@meaning = <fr>;
$word = lc($ARGV[0]);
$a = system("grep -n -w '>$word' $file > $tmp");
if($a == 0) {
	open(fw,"$tmp");
	$line = <fw>;
	@line = split(":",$line);
	$line_no = @line[0];
	while(@test[0] ne ">") {
		print @meaning[$line_no++];
		@test = @meaning[$line_no];
		@test = substr(@test[0],0,1);
	}
} else {
	print "Not present\n";
}
close(fr);
close(fw);

