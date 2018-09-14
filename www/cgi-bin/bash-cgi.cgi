#!/bin/bash

POST=$(</dev/stdin)
action=$1
news_url=$2

echo "Content-type: text/html"
echo ""
echo "<html><head><title>News"
echo "</title>"
echo "  <LINK href=/css/cramer.css rel=stylesheet type=text/css>"
echo "</head><body>"
echo "<h1>Hello world</h1>"
echo "Today is $(date)"
echo "$POST $action, $new_url"

 echo "<h4>Important News </h4>"
 echo "<FORM action=http://107.170.209.150/cgi-bin/a.cgi method=post>"
 echo "<P>"
 echo "News URL: <INPUT type=text name=new_ticker><BR>"
 echo "<INPUT type=submit name=submit value=ADD> <INPUT type=submit name=submit value=DELETE>"
 echo "</P>"
 echo "</FORM>"

echo "</body></html>"
