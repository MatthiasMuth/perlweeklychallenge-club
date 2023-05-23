#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 208 Task 1: Minimum Index Sum
#
#       Perl solution by Matthias Muth.
#

use strict;
use warnings;
use feature 'say';

use lib '.';
use TestExtractor;

use List::Util qw( min );

sub minimum_index_sum {
    my @list1 = @{$_[0]};
    my @list2 = @{$_[1]};
    my %index1 = map { ( $list1[$_] => $_ ) } 0..$#list1;
    my %strings_by_index_sum;
    for ( 0..$#list2 ) {
        if ( exists $index1{ $list2[$_] } ) {
            my $index_sum = $index1{ $list2[$_] } + $_;
            push @{$strings_by_index_sum{$index_sum}}, $list2[$_];
        }
    }
    return
        %strings_by_index_sum
        ? sort @{$strings_by_index_sum{ min( keys %strings_by_index_sum ) } }
        : ();
}

run_tests;
