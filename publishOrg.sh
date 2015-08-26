#!/bin/bash

OUTDIR="$HOME/tmp/.org"
[ -d $OUTDIR ] || mkdir -p $OUTDIR

# /usr/bin/emacs -eval '(org-batch-store-agenda-views )' \
#     -kill

/usr/local/bin/emacs --batch -l ~/.emacs -eval '(org-batch-store-agenda-views)'

scp -P 16801 -r $OUTDIR/* mushroom.alephant.net:~/org
