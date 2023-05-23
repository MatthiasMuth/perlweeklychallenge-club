#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 212 Task 1: Jumping Letters
#
#       Perl solution by Matthias Muth.
#

use strict;
use warnings;
use feature 'say';

use lib '.';
use TestExtractor;

sub jumping_letters {
    my ( $word, $jump ) = @_;

    my $i = 0;
    $word =~ s{([A-Z])|[a-z]}{
        my $base = ord( $1 ? 'A' : 'a' );
        chr( $base + ( ( ord( $& ) - $base ) + $jump->[$i++] ) % 26 );
    }eg;
    return $word;
}

run_tests;
