#!/usr/bin/perl

 use DBI;
 use CGI qw(:cgi-lib :standard); 

 require "display.pl";

&ReadParse(%in);                 # This grabs the data passed by the form and puts it in an array
$action = $in{"submit"};
$new_ticker = $in{"new_ticker"};             # Get the user's name and assign to variable


system("sh /var/www/cgi-bin/single_display.cgi"." ".$new_ticker);

print "Content-Type: text/html\n\n";
print "<html><head>";
print "<meta http-equiv=refresh content='0; url=http://107.170.209.150/single.html'>";
print "</head></html>";

1;

