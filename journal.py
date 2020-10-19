#!/usr/bin/env python3

from datetime import datetime
import sys


page_on = int(input("Current page? "))
day_of_year = datetime.now().timetuple().tm_yday
#day_of_year = int(input("Day of year? "))

book_len = 250
pages_remaining = 365 - book_len
pages_per_month = int(2 + (30 * (5 / 7)))    # 2 for month spread + only write on weekdays

days_remaining = 365 - day_of_year
months_remaining = int(days_remaining / 30)
expected_pages_used = int(months_remaining * pages_per_month)



print(f"{days_remaining} days ({months_remaining} months) to fill {book_len - page_on} pages.")
print(f"Averaging one page per day, expect {expected_pages_used} pages on daily logs, leaving {pages_remaining - expected_pages_used} free.")


