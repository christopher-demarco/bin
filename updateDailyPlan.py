#!/usr/bin/python

import datetime, os, sys, time


if len(sys.argv) >= 2:
    if sys.argv[1].lower() == "tomorrow":
        TOMORROW = True
    elif sys.argv[1].lower() == "today":
        TOMORROW = False
else:
    TOMORROW = True

date = datetime.date.today()
if TOMORROW:
    date = date + datetime.timedelta(1)
date = date.__str__()
dateFile = date + "_DAILY"


os.chdir("/home/demarco/working/maya/planning")
files = os.listdir(".")

LINK = "TODAY"
if LINK in files:
    if os.path.islink(LINK):
        if os.readlink(LINK) == dateFile:
            pass
        else:
            os.unlink(LINK)
            os.symlink(dateFile, LINK)
    else:
        print "Error:'TODAY' is not a link!"
        print "Exiting."
        sys.exit(1)
else:
    os.symlink(dateFile, LINK)


if not os.path.exists(dateFile):
    f = open(dateFile, "w")
    f.write(" %s \n" % date)
    f.write("============\n\n")
    f.close()

sys.exit(0)
