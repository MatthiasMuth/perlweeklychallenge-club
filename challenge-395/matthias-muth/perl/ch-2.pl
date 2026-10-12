#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 395 Task 2: Word Squares
#
#       Perl solution by Matthias Muth.
#

use v5.36;

sub fill_square( $rows, $level, $candidates ) {
    # Fill the next row with the candidates that match, in turn,
    # then do a recursive call for the other rows.
    # Return when we get back a fully filled square.
    for my $candidate ( $candidates->@* ) {
        # Use this candidate if it fits with what is in the square already.
        my $re = $level == 0 || $rows->[$level];
        next unless $level == 0 || $candidate =~ /^$rows->[$level]/;

        # Using a copy of the original rows,
        # put the candidate into the appropriate row,
        my @rows = $rows->@*;
        $rows[$level] = $candidate;

        # Check the end condition.
        return @rows
            if $level == length( $rows[0] ) - 1;

        # Also add the candidate letters as a columns in the
        # rest of the square.
        $rows[$_] .= substr( $candidate, $_, 1 )
            for $level + 1 .. length( $candidate ) - 1;

        # Do the recursive call.
        my @result =
            fill_square( \@rows, $level + 1,
                [ grep { $_ ne $candidate } $candidates->@* ] );
        return @result if @result;

    }
    return;
}

sub word_squares( @words ) {
    return fill_square( [], 0, [ @words ] );
}

use lib qw( . ../../../lib );
use MultiTest;

my @tests = (
    [ "Example 1:", ["MA", "AM", "MY", "ME"], ["MA", "AM"] ],
    [ "Example 2", ["SUN", "USE", "NET", "SEE", "TEN"], ["SUN", "USE", "NET"] ],
    [ "Example 3",
        ["BOAT", "TEAL", "AREA", "TSAR", "OGRE"],
        ["BOAT", "OGRE", "AREA", "TEAL"] ],
    [ "Example 4",
        ["CARD", "AREA", "REAR", "DART"],
        ["CARD", "AREA", "REAR", "DART"] ],
    [ "Example 5",
        ["HEART", "TREND", "EMBER", "RESIN", "ABUSE"],
        ["HEART", "EMBER", "ABUSE", "RESIN", "TREND"] ],
    [ "Own Test 1:", ["BOAT", "XXXX", "AREA", "OGRE"], [] ],
);

run( "word_squares", \@tests );

__END__
is [ word_squares( $_->[1]->@* ) ], $_->[2], $_->[0]
    for @tests;

done_testing;
