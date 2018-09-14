#!/usr/bin/perl

 use DBI;
 use CGI qw(:cgi-lib :standard);  # Use CGI modules that let people read data passed from a form
 use feature qw(switch);

 require "display.pl";

 my $cgi=new CGI;

 print header,
 $cgi->start_html( 
  -title => 'daily_down', 
  -style => { 
  -src => '/css/down.css' 
  }
 ); 


 print "<h2>Daily Down List</h2>";

 $n=0;
 $i=0;
 $j=0;

 $target=$otarget;

 $sth=$dbh->prepare($downlist);
 $sth->execute
 or die "SQL Error: $DBI::errstr\n";

 my @row;

 while ( @row = $sth->fetchrow_array) {
   if ( $i < 10 ) {
     $target=$target.$row[0].",";
     $i++;
   }
   elsif ( $i == 10 and $n<11) {
     $j++;
     $n++;
     print "<a href=".$target." target=_blank> uplist ".$j."</a>&nbsp";
     $i=0;
     $target=$otarget;
   }
   elsif ( $i==10 and $n==11) {
     $j++;
     $n=0;
     print "<a href=".$target." target=_blank> uplist ".$j."&nbsp</a>&nbsp<br>";
     $i=0;
     $target=$otarget;
   }
 }

for ($count = 1; $count <=4; $count++) {
   given($count){
     when(1) { 
    	$sth=$dbh->prepare($daily_down_table_1b);
     	$sth->execute
     	or die "SQL Error: $DBI::errstr\n";
        print "<h3> MarketCap > 1B </h3>";
     }
     when(2) { 
        $sth=$dbh->prepare($daily_down_table_500M);
        $sth->execute
        or die "SQL Error: $DBI::errstr\n";
        print "<h3> MarketCap Between 500M to 1B </h3>";
     }     
     when(3) { 
        $sth=$dbh->prepare($daily_down_table_100M);
        $sth->execute
        or die "SQL Error: $DBI::errstr\n";
        print "<h3> MarketCap Between 100M to 500M </h3>";
     }     
     when(4) { 
        $sth=$dbh->prepare($daily_down_table_20M);
        $sth->execute
        or die "SQL Error: $DBI::errstr\n";
        print "<h3> MarketCap Between 20M to 100M </h3>";
     }     
     default { print '<P>Daily Down List</P>' }
   }

 print "<P>Column Name:</P>\n";
 print "<P>T=ticker  G=galley L=CandleStick  M=marketcap V/F=volumn/float OP=price(catch day) OR=CatchDay Changerate CR=Current to CatchDay Changerate DF=datediff</P>\n" ;

 print '<table class="gridtable">'; 
 print $basic_header;
 while (my @row = $sth->fetchrow_array) {
 print "@row";
 }
 print "</table>";
}


print "</body></html>";

1;

