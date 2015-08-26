#!/usr/bin/perl -w

# Proof-of-concept for import-n-export of Memo32 records...
# ...a work-in-progress, hopefully!

# There should be a similar script to get the list of category names.

# This script should be able to do multiple  things: list, add, change
# memos.  It should understand categories.

# How to choose the memo to export?

use strict;
use Palm::PDB;
use Palm::Memo32;

die "First argument is the .pdb to parse." unless $ARGV[0];

my $pdb = new Palm::PDB;
$pdb->Load("$ARGV[0]");

my @categories = @{$pdb->{appinfo}{categories}};

my $records_hash_ref = $pdb->{records};
foreach my $record ( @$records_hash_ref ) {
  my $c = $$record{category};
	next
		unless ($categories[$c]->{name} eq "Projects");
	my $cname = $categories[$c]->{name};
  print "data: $$record{data}\n";
  print "category: $cname\n";
  print "---\n\n";
}






# $Id: memo32.pl 4 2005-08-09 19:43:45Z cmd $
