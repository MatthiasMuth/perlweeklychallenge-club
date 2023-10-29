#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 240 Task 1: Acronym
#
#       Perl solution by Matthias Muth.
#

use v5.20;
use strict;
use warnings;
use feature 'signatures';
no warnings 'experimental::signatures';

use lib '.';
use TestExtractor;

use List::Util qw( reduce );

sub acronym( $str, $chk ) {
    # return lc( reduce { $b =~ /./; "$a$&" } "", @$str ) eq $chk;
    return lc( join "", map substr( $_, 0, 1 ), @$str ) eq $chk;
}

run_tests;
