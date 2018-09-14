#!/bin/bash

ticker=$1

. /var/www/scripts/statements.sh

parts=/var/www/cgi-bin/parts
target=/var/www/html/single.html
single_display=${single}" and a.ticker='$1'"

/var/www/scripts/headergen.sh single_research > $target

#echo ${single_display} >> $target
echo "<FORM action=http://107.170.209.150/cgi-bin/single.cgi method=post>" >> $target
echo "Ticker: <INPUT type=text name=new_ticker>" >> $target
echo "<INPUT type=submit name=submit value=ADD> " >> $target
echo "</FORM>" >> $target

#-------------------------------------------------------------------------
echo "<div id=demo_gecko>" >> $target
echo "<table cellpadding=0 cellspacing=0 border=0 class='display dataTable' width=100%>" >> $target
echo "<thead>${basic_header}</thead>">> $target

echo "<tbody>">> $target
mysql -uroot -pondemand -s -e "${single_display}" >> $target
echo "</tbody>" >> $target

echo "</table></div>" >> $target

cat $parts/part2.html >> $target

exit 0
