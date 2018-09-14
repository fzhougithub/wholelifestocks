#!/usr/bin/perl

 use DBI;
 use CGI qw(:cgi-lib :standard);  # Use CGI modules that let people read data passed from a form

 require "display.pl";

 print "Content-type: text/html\n\n";

 print "<h4>Daily Up List</h4>";

 $n=0;
 $i=0;
 $j=0;

 $target=$otarget;

 $sth=$dbh->prepare($uplist);
 $sth->execute
 or die "SQL Error: $DBI::errstr\n";

 my @row;

 while ( @row = $sth->fetchrow_array) {
   if ( $i < 10 ) {
     $target=$target.$row[0].",";
     $i++;
   }
   elsif ( $i == 10) {
     $j++;
     print "<a href=".$target." target=_blank> uplist ".$j."</a><br>";
     $i=0;
     $target=$otarget;
   }
 }

 print "</table>";

 $sth=$dbh->prepare($daily_up_table);
 $sth->execute
 or die "SQL Error: $DBI::errstr\n";

 print "<P>Column Name:</P>\n";
 print "<P>T=ticker  G=galley L=CandleStick  M=marketcap V/F=volumn/float OP=price(catch day) OR=CatchDay Changerate CR=Current to CatchDay Changerate DF=datediff</P>\n" ;

 print '<table border="1" align=left>'; 
 #print "<tr><th>T</th><th>G</th><th>L</th><th>M</th><th>V/F</th><th>OP</th><th>OR</th><th>CR</th><th>DF</th><th>Sector</th></tr>"; 

 while (my @row = $sth->fetchrow_array) {
 print "@row";
 }
 print "</table>";

1;

