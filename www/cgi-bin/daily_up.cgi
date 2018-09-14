#!/usr/bin/perl

 use DBI;
 use CGI qw(:cgi-lib :standard);  # Use CGI modules that let people read data passed from a form
 use feature qw(switch);

 require "display.pl";

 my $cgi = new CGI

 print header,
 $cgi->start_html( 
  -title => 'daily_up', 
  -style => { 
  -src => '/css/table.css' 
  }
 ); 

 print "<h4>Daily Up List</h4>";

 $n=0;
 $i=0;
 $j=0;

 $target=$otarget;

 $dbh = DBI->connect('dbi:mysql:s','root','ondemand')
 or die "Connection Error: $DBI::errstr\n";

 $sth=$dbh->prepare($uplist);
 $sth->execute
 or die "SQL Error: $DBI::errstr\n";

 my @row;

 while ( @row = $sth->fetchrow_array) {
   if ( $i < 10 ) {
     $target=$target.$row[0].",";
     $i++;
   }
   elsif ( $i == 10 and $n<10) {
     $j++;
     $n++;
     print "<a href=".$target." target=_blank> uplist ".$j."</a>&nbsp";
     $i=0;
     $target=$otarget;
   }
   elsif ( $i==10 and $n==10) {
     $j++;
     $n=0;
     print "<br>";
     print "<a href=".$target." target=_blank> uplist ".$j."&nbsp</a>&nbsp";
     $i=0;
     $target=$otarget;
   }
 }

for ($count = 1; $count <=4; $count++) {
   given($count){
     when(1) { 
    	$sth=$dbh->prepare($daily_up_table_1b);
     	$sth->execute
     	or die "SQL Error: $DBI::errstr\n";
        print "<h2> MarketCap > 1B </h2>";
     }
     when(2) { 
        $sth=$dbh->prepare($daily_up_table_500M);
        $sth->execute
        or die "SQL Error: $DBI::errstr\n";
        print "<h2> MarketCap Between 500M to 1B </h2>";
     }     
     when(3) { 
        $sth=$dbh->prepare($daily_up_table_100M);
        $sth->execute
        or die "SQL Error: $DBI::errstr\n";
        print "<h2> MarketCap Between 100M to 500M </h2>";
     }     
     when(4) { 
        $sth=$dbh->prepare($daily_up_table_20M);
        $sth->execute
        or die "SQL Error: $DBI::errstr\n";
        print "<h2> MarketCap Between 20M to 100M </h2>";
     }     
     default { print '<P>Daily Up List</P>' }
   }

   print "<P align=left>Column Name:</P>";
   print "<P>T=ticker  G=galley L=CandleStick  M=marketcap V/F=volumn/float OP=price(catch day) OR=CatchDay Changerate CR=Current to CatchDay Changerate DF=datediff</P>" ;

   print "<table class=gridtable>";
   print $basic_header;
   while (my @row = $sth->fetchrow_array) {
    print "@row";
   }
 print "</table>";
}

 print "</body></html>";

1;

