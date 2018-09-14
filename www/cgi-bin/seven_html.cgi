#!/bin/sh

# $ wget -S http://httpd.apache.org/images/httpd_logo_wide.gif 2>&1 | grep 'Accept-Ranges' 

. /var/www/scripts/seven_statements.sh

parts=/var/www/cgi-bin/parts
target=/var/www/html/seven.html
lock=/var/www/html/seven/seven.lock
error=/var/www/html/seven/error

if [ $# -ne 2 ];then
	exit 1
fi

if [ -f $lock ]; then
	exit 1
fi

target=/var/www/html/seven/${1}_${2}.html

echo $(date) > $lock

if [ -f $target ];then
	rm -rf $lock
	exit 0
fi

cat $parts/part1_seven.html> $target

echo "<a href=http://107.170.209.150/fileupload.html target=blank>Upload Data</a>" >> $target

echo "<FORM action=http://107.170.209.150/cgi-bin/seven.cgi method=post>" >> $target
echo "<label for=newdate>New Date:</label>" >> $target
echo "<input type=text name=newdate id=newdate value=${1} data-dojo-type=dijit/form/DateTextBox required=true />" >> $target
echo "<label for=olddate>Old Date:</label>" >> $target
echo "<input type=text name=olddate id=olddate value=${2} data-dojo-type=dijit/form/DateTextBox required=true />" >> $target
echo "<INPUT type=submit name=submit value=COMPARE>">> $target
echo "</FORM>">> $target

echo "<h1>Heptathlon List (a=$1, b=$2)</h1>" >> $target
echo "<div id=demo_gecko>" >> $target
echo "<table cellpadding=0 cellspacing=0 border=0 class='display dataTable' width=100%>" >> $target
echo "<thead>${basic_header}</thead>">> $target

echo "<tbody>">> $target
mysql -uroot -pondemand -s -e "${basic}" >> $target
echo "</tbody>" >> $target

echo "<tfoot>${basic_header}</tfoot>">> $target

echo "</table></div>" >> $target

cat $parts/part2_seven.html >> $target
chmod 777 $target

rm $lock

exit
