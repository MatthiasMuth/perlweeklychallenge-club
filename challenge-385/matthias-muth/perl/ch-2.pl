#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 385 Task 2: Outermost Parentheses
#
#       Perl solution by Matthias Muth.
#

use v5.36;

sub outermost_parentheses( $str ) {
    return $str =~ s/ (\() ( (?R)* ) \) /$2/xgr;
}

use lib qw( . ../../../lib );
use MultiTest;

my @tests = (
    [ "Example 1", "()()()", "" ],
    [ "Example 2", "(((())))", "((()))" ],
    [ "Example 3", "(()())(())", "()()()" ],
    [ "Example 4", "()((()))()", "(())" ],
    [ "Example 5", "(()(()))(()())", "()(())()()" ],
);

run( "outermost_parentheses", \@tests );
