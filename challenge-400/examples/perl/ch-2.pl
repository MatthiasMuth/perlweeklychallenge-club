#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 400 Task 2: Minimum Genetic Mutation
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

sub minimum_genetic_mutation( $start_gene, $end_gene, $gene_bank ) {
    my @results;
    return @results;
}

use Test2::V0 qw( -no_srand );

my @tests = (
    [ "Example 1", ["AACCGGTT", "AACCGGTA", ["AACCGCTA", "AAACGGTA"]], -1 ],
    [ "Example 2",
        [
          "AACCGGTT",
          "AACCGGAA",
          ["AACCGGTA", "AACCGGAA", "AACCGCTA", "AACCCTAA", "AACCGTAA"],
        ],
        2 ],
    [ "Example 3",
        ["AAAAAAAA", "AAAAACCC", ["CAAAAAAA", "CCAAAAAA", "AAAAAAAC"]],
        -1 ],
    [ "Example 4",
        [
          "GAAAAAAA",
          "GCCCCCCC",
          [
            "GCAAAAAA",
            "GCCAAAAA",
            "GCCCAAAA",
            "GCCCCAAA",
            "GCCCCCAA",
            "GCCCCCCAA",
            "GCCCCCCA",
            "GCCCCCCC",
          ],
        ],
        7 ],
    [ "Example 5", ["AACCGGTT", "AACCGGTT", ["AACCGGTA"]], 0 ],
);

is minimum_genetic_mutation( $_->[1]->@* ), $_->[2], $_->[0]
    for @tests;

done_testing;
