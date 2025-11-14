#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 346 Task 2: Magic Expression
#
#       Perl solution by Matthias Muth.
#

use v5.36;

sub chain( $str, $target, $last_product_term = undef ) {
    # Build all possible concatenations of the digits, starting from the left.
    # The rest of the digits are then used to be chained by recursive calls.
    # We try
    # * *multiplying* the current number,
    # * *adding* the current number,
    # * *subtracting* the current number.
    # For the multiplication, we need the value of the last term of the
    # existing chain that can be multiplied by another number, which is
    # passed in as the $last_product_term parameter.
    # If that parameter is undef, we don't have any previous term,
    # which means that this call is for starting the whole chain with the
    # first number, without a leading operator. In that case we do not do
    # multiplying or subtracting, and we indicate that we don't want an
    # operator character for the first number.
    my $number = "";
    my @returns;
    while ( $str ne "" ) {
        # Remove the first digit from $str, concatenating it to $number.
        $number .= substr( $str, 0, 1, "" );

        # Chain combinations of the rest of digits.
        push @returns,
            defined $last_product_term
            ? ( chain_mult( $number, $str, $target, $last_product_term ),
                chain_add( '+', $number, $str, $target ),
                chain_add( '-', $number, $str, $target ) )
            : ( chain_add( '', $number, $str, $target ) );

        # Don't allow concatenating numbers with a leading zero.
        last if $number eq "0";
    }
    return @returns;
}

sub magic_expression( $str, $target ) {
    return chain( $str, $target, undef );
}

sub chain_mult( $number, $str, $target, $last_product_term ) {
    my $value = $last_product_term * ( $number - 1 );
    return
        $str eq ""
        ? $value == $target ? "*${number}" : ()
        : map "*${number}$_",
            chain( $str, $target - $value, $last_product_term * $number );
}

sub chain_add( $operator, $number, $str, $target ) {
    my $value = $operator eq '-' ? -$number : +$number;
    return
        $str eq ""
        ? $value == $target ? "${operator}${number}" : ()
        : map "${operator}${number}$_",
            chain( $str, $target - $value, $value );
}

use Test2::V0 qw( -no_srand );

my @tests =
    @ARGV >= 2
    ? ( [ "", [ @ARGV[0,1] ], [ @ARGV[2..$#ARGV] ] ] )
    : (
        [ 'Example 1', [ "123", 6 ] => [ qw( 1*2*3 1+2+3 ) ] ],
        [ 'Example 2', [ "105", 5 ] => [ qw( 1*0+5 10-5 ) ] ],
        [ 'Example 3', [ "232", 8 ] => [ qw( 2*3+2 2+3*2 ) ] ],
        [ 'Example 4', [ "1234", 10 ] => [ qw( 1*2*3+4 1+2+3+4 ) ] ],
        [ 'Example 5', [ "1001", 2 ]
            => [ qw( 1+0*0+1 1+0+0+1 1+0-0+1 1-0*0+1 1-0+0+1 1-0-0+1 ) ] ],
        [ 'Own Test 1', [ "43", 7 ] => [ qw( 4+3 ) ] ],
        [ 'Own Test 2', [ "43", 1 ] => [ qw( 4-3 ) ] ],
        [ 'Own Test 3', [ "43", 12 ] => [ qw( 4*3 ) ] ],
        [ 'Own Test 4', [ "43", 43 ] => [ qw( 43 ) ] ],
        [ 'Own Test 5', [ "50", 5 ] => [ qw( 5+0 5-0 ) ] ],
        [ 'Own Test 6', [ "560", 5 ] => [ qw( 5+6*0 5-6*0 ) ] ],
        [ 'Own Test 7', [ "05", 5 ] => [ qw( 0+5 ) ] ],
        [ 'Own Test 8', [ "0", 0 ] => [ qw( 0 ) ] ],
        [ 'Own Test 9', [ "00", 0 ] => [ qw( 0*0 0+0 0-0 ) ] ],
        [ 'Own Test 10', [ "000", 0 ]
            => [ qw( 0*0*0 0*0+0 0*0-0 0+0*0 0+0+0 0+0-0
                    0-0*0 0-0+0 0-0-0 ) ] ],
        [ 'Own Test 11', [ "12345", 0 ] => [ qw( 1*2-3-4+5 12-3-4-5 ) ] ],
        [ 'Own Test 12', [ "123456789", 362880 ]
            => [ qw(  1*2*3*4*5*6*7*8*9 ) ] ],
        [ 'Own Test 13', [ "1111111111111", 9999999999 ] => [ qw( ) ] ],
    );

for ( @tests ) {
    my ( $test, $input, $expected ) = $_->@*;
    my ( $str, $target ) = $input->@*;
    my $output = [ magic_expression( $input->@* ) ];
    is $output, $expected,
        "$test: ( \"$str\", $target ) => ( $expected->@* )";
    for ( $output->@* ) {
        my $actual_result = eval $_;
        is $actual_result, $target, "verify '$_' == $target"
            if $actual_result != $target;
    }
}

done_testing;
