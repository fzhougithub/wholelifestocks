#!/usr/bin/perl

 use DBI;
 use CGI qw(:cgi-lib :standard);  # Use CGI modules that let people read data passed from a form

 require "display.pl";

 my $cgi=new CGI;

 print header,
 $cgi->start_html( 
  -title => 'AddResearch', 
  -style => { 
  -src => '/css/fz.css' 
  }
 ); 
 
 $ticker = $cgi->param("ticker");
 $action = $cgi->param("submit");
 $url = $cgi->param("url");
 $id = $cgi->param("id");
 
 print "<h4>Add ".$ticker." Research Topic URL in Forum</h4>";
 print "<FORM action=http://107.170.209.150/cgi-bin/addresearch.cgi method=post>";
 print "<P>";
 print "URL: <INPUT type=text name=url>";
 print "<input type=hidden name=ticker value=".$ticker.">";
 print "<INPUT type=submit name=submit value=ADD>";
 print "url length:1000 <br>";
 print "</P>";
 print "</FORM>";

 if ( $url ne "" and $action eq "ADD"){
   $sth=$dbh->prepare("insert into s.research values(null,'".$ticker."','".$url."',now())");
   $sth->execute
   or die "SQL Error: $DBI::errstr\n";
 }

 if ( $id ne "" and $action eq "DELETE") {
   $sth=$dbh->prepare("delete from s.research where id=".$id);
   $sth->execute
   or die "SQL Error: $DBI::errstr\n";
 }

 $sth=$dbh->prepare("select concat('<tr><td>',id,'</td><td>',url,'</td><td>',createddate,'</td><tr>') from s.research where ticker='".$ticker."'");

 $sth->execute
 or die "SQL Error: $DBI::errstr\n";


 print '<table border="1" align=left class=gridtable>'; 
 print "<tr><th>id</th><th>url</th><th>createddate</th></tr>";

 while (my @row = $sth->fetchrow_array) {
 print "@row";
 }
 print "</table>";

1;

