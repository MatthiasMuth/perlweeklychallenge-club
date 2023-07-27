#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 226 Task 2: Zero Array
#
#       Perl solution by Matthias Muth.
#

use strict;
use warnings;
use feature 'say';

use lib '.';
use TestExtractor;

use List::Util qw( uniq );

sub zero_array {
    my ( @ints ) = @_;
    return scalar uniq grep $_,@ints;
}

run_tests;
