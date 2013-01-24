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
    # returns two hashrefs...
    my @log_lines = (
        q{127.0.0.1 - - [11/Jan/2013:17:31:36 -0600] "GET / HTTP/1.1" 200 612 "-" "HTTP-Tiny/0.022"},
        q{127.0.0.1 - - [11/Jan/2013:17:31:38 -0600] "GET / HTTP/1.1" 200 612 "-" "HTTP-Tiny/0.022"},
    );
    my @recs = $p->parse( @log_lines );

is(@recs, 2, 'parsed 2 lines');


