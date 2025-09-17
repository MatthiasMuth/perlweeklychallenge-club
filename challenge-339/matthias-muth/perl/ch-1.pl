#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 339 Task 1: Max Diff
#
#       Perl solution by Matthias Muth.
#

use v5.36;
use builtin qw( true false );

use Dsay;

use List::Util qw( product max );

sub max_diff( @ints ) {
    dsay +( my $i = Indent->new )++, "max_diff( @ints )";
    my @positives = sort { $b <=> $a } grep $_ >= 0, @ints;
    my @negatives = sort { $b <=> $a } grep $_ < 0, @ints;
    dsay $i, "\@positives ( @positives )\n", "\@negatives ( @negatives )";

    my @cases;

    # Try the highest two positive numbers as the first product,
    # with the second product as small as possible after having used
    # those two positive numbers:
    if ( @positives >= 2 ) {
        push @cases, [ "case 1",
            [ @positives[0,1] ],
            @negatives
                ? @positives >= 3
                    ? [ $positives[2], $negatives[-1] ]
                    : [ @negatives[0,1] ]
                : [ @positives[-2,-1] ]
        ];
    }

    # Try the lowest two negative numbers as the first product:
    # with the second product as small as possible after having used
    # those two negative numbers:
    if ( @negatives >= 2 ) {
        push @cases, [ "case 2",
            [ @negatives[-2,-1] ],
            @negatives >= 3
                ? @positives
                    ? [ $positives[0], $negatives[-3] ]
                    : [ @negatives[0,1] ]
                : [ @positives[-2,-1] ]
        ];
    }

    # Try the lowest *second* product first,
    # with the three options for the first product after that.
    if ( @negatives ) {
        if ( @positives ) {
            # We have negatives and positives.
            # Use the best possible mixed pair for the second product.
            # For the first product, we then have one less positive and
            # one less negative available.
            my $pair_2 = [ $positives[0], $negatives[-1] ];
            my $got_positive_first_product = false;
            if ( @positives >= 3 ) {
                push @cases, [ "case 3",
                    [ @positives[1,2] ],
                    $pair_2,
                ];
                $got_positive_first_product = true;
            }
            if ( @negatives >= 3 ) {
                push @cases, [ "case 4",
                    [ @negatives[-3,-2] ],
                    $pair_2,
                ];
                $got_positive_first_product = true;
            }
            # In case we couldn't create either of the two cases above,
            # we have to use a 'mixed pair' for the first product:
            unless ( $got_positive_first_product ) {
                push @cases, [ "case 5",
                    [ $positives[1], $negatives[-2] ],
                    $pair_2
                ];
            }
        }
    }
    dsay $i, pp @cases;

    my $maximum =
        max( map product( $_->[1]->@* ) - product( $_->[2]->@* ), @cases );
    return $maximum
        unless wantarray;

    for ( @cases ) {
        dsay $i, pp( $_ ),
            " => ", product( $_->[1]->@* ) - product( $_->[2]->@* );
        my $result = product( $_->[1]->@* ) - product( $_->[2]->@* );
        if ( $result == $maximum ) {
            vsay "# $_->[0]: ",
                "($_->[1][0] * $_->[1][1]) - ($_->[2][0] * $_->[2][1])",
                " = $result";
            # Return the maximum and the two pairs that led to the result.
            return ( $maximum, $_->@[1,2] );
        }
    }
}

use Test2::V0 qw( -no_srand );

my @tests = (
    [ "Test 0", [ +5, +4, +3, +2 ], 14 ],
    [ "Test 1", [ -5, +4, +3, +2 ], 26 ],
    [ "Test 2", [ +5, -4, +3, +2 ], 26 ],
    [ "Test 3", [ -5, -4, +3, +2 ], 14 ],
    [ "Test 4", [ +5, +4, -3, +2 ], 26 ],
    [ "Test 5", [ -5, +4, -3, +2 ], 14 ],
    [ "Test 6", [ +5, -4, -3, +2 ], 14 ],
    [ "Test 7", [ -5, -4, -3, +2 ], 26 ],
    [ "Test 8", [ +5, +4, +3, -2 ], 26 ],
    [ "Test 9", [ -5, +4, +3, -2 ], 14 ],
    [ "Test 10", [ +5, -4, +3, -2 ], 14 ],
    [ "Test 11", [ -5, -4, +3, -2 ], 26 ],
    [ "Test 12", [ +5, +4, -3, -2 ], 14 ],
    [ "Test 13", [ -5, +4, -3, -2 ], 26 ],
    [ "Test 14", [ +5, -4, -3, -2 ], 26 ],
    [ "Test 15", [ -5, -4, -3, -2 ], 14 ],

    [ "Test 16 (201 numbers)", [ -100..+100 ], 19702 ],

    [ "Example 1", [ 5, 9, 3, 4, 6 ], 42 ],
    [ "Example 2", [ 1, -2, 3, -4 ], 10 ],
    [ "Example 3", [ -3, -1, -2, -4 ], 10 ],
    [ "Example 4", [ 10, 2, 0, 5, 1 ], 50 ],
    [ "Example 5", [ 7, 8, 9, 10, 10 ], 44 ],
);

for ( @tests ) {
    my ( $test_name, $input, $expected ) = $_->@*;
    my $descr = "$test_name:"
        . " max_diff( " . join( ", ", $input->@* ) . " ) == $expected";
    my ( $maximum, $pair_1, $pair_2 ) = max_diff( $input->@* );
    is $maximum, $expected, $descr
        and $pair_1 && $pair_2 && do {
            # Explain the correct solution.
            my $product_1 = $pair_1->[0] * $pair_1->[1];
            my $product_2 = $pair_2->[0] * $pair_2->[1];
            my $result = $product_1 - $product_2;
            note "            Pair 1: ( $pair_1->[0], $pair_1->[1] )";
            note "            Pair 2: ( $pair_2->[0], $pair_2->[1] )";
            note "            Product Diff: ",
                "( $pair_1->[0] * $pair_1->[1] )",
                    " - ( $pair_2->[0] * $pair_2->[1] )",
                " => ( ", $product_1 >= 0 ? $product_1 : "($product_1)",
                    " - ", $product_2 >= 0 ? $product_2 : "($product_2)", " )",
                " => $result";
            note "";
        }
}

done_testing;
