#! /usr/bin/perl

use Test::Harness qw/runtests/;
my @tests = @ARGV ? @ARGV : <t/*.t>;
runtests @tests;
