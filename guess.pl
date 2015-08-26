#!/usr/bin/perl -w

$s = rand ( 99 ) ; $s++;
( $s, $r ) = split (/\./, $s)     ;

$n = 0;
&prompt("Guess a number between 1 and 100: ");

until ($win) {
	&prompt("Too low.  Guess again: ") if $g < $s;
	&prompt("Too high.  Guess again: ") if $g > $s;
	$win = 1 if $g == $s and last;
}
print "You win!\nIt took you $n tries.\n" and exit;

sub prompt {
	$n++;
        print "$_[0] ";
	chomp ($g = <STDIN>);
}
# $Id: guess.pl 4 2005-08-09 19:43:45Z cmd $
