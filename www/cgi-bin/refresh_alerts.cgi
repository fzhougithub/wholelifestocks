#!/bin/bash
#java -classpath .:/root/www/scripts/j/java-stocks/src com/nhefner/main/CurrentPrice 

. /var/www/scripts/statements.sh

parts=/var/www/cgi-bin/parts
target=/var/www/html/alerts.html
dir=/var/www/cgi-bin

/var/www/scripts/headergen.sh alert > $target

function getform(){
cat $dir/form/refresh_alerts.frm >> $target
}

percent=$(echo "$QUERY_STRING" | sed -n 's/^.*percent=\([^&]*\).*$/\1/p' | sed "s/%20/ /g"|sed "s/%5D/]/g"|sed "s/%5B/[/g"|sed "s/%2C/,/g")

if [ -z $percent ]; then
range=" and abs(s.price_alert_range(a.ticker)) < 10"
else
	case $percent in
	"1")	range=" and abs(s.price_alert_range(a.ticker)) < 10";;
	"2")	range=" and abs(s.price_alert_range(a.ticker)) between 10 and 20 ";;
	"3")	range=" and abs(s.price_alert_range(a.ticker)) between 20 and 30 ";;
	"4")	range=" and abs(s.price_alert_range(a.ticker)) between 30 and 40";;
	"5")	range=" and abs(s.price_alert_range(a.ticker)) > 40";;
	"*")	;;
	esac
fi

echo "<b>Fired Alerts:</b>  $(mysql --login-path=root_local -s -e "select max(lastmodifieddate) from s.alerts"|tail -n +1)" >> $target
echo "<a href=http://107.170.209.150/cgi-bin/refresh_alerts.cgi> Refresh</a>>" >> $target

getform

mysql --login-path=root_local -s -e "update s.alerts set breakoutdate=now() where (price<pmin or price>pmax) and breakoutdate is null"

#echo ${alert_fired_1b}${range} >> $target
#-------------------------------------------------------------------------
echo "<h3>MarketCap > 1B</h3>" >> $target 
echo "<div id=demo_gecko>" >> $target
echo "<table cellpadding=0 cellspacing=0 border=0 class='display dataTable' width=100%>" >> $target
echo "<thead>${alert_header}</thead>">> $target

echo "<tbody>">> $target
mysql --login-path=root_local -s -e "${alert_fired_1b}${range}" >> $target
echo "</tbody>" >> $target
#echo "<br>" >> $target
echo "</table></div>" >> $target
#echo "<br>" >> $target
echo "<br><a href=http://107.170.209.150/cgi-bin/refresh_alerts.cgi>Refresh</a>>" >> $target

echo "<h3>MarketCap between 500m and 1B</h3>" >> $target
echo "<div id=demo_gecko>" >> $target
echo "<table cellpadding=0 cellspacing=0 border=0 class='display dataTable' width=100%>" >> $target
echo "<thead>${alert_header}</thead>">> $target
echo "<tbody>">> $target
mysql --login-path=root_local -s -e "${alert_fired_500m}${range}" >> $target
echo "</tbody>" >> $target
echo "</table></div>" >> $target
#echo "<br>" >> $target
echo "<br><a href=http://107.170.209.150/cgi-bin/refresh_alerts.cgi>Refresh</a>>" >> $target

echo "<h3>MarketCap between 100m and 500m</h3>" >> $target
echo "<div id=demo_gecko>" >> $target
echo "<table cellpadding=0 cellspacing=0 border=0 class='display dataTable' width=100%>" >> $target
echo "<thead>${alert_header}</thead>">> $target
echo "<tbody>">> $target
mysql --login-path=root_local -s -e "${alert_fired_100m}${range}" >> $target
echo "</tbody>" >> $target
echo "</table></div>" >> $target
#echo "<br>" >> $target
echo "<br><a href=http://107.170.209.150/cgi-bin/refresh_alerts.cgi>Refresh</a>>" >> $target

echo "<h3>MarketCap < 100M </h3>" >> $target
echo "<div id=demo_gecko>" >> $target
echo "<table cellpadding=0 cellspacing=0 border=0 class='display dataTable' width=100%>" >> $target
echo "<thead>${alert_header}</thead>">> $target

echo "<tbody>">> $target
mysql --login-path=root_local -s -e "${alert_fired_20m}${range}" >> $target
echo "</tbody>" >> $target
echo "</table></div>" >> $target
#echo "<br>" >> $target
echo "<br><a href=http://107.170.209.150/cgi-bin/refresh_alerts.cgi>Refresh</a>>" >> $target

# -----------------------------------------------------------------------
echo "<h3 color:blue;>Still in range</h3 color:blue;>" >> $target
#echo "${alert_other}" >> $target
echo "<div id=demo_trident>" >> $target
echo "<table cellpadding=0 cellspacing=0 border=0 class='display dataTable' id=allan width=100%>" >> $target
echo "<thead>${alert_header}</thead>">> $target

echo "<tbody>">> $target
mysql --login-path=root_local -s -e "${alert_other}" >> $target
echo "</tbody>" >> $target
echo "</table></div>" >> $target
#echo "<br>" >> $target
#echo "<tfoot>${alert_header}</tfoot></table></div>" >> $target


echo "<br><a href=http://107.170.209.150/cgi-bin/refresh_alerts.cgi>Refresh</a>>" >> $target

cat $parts/alert2.html >> $target

echo "Content-type: text/html"
echo ""
echo "<html><head><title>refresh"
echo "</title>"
echo '<meta http-equiv=refresh content="0; url=http://107.170.209.150/alerts.html">'
echo "</head><body></body>"
echo "</html>"

