#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 224 Task 1: Special Notes
#
#       Perl solution by Matthias Muth.
#

use strict;
use warnings;
use feature 'say';

use lib '.';
use TestExtractor;

sub special_notes {
    my ( $source, $target ) = @_;

    my $ordered_chars = join "", sort split '', $source;
    vsay "ordered chars: $ordered_chars";

    my $pattern = '^.*' . join( '.*', sort split '', $target ) . '.*$';
    vsay "pattern for '$target': qr/$pattern/";
    return $ordered_chars =~ /${pattern}/ ? 1 : 0;
}

run_tests;
