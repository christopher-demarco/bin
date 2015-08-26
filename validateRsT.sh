#!/bin/bash

for f in $*; do
    [ ! -f $f ] && continue
    ERR=$(rst2html < $f 2>&1 1>/dev/null)
    [ "$ERR" != '' ] && \
        echo $f $ERR
done
