#!/usr/bin/perl -w
use strict;

$ARGV[0] or usage();

open( F, "<$ARGV[0]")
  or die( "Can't open $ARGV[0]: $!\n" );
my @lines = <F>;
close F;

my $account = shift( @lines );
my $rate = 0;
my %days;
my ( $d, $k, $v );

LINE: foreach my $l ( @lines ) {
	chomp $l;
	$l =~ m/:/ or next LINE;
	if ( $l =~ m/rate/i ) {
		$rate = ( split( /:/, $l ) )[1];
		next LINE;
	}
	( $d, $k, $v ) = split( /:/, $l );
	
	$days{$d} += $v;
}

foreach ( keys( %days ) ) {
	print "$_: $days{$_}\n";
}


sub usage {
		print '$1 is supposed to be the file to parse', "\n";
		exit;
}
# $Id: count_timesheet.pl 4 2005-08-09 19:43:45Z cmd $
