#!/usr/bin/python

import StringIO, os
from commands import getstatusoutput

tracks = StringIO.StringIO("""ph94-10-31d1t01 Crowd Noise 1
ph94-10-31d1t02 Frankenstein
ph94-10-31d1t03 Sparkle
ph94-10-31d1t04 Simple
ph94-10-31d1t05 The Divided Sky
ph94-10-31d1t06 Harpua
ph94-10-31d1t07 Julius
ph94-10-31d1t08 The Horse
ph94-10-31d1t09 Silent in the Morning
ph94-10-31d2t01 Reba
ph94-10-31d2t02 Golgi Apparatus
ph94-10-31d2t03 Crowd Noise 2
ph94-10-31d2t04 Speak to Me
ph94-10-31d2t05 Beatles Intro
ph94-10-31d2t06 Back in the USSR
ph94-10-31d2t07 Dear Prudence
ph94-10-31d2t08 Glass Onion
ph94-10-31d2t09 Ob-La-Di Ob-La-Da
ph94-10-31d2t10 Wild Honey Pie
ph94-10-31d2t11 The Continuing Story of Bungalow Bill
ph94-10-31d2t12 While My Guitar Gently Weeps
ph94-10-31d2t13 Happiness Is a Warm Gun
ph94-10-31d2t14 Martha My Dear
ph94-10-31d2t15 I'm So Tired
ph94-10-31d2t16 Blackbird
ph94-10-31d2t17 Piggies
ph94-10-31d2t18 Rocky Raccoon
ph94-10-31d2t19 Don't Pass Me By
ph94-10-31d2t20 Why Don't We Do It in the Road
ph94-10-31d2t21 I Will
ph94-10-31d2t22 Julia
ph94-10-31d3t01 Birthday Jam
ph94-10-31d3t02 Yer Blues
ph94-10-31d3t03 Mother Nature's Son
ph94-10-31d3t04 Everybody's Got Something to Hide Except for Me and My Monkey
ph94-10-31d3t05 Sexy Sadie
ph94-10-31d3t06 Helter Skelter
ph94-10-31d3t07 Long Long Long
ph94-10-31d3t08 Revolution 1
ph94-10-31d3t09 Honey Pie
ph94-10-31d3t10 Savoy Truffle
ph94-10-31d3t11 Cry Baby Cry
ph94-10-31d3t12 Revolution 9
ph94-10-31d3t13 Good Night
ph94-10-31d4t01 Crowd Noise 3
ph94-10-31d4t02 David Bowie
ph94-10-31d4t03 Bouncing Around the Room
ph94-10-31d4t04 Slave to the Traffic Light
ph94-10-31d4t05 Rift
ph94-10-31d4t06 Sleeping Monkey
ph94-10-31d4t07 Poor Heart
ph94-10-31d4t08 Run Like an Antelope
ph94-10-31d4t09 Crowd Noise 4
ph94-10-31d4t10 Amazing Grace
ph94-10-31d4t11 Costume Contest
ph94-10-31d4t12 The Squirming Coil 
ph94-10-31d4t13 Crowd Noise 5
""")

for line in tracks.readlines():
    line = line.rstrip("\n")
    (fn, tn) = line.split(" ", 1)
    fn += ".mp3"
    cmd = "/usr/bin/id3v2 -2 -t \"%s\" %s" % (tn, fn)
    (s, output) = getstatusoutput(cmd)
    if s: raise Exception(output)
        
    

