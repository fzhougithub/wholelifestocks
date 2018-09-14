#!/usr/bin/perl

 use DBI;
 use CGI qw(:cgi-lib :standard);  # Use CGI modules that let people read data passed from a form

 require "display.pl";

# &ReadParse(%in);                 # This grabs the data passed by the form and puts it in an array
# $action = $in{"submit"};
# $new_ticker = $in{"new_ticker"};             # Get the user's name and assign to variable

 my $cgi=new CGI;

 print header,
 $cgi->start_html( 
  -title => 'alertsetup', 
  -style => { 
  -src => '/css/alertsetup.css' 
  }
 ); 
 
 $ticker = $cgi->param("ticker");
 $action = $cgi->param("submit");
 $minprice = $cgi->param("minprice");
 $maxprice = $cgi->param("maxprice");
 $reason = $cgi->param("reason");
 $sql = '';
 
 $strickprice=~ s/[<>?;:!,.='"]//g;
 print "<center><h4>".$ticker." Alert Setup </h4></center>";
# print "<div id=container style=width:100%;>";
# print "<div id=left style=float:left; width:70%;>";   
 print "<iframe src=http://stockcharts.com/freecharts/gallery.html?s=".$ticker." width=1300 height=300></iframe></div>";
# print "<div id=right style=float:right; width:30%;>";
 print "<center><FORM action=http://107.170.209.150/cgi-bin/alertsetup.cgi method=post>";
 print "<P>";
 print "Min Price: <INPUT type=text name=minprice>";
 print "Max Price: <INPUT type=text name=maxprice>";
 print "SetReason: <INPUT type=text name=reason>";
 print "<input type=hidden name=ticker value=".$ticker.">";
 print "<INPUT type=submit name=submit value=ADD>";
 print "</P>";
 print "</FORM></center>";

 $sql = $show_alert." where ticker='".$ticker."' order by createddate desc";
# print "$sql";

 if ( $minprice ne "" and $maxprice ne "" and $action eq "ADD"){
   $sth=$dbh->prepare("replace into s.alerts(ticker,pmin,pmax,reason) values('$ticker',$minprice,$maxprice,'$reason')");
   $sth->execute
   or die "SQL Error: $DBI::errstr\n";
 }

 $sth=$dbh->prepare($show_alert." where ticker='".$ticker."' order by createddate desc");

 $sth->execute
 or die "SQL Error: $DBI::errstr\n";

# print "$strikeprice,$symbol";
 print '<table border="1" align=center class=gridtable>'; 
 print "<tr><th>CreateDate</th><th>MinPrice</th><th>MaxPrice</th><th>Reason</th></tr>";

 while (my @row = $sth->fetchrow_array) {
 print "@row";
 }
 print "</table>";

# print "</div></div>";
1;

