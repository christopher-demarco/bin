#!/usr/bin/perl -w

# Dump a named Memo32DB.pdb to the current directory.
# Mandatory -f switch indicates the pdb to process.
# Optional -c indicates the category to dump; if not given then dump all.
# Optional -C causes the script to simply dump category names and exit.

use strict;
use Fcntl;
use Palm::PDB;
use Palm::Memo32;


use Getopt::Std;
getopts ("f:c:C");
our ($opt_f, $opt_c, $opt_C);

die "Use -f <file> to indicate the .pdb to be parsed."
	unless defined $opt_f;


my $pdb = new Palm::PDB;
$pdb->Load("$opt_f");


my $cat;
my @categories = @{$pdb->{appinfo}{categories}};

if (defined $opt_C) {
	print "Defined categories:\n";
	foreach my $cat_hash_ref (@categories) {
		my $c = $cat_hash_ref->{name};
		next if $c =~ m/^$/;
		print "$c\n";
	}
exit;
}

if (defined $opt_c) {
	foreach my $cat_hash_ref (@categories) {
		if ($cat_hash_ref->{name} eq $opt_c) {
			$cat = $cat_hash_ref->{name};
			last;
		}
	}
}


my $records_hash_ref = $pdb->{records};
foreach my $record ( @$records_hash_ref ) {

	if (defined $cat) {
		my $c = $$record{category};
		next
			unless ($categories[$c]->{name} eq $cat);
	}

	my @data = split /\n/, $$record{data};
	my $name = shift @data;
	open F,">$name";
	print F "$name\n";
	foreach (@data) {
		print F "$_\n";
	}
	close F;

}


# # ## ### ##### ######## ############# #####################
# CHANGELOG
# Wed Nov  3 21:16:27 MYT 2004
#   Initial version
#   Christopher DeMarco <cdemarco@md.com.my>




# $Id: dump_memo32.pl 4 2005-08-09 19:43:45Z cmd $
