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

my $file = "ch-1-for-tests.pl";
my @test_list = qw(

    atschneid		password_distance

    bob-lied		strongPassword
    e-choroba		strong_password
    jo-37		strong_password
    jtimothyking	strong_password
    kjetillll		strong_pw_steps
    laurent-rosenfeld	strong_password
    lubos-kolouch	strong_password_steps
    matthias-muth	strong_password
    mattneleigh		steps_to_strong_password
    packy-anderson	strongPassword
    paulo-custodio	steps_to_strong
    perlboy1967		stepsToMakeStrongPassword
    peter-campbell-smith strong_password
    peter-meszaros	strong_password
    reinier-maliepaard	strong_password
    robbie-hatley	make_strong
    roger-bell-west	strongpassword
    santiago-leyva	checkPassword
    sgreen		strong_password
    ulrich-rieke	strong_password
    wanderdoc		evaluate
    wlmb		strong_password
    zapwai		proc
);

use Test2::V0 qw( -no_srand );
use List::Util qw( none );

for my ( $who, $sub ) ( @test_list ) {
    next
        if @ARGV && none { $_ eq $who } @ARGV;
    note "";
    note "Solution by $who";
    note "  file test-includes/$who/$file";

    require "test-includes/$who/$file";

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
	"Extra 5: $sub( 'aaaa1B' ) == 1 (like 'aaba1B' using one replace)";
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
	"Extra 11: $sub( 'aaabC' ) == 1 (like 'aa1abC' using one insert)";
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
