#!/usr/bin/perl -wU

use strict;
use CGI;
use CGI::Carp qw ( fatalsToBrowser );
use File::Basename;

$CGI::POST_MAX = 10240000;

my $safe_filename_characters = "a-zA-Z0-9_.-";

my $upload_dir = "/var/www/html/upload";

my $query = new CGI;
my $filename = $query->param("datafile");
#my $email_address = $query->param("email_address");

if ( !$filename )
{
print $query->header ( );
print "I did not get the file, please click back button and try again!).";
exit;
}

my ( $name, $path, $extension ) = fileparse ( $filename, '..*' );
$filename = $name . $extension;

$filename =~ tr/ /_/;
$filename =~ s/[^$safe_filename_characters]//g;

if ( $filename =~ /^([$safe_filename_characters]+)$/ )
{
$filename = $1;
}
else
{
die "Filename contains invalid characters";
}

my $upload_filehandle = $query->upload("datafile");

open ( UPLOADFILE, ">$upload_dir/$filename" ) or die "$!";
binmode UPLOADFILE;

while ( <$upload_filehandle> )
{
print UPLOADFILE;
}

close UPLOADFILE;

my $source=$upload_dir."/".$filename;
my $result=$filename.".req.result";

system("sh /var/www/scripts/convert_file.sh ".$source);
system("sh /var/www/scripts/load_abase.sh");

  
print $query->header ( );

if (-e $upload_dir."/".$result) {
print <<END_HTML;
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en"> <head> <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Thanks!</title> <style type="text/css"> img {border: none;} </style> </head>
<body> <p>Thanks for uploading Data file!</p>
<p>Your Heptathlon Sorting Result:</p>
<iframe src="/upload/$result" width="100%" height=300></iframe>
<a href=/upload/$result>download</a> <a href=/fileupload.html>load another data file</a> <a href=http://107.170.209.150/seven_input.html target=_blank>Heptathlon List</a></br>
</body> </html>
END_HTML
} else 
{ 
print <<END_HTML;
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en"> <head> <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Thanks!</title> <style type="text/css"> img {border: none;} </style> </head>
<body> <p>Thanks for uploading Data file!</p>
<p>We only support load data file from GuangFa Zhengquan. Please reload correct file.  </p> 
</body> </html>
END_HTML
}


