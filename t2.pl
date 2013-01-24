#! /usr/bin/perl

use strict;
use warnings;
use Data::Dumper;
use File::Slurp;
use File::Temp;
use Carp;
use feature qw(say);

my $file = shift;
croak ("usage: $0 <file.log>") unless ( $file );

use Parse::AccessLog;

my $p = Parse::AccessLog->new;

# returns a hashref for each line in 'access.log'...
my @recs = $p->parse( $file );

say "Got " . scalar(@recs) . " recs";

