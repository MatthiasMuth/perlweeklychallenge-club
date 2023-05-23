#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 205 Task 2: Maximum XOR
#
#       Perl solution by Matthias Muth.
#

use strict;
use warnings;
use feature 'say';

use lib '.';
use TestExtractor;

use List::Util qw( max );

sub max_xor_1 {
    my @all_xors;
    for my $i ( 0 .. ( $#_ - 1 ) ) {
        for my $j ( $i..$#_ ) {
            push @all_xors, $_[$i] ^ $_[$j];
        }
    };
    return max( @all_xors );
}

sub max_xor_2 {
    my @all_xors;
    for my $i ( 0..$#_ ) {
        push @all_xors, map $_[$i] ^ $_[$_], $i..$#_;
    };
    return max( @all_xors );
}

sub xor_slice { return map $_[0] ^ $_, @_[1..$#_] }
sub max_xor_3 {
    return max( map xor_slice( @_[$_..$#_] ), 0 .. ( $#_ - 1 ) );
}

sub maximum_xor {
    return max_xor_3( @_ );
}

run_tests;
