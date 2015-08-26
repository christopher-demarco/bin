#!/usr/bin/perl -w

use strict;
use Palm::PDB;
use Palm::Raw;

my $DEBUG = 0;

my $pdb = new Palm::PDB;
$pdb->Load("ImageLib_imageDB.pdb");

my $id = my $oldid = 0;
my $partone = my $firsttime = 1;
foreach my $chunk (@{$pdb->{records}}) {
           $id = $chunk->{'id'};
           if($oldid != 0 && $id > ($oldid+1)) {
              close JPG;
              $partone = 1;
           } elsif ($firsttime == 1) {
              $firsttime = 0;
           }
           my $jpg = unpack("x4a*", $chunk->{'data'});
           if ($DEBUG) {
                open(DJPG, "> chunk.$id.jpg") or die "Couldn't open debug file $id\n";
                # print the raw packed data
                print DJPG "$chunk->{'data'}";
                close DJPG;
           }

           if($partone == 1) {
                open(JPG, "> $id.jpg") or die "Couldn't open $id.jpg\n";
                $partone = 0;
                print "\n$id.jpg ";
           }
           print JPG "$jpg";

        $oldid = $id;
        print ".";
}
print "\n";
# $Id: treopix.pl 4 2005-08-09 19:43:45Z cmd $
