#!/usr/bin/perl -w

# This script takes one argument, a file containing a list of words.
# We search through that file for any word which when rot13'd yields 
# another word in the same file.

use strict;

my %pairs;
my $j;

my $dic = $ARGV[0];

open IN, $dic;
my @words = <IN>;
close IN;

foreach my $w (@words) {
  chomp $w;
  $j = $w;
	next if ($j =~ m/\d/);
  $j =~ tr/A-Za-z/N-ZA-Mn-za-m/;
  $pairs{$w} = $j;
}

my ( $l, $r );
foreach $l ( keys ( %pairs ) ) {
  $r = $pairs{$l};
  if ( $pairs{$r} ) {
    print "$l : $r\n";
  }
}
# $Id: rotsearch.pl 33 2005-11-30 01:55:04Z cmd $
