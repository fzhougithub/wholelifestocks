#!/bin/bash

. /var/www/scripts/statements.sh

parts=/var/www/cgi-bin/parts
target=/var/www/html/daily_cramer.html

cp $parts/part1_cramer.html $target

echo "<h1>Story Company List</h1>" >> $target
echo "<a href=http://107.170.209.150/cgi-bin/cramerlist.cgi>Refresh</a>>" >> $target

echo "<FORM action=http://107.170.209.150/cgi-bin/cramerlist.cgi method=post>" >> $target
echo "Ticker: <INPUT type=text name=new_ticker>" >> $target
echo "<INPUT type=submit name=submit value=ADD> <INPUT type=submit name=submit value=DELETE>" >> $target
echo "</FORM>" >> $target

#-------------------------------------------------------------------------
echo "<h1> Market Cap > 1B </h1>" >> $target
echo "<div id=demo_gecko>" >> $target
echo "<table cellpadding=0 cellspacing=0 border=0 class='display dataTable' width=100%>" >> $target
echo "<thead>${basic_header}</thead>">> $target

echo "<tbody>">> $target
mysql -uroot -pondemand -s -e "${cramer_table_1b}" >> $target
echo "</tbody>" >> $target

echo "</table></div>" >> $target
#echo "<tfoot>${basic_header}</tfoot></table></div>" >> $target
#echo "<div class="clear"></div>" >> $target


# -----------------------------------------------------------------------
echo "<h1> Market Cap Between 500M and 1B </h1>" >> $target
echo "<div id=demo_trident>" >> $target
echo "<table cellpadding=0 cellspacing=0 border=0 class='display dataTable' id=allan width=100%>" >> $target
echo "<thead>${basic_header}</thead>">> $target

echo "<tbody>">> $target
mysql -uroot -pondemand -s -e "${cramer_table_500m}" >> $target
echo "</tbody>" >> $target

echo "</table></div>" >> $target
#echo "<tfoot>${basic_header}</tfoot></table></div>" >> $target

# -----------------------------------------------------------------------
echo "<h1> Market Cap Between 100M and 500M </h1>" >> $target
echo "<div id=demo_webkit>" >> $target
echo "<table cellpadding=0 cellspacing=0 border=0 class='display dataTable' id=100m width=100%>" >> $target
echo "<thead>${basic_header}</thead>">> $target

echo "<tbody>">> $target
mysql -uroot -pondemand -s -e "${cramer_table_100m}" >> $target
echo "</tbody>" >> $target

echo "</table></div>" >> $target
#echo "<tfoot>${basic_header}</tfoot></table></div>" >> $target

# -----------------------------------------------------------------------
echo "<h1> Market Cap Between 20M and 100M </h1>" >> $target
echo "<div id=demo_frank>" >> $target
echo "<table cellpadding=0 cellspacing=0 border=0 class='display dataTable' id=20m width=100%>" >> $target
echo "<thead>${basic_header}</thead>">> $target

echo "<tbody>">> $target
mysql -uroot -pondemand -s -e "${cramer_table_20m}" >> $target
echo "</tbody>" >> $target

echo "</table></div>" >> $target
#echo "<tfoot>${basic_header}</tfoot></table></div>" >> $target

echo "<br><a href=http://107.170.209.150/cgi-bin/cramerlist.cgi>Refresh</a>>" >> $target

cat $parts/part2.html >> $target

#echo "Content-type: text/html"
#echo ""
#echo "<html><head><title>refresh"
#echo "</title>"
#echo '<meta http-equiv=refresh content="0; url=http://107.170.209.150/daily_cramer.html">'
#echo "</head><body></body>"
#echo "</html>"

