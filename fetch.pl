open(fr,"words");
open(fw,">>meanings");
@words = <fr> ;
$len = @words;
for($i=0;$i<$len;$i++) {
    $word = @words[$i];
    chop($word);
    system("dict -d wn $word > file 2>&1");
    open(fp,"file");
    my @file = <fp>;
    my @first = split(/ /,@file[0]);
    @first = split(//,@first[0]);
    if(@first[0] eq 'N') {
        print fw (">>".@words[$i]." - Meaning not present\n");
    } elsif(@first[0] eq 'C'){
        $i--;
    } else{
        $j = 4;
        print fw (">".@words[$i]."\n");
        while(@file[$j++]) {
            print fw (@file[$j]);
        }
    }
    undef @file;
    undef @first;
    close(fp);
}
close(fr);
close(fw);
