#!/usr/bin/perl

$newdate='2013-12-12';
$olddate='2012-12-23';

$query="select count(1) from s.v_seven_calendar where date in ('".$newdate."','".$olddate."')";
print "$query";

