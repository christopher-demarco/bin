#!/usr/bin/env python3

from datetime import datetime
import sys


if len(sys.argv) == 1:
    page_on = int(input("Current page? "))
else:
    page_on = int(sys.argv[1])
day_of_year = datetime.now().timetuple().tm_yday

book_len = 250 - 23 # perforated pages at the end
pages_remaining = book_len - page_on

days_remaining = 365 - day_of_year
writing_days_remaining = int(days_remaining * 5 / 7) # only write on weekdays
months_remaining = int(days_remaining / 30)

# including monthly spreads
expected_pages_used = 2 * months_remaining + writing_days_remaining

expected_end_page = page_on + expected_pages_used
expected_unwritten_pages = book_len - expected_end_page
expected_unwritten_percent = expected_unwritten_pages / book_len * 100

print(f"{days_remaining} days remain to fill {pages_remaining} pages.")
print(f"Averaging one page per weekday, expect {expected_pages_used} pages to be written.")
print(f"Thus the year will finish on page {expected_end_page}, leaving {expected_unwritten_pages} ({expected_unwritten_percent}%) unwritten.")

