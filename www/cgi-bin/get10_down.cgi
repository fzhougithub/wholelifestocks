#!/bin/sh

function gettop(){
	cat $dir/form/div_vertical_top >> $target
}

function getbottom(){
	cat $dir/form/div_vertical_bottom >> $target
}

function getfile(){
	target=/var/www/html/sall/$file
	chmod 777 $target
	echo ""> $target
}

function getcharts1(){
	title="Alert"
	src="http://107.170.209.150/cgi-bin/recent10_down.cgi" 
	echo "<iframe src=$src width=1350 height=320 name=\"bbb\"></iframe>" >> $target
}

function getcharts2(){
echo "<iframe src=http://107.170.209.150/cgi-bin/getall.cgi?ticker=VVUS width=1350 height=430 name=\"aaa\"></iframe>" >> $target
echo "</body></html>" >> $output
}

dir=/var/www/cgi-bin
file=get10_down.html

ticker=$(echo $QUERY_STRING | sed -n 's/^.*ticker=\([^&]*\).*$/\1/p' | sed "s/%20/ /g")

	getfile
	gettop
	chart=get10_down.html
	output=/var/www/html/sall/$chart
	getcharts1
	getcharts2
	getbottom

echo "Content-type: text/html"
echo ""
echo "<html><head><title>statuscharts"
echo "</title>"
echo "<meta http-equiv=refresh content=\"0; url=http://107.170.209.150/sall/$file\">"
echo "</head><body></body>"
echo "</html>"

