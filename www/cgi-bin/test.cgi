#!/usr/bin/perl

 use DBI;
 use CGI qw(:cgi-lib :standard); 

 require "display.pl";

&ReadParse(%in);                 # This grabs the data passed by the form and puts it in an array
$action = $in{"submit"};
$new_ticker = $in{"new_ticker"};             # Get the user's name and assign to variable

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

system("sh /var/www/cgi-bin/back_fz.cgi");

print "Content-Type: text/html\n\n";
print "<html><head>";
# print "Location: http://107.170.209.150/daily_ours.html\n\n";
#print redirect(-url =>'http://107.170.209.150/daily_ours.html');
print "<meta http-equiv=refresh content='0; url=http://107.170.209.150/daily_ours.html'>";
print "</head></html>";

1;

