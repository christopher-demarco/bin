#!/usr/bin/env python

"""
Rename every file in a directory to some_name + ordinal,
e.g. foo_1.jpg, foo_2.jpg.  Extension is preserved, but not required.
"""

import os, sys

name = sys.argv[1]

i = 0
for file in os.listdir('.'):
    if file.startswith('.'): continue
    try: oldname, extension = file.split('.')
    except ValueError:
        oldname = file
        extension = None
    newname = "%s_%d" % (name, i)
    if extension:
        newname += ".%s" % extension
    os.rename(file, newname)
    i += 1
    

    
