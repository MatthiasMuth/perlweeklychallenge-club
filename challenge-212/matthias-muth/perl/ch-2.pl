#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 212 Task 2: Rearrange Groups
#
#       Perl solution by Matthias Muth.
#

use strict;
use warnings;
use feature 'say';

use lib '.';
use TestExtractor;

use Data::Dump qw( pp );
use List::Util qw( min );

sub rearrange_groups {
    my ( $list, $size ) = @_;
    my %available;

    return -1
        if @$list % $size != 0;

    $available{$_}++
        for @$list;

    my @groups;
    while ( %available ) {
        push @groups, [];
        my $first_element = min( keys %available );
        for ( $first_element .. $first_element + $size - 1 ) {
            return -1
                unless $available{$_};
            push @{$groups[-1]}, $_;
            delete $available{$_}
                if --$available{$_} == 0;
        }
    }
    return @groups;
}

run_tests;
