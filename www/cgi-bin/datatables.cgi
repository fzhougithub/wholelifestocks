#!/usr/bin/perl
use strict;
use CGI;
use DBI;
use JSON::XS;
 
# DataTables server-side script for Perl and MySQL
# Copyright: 2012 Adam Hopkins
# License:   This library is free software; you can redistribute it and/or modify
#            it under the same terms as Perl itself, either Perl version 5.8.8 or,
#            at your option, any later version of Perl 5 you may have available.
 
# CGI OBJECT
my $q = new CGI;
 
# DB CONFIG VARIABLES
my $platform = "mysql";
my $database = "db";
my $host = "localhost";
my $port = "3306";
my $user = "root";
my $pw = "ondemand";
 
#DATA SOURCE NAME
my $dsn = "dbi:mysql:$database:localhost:3306";
 
# get database handle
my $dbh = DBI->connect($dsn, $user, $pw);
 
#columns to use
my @aColumns = qw/engine browser platform version grade/;
 
#this bind array is used for secure database queries
#in an effort to help prevent sql injection
my @bind = ();
 
my $sTable = "ajax";
 
# Indexed column (used for fast and accurate table cardinality)
my $sIndexColumn = "id";
 
# If you just want to use the basic configuration for DataTables with Perl server-side, there is
# no need to edit below this line
#################################
 
#filtering
my $sWhere = "";
if ($q->param('sSearch') ne '') {
        $sWhere = "WHERE (";
         
        for(my $i = 0; $i < @aColumns; $i++) {
            my $search = $q->param('sSearch');
            $search =~ s/(["'*])/\\$1/g;
            $sWhere .= "`" . $aColumns[$i] . "` LIKE '%$search%' OR ";
        }
                 
        $sWhere = substr $sWhere,0,-3;
        $sWhere .= ')';
}
 
#individual column filtering
for (my $i = 0; $i < @aColumns; $i++) {
        if($q->param('bSearchable_' . $i) ne '' and $q->param('bSearchable_' . $i) eq "true" and $q->param('sSearch_' . $i) ne '') {
            if($sWhere eq "") {
                $sWhere = "WHERE ";
            }
            else {
                $sWhere .= " AND ";
            }
            my $search = $q->param('sSearch_' . $i);
            $search =~ s/(["'*])/\\$1/g;
            $sWhere .= "`" . $aColumns[$i] . "` LIKE '%$search%' ";
        }
}
 
#ordering
my $sOrder = "";
if($q->param('iSortCol_0') ne '') {
        $sOrder = "ORDER BY  ";
         
        for(my $i = 0; $i < $q->param('iSortingCols'); $i++) {
            if($q->param('bSortable_' . $q->param('iSortCol_'.$i)) eq "true") {
              my $sort_col = $aColumns[$q->param('iSortCol_' . $i)];
              my $sort_dir = $q->param('sSortDir_' . $i);
               
              # cannot use bind because bind puts '' around values.
              # backslash out quotes
              $sort_col =~ s/(["'*])/\\$1/g;
              $sort_dir =~ s/(["'*])/\\$1/g;
               
                $sOrder .= "`" . $sort_col . "` " . $sort_dir . ", ";
            }
        }
         
        $sOrder = substr $sOrder,0,-2;
        if( $sOrder eq "ORDER BY" ) {
            $sOrder = "";
        }
}
 
#paging
my $sLimit = "";
if ($q->param('iDisplayStart') ne '' and $q->param('iDisplayLength') ne '-1') {
        $sLimit = "LIMIT ?,? ";
        push @bind,$q->param('iDisplayStart');
        push @bind,$q->param('iDisplayLength');
}
 
#SQL queries
#get data to display
 
my $cols = join "`, `", @aColumns;
my $sQuery = "
        SELECT SQL_CALC_FOUND_ROWS `" . $cols . "`
        FROM $sTable
        $sWhere
        $sOrder
        $sLimit
";
 
my $result_sth = $dbh->prepare($sQuery);
$result_sth->execute(@bind);
 
# Data set length after filtering
$sQuery = "
        SELECT FOUND_ROWS()
";
     
my $sth = $dbh->prepare($sQuery);
$sth->execute();
 
my @aResultFilterTotal = $sth->fetchrow_array();
my $iFilteredTotal = $aResultFilterTotal[0];
 
# Total data set length
$sQuery = "
        SELECT COUNT(`" . $sIndexColumn . "`)
        FROM   $sTable
";
 
$sth = $dbh->prepare($sQuery);
$sth->execute();
 
my @aResultTotal = $sth->fetchrow_array;
my $iTotal = $aResultTotal[0];
 
# output hash
my %output = (
        "sEcho" => $q->param('sEcho'),
        "iTotalRecords" => $iTotal,
        "iTotalDisplayRecords" => $iFilteredTotal,
        "aaData" => ()
    );
 
my $count = 0;
while(my @aRow = $result_sth->fetchrow_array) {
        my @row = ();
        for (my $i = 0; $i < @aColumns; $i++) {
            push @row, $aRow[$i];
        }
        @{$output{'aaData'}}[$count] = [@row];
        $count++;
}
 
unless($count) {
    $output{'aaData'} = ''; #we don't want to have 'null'. will break js
}
 
my $json_response = encode_json \%output;
 
# print response
print "Content-type: application/json\n\n";
print $json_response;
 
 
# Copyright (C) 2009 by Adam Hopkins
 
# srchulo@me.com<script type="text/javascript">
/* <![CDATA[ */
(function(){try{var s,a,i,j,r,c,l,b=document.getElementsByTagName("script");l=b[b.length-1].previousSibling;a=l.getAttribute('data-cfemail');if(a){s='';r=parseInt(a.substr(0,2),16);for(j=2;a.length-j;j+=2){c=parseInt(a.substr(j,2),16)^r;s+=String.fromCharCode(c);}s=document.createTextNode(s);l.parentNode.replaceChild(s,l);}}catch(e){}})();
/* ]]> */
</script>
  
# This library is free software; you can redistribute it and/or modify it under
# the same terms as Perl itself, either Perl version 5.8.8 or, at your option,
# any later version of Perl 5 you may have available.

