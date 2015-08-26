#!/usr/bin/python

"""
Usage: rst.py <inputfile>

Outputs PDF and XHTML.

"""

import os, sys
from commands import getstatusoutput

if len(sys.argv) < 2:
    print __doc__
    sys.exit(1)

source = sys.argv[1]
tex = source + ".tex"
# FIXME: use the actual Python module!
(s, output) = getstatusoutput("/usr/bin/rst2latex %s %s" % (source, tex))
if s: print output
(s,output) = getstatusoutput("/usr/bin/pdflatex %s" % tex)
if s: print output
for tmp in ('aux', 'log', 'out', 'tex'):
    os.unlink("%s.%s" % (source, tmp))

## FIXME: use the actual Python module!
#(s, output) = getstatusoutput("/usr/bin/rst2html %s > %s.xhtml" % \
#                              (source, source))
     


