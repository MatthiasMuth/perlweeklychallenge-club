#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 387 Task 2: Atoms Count
#
#       Perl solution by Matthias Muth.
#

use v5.36;

my $element_re = qr/[A-Z][a-z]?/;
my $simple_group_re =
    qr/ \( (?<group> (?: $element_re \d* )+ ) \) (?<mult>\d+) /x;

sub normalize_group( $group, $multiplier = 1 ) {
    # Return a normalized (sorted) form of a simple atom groups
    # (containing no parentheses)
    # with the atom counts multiplied by $multiplier.
    my %atom_counts;
    while ( $group =~ /($element_re)(\d*)/g ) {
        $atom_counts{$1} += ( $2 || 1 ) * $multiplier;
    }
    return join "",
        map $_ . ( $atom_counts{$_} == 1 ? "" : $atom_counts{$_} ),
            sort keys %atom_counts;
}

sub atoms_count( $formula ) {
    # Replace simple (non-recursive) multiplier groups by their
    # normalized content until no more groups are found.
    # Then normalize (sort) the resulting sequence and return it.
    while ( 1 ) {
        $formula =~ s<$simple_group_re>{
            normalize_group( $+{group}, $+{mult} )
        }e
            or return normalize_group( $formula );
    }
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
