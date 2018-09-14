#!/usr/bin/perl

 use DBI;
 use CGI qw(:cgi-lib :standard);  # Use CGI modules that let people read data passed from a form
 use feature qw(switch);

 require "display.pl";

 print "Content-type: text/html\n\n";
 print "<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01//EN' http://www.w3.org/TR/html4/strict.dtd>";
 print "<html>";
 print "    <head>";
 print "        <meta http-equiv=content-type content=text/htm; charset=utf-8 />";
 print "        <link rel='shortcut icon' type=/image/ico href=http://www.datatables.net/favicon.ico />";

 print "        <title>DataTables example</title>";
 print "        <style type=text/css title=currentStyle>";
 print '                @import /DataTables/media/css/demo_page.css;';
 print '                @import /DataTables/media/css/demo_table.css;';
 print "        </style>";
 print "        <script type=text/javascript language=javascript src=/DataTables/media/js/jquery.js></script>";
 print "        <script type=text/javascript language=javascript src=/DataTables/media/js/jquery.dataTables.js></script>";
 print "        <script type=text/javascript charset=utf-8>";
 print "        $(document).ready(function(){$(#example).dataTable();});";
 print "        </script>";
 print "        </head>";
 print "        <body id=dt_example>";
 print "          <div id=container>";
 print "                        <h1>Live example</h1>";
 print "                        <div id=demo>";
 print " 	<table cellpadding=0 cellspacing=0 border=0 class=display id=example width=100%>";
 print "        <thead>";
 print "                <tr>";
 print "                       <th>Rendering engine</th>";
 print "                        <th>Browser</th>";
 print "                        <th>Platform(s)</th>";
 print "                        <th>Engine version</th>";
 print "                        <th>CSS grade</th>";
 print "                </tr>";
 print "        </thead>";
 print "        <tbody>";
 print "                <tr class=odd gradeX>";
 print "                       <td>Trident</td>";
 print "                       <td>Internet";
 print "                                Explorer 4.0</td>";
 print "                       <td>Win 95+</td>";
 print "                       <td class=center> 4</td>";
 print "                        <td class=center>X</td>";
 print "               </tr>";
 print "               <tr class=even gradeCr;>";
 print "                       <td>Trident</td>";
 print "                       <td>Internet";
 print "                                Explorer 5.0</td>";
 print "                       <td>Win 95+</td>";
 print "                       <td class=center>5</td>";
 print "                       <td class=center>C</td>";
 print "               </tr>";
 print "               <tr class=even gradeCr;>";
 print "                       <td>Trident</td>";
 print "                       <td>Internet";
 print "                                Explorer 5.0</td>";
 print "                       <td>Win 95+</td>";
 print "                       <td class=center>5</td>";
 print "                       <td class=center>C</td>";
 print "               </tr>";
 print "               <tr class=even gradeCr;>";
 print "                       <td>Trident</td>";
 print "                       <td>Internet";
 print "                                Explorer 5.0</td>";
 print "                       <td>Win 95+</td>";
 print "                       <td class=center>5</td>";
 print "                       <td class=center>C</td>";
 print "               </tr>";
 print "        </tbody>";
 print "        </tbody>";
 print "        </tbody>";
 print "       <tfoot>";
 print "               <tr>";
 print "                       <th>Rendering engine</th>";
 print "                       <th>Browser</th>";
 print "                       <th>Platform(s)</th>";
 print "                       <th>Engine version</th>";
 print "                       <th>CSS grade</th>";
 print "               </tr>";
 print "       </tfoot>";
 print "</table>";

 print "      </div>";
 print "    </div>";

 print "</body></html>";

1
