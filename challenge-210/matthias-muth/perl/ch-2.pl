#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 210 Task 2: Number Collision
#
#       Perl solution by Matthias Muth.
#

use strict;
use warnings;
use feature 'say';

use lib '.';
use TestExtractor;

use List::Util qw( all );

sub number_collision {
    my ( @list ) = @_;

    while ( ( ! all { $_ > 0 } @list )
        && ! all { $_ < 0 } @list )
    {
        for ( 0 .. $#list - 1 ) {
            if ( ( $list[$_] <=> 0 ) != ( $list[ $_ + 1 ] <=> 0 ) ) {
                # Kill the left one if its value is less or equal.
                my $pos =
                    abs( $list[$_] ) <= abs( $list[ $_ + 1 ] )
                    ? $_
                    : $_ + 1 ;
                # Kill both if their values are equal.
                my $n =
                    abs( $list[$_] ) == abs( $list[ $_ + 1 ] )
                    ? 2
                    : 1;
                splice @list, $pos, $n, ();
                last;
            }
        }
    }

    return @list;
}

run_tests;
