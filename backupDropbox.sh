#!/bin/bash
set -e
DBD=~/cmd/BAK/Dropbox
[ -e $DBD ] || mkdir -p $DBD
rdiff-backup --print-statistics ~/cmd/Dropbox\ \(Personal\) $DBD
