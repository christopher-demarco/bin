#!/usr/bin/python

# handy for pipelines

import random, sys

lines = sys.stdin.readlines()
random.shuffle(lines)
for line in lines: print line[:-1]
sys.exit()
