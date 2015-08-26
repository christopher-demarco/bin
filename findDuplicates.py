#!/usr/bin/python

import os, sys
from commands import getstatusoutput

def usage():
    print "sys.argv[0] <directory>"
    sys.exit(1)
if sys.argv[1] is None:
    usage()

mac = False
if os.uname()[0] == 'Darwin': mac = True

d = sys.argv[1]
sums = {}
files = os.listdir(d)
i = 0
l = len(files)
for f in os.listdir(d):
    if i % (l / 6) is 0:
        sys.stderr.write("%d / %d\n" % (i, l))
    if mac: c = "/sbin/md5 \"%s/%s\"" % (d, f)
    else: c = "/usr/bin/md5sum \"%s/%s\"" % (d, f)
    s, output = getstatusoutput(c)
    if s is not 0:
        print "WEIRD:  ", c
        print "    exited with status ", s
        print "    and ouput ", output
        exit(1)
    if mac:
        olist = output.split()
        (md, fn) = (olist[3], olist[1][1:-1])
    else: (md, fn) = output.split('  ')
    try:
        x = sums[md]
    except KeyError:
        sums[md] = fn
    else:
        print "rm -f", fn
    i += 1

