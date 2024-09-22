#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 287 Task 1: Strong Password
#
#       Perl solution by Matthias Muth.
#

use v5.36;

use List::Util qw( sum min );

our $verbose = 0;
sub vsay( @args ) { say @args if $verbose }

use constant MIN_PASSWORD_LENGTH => 6;

sub strong_password( $str ) {
    vsay "strong_password( $str )";

    # Make pattern matches easier to write.
    $_ = $str;

    my ( $cost, $available_inserted, $available_replaced ) = ( 0, 0, 0 );

    # 1: Do *inserts* for bringing the password up to length.
    vsay "  password length: ", length();
    if ( length() < MIN_PASSWORD_LENGTH ) {
        $available_inserted = MIN_PASSWORD_LENGTH - length();
        $cost += $available_inserted;
        vsay "  insert $available_inserted for password length";
        vsay "  cost is at $cost";
    }

    # 2: Use the inserted characters to add missing categories
    #    (*no additional cost!*),
    my $n_missing_categories = sum( ! /\d/, ! /[a-z]/, ! /[A-Z]/ );
    vsay "  $n_missing_categories missing categories";
    if ( $n_missing_categories && $available_inserted ) {
        my $n_to_use = min( $n_missing_categories, $available_inserted );
        $n_missing_categories -= $n_to_use;
        vsay "    used $n_to_use inserts for missing categories";
    }

    # 3: If there still are categories missing,
    #    we *replace* existing characters.
    if ( $n_missing_categories ) {
        $available_replaced = $n_missing_categories;
        $cost += $available_replaced;
        vsay "  replace $available_replaced for categories";
        vsay "  cost is at $cost";
    }

    # 4: Deal with long repeating sequences (3 or more same characters).
    while ( /(.)\1\1\1*/g ) {
        my $sequence_length = length( $& );
        vsay "  sequence '$&', length $sequence_length";
        while ( $sequence_length > 2 && $available_replaced ) {
            vsay "  use replace in sequence";
            $sequence_length -= 3;
            --$available_replaced;
        }
        while ( $sequence_length > 2 && $available_inserted ) {
            vsay "  use insert in sequence";
            $sequence_length -= 2;
            --$available_inserted;
        }
        while ( $sequence_length > 2 ) {
            vsay "  replace in sequence";
            vsay "  cost is at $cost";
            $sequence_length -= 3;
            ++$cost;
        }
    }
    return $cost;
}

1;
