#!/usr/bin/python
from schedule_item import read_db
from datetime import datetime
from time import sleep
import os
from subprocess import Popen

os.chdir("/home/pi/Documents/cdlty")
running = True
while running:
	today = datetime.now().strftime("%Y-%m-%d")
	db = read_db("schedule.csv")
	actions_today = list(filter(lambda x: (x['publication_date'] == today), db))
	print(f"Today is {today}. Actions: {actions_today}")

	for action in actions_today:
		filename = action['filename']
		description = action['description']
		commands = [f"git add {filename}", f"git commit -m \"{description}\"", "git push"]
		for command in commands:
			proc = Popen(command, shell=True)
			proc.wait()
	print("Job done. Waiting...")
	sleep(3600)
