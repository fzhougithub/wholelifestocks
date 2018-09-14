#!/bin/bash

tname=tmp_history_$(date +%Y%m%d%H%M%S)
dir=/var/www/cgi-bin
target=/var/www/html/history_scan.html

sqlhtml="select '<tr><td>',mc,'</td><td>',high,'</td><td>',low,'</td><td>',close,'</td><td>',h2l,'</td><td>',c2l,'</td><td>',concat('<a href=http://107.170.209.150/cgi-bin/getall.cgi?ticker=',ticker,' target=aaa>'),ticker,'</a></td></tr>' from ${tname}"
headhtml="<thead><th>M</th><th>H</th><th>L</th><th>C</th><th>H2L</th><th>C2L</th><th>T</th><thead>"

function get_table(){

sql="insert into ${tname} select g.ticker,c.high,c.low,d.close,round((c.high/c.low-1)*100),round((d.close/c.low-1)*100),g.marketcap from (select a.ticker ticker,max(a.high) high,min(a.low) low from history a join (select ticker,max(high) high,min(low) low from history where date > now() - interval ${dates} day group by ticker) b on ((a.ticker=b.ticker) and (a.high=b.high or a.low=b.low)) where a.date > now() - interval ${dates} day group by ticker) c join (select e.ticker,e.close from history e join (select ticker,max(date) date from history group by ticker) f on (e.ticker=f.ticker and e.date = f.date)) d on (c.ticker=d.ticker) join owner g on (c.ticker=g.ticker)"

create="create table ${tname}(ticker varchar(10),high decimal(10,2),low decimal(10,2),close decimal(10,2),h2l decimal(10,2),c2l decimal(10,2),mc decimal(10,2))"
mysql --login-path=root_local -s -e "use s;${create}; ${sql};"
}

function get_html(){
echo "$dates days high-low Scan:<br>" >> $target
echo "<div><table cellpadding=0 cellspacing=0 border=0 class='display dataTable' id=1000m width=100%>" >> $target
echo $headhtml >> $target
echo "<tbody>" >> $target
mysql --login-path=root_local -s -e "use s;${sqlhtml} where mc > 1000" >> $target
echo "</tbody></table></div>" >> $target
echo "<div><table cellpadding=0 cellspacing=0 border=0 class='display dataTable' id=500m width=100%>" >> $target
echo $headhtml >> $target
echo "<tbody>" >> $target
mysql --login-path=root_local -s -e "use s;${sqlhtml} where mc between 500 and 1000" >> $target
echo "</tbody></table></div>" >> $target
echo "<div><table cellpadding=0 cellspacing=0 border=0 class='display dataTable' id=100m width=100%>" >> $target
echo $headhtml >> $target
echo "<tbody>" >> $target
mysql --login-path=root_local -s -e "use s;${sqlhtml} where mc between 100 and 500" >> $target
echo "</tbody></table></div>" >> $target
echo "<div><table cellpadding=0 cellspacing=0 border=0 class='display dataTable' id=10m width=100%>" >> $target
echo $headhtml >> $target
echo "<tbody>" >> $target
mysql --login-path=root_local -s -e "use s;${sqlhtml} where mc < 100" >> $target
echo "</tbody></table></div>" >> $target
}

function get_form(){
	cat $dir/form/history_scan.frm >> $target
}

dates=$(echo "$QUERY_STRING" | sed -n 's/^.*dates=\([^&]*\).*$/\1/p' | sed "s/%20/ /g"|sed "s/%5D/]/g"|sed "s/%5B/[/g"|sed "s/%2C/,/g")

if [ -z $dates ]; then
dates=30
fi

cat $dir/parts/p1_history.html > $target
get_form
get_table
get_html
cat $dir/parts/part2.html >> $target

mysql --login-path=root_local -s -e "use s;drop table ${tname};"

echo "Content-type: text/html"
echo ""
echo "<html><head><title>refresh"
echo "</title>"
echo '<meta http-equiv=refresh content="0; url=http://107.170.209.150/history_scan.html">'
echo "</head><body></body>"
echo "</html>"
