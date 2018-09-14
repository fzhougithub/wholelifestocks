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
  -title => 'story list', 
  -style => { 
  -src => '/css/cramer.css' 
  }
 ); 

 $action=$cgi->param('submit');
 $new_ticker=$cgi->param('new_ticker');

 print "<h4>Story Company List</h4>";
 print "<FORM action=http://107.170.209.150/cgi-bin/cramer.cgi method=post>";
 print "<P>";
 print "Ticker: <INPUT type=text name=new_ticker><BR>";
 print "<INPUT type=submit name=submit value=ADD> <INPUT type=submit name=submit value=DELETE>";
 print "</P>";
 print "</FORM>";

if ( $new_ticker ne "") {
 if ( $action eq "ADD"){
   $sth=$dbh->prepare("replace into s.cramer select * from s.all_daily where ticker='".$new_ticker."'");
   $sth->execute
   or die "SQL Error: $DBI::errstr\n";
 }  elsif ( $action eq "DELETE") {
   $sth=$dbh->prepare("delete from s.cramer where ticker='".$new_ticker."'");
   $sth->execute
   or die "SQL Error: $DBI::errstr\n";
 }
}

 $sth=$dbh->prepare($cramer_table);

 $sth->execute
 or die "SQL Error: $DBI::errstr\n";

 print "<P>Column Name:";
 print "<P>T=ticker  G=galley L=CandleStick  M=marketcap V/F=volumn/float OP=price(catch day) OR=CatchDay Changerate CR=Current to CatchDay Changerate DF=datediff";

 print '<table border="1" align=left class=gridtable>'; 
 print $basic_header;
 while (my @row = $sth->fetchrow_array) {
 print "@row";
 }
 print "</table>";

1;

