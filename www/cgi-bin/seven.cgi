#!/usr/bin/perl

 use DBI;
 use CGI  qw(:cgi-lib :standard);  # Use CGI modules that let people read data passed from a form
 use Encode qw/encode decode from_to/;
 use encoding 'utf8', STDIN=>'utf8', STDOUT=>'utf8';
 use HTML::Entities;
 use utf8;

 require "display.pl";

# &ReadParse(%in);                 # This grabs the data passed by the form and puts it in an array
# $action = $in{"submit"};
# $new_ticker = $in{"new_ticker"};             # Get the user's name and assign to variable

 my $cgi=new CGI;

 print header,
 $cgi->start_html( 
  -title => 'News', 
 ); 

 $newdate = $cgi->param("newdate");
 $action = $cgi->param("submit");
 $olddate = $cgi->param("olddate");
 my $cnt=0;

 print "<html><head><title>seven";
 print "</title>";
 
 if ( $newdate ne "" and $olddate ne "" and $action eq "COMPARE"){

   $dbh = DBI->connect('dbi:mysql:s','root','ondemane') or die "Connection Error: $DBI::errstr\n";
   $sth=$dbh->prepare("select count(1) from s.v_seven_calendar where date in ('".$newdate."','".$olddate."')");
   $sth->execute
   or die "SQL Error: $DBI::errstr\n";

   while (my @row = $sth->fetchrow_array) {
        $cnt=$row[0];
   }
 
   if ( $cnt eq 2 ) {

	my $file=$newdate."_".$olddate.".html";

	$sth=$dbh->prepare("call seven_compare_perl('$newdate','$olddate')");
	$sth->execute
	or die "SQL Error: $DBI::errstr\n";

	system("sh /var/www/cgi-bin/seven_html.cgi ".$newdate." ".$olddate);
 	print '<meta http-equiv=refresh content="0; url=http://107.170.209.150/seven/'.$file.'" Content-Length=1048576>';
   } else { 
 	print '<meta http-equiv=refresh content="0; url=http://107.170.209.150/seven_input.html">';
   }
 }
 print "</head><body>";
print "we are here";
 print "$cnt,@row";
 print "New Date: $newdate<br>";
# print "Old Date: $olddate<br>";
# print "Action: $action<br>";
 print "</body>";
 print "</html>";

1;

