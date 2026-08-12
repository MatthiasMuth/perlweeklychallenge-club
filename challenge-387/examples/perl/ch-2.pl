#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 387 Task 2: Atoms Count
#
#       Perl solution template.
#       Uses test data extracted from the challenge task examples
#       to test the solution during development.
#       (Template by Matthias Muth)
#

use v5.20;
use warnings;
use feature 'signatures';
no warnings 'experimental::signatures';

sub atoms_count( $formula ) {
    my @results;
    return @results;
}

use Test2::V0 qw( -no_srand );

my @tests = (
    [ "Example 1", "((N2O)3(H2O)2)2", "H8N12O10" ],
    [ "Example 2", "Mg3(PO4)2", "Mg3O8P2" ],
    [ "Example 3", "(((H)2)3)4", "H24" ],
    [ "Example 4", "NaCl3(O2(S10)2)2Mg", "Cl3MgNaO4S40" ],
    [ "Example 5", "Z2Y3(X2W)2", "W2X4Y3Z2" ],
);

is atoms_count( $_->[1] ), $_->[2], $_->[0]
    for @tests;

done_testing;