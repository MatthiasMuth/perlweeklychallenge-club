#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';
use feature 'signatures';
no warnings 'experimental::signatures';

use Data::Dump qw( pp );
use Test2::V0 qw( -no_srand );

use lib qw( . ..);
use TestExtractor;

use Getopt::Long;

GetOptions(
    "v|verbose!" => \$TestExtractor::verbose,
) or do { say "usage!"; exit 2 };

my ( $test_no, @tests );

while ( <DATA> ) {
    /^\s*$/ and next;
    /^Expect:\s*(.*)$/ and do {
	$tests[-1]{EXPECTED} = $1;
	next;
    };
    /^(Input:.*)$/ and do {
	my $test = "Test " . ++$test_no;
        push @tests, {
	    TEST => $test,
	    INPUT => $_,
            SOURCE => "DATA line $.",
	};
	next;
    };
    /^(.*)$/ && @tests and do {
        $tests[-1]{INPUT} .= $_;
	next;
    };
}

# say pp @tests;
# say "";

do {
    vsay "input: ", pp $_->{INPUT};
    0 && vsay "passing in <",
	    "$_->{TEST}\n$_->{INPUT}Output: none\n", ">";
    my @extracted = TestExtractor::extract_tests(
	    "$_->{TEST}\n$_->{INPUT}Output: none\n" );
    vsay "extracted:", pp \@extracted;

    0 && vsay "expected: ", pp( $_->{EXPECTED} );
    my $expected = eval $_->{EXPECTED};
    vsay "expected: ", pp $expected;
    my $source = delete $_->{SOURCE};
    is [ $extracted[0]{VARIABLE_NAMES}, $extracted[0]{INPUT} ],
        $expected,
	$_->{TEST},
	$source ? "Test defined in $source:\n" : (),
	pp( $_ );
    vsay "";
} for @tests;

done_testing;

__DATA__

Input: @nums = (6,5,5,4)
Expect: [ [ '@nums' ], [ [6,5,5,4] ] ]

Input: [ 1 2 ]
       [ 3 4 ]

       $matrix = [ [ 1, 2 ], [ 3, 4 ] ]
       $r = 1
       $c = 4
Expect: [ [ '$matrix', '$r', '$c' ], [ [ [ 1,2 ], [ 3,4 ] ], 1, 4 ] ]

Input: @time = ("00:00", "23:55", "20:00")
Expect: [ [ "\@time" ], [ [ "00:00", "23:55", "20:00" ] ] ]

Input: @words = ("Hello","Alaska","Dad","Peace")
Expect: [ [ '@words' ], [ [ "Hello","Alaska","Dad","Peace" ] ] ]

Input: @list1 = ("Perl", "Raku", "Love")
       @list2 = ("Raku", "Perl", "Hate")
Expect: [ [ '@list1', '@list2' ], [ [ "Perl", "Raku", "Love" ], ["Raku", "Perl", "Hate" ] ] ]

Input: @accounts = [ ["A", "a1@a.com", "a2@a.com"],
                     ["B", "b1@b.com"],
                     ["A", "a3@a.com", "a1@a.com"] ]
                   ]
Expect: [ [ '@accounts' ], [ [ [ 'A', 'a1@a.com', 'a2@a.com' ], ['B', 'b1@b.com'], ['A', 'a3@a.com', 'a1@a.com'] ] ] ]

Input: $word = 'Perl' and @jump = (2,22,19,9)
Expect: [ [ '$word', '@jump' ], [ 'Perl', [ 2,22,19,9 ] ] ]

Input: @list = (1,2,3,5,1,2,7,6,3) and $size = 3
Expect: [ [ '@list', '$size' ], [ [ 1,2,3,5,1,2,7,6,3 ], 3 ] ]

Input: @routes = ([1,2,3], [4,5,6], [3,8,9], [7,8])
       $source = 1
       $destination = 7
Expect: [ [ '@routes', '$source', '$destination' ], [ [ [1,2,3], [4,5,6], [3,8,9], [7,8] ], 1, 7 ] ]

Input: @words = ('abc', 'xyz', 'tsu')
Expect: [ [ '@words' ], [ [ 'abc', 'xyz', 'tsu' ] ] ]

Input: @numbers = (1,0,0,0,1), $count = 1
Expect: [ [ '@numbers', '$count' ], [ [ 1,0,0,0,1 ], 1 ] ]

Input: @stickers = ('perl','raku','python'), $word = 'peon'
Expect: [ [ '@stickers', '$word' ], [ [ 'perl','raku','python' ], 'peon' ] ]

Input: $x = 3, $y = 4, @points ([1, 2], [3, 1], [2, 4], [2, 3])
Expect: [ [ '$x', '$y', '@points' ], [ 3, 4, [[1, 2], [3, 1], [2, 4], [2, 3]] ] ]

