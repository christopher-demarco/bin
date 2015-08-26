#!/usr/bin/perl -w

use strict;

# Take a directory full of files.  Rename as follows:
# Split on "."; reverse char order of $2; unsplit.

foreach my $file ( `ls` )
{
    chomp $file;
    my ( $n, $ext ) = split /\./,$file;
    $ext =~ /(\w)(\w)(\w)/;
    $ext = $3 . $2 . $1;
    system ( "mv $file $n.$ext" );
}

exit;
# $Id: unhide.pl 4 2005-08-09 19:43:45Z cmd $
