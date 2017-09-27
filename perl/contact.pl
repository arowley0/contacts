#!/usr/bin/perl -w
use strict;
use DBI;

my $database = 'contactdb';
my $hostname = 'localhost';
my $port = '3306';
my $user = 'root';
my $password = 'password';
my $dsn = "DBI:mysql:database=$database;host=$hostname;port=$port";
my $dbh = DBI->connect($dsn, $user, $password);

my $sth = $dbh->prepare(
  'select name, email, phone FROM contact WHERE name = ?')
  or die "prepare statement failed: $dbh->errstr()";
$sth->execute('Eggers') or die "execution failed: $dbh->errstr()";
print $sth->rows . " rows found.\n";
while (my $ref = $sth->fetchrow_hashref()) {
  #  print "Found a row: id = $ref->{'id'}, fn = $ref->{'first_name'}\n";
    print "Found a row: name = $ref->{'name'}\n";
}
$sth->finish;

