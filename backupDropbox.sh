#!/bin/bash
set -e
DBD=~/cmd/BAK/Dropbox
[ -d $DBD ] || mkdir -p $DBD
rdiff-backup --print-statistics ~/Dropbox $DBD
