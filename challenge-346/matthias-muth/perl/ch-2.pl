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

sub chain( $str, $target, $product_chaining ) {
    # Build all possible concatenations of the digits, starting on the left.
    # The rest of the digits are then used to be chained by recursive calls.
    # We try 
    # * *multiplying* the current number,
    # * *adding* the current number,
    # * *subtracting* the current number.
    # For the multiplication, we need the value of the last term of the
    # existing chain, which is passed in as the $product_chaining parameter.
    local $d_area = "chain";
    %debug and dsay $i++,
        "chain( '$str', $target, $product_chaining )";

    my @returns;

    # Extract the first digit from $str, also removing it from there.
    my $number = substr( $str, 0, 1, "" );
    %debug and dsay $i, "number $number str '$str'";

    if ( $number ne "0" ) {
        %debug and dsay $i, "number ne 0";
        while ( $str ne "" ) {
            push @returns,
                map( "*${number}$_",
                    chain( $str, $target - ( $number - 1 ) * $product_chaining,
                        $number ) ),
                map( "+${number}$_",
                    chain( $str, $target - $number, $number ) ),
                map( "-${number}$_",
                    chain( $str, $target + $number, -$number ) );
            # Move the next digit from $str to $number.
            $number .= substr( $str, 0, 1, "" );
            %debug and dsay $i, "number $number str '$str'";
        }
    }
    elsif ( $str ne "" ) {
        %debug and dsay $i, "number eq 0 and str '$str'";
        # We know that $number is zero, but we have the rest of the digits
        # in $str.
        # Zero as a multiplying factor 0 invalidates the previous term
        # that was already added (product_chaining), so we need to *raise*
        # the target.
        @returns = (
            map( "*0$_", chain( $str, $target + $product_chaining, 0 ) ),
            map( "+0$_", chain( $str, $target, 0 ) ),
            map( "-0$_", chain( $str, $target, 0 ) ),
        );
        %debug and dsay $i--, "returns ", pp( @returns );
        return @returns;
    }

    # Deal with the final number without a rest in $str.
    # With the above conditionals, that final number may be the complete
    # original $str parameter, or a single zero.
    # For the multiplication, as $product_chaining was already added to the
    # total result, multiplying by <n> means adding another <n>-1 times
    # that amount.
    push @returns,
        $product_chaining * ( $number - 1 ) == $target ? "*$number" : (),
        $number == $target                             ? "+$number" : (),
        -$number == $target                            ? "-$number" : ();

    %debug and dsay $i--, "returns ", pp( @returns );
    return @returns;
}

sub magic_expression( $str, $target ) {
    dsay $i++, "magic_expression( '$str', $target )";

    # Extract the first digit, also removing it from there.
    my $number = substr( $str, 0, 1, "" );
    %debug and dsay $i, "number $number str '$str'";

    my @results;
    if ( $number ne "0" ) {
        while ( $str ne "" ) {
            # Add all matching combinations starting with the current substring.
            push @results,
                map "${number}$_", chain( $str, $target - $number, $number );
            # Move the next digit from $str to $number.
            $number .= substr( $str, 0, 1, "" );
            %debug and dsay $i, "number $number str '$str'";
        }
    }
    elsif ( $str ne "" ) {
        # Simple case if the first digit is '0'.
        @results = map "0" . chain( $str, $target, 0 );
        dsay $i--, "results: ", pp( @results );
        return @results;
    }

    # Deal with the final number without a rest in $str.
    # With the above conditionals, that final number may be the complete
    # original $str parameter, or a single zero.
    push @results, $number == $target ? $number : ();
    %debug and dsay $i--, "results: ", pp( @results );
    return @results;
}

use Test2::V0 qw( -no_srand bag );

sub create_bag( @args ) {
    return bag { item $_ for @args; end };
}

is [ magic_expression( "123", 6 ) ],
    create_bag( qw( 1*2*3 1+2+3 ) ),
    'Example 1: ( "123", 6 ) => ( "1*2*3", "1+2+3" )';
is [ magic_expression( "105", 5 ) ],
    create_bag( qw( 1*0+5 10-5 ) ),
    'Example 2: ( "105", 5 ) => ( "1*0+5", "10-5" )';
is [ magic_expression( "232", 8 ) ],
    create_bag( qw( 2*3+2 2+3*2 ) ),
    'Example 3: ( "232", 8 ) => ( "2*3+2", "2+3*2" )';
is [ magic_expression( "1234", 10 ) ],
    create_bag( qw( 1*2*3+4 1+2+3+4 ) ),
    'Example 4: ( "1234", 10 ) => ( "1*2*3+4", "1+2+3+4" )';
is [ magic_expression( "1001", 2 ) ],
    create_bag( qw( 1+0*0+1 1+0+0+1 1+0-0+1 1-0*0+1 1-0+0+1 1-0-0+1 ) ),
    'Example 5: ( "1001", 2 ) => ( "1+0*0+1", "1+0+0+1", "1+0-0+1", "1-0*0+1", "1-0+0+1", "1-0-0+1" )';

is [ magic_expression( "43", 7 ) ],
    create_bag( qw( 4+3 ) ),
    'Own Test 1: ( "43", 7 ) => ( "4+3" )';
is [ magic_expression( "43", 1 ) ],
    create_bag( qw( 4-3 ) ),
    'Own Test 2: ( "43", 1 ) => ( "4-3" )';
is [ magic_expression( "43", 12 ) ],
    create_bag( qw( 4*3 ) ),
    'Own Test 3: ( "43", 12 ) => ( "4*3" )';
is [ magic_expression( "43", 43 ) ],
    create_bag( qw( 43 ) ),
    'Own Test 4: ( "43", 43 ) => ( "43" )';
is [ magic_expression( "50", 5 ) ],
    create_bag( qw( 5+0 5-0 ) ),
    'Own Test 5: ( "50", 5 ) => ( "5+0", "5-0" )';
is [ magic_expression( "560", 5 ) ],
    create_bag( qw( 5+6*0 5-6*0 ) ),
    'Own Test 6: ( "560", 5 ) => ( "5+6*0", "5-6*0" )';
is [ magic_expression( "0", 0 ) ],
    create_bag( qw( 0 ) ),
    'Own Test 7: ( "0", 5 ) => ( "5+6*0", "5-6*0" )';

done_testing;
