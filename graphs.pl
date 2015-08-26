#!/usr/bin/perl -w
use strict;

# Set everything up

my $hostname;
if ( defined( $ARGV[0]) ) {
	$hostname = $ARGV[0];
} else {
	$hostname = "undefined";
}

my $gnuplot = '/usr/bin/gnuplot -persist';

my $ext = "png";
my $term = "png color";

my $how = "with lines";
my $avg = "smooth bezier";

# Now let's make some reports!

my ( $a, $z ) = ( 20, 26 );
#for my $n ( $a .. $z ) {
for my $n ( 1 ) {
	my $code = '';
	my $label = '';

	my $init_code = sub {
		$label = "${hostname}_2005-04-ALL_";
		$code = qq(
							 set datafile separator ';'
							 unset border
							 set xdata time
							 set timefmt '%Y-%m-%d %H:%M:%S'
							 set terminal $term
							 set output
							 set xrange [ "2005-04-$a 00:00:00":"2005-04-$z 23:59:59" ]
							);
	};


	### io
	&$init_code;
	$label .= "io_transactions";
	$code .= qq(
							set title "$label"
							set ylabel "transactions"
							plot "io_stats" using 3:5 title "reads/sec" $how 3, \\
							"io_stats" using 3:5 notitle $avg $how 3, \\
							"io_stats" using 3:6 title "writes/sec" $how 4, \\
							"io_stats" using 3:6 notitle $avg $how 4
						 );
	plot( $code, "${label}.$ext" );

 	&$init_code;
 	$label .= "io_blocks";
 	$code .= qq(
							set title "$label"
							set ylabel "blocks (512b)"
							plot "io_stats" using 3:7 title "total reads/sec" $how 3, \\
							"io_stats" using 3:7 notitle $avg $how 3, \\
							"io_stats" using 3:8 title "total writes/sec" $how 4, \\
							"io_stats" using 3:8 notitle $avg $how 4
						 );
	plot( $code, "${label}.$ext" );

	if ( $hostname eq "www" ) {
		&$init_code;
		$label .= "filesystems_io_blocks";
		$code .= qq(
								set title "$label"
								set ylabel "percent"
								plot \\);
		foreach ( qw( home tmp usr var ) ) {
			$code .= qq(
									"device_stats_$_" using 3:6 title "/$_ reads/sec" $how, \\
									"device_stats_$_" using 3:7 title "/$_ writes/sec" $how, \\);
		}
		chomp $code;
		$code =~ s/, \\\s*$//;
		plot( $code, "${label}.$ext" );
	}


	### cpu
	&$init_code;
	$label .= "cpu";
	$code .= qq(
							set title "$label"
							set ylabel "percent"
							set pointsize .5
							plot "cpu_util_stats" using 3:(100-\$8) title "used" $how 3, \\
							"cpu_util_stats" using 3:(100-\$8) notitle $avg $how 3, \\
							"cpu_util_stats" using 3:7 title "iowait" $how 4, \\
							"cpu_util_stats" using 3:7 notitle $avg $how 4
							);
	plot( $code, "${label}.$ext" );


	### load
	&$init_code;
	$label .= "cswitches";
	$code .= qq(
							set title "$label"
							set noylabel
							plot "cswitch_stats" using 3:4 title "switches/sec" $how 3, \\
							"cswitch_stats" using 3:4 notitle $avg $how 3
						 );
	plot( $code, "${label}.$ext" );

	&$init_code;
	$label .= "process_queue";
	$code .= qq(
							set title "$label"
							set noylabel
							plot "load_stats" using 3:4 title "run queue" $how 3, \\
							"load_stats" using 3:4 notitle $avg $how 3, \\
							"load_stats" using 3:6 title "1 min load avg" $how 4, \\
							"load_stats" using 3:6 notitle $avg $how 4, \\
							"load_stats" using 3:7 title "5 min load avg" $how 2, \\
							"load_stats" using 3:7 notitle $avg $how 2
						 );
	plot( $code, "${label}.$ext" );


	### memory
	&$init_code;
	$label .= "memory";
	$code .= qq(
							set title "$label";
							set ylabel "percent"
							plot "mem_stats" using 3:6 title "used memory" $how 3, \\
							"mem_stats" using 3:6 notitle $avg $how 3, \\
							"mem_stats" using 3:(100-\$11) title "free swap" $how 4, \\
							"mem_stats" using 3:(100-\$11) notitle $how 4
						 );
	plot( $code, "${label}.$ext" );


} # end for my $n




# # ## ### ##### ######## ############# #####################

sub plot {
	my $code = shift;
	my $output = shift;

	open G, "| $gnuplot > $output" or
		die "Can't open $gnuplot: $!";
	select G;

	print "# new job:\n";
	print $code;
	print "\n";

	close G;
}
# $Id: graphs.pl 4 2005-08-09 19:43:45Z cmd $
