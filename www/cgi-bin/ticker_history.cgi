#!/usr/bin/perl

 use DBI;
 use CGI qw(:cgi-lib :standard);  # Use CGI modules that let people read data passed from a form

 require "display.pl";

 &ReadParse(%in);                 # This grabs the data passed by the form and puts it in an array
 $new_ticker = $in{"new_ticker"};             # Get the user's name and assign to variable

 my $cgi=new CGI;

 print header,
 $cgi->start_html( 
  -title => 'ours cgi webpage', 
  -style => { 
  -src => '/css/table.css' 
  }
 ); 


 print "<h4>$new_ticker History</h4>";

if ( $new_ticker ne "") {
   $ticker_history=$ticker_history.$new_ticker."' order by Date desc";
   $sth=$dbh->prepare($ticker_history);
   $sth->execute
   or die "SQL Error: $DBI::errstr\n";
}

 print '<table border="1" align=left class=gridtable>'; 
 print "<tr><th>Date</th><th>Open</th><th>High</th><th>Low</th><th>Close</th><th>Volume</th><th>AdjustClose</th></tr>";

 while (my @row = $sth->fetchrow_array) {
 print "@row";
 }
 print "</table>";

1;

