#!/usr/bin/python

import binascii, sys
ifh = open(sys.argv[1], "r")
s = ifh.read()
ifh.close()
s = binascii.a2b_base64(s)

ofh = open(sys.argv[2], "w")
ofh.write(s)
ofh.close()

