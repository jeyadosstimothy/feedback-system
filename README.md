# Feedback App
This is a web application for receiving feedback from students, alumni and parent. The admin can view the statistics at any time, provided that there is atleast one feedback entry.

* Server side is written in python using Flask server and Jinja2 templates
* Client side uses CSS, jQuery and HTML
* Database: MySQL

Usage:
* Load MySQL dump from dbDump/ : mysql -u [user] -p [dbName] < dbDump/db.sql
* Run the python server: python serv.py
* Users can login at http://localhost:5000/ (Credentials available in *info* table)
* Admin can login at http://localhost:5000/admin with username: admin, password: 1234
