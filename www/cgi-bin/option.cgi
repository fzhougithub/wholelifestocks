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
  -title => 'options', 
  -style => { 
  -src => '/css/fz.css' 
  }
 ); 
 
 $ticker = $cgi->param("ticker");
 $action = $cgi->param("submit");
 $strikeprice = $cgi->param("price");
 $symbol = $cgi->param("symbol");
 $id = $cgi->param("id");
 $sql = '';
 
 $strickprice=~ s/[<>?;:!,.='"]//g;
 print "<h4>".$ticker." Option Tracker </h4>";
 print "<FORM action=http://107.170.209.150/cgi-bin/option.cgi method=post>";
 print "<P>";
 print "Strike Price: <INPUT type=text name=price>";
 print "Symbol: <INPUT type=text name=symbol>";
 print "<input type=hidden name=ticker value=".$ticker.">";
 print "<INPUT type=submit name=submit value=ADD>";
 print "ID: <INPUT type=text name=id>";
 print "<INPUT type=submit name=submit value=DELETE>";
 print "Add in strike price and symbol<br>";
 print "</P>";
 print "</FORM>";

# $sql = $show_options." where ticker='".$ticker."' order by createddate desc";
# print "$sql";

 if ( $strickprice ne "" and $symbol ne "" and $action eq "ADD"){
#   $sth=$dbh->prepare("insert into s.options(id,ticker,strikeprice,symbol,createddate) values(null,'".$ticker."',".$strikeprice.",'".$symbol."',now())");
#   $sth->execute
#   or die "SQL Error: $DBI::errstr\n";
 }

 if ( $id ne "" and $action eq "DELETE") {
#   $sth=$dbh->prepare("delete from s.options where id=".$id);
#   $sth->execute
#   or die "SQL Error: $DBI::errstr\n";
 }

# $sth=$dbh->prepare($show_options." where ticker='".$ticker."' order by createddate desc");

# $sth->execute
# or die "SQL Error: $DBI::errstr\n";

 print "$strikeprice,$symbol";
 print '<table border="1" align=left class=gridtable>'; 
 print "<tr><th>date</th><th>strike price</th><th>option symbol</th><th>id</th></tr>";

# while (my @row = $sth->fetchrow_array) {
# print "@row";
# }
 print "</table>";

1;

