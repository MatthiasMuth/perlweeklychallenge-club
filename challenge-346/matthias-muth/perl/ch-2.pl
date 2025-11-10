#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 346 Task 2: Magic Expression
#
#       Perl solution by Matthias Muth.
#

use v5.42;
use Dsay;

our $i = Indent->new;

sub combine( $str, $target, $product_chaining = undef ) {
    # Build all possible concatenations of the digits.
    # (starting with the first digit only).
    # The rest of the digits are then used to be added by
    # recursive calls.
    # We try 
    # * *multiplying* the current term,
    # * *adding* the current term,
    # * *subtracting* the current term.
    # For the multiplication, we need the value of the last term of the
    # existing chain, which is the $product_chaining parameter.
    # If there is no product chaining (undef) this means we have to create
    # the first term in the sequence, so no multiplying or subtracting.
    local $d_area = "combine";
    %debug and dsay $i++,
        "combine( '$str', $target, ", pp( $product_chaining ), " )";

    my @returns;

    # Try all concatenations of the leftmost characters.
    # For the rest, try adding them to the chain using a recursive call.
    my $concat = "";
    while ( length( $str ) ) {
        # Extract the next digit from $str, also removing it from there.
        $concat .= substr( $str, 0, 1, "" );
        dsay $i, "concat '$concat'";

        # Try to multiply with the current value.
        # This is only possible when we have received something to multiply
        # with.
        if ( defined $product_chaining ) {
            # Use our number as a factor, then combine the rest.
            my $added_value = $product_chaining * ( $concat - 1 );
            my $new_target = $target - $added_value;
            my $new_product_chaining = $product_chaining * $concat;
            push @returns,
                length( $str ) > 0
                ? map "*${concat}$_",
                    combine( $str, $new_target, $new_product_chaining )
                : $added_value == $target
                    ? "*$concat"
                    : ();
        }

        # Try to add the current value.
        # (We try this all the time.)
        my $sign = defined $product_chaining ? "+" : "";
        push @returns,
            length( $str ) > 0
            ? map "${sign}${concat}$_",
                combine( $str, $target - $concat, $concat )
            : $concat == $target
                ? "${sign}${concat}"
                : ();

        if ( defined $product_chaining ) {
            # Try with subtracting the current value.
            push @returns,
                length( $str ) > 0
                ? map "-${concat}$_",
                    combine( $str, $target + $concat, -$concat )
                : -$concat == $target
                    ? "-$concat"
                    : ();
        }

        last if $concat eq "0";

    }

    %debug and dsay $i--, "returns ", pp( @returns );
    return @returns;
}

sub magic_expression( $str, $target ) {
    return combine( $str, $target );
}

use Test2::V0 qw( -no_srand bag );

sub create_bag( @args ) {
    return bag { item $_ for @args; end };
}

is [ magic_expression( "123", 6 ) ],
    create_bag( qw( 1*2*3 1+2+3 ) ),
    'Example 1: magic_expression( "123", 6 ) == ( "1*2*3", "1+2+3" )';
is [ magic_expression( "105", 5 ) ],
    create_bag( qw( 1*0+5 10-5 ) ),
    'Example 2: magic_expression( "105", 5 ) == ( "1*0+5", "10-5" )';
is [ magic_expression( "232", 8 ) ],
    create_bag( qw( 2*3+2 2+3*2 ) ),
    'Example 3: magic_expression( "232", 8 ) == ( "2*3+2", "2+3*2" )';
is [ magic_expression( "1234", 10 ) ],
    create_bag( qw( 1*2*3+4 1+2+3+4 ) ),
    'Example 4: magic_expression( "1234", 10 ) == ( "1*2*3+4", "1+2+3+4" )';
is [ magic_expression( "1001", 2 ) ],
    create_bag( qw( 1+0*0+1 1+0+0+1 1+0-0+1 1-0*0+1 1-0+0+1 1-0-0+1 ) ),
    'Example 5: magic_expression( "1001", 2 ) == ( "1+0*0+1", "1+0+0+1", "1+0-0+1", "1-0*0+1", "1-0+0+1", "1-0-0+1" )';

is [ magic_expression( "43", 7 ) ],
    create_bag( qw( 4+3 ) ),
    'Own Test 1: magic_expression( "43", 7 ) == ( "4+3" )';
is [ magic_expression( "43", 1 ) ],
    create_bag( qw( 4-3 ) ),
    'Own Test 2: magic_expression( "43", 1 ) == ( "4-3" )';
is [ magic_expression( "43", 12 ) ],
    create_bag( qw( 4*3 ) ),
    'Own Test 3: magic_expression( "43", 12 ) == ( "4*3" )';
is [ magic_expression( "50", 5 ) ],
    create_bag( qw( 5+0 5-0 ) ),
    'Own Test 4: magic_expression( "50", 5 ) == ( "5+0", "5-0" )';
is [ magic_expression( "560", 5 ) ],
    create_bag( qw( 5+6*0 5-6*0 ) ),
    'Own Test 5: magic_expression( "560", 5 ) == ( "5+6*0", "5-6*0" )';

done_testing;
