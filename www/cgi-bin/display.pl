#!/usr/bin/perl

$otarget="http://stockcharts.com/freecharts/candleglance.html?";
$uplist="select ticker from s.up_daily where marketcap> 20 order by marketcap desc";
$downlist="select ticker from s.down_daily where marketcap > 20 order by marketcap desc";

$now="select now()";

 $dbh = DBI->connect('dbi:mysql:s:localhost:mysql_socket=/u01/run/mysql/mysql.sock','root','ondemand')
 or die "Connection Error: $DBI::errstr\n";

 $basic_header="<tr><th>T</th><th>M</th><th>V/F</th><th>OP</th><th>OR</th><th>CR</th><th>DF</th><th>sector</th><th>D</th><th>G</th><th>L</th><th>X</th><th>S</th><th>T</th><th>f</th><th>A</th><th>H</th><th>O</th><th>N</tr>";
 $basic="select '<tr><td align=right>',concat('<a href=http://finviz.com/quote.ashx?t=',a.ticker,'&ty=c&ta=1&p=d&b=1 target=_blank>',a.ticker,'</a>'),'</td><td align=right>',a.MarketCap,'</td><td align=right>',round(a.volume/b.floatShares*100/1000000,1),'%</td><td align=right>',a.price,'</td><td align=right>',a.changerate,'%</td><td align=right>',round(b.price*100/a.price,1),'%</td><td align=right>',datediff(now(),a.createddate),'</td><td>',sector,'</td><td>',concat('a href=http://www.trefis.com/company?hm=',ticker,'.trefis&from=search# target=_blank>',ticker,'</a>'),'</td><td align=right>',concat('<a href=http://stockcharts.com/freecharts/gallery.html?s=',a.ticker,' target=_blank> g</a>'),'</td><td align=right>',concat('<a href=http://stockcharts.com/h-sc/ui?s=',a.ticker,'&p=D&b=5&g=0&id=p81112903531 target=_blank> c</a>'),'</td><td>',concat('<a href=http://xueqiu.com/S/',a.ticker,' target=_blank>x</a>'),'</td><td>',concat('<a href=http://www.nasdaq.com/symbol/',a.ticker,'/sec-filings target=_blank>s</a>'),'</td><td>',concat('<a href=http://finance.yahoo.com/mb/',a.ticker,'/ target=_blank>t</a>'),'</td><td>',concat('<a href=https://www.google.com/finance?q=NASDAQ%3A',a.ticker,'&fstype=ii&ei=-O2GUojEIMi1iALHVQ target=_blank>f</a>'),'</td><td>',concat('<a href=http://seekingalpha.com/symbol/',a.ticker,' target=_blank>a</a>'),'</td><td>',concat('<a href=http://107.170.209.150/cgi-bin/ticker_history.cgi?new_ticker=',a.ticker,' target=_blank>h</a>'),'</td><td>',concat('<a href=http://finance.yahoo.com/q/op?s=',a.ticker,' target=_blank>o</a>'),'</td><td>',concat('<a href=http://107.170.209.150/cgi-bin/news.cgi?ticker=',a.ticker,' target=_blank>',count_news(a.ticker),'</a>'),'</td><tr>' from ";
 
 $daily_up_table_1b=$basic."s.up_daily a,s.owner b where a.ticker=b.ticker and a.marketcap > 1000 order by 12 ";
 $daily_down_table_1b=$basic."s.down_daily a,s.owner b where a.ticker=b.ticker and a.marketcap > 1000 order by 12 ";
 $our_table=$basic."s.fz a,s.owner b where a.ticker=b.ticker and a.marketcap > 20 order by 12 ";
 $cramer_table=$basic."s.cramer a,s.owner b where a.ticker=b.ticker and a.marketcap > 20 order by 12 ";
 
 $daily_up_table_500M=$basic."s.up_daily a,s.owner b where a.ticker=b.ticker and a.marketcap between 500 and 1000 order by 12 ";
 $daily_down_table_500M=$basic."s.down_daily a,s.owner b where a.ticker=b.ticker and a.marketcap between 500 and 1000 order by 12 ";
 
 $daily_up_table_100M=$basic."s.up_daily a,s.owner b where a.ticker=b.ticker and a.marketcap between 100 and 500 order by 12 ";
 $daily_down_table_100M=$basic."s.down_daily a,s.owner b where a.ticker=b.ticker and a.marketcap between 100 and 500 order by 12 ";
 
 $daily_up_table_20M=$basic."s.up_daily a,s.owner b where a.ticker=b.ticker and a.marketcap between 20 and 100 order by 12 ";
 $daily_down_table_20M=$basic."s.down_daily a,s.owner b where a.ticker=b.ticker and a.marketcap between 20 and 100 order by 12 ";
 
 $ticker_history="select '<tr><td>',Date,'</td><td>',Open,'</td><td>',High,'</td><td>',Low,'</td><td>',Close,'</td><td>',Volume,'</td><td>',AdjustClose'</td></tr>' from history where ticker='";

 $show_news="select '<tr><td>',createddate,'</td><td>',concat('<a href=/news/',ticker,'/',path,' target=_blank>',title,'</a>'),'</td><td>',id,'</td></tr>' from s.news ";
 $show_docs="select '<tr><td>',createddate,'</td><td>',concat('<a href=/docs/',path,' target=_blank>',title,'</a>'),'</td><td>',id,'</td></tr>' from s.docs ";
 $show_options="select '<tr><td>',createddate,'</td><td>',strikeprice,'</td><td>',concat('<a href=http://finance.yahoo.com/q/os?s=',ticker,'&k=',strikeprice,' target=_blank>',symbol,'</a>'),'</td><td>',id,'</td></tr>' from s.options ";
 $show_alert="select '<tr><td>',createddate,'</td><td>',pmin,'</td><td>',pmax,'</td><td>',reason,'</td></tr>' from s.v_alerts ";

1;

