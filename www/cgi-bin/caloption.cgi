#! /usr/bin/env python

import cgitb 
import cgi

cgitb.enable(display=0, logdir="/root/www/html/log")

a=12

print "Content-Type: text/html"  # HTML header
print					# blank line is required to terminate header part
 
#print "<TITLE>caloption</TITLE>"
#print "<H1>Option Calculator</H1>"
#print "Hello, world!"
#print 

form = cgi.FieldStorage()
if "name" not in form or "addr" not in form:
    print "<H1>Error</H1>"
    print "Please fill in the name and addr fields."
    return
else:
    print


print "<p>name:", form["name"].value
print "<p>addr:", form["addr"].value
print a

