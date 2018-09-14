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
  -title => 'ours list', 
  -style => { 
  -src => '/css/fz.css' 
  }
 ); 
 
 $action = $cgi->param("submit");
 $new_ticker = $cgi->param("new_ticker");

 print "<h4>Our Warch List</h4>";
 print "<FORM action=http://107.170.209.150/cgi-bin/fz.cgi method=post>";
 print "<P>";
 print "Ticker: <INPUT type=text name=new_ticker><BR>";
 print "<INPUT type=submit name=submit value=ADD> <INPUT type=submit name=submit value=DELETE>";
 print "</P>";
 print "</FORM>";

if ( $new_ticker ne "") {
 if ( $action eq "ADD"){
   $sth=$dbh->prepare("replace into s.fz select * from s.all_daily where ticker='".$new_ticker."'");
   $sth->execute
   or die "SQL Error: $DBI::errstr\n";
 }  elsif ( $action eq "DELETE") {
   $sth=$dbh->prepare("delete from s.fz where ticker='".$new_ticker."'");
   $sth->execute
   or die "SQL Error: $DBI::errstr\n";
 }
}

 $sth=$dbh->prepare($our_table);

 $sth->execute
 or die "SQL Error: $DBI::errstr\n";

 print "<P>Column Name:</P>";
 print "<p>T=ticker  G=galley L=CandleStick  M=marketcap V/F=volumn/float OP=price(catch day) OR=CatchDay Changerate CR=Current to CatchDay Changerate DF=datediff</P>";

 print '<table border="1" align=left class=gridtable>'; 
 print "<tr><th>T</th><th>M</th><th>V/F</th><th>OP</th><th>OR</th><th>CR</th><th>DF</th><th>sector</th><th>G</th><th>L</th><th>X</th><th>S</th><th>T</th><th>f</th><th>A</th><th>H</th></tr>";

 while (my @row = $sth->fetchrow_array) {
 print "@row";
 }
 print "</table>";

1;

