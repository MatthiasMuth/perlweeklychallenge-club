#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 392 Task 1: Convert Palindrome
#
#       Perl solution by Matthias Muth.
#

use v5.36;
use Dsay;

sub is_palindrome( $str ) {
    return substr( $str, 0, length( $str) / 2 )
        eq reverse substr( $str, -length( $str) / 2 );
}

sub convert_palindrome( $str ) {
    my $reversed = reverse $str;
    my $prepend = "";
    dsay pp $str, $reversed;
    dsay "  prepend: '$prepend' => '$prepend.$str'";
    until ( is_palindrome( $prepend . $str ) ) {
        $prepend .= substr( $reversed, 0, 1, "" );
        dsay "  prepend: '$prepend' => '$prepend.$str'";
    }
    return $prepend . $str;
}

use lib qw( . ../../../lib );
use MultiTest;

my @tests = (
    [ "Example 1:", "pinnipeds", "sdepinnipeds" ],
    [ "Example 2:", "abcd", "dcbabcd" ],
    [ "Example 3:", "bananas", "sananabananas" ],
    [ "Example 4:", "dissident", "tnedissident" ],
    [ "Example 5:", "cailliachs", "shcailliachs" ],
    [ "Own Test 1:", "racecar", "racecar" ],
);

ok ! is_palindrome( $_->[1] ), "'$_->[1]' is not a palindrome"
    for grep  { $_->[1] ne $_->[2] } @tests;
ok is_palindrome( $_->[2] ), "'$_->[2]' is a palindrome"
    for @tests;

run( "convert_palindrome", \@tests );

__END__
is convert_palindrome( $_->[1] ), $_->[2], $_->[0]
    for @tests;

done_testing;

pinnipeds
sdepinnip

s pinnipeds
sd pinnipeds
sde pinnipeds
sdepinnip pinnipeds
sdepinnip pinnipeds
sdepinnip pinnipeds
sdepinnip pinnipeds
          *
s pinnipeds
