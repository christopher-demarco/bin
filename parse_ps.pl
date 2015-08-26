#!/usr/bin/perl -w
use strict;



unless ( defined( $ARGV[0] ) ) {
	print "I need something to work with!\n";
	exit;
}
my $file = $ARGV[0];
open( F, "< $file" ) or
	die "Can't open $file: $!";

my ( $stamp, %stamp );
my ( %mysql_cpu, %mysql_mem, %apache_cpu, %apache_mem );

open (MC, "> mysql_cpu");
open (MM, "> mysql_mem");
open (AC, "> apache_cpu");
open (AM, "> apache_mem");


LINE: while ( my $line = <F> ) {
	chomp $line;
	if ( $line =~ m/CDT/ ) {
		$stamp = $line;
		my @s = split( / /, $line);
		%stamp = (
							mon => $s[1],
							day => $s[2],
							time => $s[3],
							year => $s[5],
						 );
		@s = split( /:/, $stamp{"time"} );
		( $stamp{"hour"}, $stamp{"min"}, $stamp{"sec"} ) =
			( $s[0], $s[1], $s[2] );
		$stamp = "$stamp{day} $stamp{time}";
		next LINE;
	}

	# mysql
	if ( $line =~ m/mysqld --basedir/ ) {
		if ( $line =~ s/^\s+\w{3}\s+\d\d\s+// ) {
			;
		} elsif ( $line =~ s/^\d\d:\d\d:\d\d\s+// ) {
			;
		}
		my ( $cpu, $mem ) = ( split( ' ', $line ) )[0,1];
		if ( defined( $mysql_cpu{$stamp} ) ) {
			$mysql_cpu{$stamp} += $cpu;
		}	else {
			$mysql_cpu{$stamp} = $cpu;
		}
		if ( defined( $mysql_mem{$stamp} ) ) {
			$mysql_mem{$stamp} += $mem;
		}	else {
			$mysql_mem{$stamp} = $mem;
		}
		print MM "$mem\n";
		print MC "$cpu\n";
		next LINE;
	}

	# apache
	if ( $line =~ m/apache/ ) {
		if ( $line =~ s/^\s+\w{3}\s+\d\d\s+// ) {
			;
		} elsif ( $line =~ s/^\d\d:\d\d:\d\d\s+// ) {
			;
		}
		my ( $cpu, $mem ) = ( split( ' ', $line ) )[0,1];
		if ( defined( $apache_cpu{$stamp} ) ) {
			$apache_cpu{$stamp} += $cpu;
		}	else {
			$apache_cpu{$stamp} = $cpu;
		}
		if ( defined( $apache_mem{$stamp} ) ) {
			$apache_mem{$stamp} += $mem;
		}	else {
			$apache_mem{$stamp} = $mem;
		}
		print AM "$mem\n";
		print AC "$cpu\n";
		next LINE;
	}

} # end LINE

exit;


foreach ( keys( %mysql_cpu ) ) {
	print MC "$mysql_cpu{$_}\n";
}
foreach ( keys( %mysql_mem ) ) {
	print MM "$mysql_mem{$_}\n";
}

foreach ( keys( %apache_cpu ) ) {
	print AC "$apache_cpu{$_}\n";
}
foreach ( keys( %apache_mem ) ) {
	print AM "$apache_mem{$_}\n";
}




# $Id: parse_ps.pl 133 2006-08-24 20:27:52Z cmd $
