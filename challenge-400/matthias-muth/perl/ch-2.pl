#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 400 Task 2: Minimum Genetic Mutation
#
#       Perl solution by Matthias Muth.
#

use v5.36;
use Dsay;

sub distance( $gene_1, $gene_2 ) {
    my $distance = scalar grep
        { substr( $gene_1, $_, 1 ) ne substr( $gene_2, $_, 1 ) }
        0 .. length( $gene_1 ) - 1;
    dsay "distance( \"$gene_1\", \"$gene_2\" ): $distance";
    return $distance;
}

use List::Util qw( uniq );

sub minimum_genetic_mutation( $start_gene, $end_gene, $gene_bank ) {
    state $i = Indent->new;
    dsay $i++, "minimum_genetic_mutation",
        pp $start_gene, $end_gene, $gene_bank;

    # End condition for the recursion:
    # Start gene and end gene are the same.
    do { dsay $i--, "start gene and end gene are the same"; return 0 }
        if $start_gene eq $end_gene;

    # Create a list of 'neighbor' genes for each gene in the gene pool.
    # Make sure the start gene is in the gene bank.
    my %mutations;
    unshift $gene_bank->@*, $start_gene;
    $gene_bank = [ uniq $gene_bank->@* ];
    for my $i ( keys $gene_bank->@* ) {
        my $gene_i = $gene_bank->[$i];
        for my $j ( $i + 1 .. $gene_bank->$#* ) {
            my $gene_j = $gene_bank->[$j];
            if ( distance( $gene_i, $gene_j ) == 1 ) {
                push $mutations{$gene_i}->@*, $gene_j;
                push $mutations{$gene_j}->@*, $gene_i;
            }
        }
    }
    dsay $i, "mutations: ", pp_hash %mutations;

    # Verify that the end gene is in the gene pool.
    do { dsay $i--, "end gene not in gene pool"; return -1 }
        unless exists $mutations{$end_gene};

    # Using a BFS algorithm to find the shortest path.
    my ( $gene, $distance ) = ( $start_gene, 0 );
    my @q = ( [ $gene, $distance ] );
    my %visited = ( $start_gene => 1 );
    while ( @q ) {
        ( $gene, $distance ) = ( shift @q )->@*;
        dsay $i, "visiting $gene at diatnce $distance";
        return $distance
            if $gene eq $end_gene;
        $visited{$gene} = 1;
        my @next = 
            map [ $_, $distance + 1 ],
                grep ! $visited{$_}, $mutations{$gene}->@*;
        dsay $i, "next: ", pp @next;
        push @q, @next;
    }
    do { dsay $i--, "end gene cannot be reached"; return -1 };
}

use lib qw( . ../../../lib );
use MultiTest;

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
            "GCCCCCCA",
            "GCCCCCCC",
          ],
        ],
        7 ],
    [ "Example 5", ["AACCGGTT", "AACCGGTT", ["AACCGGTA"]], 0 ],
);

run( "minimum_genetic_mutation", \@tests );

__END__
is minimum_genetic_mutation( $_->[1]->@* ), $_->[2], $_->[0]
    for @tests;

done_testing;
