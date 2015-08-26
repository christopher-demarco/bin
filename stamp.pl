#!/usr/bin/perl -w

# Appends $suf to all files in the directory.
# E.g. foo_suf.txt bar_suf.exe baz_suf.jpg
# Files MUST have a three-char extension, which is preserved (of course).

use strict;

&usage unless $ARGV[0];
my $suf = $ARGV[0];
my ( $file, $new );

foreach $file ( `ls` ) {
	next unless ( $file =~ m/(\w+)\.(\w\w\w)/ );
	chomp $file;
	$new = $1 . "_$suf." . $2;
	system ( "mv $file $new" );
}

sub usage {
    print "Usage: stamp.pl <SUFFIX>.\n";
    exit;
}
# $Id: stamp.pl 4 2005-08-09 19:43:45Z cmd $
