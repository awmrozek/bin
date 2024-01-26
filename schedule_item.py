from collections import *
import argparse
import csv
import sys
from datetime import date

parser = argparse.ArgumentParser(
	prog='Schedule Item',
	description='Helps you to schedule item upload to GIT',
	epilog='This software maybe has super cow powers')
parser.add_argument('-new', action="store_true")
parser.add_argument('-new_filename')
parser.add_argument('-new_message')

parser.add_argument('-printme', action="store_true")
parser.add_argument('-db')

args = parser.parse_args()

def read_db(filename):
	schedule = open(filename)
	csvreader = csv.reader(schedule)

	csv_reader = csv.DictReader(schedule)
	data = [row for row in csv_reader]
	schedule.close()
	return data

if args.printme:
	db_content = read_db(args.db)
	print(db_content)

def write_db(db, filename):
	schedule_out = open(filename, "w")
	writer = csv.DictWriter(schedule_out, db[0].keys())
	writer.writeheader()
	for row in db:
		writer.writerow(row)
	
if args.new:
	filename = args.new_filename
	message = args.new_message
	db = read_db(args.db)
	print(db)
	db.append({'publication_date': date.today(), 'filename': 'sample.txt', 'description': 'Sample automatic description'})
	# datetimes = [datetime(x[1]) for x in rows]
	write_db(db, args.db)
	
