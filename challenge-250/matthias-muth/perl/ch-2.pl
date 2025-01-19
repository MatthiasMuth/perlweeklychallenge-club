#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 250 Task 2: Alphanumeric String Value
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

use List::Util qw( max );

sub alphanumeric_string_value( @alphanumstr ) {
    return max map /^\d+$/ ? 0 + $_ : length( $_ ), @alphanumstr;
}

run_tests;
