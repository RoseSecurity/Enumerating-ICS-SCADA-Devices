#!/usr/bin/env python3

from datetime import date
import requests
import csv
import os

# Date Formatting
ics_date = date.today()
formatted_date = ics_date.strftime("%b-%d-%Y")

# Pull the Data
ics_devices = requests.get('https://shodan.nyc3.digitaloceanspaces.com/exposure-data/US.json')
ics_json = ics_devices.json()
ics_number = str((ics_json["numIcs"]))


# Input into CSV
input_ics_data = [formatted_date, ics_number]
with open('Internet_Facing_ICS.csv', 'w', newline = '') as csvfile:
    my_writer = csv.writer(csvfile, delimiter = ' ')
    my_writer.writerow(input_ics_data)
