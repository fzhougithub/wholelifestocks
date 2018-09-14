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
  -title => 'News', 
  -style => { 
  -src => '/css/fz.css' 
  }
 ); 
 
 $ticker = $cgi->param("ticker");
 $action = $cgi->param("submit");
 $title = $cgi->param("title");
 $url = $cgi->param("url");
 $id = $cgi->param("id");
 
 $title=~ s/[<>?;:!,.='"]//g;
 print "<h4>".$ticker." Research Docs</h4>";
 print "<FORM action=http://107.170.209.150/cgi-bin/news.cgi method=post>";
 print "<P>";
 print "Title: <INPUT type=text name=title>";
 print "URL: <INPUT type=text name=url>";
 print "<input type=hidden name=ticker value=".$ticker.">";
 print "<INPUT type=submit name=submit value=ADD>";
 print "ID: <INPUT type=text name=id>";
 print "<INPUT type=submit name=submit value=DELETE>";
 print "title length:200  url length:1000 <br>";
 print "</P>";
 print "</FORM>";

 if ( $title ne "" and $url ne "" and $action eq "ADD"){
   `/var/www/scripts/get_news.sh $ticker "$title" "$url"`   
 }

 if ( $id ne "" and $action eq "DELETE") {
   $sth=$dbh->prepare("delete from s.news where id=".$id);
   $sth->execute
   or die "SQL Error: $DBI::errstr\n";
 }

 $sth=$dbh->prepare($show_news." where ticker='".$ticker."' order by createddate desc");

 $sth->execute
 or die "SQL Error: $DBI::errstr\n";


 print '<table border="1" align=left class=gridtable>'; 
 print "<tr><th>date</th><th>article</th><th>id</th></tr>";

 while (my @row = $sth->fetchrow_array) {
 print "@row";
 }
 print "</table>";

1;

