#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 382 Task 1: Hamiltonian Cycle
#
#       Perl solution by Matthias Muth.
#

use v5.36;
use builtin qw( true false );

use Verbose;
use Dsay;
use Test2::V0 qw( -no_srand );

my @is_square;

sub descend_hamiltonian( $chain, $available ) {
    state $i = Indent->new( width => 2 );
    local $d_area = "descend";
    %debug and dsay $i++,
        "descend_hamiltonian( ", pp( $chain ), ", ", pp( $available ), " )";
    my @solutions;
    if ( $available->@* == 0 ) {
        %debug and dsay $i--, "return ",
            pp $is_square[ $chain->[-1] + $chain->[0] ] ? $chain : ();
        return $is_square[ $chain->[-1] + $chain->[0] ] ? $chain : ();
    }
    for ( keys $available->@* ) {
        if ( $is_square[ $chain->[-1] + $available->[$_] ] ) {
            push @solutions,
                descend_hamiltonian(
                    [ $chain->@*, $available->[$_] ],
                    [ $available->@[ 0 .. $_ - 1, $_ + 1 .. $available->$#* ] ]
                );
        }
    }
    %debug and dsay $i--, "return ", pp @solutions;
    return @solutions;
}


sub hamiltonian_cycle( $n ) {
    $is_square[ $_ * $_ ] = 1
        for 1 .. $n + ( $n - 1 );
    my ( $chain, $available ) = ( [ 1 ], [ 2..$n ] );
    my @solutions = descend_hamiltonian( $chain, $available );
    if ( $verbose ) {
        note "found ", plural( scalar @solutions, "solution" ), ":";
        note "$_->@*"
            for @solutions;
    }
    return @solutions ? $solutions[0]->@* : ();
}

use lib qw( . ../../../lib );
use MultiTest;

sub chain_check( @chain ) {
    return () unless @chain >= 2;
    my $previous = $chain[-1];
    for ( keys @chain ) {
        return false unless $chain[$_] == $previous;
        $previous = $chain[$_];
    }
    return true;
}

my @tests = (
    [ "Example 1",
        32,
        [
          1,
          8,
          28,
          21,
          4,
          32,
          17,
          19,
          30,
          6,
          3,
          13,
          12,
          24,
          25,
          11,
          5,
          31,
          18,
          7,
          29,
          20,
          16,
          9,
          27,
          22,
          14,
          2,
          23,
          26,
          10,
          15,
        ]
    ],
    [ "Example 2", 15, [] ],
    [ "Example 3",
        34,
        [
          1,
          8,
          28,
          21,
          4,
          32,
          17,
          19,
          6,
          30,
          34,
          15,
          10,
          26,
          23,
          2,
          14,
          22,
          27,
          9,
          16,
          33,
          31,
          18,
          7,
          29,
          20,
          5,
          11,
          25,
          24,
          12,
          13,
          3,
        ]
    ],
);

run( "hamiltonian_cycle", \@tests );

__END__

# Version for publishing:

use Test2::V0 qw( -no_srand );
is [ hamiltonian_cycle( $_->[1] ) ], $_->[2], $_->[0]
    for @tests;
done_testing;
