#!/bin/sh

function gettop(){
	cat $dir/form/div_vertical_top >> $target
}

function getform(){
	cat $dir/form/getall.frm >> $target
}

function getbottom(){
	cat $dir/form/div_vertical_bottom >> $target
}

function getfile(){
	target=/var/www/html/sall/$file
	echo ""> $target
	chmod 777 $target
}

function getcharts(){
#echo "<!DOCTYPE html><html><body>" > $output

echo "<tr>" >> $target
  for l in {1..14};
  do
	case $l in 
	"1")	title="Finviz" 
		src="http://finviz.com/quote.ashx?t=$ticker&ty=c&ta=1&p=d&b=1" ;;
	"2")	title="GalleryView"
		src="http://stockcharts.com/freecharts/gallery.html?s=$ticker" ;;
	"3")	title="SharpView"
		src="http://stockcharts.com/h-sc/ui?s=${ticker}&p=D&b=5&g=0&id=p81112903531" ;;
	"4")	title="SeekingAlpha"
		src="http://seekingalpha.com/symbol/$ticker" ;;
	"5")	title="Stwist"
		src="http://stocktwits.com/symbol/$ticker?q=$ticker" ;;
	"6")	title="Headline"
		src="http://www.nasdaq.com/symbol/${ticker}/news-headlines" ;;
	"7")	title="SECFiling"
		src="http://www.nasdaq.com/symbol/$ticker/sec-filings" ;;
	"8")	title="MarketStream"
		src="http://www.nasdaq.com/symbol/$ticker/stream" ;;
	"9")	title="AlertSetup"
		src="http://107.170.209.150/cgi-bin/alertsetup.cgi?ticker=$ticker" ;;
	"10")	title="Single"
		src="http://107.170.209.150/cgi-bin/single.cgi?new_ticker=$ticker" ;;
	"11")	title="10DUp"
		src="http://107.170.209.150/cgi-bin/recent10_up.cgi" ;;
	"12")	title="10DDown"
		src="http://107.170.209.150/cgi-bin/recent10_down.cgi" ;;
	"13")	title="Alert"
		src="http://107.170.209.150/cgi-bin/refresh_alerts.cgi" ;;
	"14")	title="Guru"
		src="http://www.gurufocus.com/gurutrades/$ticker" ;;
	*)	;;
	esac
	echo "<td style=padding: 0px 50px 0px 50px;><a href=$src target=\"xxx\">&middot;$title</a></td>" >> $target
  done
  echo "<a href=http://xueqiu.com/S/$ticker target=_blank>&middot; Xueqiu</a>" >> $target
  echo "<a href=https://www.google.com/finance?q=NASDAQ%3A${ticker}&fstype=ii&ei=-O2GUojEIMi1iALHVQ  target=_blank>&middot; Finance</a>" >> $target
  echo "<a href=http://finance.yahoo.com/mb/$ticker/ target=_blank>&middot; yahoo</a>" >> $target
  news_cnt=$(mysql --login-path=root_local --skip-column-names -s -e "select s.count_news('$ticker')")
  echo "<a href=http://107.170.209.150/cgi-bin/news.cgi?ticker=$ticker target=_blank>&middot;${news_cnt} news</a>" >> $target

  echo "</tr>" >> $target
echo "<iframe src=http://finviz.com/quote.ashx?t=$ticker&ty=c&ta=1&p=d&b=1 width=1350 height=750 name=\"xxx\"></iframe>" >> $target
echo "</body></html>" >> $output
}

dir=/var/www/cgi-bin
file=getall.html

ticker=$(echo $QUERY_STRING | sed -n 's/^.*ticker=\([^&]*\).*$/\1/p' | sed "s/%20/ /g")

if [ -z $ticker ]; then
	getfile
	gettop
	getform
	echo "Please enter the stock symbol you want to check" >> $target
	getbottom
#elif [ $(mysql --login-path=localroot --skip_column_names -s -e "select count(1) from s.single_base where ticker='$ticker'") -eq 0 ]; then
#	getfile
#	gettop
#	getform
#	echo "The stock symbol you entered is not in our database, please try other stock" >> $target
#	getbottom
else
	file=${ticker}_ct.html
	getfile
	gettop
	getform
#	echo "The stock you are looking for is $ticker " >> $target
	chart=${ticker}_ct.html
	output=/var/www/html/sall/$chart
	getcharts
#	echo "<div style=position:absolute;bottom:0;width:1300px;height=700px;><iframe src=http://107.170.209.150/sall/$chart width=1400 height=700></iframe></div>" >> $target
#	echo "<div style=width:1300px;height=800px;><iframe src=http://107.170.209.150/sall/$chart width=1400 height=740 align=bottom></iframe></div>" >> $target
	getbottom
fi

echo "Content-type: text/html"
echo ""
echo "<html><head><title>statuscharts"
echo "</title>"
echo "<meta http-equiv=refresh content=\"0; url=http://107.170.209.150/sall/$file\">"
echo "</head><body></body>"
echo "</html>"

