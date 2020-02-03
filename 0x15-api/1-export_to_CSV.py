#!/usr/bin/python3
"""
Shows the complete tasks done by a specific employee ID
"""

import requests
import sys
import csv

if __name__ == "__main__":
    # Get the todo list
    url = 'https://jsonplaceholder.typicode.com/todos'
    params = (('userId', sys.argv[1]),)
    t = requests.get(url, params=params)

    # Get the user info
    url = 'https://jsonplaceholder.typicode.com/users'
    params = (('id', sys.argv[1]),)
    u = requests.get(url, params=params)

    # Convert to json
    todos = t.json()
    user = u.json()

    with open("{}.csv".format(sys.argv[1]), 'w', newline='') as csvfile:
        cvs_writer = csv.writer(csvfile, quoting=csv.QUOTE_ALL)
        for task in todos:
            cvs_writer.writerow([int(sys.argv[1]), user[0]['username'],
                                 task['completed'], task['title']])
