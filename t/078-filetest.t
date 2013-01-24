#!perl

use strict;
use warnings;
use Data::Dumper;
use File::Slurp;
use File::Temp;
use Carp;
use feature qw(say);
use Test::More tests => 5;

BEGIN {
    use_ok( 'Parse::AccessLog' ) || print "Bail out!\n";
}

my $p = new_ok('Parse::AccessLog');

# returns a hashref for each line in 'access.log'...
my @recs = $p->parse( 'access.log' );

say "Got " . scalar(@recs) . " recs";


