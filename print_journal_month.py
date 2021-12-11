#!/usr/bin/env python3

from itertools import cycle, islice
import sys

if len(sys.argv) != 3:
    nargs = len(sys.argv)
    print("Usage: "+sys.argv[0]+" <days in month> <m|t|w|r|f|s|u>")
    sys.exit(255)
else:
    ndays = int(sys.argv[1])
    startday = sys.argv[2]

week = ['m', 't', 'w', 'r', 'f', 's', 'u']
start_index = week.index(startday)
week = cycle(week)
weekday = islice(week, start_index, None)

for date in range(1, ndays + 1):
    print(f"{date:02} {next(weekday)}")
print('-'*5)
for date in range(1, 8):
    print(f"{date:02} {next(weekday)}")
