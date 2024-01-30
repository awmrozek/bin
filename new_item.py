#!/usr/bin/python
from collections import *
import sys
import argparse
from datetime import datetime
from datetime import timedelta

from schedule_item import read_db
from schedule_item import write_db

DATE_FORMAT='%Y-%m-%d'
parser = argparse.ArgumentParser(
	prog='Automate add item',
	description='Adds item to database based on max value in datetime column',
	epilog='This software has plenty of super cow powers')

parser.add_argument('-f', required=True)
parser.add_argument('-m', required=True)
#parser.add_argument('-db', required=True)
DB="schedule.csv"

args = parser.parse_args()
db = read_db(DB)

latest_date=max([datetime.strptime(x['publication_date'], DATE_FORMAT) for x in db])
new_publication_day = latest_date + timedelta(days=1)
new_record = \
	{"publication_date": new_publication_day.strftime(DATE_FORMAT),
	"filename": args.f,
	"description": args.m}
db.append(new_record)

write_db(db, DB)

