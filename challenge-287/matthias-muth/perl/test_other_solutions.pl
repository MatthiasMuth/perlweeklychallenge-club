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

$| = 1;

my $file = "ch-1.pl";
my @test_list = qw(
    bob-lied		ch-1.pl		strongPassword
    e-choroba		ch-1.pl		strong_password
    kjetillll		ch-1.pl		strong_pw_steps
    laurent-rosenfeld	ch-1.pl		strong_password
    lubos-kolouch	ch-1.pl		strong_password_steps
    matthias-muth	ch-1.pl		strong_password
    mattneleigh		ch-1.pl		steps_to_strong_password
    packy-anderson	ch-1.pl		strongPassword
    paulo-custodio	ch-1.pl		steps_to_strong
    perlboy1967		ch-1.pl		stepsToMakeStrongPassword
    peter-campbell-smith ch-1.pl	strong_password
    peter-meszaros	ch-1.pl		strong_password
    robbie-hatley	ch-1.pl		make_strong
    roger-bell-west	ch-1.pl		strongpassword
    santiago-leyva	ch-1.pl		checkPassword
    ulrich-rieke	ch-1.pl		strong_password
    wlmb		ch-1.pl		strong_password
    zapwai		ch-1.pl		proc

);

use Test2::V0 qw( -no_srand );

for my ( $who, $file, $sub ) ( @test_list ) {
    note "";
    note "Solution by $who";
    
    require "../../$who/perl/$file";

    no strict 'refs';
    note "  using $sub";
    subtest $who => sub {
	run_tests( $sub );
    };

    delete $::{$sub};
}

done_testing;

sub run_tests( $sub ) {
    no strict 'refs';
    is $sub->( 'a' ), 5,
	"Example 1: $sub( 'a' ) == 5";
    is $sub->( 'aB2' ), 3,
	"Example 2: $sub( 'aB2' ) == 3";
    is $sub->( 'PaaSW0rd' ), 0,
	"Example 3: $sub( 'PaaSW0rd' ) == 0";
    is $sub->( 'Paaasw0rd' ), 1,
	"Example 4: $sub( 'Paaasw0rd' ) == 1";
    is $sub->( 'aaaaa' ), 2,
	"Example 5: $sub( 'aaaaa' ) == 2 (like 'aa1aaB')";

    is $sub->( '' ), 6,
	"Extra 1: $sub( '' ) == 6 (like '1aBcde')";

    is $sub->( 'abcABC' ), 1,
	"Extra 2: $sub( 'abcABC' ) == 1 (like 'a1cABC')";
    is $sub->( 'abcdef' ), 2,
	"Extra 3: $sub( 'abcdef' ) == 2 (like 'a1Adef')";

    is $sub->( 'aaa1B' ), 1,
	"Extra 4: $sub( 'aaa1B' ) == 1 (like 'aaba1B' using one insert)";
    is $sub->( 'aaaa1B' ), 1,
	"Extra 5: $sub( 'aaaa1B' ) == 1 (like 'aaba1B')";
    is $sub->( 'aaaaa1B' ), 1,
	"Extra 6: $sub( 'aaaaa1B' ) == 1 (like 'aabaa1B')";
    is $sub->( 'aaaaaa1B' ), 2,
	"Extra 7: $sub( 'aaaaaa1B' ) == 2 (like 'aabaab1B')";
    is $sub->( 'aaaaaaa1B' ), 2,
	"Extra 8: $sub( 'aaaaaaa1B' ) == 2 (like 'aabaaba1B')";
    is $sub->( 'aaaaaaaa1B' ), 2,
	"Extra 9: $sub( 'aaaaaaaa1B' ) == 2 (like 'aabaabaa1B')";
    is $sub->( 'aaaaaaaaaaaa1B' ), 4,
	"Extra 10: $sub( 'aaaaaaaaaaaa1B' ) == 4 (like 'aabaabaabaab1B')";

    is $sub->( 'aaaBc' ), 1,
	"Extra 11: $sub( 'aaaBc' ) == 1 (like 'aa1aBc' using one insert)";
    is $sub->( 'aaaabC' ), 1,
	"Extra 12: $sub( 'aaaabC' ) == 1 (like 'aa1abC')";

    is $sub->( 'aaaacccc' ), 2,
	"Extra 13: $sub( 'aaaacccc' ) == 2 (like 'aa1accBc')";
    is $sub->( 'aaaaaabbbbbb' ), 4,
	"Extra 14: $sub( 'aaaaaabbbbbb' ) == 4 (like 'aa1aaXbbYbbY')";
    is $sub->( 'aaacc' ), 2,
	"Extra 15: $sub( 'aaacc' ) == 2 (like 'aa1ccX')";
}

1;
