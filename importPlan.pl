#!/usr/bin/perl -w
# vi:nospell

use strict;
use lib "$ENV{HOME}/lib/perl";
use Homunculus qw(
                    openPDB
                    readPlan
                    validatePDB
                    addToDo
                    mergeToDo
                    __abbreviateCategory
                    getRecords
                    getUniqueID
                    writePDB
                    compareToDo 

                    );
use Data::Dumper;

print "Not ready for primetime...  Records aren't set 'new...'\n";

warn "New feature: Print records which exist in PDB without corresponding PLAN entires?";
warn "New feature: Print records that are Unfiled";
warn "New feature: Allow change of category without adding a new record";


exit;

sub usage {
    print "$0: <planFile> <pdbFile>\n";
    exit 1;
}

my $planFile = shift;
usage() if not defined $planFile;
my $pdbFile = shift;
usage() if not defined $pdbFile;

my $pdb = openPDB($pdbFile);
validatePDB($pdb);
my $planToDos = readPlan($planFile);
my $pdbToDos = getRecords(\$pdb);


#use Data::Dumper;
#print Dumper $todos;
#print Dumper $pdb;

compareToDo($planToDos, $pdbToDos);
#mergeToDo($todos, $pdb);

#print Dumper $pdb; 

# This doesn't work...
 writePDB($pdb, '/home/cmd/tmp/new_pdb');




#vi:nospell
