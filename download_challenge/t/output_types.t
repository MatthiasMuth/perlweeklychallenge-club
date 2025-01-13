#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';
use feature 'signatures';
no warnings 'experimental::signatures';

use Data::Dump qw( pp );
use Test2::V0 ( -no_srand => 1 );

use lib qw( . .. );
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
    /^Output:\s*(.*)$/ and do {
	my $test = "Test " . ++$test_no . " (DATA line $.)";
        push @tests, {
	    TEST => $test,
	    OUTPUT => $1,
	};
	next;
    };
    /^(.*)$/ && @tests and do {
        $tests[-1]{OUTPUT} .= "\n" . $1;
	next;
    };
}

# say pp @tests;
# say "";

do {
    vsay "output: ", pp $_->{OUTPUT};
    0 and vsay "passing in <",
	    "$_->{TEST}\nInput: \$dummy = 1\nOutput: $_->{OUTPUT}", ">";
    my @extracted = TestExtractor::extract_tests(
	    "$_->{TEST}\nInput: \$dummy = 1\nOutput: $_->{OUTPUT}" );
    vsay "extracted:", pp \@extracted;

    0 && vsay "expected: ", pp( $_->{EXPECTED} );
    my $expected = eval $_->{EXPECTED};
    vsay "expected: ", pp $expected;
    is $extracted[0]{OUTPUT},
        $expected,
	$_->{TEST},
	pp( $_ ) . "\n" . pp( $extracted[0] );
    vsay "";
} for @tests;

done_testing;

__DATA__
Output: 1
Expect: [ 1 ]

Output: [ 1 2 3 4 ]
Expect: [ [ 1, 2, 3, 4 ] ]

Output: [ [ 1, 2 ], [ 3, 4 ], [ 5, 6 ] ]
Expect: [ [ [ 1, 2 ], [ 3, 4 ], [ 5, 6 ] ] ]

Output: ("Alaska","Dad")
Expect: [ "Alaska", "Dad" ]

Output: ()
Expect: []

Output: ("A")
Expect: [ "A" ]

Output: (2,3)
Expect: [ 2, 3 ]

Output: -1
Expect: [ -1 ]

Output: [ ["A", "a1@a.com", "a2@a.com"],
          ["A", "a3@a.com"],
          ["B", "b1@b.com", "b2@b.com"] ]
Expect: [ [ [ 'A', 'a1@a.com', 'a2@a.com' ], [ 'A', 'a3@a.com' ], [ 'B', 'b1@b.com', 'b2@b.com' ] ] ]

Output: (2, 3)
Expect: [ 2, 3 ]

Output: (-4)
Expect: [ -4 ]

Output: true
Expect: [ "true" ] # (Implement 'ok <call> ? <expected> : ! <expected>, <test>;'.

Output: false
Expect: [ "false" ] # (Implement 'ok <call> ? <expected> : ! <expected>, <test>;'.

Output: Raku
Expect: [ 'Raku' ]

Output: 'Perl'
Expect: [ "Perl" ]

Output: (1,2,3), (1,2,3), (5,6,7)
Expect: [ [ 1, 2, 3 ], [ 1, 2, 3 ], [ 5, 6, 7 ] ]

Output: (G,4,B,S,5)
Expect: [ "G", 4, "B", "S", 5 ]

Output: ('abcd')
Expect: [ "abcd" ]

Output: ('job', 'bjorg')
Expect: [ "job", "bjorg" ]

Output: 12.75
Expect: [ 12.75 ]
