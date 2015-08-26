#!/usr/bin/python

import binascii, sys
fh = open(sys.argv[1], "r")
s = fh.read()
s = binascii.b2a_base64(s)

while True:
    print s[:80]
    s = s[80:]
    if len(s) == 0: break


