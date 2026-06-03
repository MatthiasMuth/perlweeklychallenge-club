#!/usr/bin/env perl

use v5.22;
use strict;
use warnings;
use feature 'say';
use feature 'signatures';
no warnings 'experimental::signatures';
use feature 'postderef_qq';
no warnings 'experimental::postderef';

use Data::Dump qw( pp );
use Test2::V0 qw( -no_srand );
$ENV{TABLE_TERM_SIZE} //= Term::Table::Util::term_size() // 80;

use lib qw( . .. );
use TestExtractor;

use Getopt::Long;
use List::Util qw( max );
use Dsay;

my %do_run;
GetOptions(
    "v|verbose!" => \$TestExtractor::verbose,
    "run:s"      =>
        sub {
            while ( $_[1] =~ /(\d+)\s*-s*(\d+)|(\d+)/g ) {
                $do_run{$_} = 1
                    for $1 ? ( $1..$2 ) : $3;
            }
        },
) or do { say "usage!"; exit 2 };

my $last_test_to_run = %do_run ? max( keys %do_run ) : undef;

my ( $test_no, @tests );
while ( <DATA> ) {
    /^\s*$/ and next;
    /^\s*\#\s*(.*?)\s*$/ and do {
        $tests[-1] && exists $tests[-1]{COMMENT}
            ? $tests[-1]{COMMENT} .= $1
            : push @tests, { COMMENT => $1 };
        next;
    };
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

for ( @tests ) {
    SKIP: {
        if ( %do_run ) {
            ( my $test_no ) = $_->{TEST} =~ /(\d+)/;
            if ( $test_no > $last_test_to_run ) {
                done_testing;
                exit 0;
            }
            skip unless $do_run{$test_no};
        }

        if ( $_->{COMMENT} ) {
            note $_
                for "", $_->{COMMENT}, "";
            next;
        }

        vsay "output: ", pp $_->{OUTPUT};
        0 and vsay "passing in <",
                "$_->{TEST}\nInput: \$dummy = 1\nOutput: $_->{OUTPUT}", ">";
        my @extracted = TestExtractor::extract_tests(
                "$_->{TEST}\nInput: \$dummy = 1\nOutput: $_->{OUTPUT}" );
        vsay "extracted:", pp \@extracted;

        0 && vsay "expected: ", pp( $_->{EXPECTED} );
        my $expected = eval $_->{EXPECTED};
        vsay "expected: ", pp $expected;

        # 48 characters = " => " + 2 x 22
        #               = " => " + 2 x "max 19..."
        my $descr = join " => ",
            map length > 22 ? substr( $_, 0, 19 ) . "..." : $_,
                $_->@{ qw( OUTPUT EXPECTED ) };
        is $extracted[0]{OUTPUT},
            $expected,
            $_->{TEST} . " " . $descr,
            pp( $_ ), "\n",
            "got data:\n", pp( $extracted[0]{OUTPUT} );
    }
    vsay "";
}

done_testing;

__DATA__

# Simple literals and lists of simple literals
Output: 1
Expect: [ 1 ]

Output: -4
Expect: [ -4 ]

Output: 2, 3
Expect: [ 2, 3 ]

# Parenthesized lists => arrayrefs
Output: ()
Expect: [ [] ]

Output: ( 11 )
Expect: [ [ 11 ] ]

Output: ( -44 )
Expect: [ [ -44 ] ]

Output: ( 22, 33 )
Expect: [ [ 22, 33 ] ]

Output: (1,2,3), (4,5,6), (7,8,9)
Expect: [ [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] ]

Output: ("A")
Expect: [ [ "A" ] ]

Output: ("Alaska","Dad")
Expect: [ [ "Alaska", "Dad" ] ]

# Bracketed lists => arrayrefs
Output: [ 1 ]
Expect: [ [ 1 ] ]

Output: [ 1 2 3 4 ]
Expect: [ [ 1, 2, 3, 4 ] ]

Output: [ [ 1, 2 ], [ 3, 4 ], [ 5, 6 ] ]
Expect: [ [ [ 1, 2 ], [ 3, 4 ], [ 5, 6 ] ] ]

Output: true
Expect: [ "true" ] # (Interpretation will vary for running tests or .json.)

Output: false
Expect: [ "false" ] # Interpretation will vary for running tests or .json.)

# Unquoted and single quoted strings
Output: Raku
Expect: [ "Raku" ]

Output: 'Perl'
Expect: [ "Perl" ]

Output: ('abcd')
Expect: [ [ "abcd" ] ]

Output: ('job', 'bjorg')
Expect: [ [ "job", "bjorg" ] ]

# Mixed types
Output: (G,4,B,S,5)
Expect: [ [ "G", 4, "B", "S", 5 ] ]

# Floating point
Output: 12.75
Expect: [ 12.75 ]

# Unparenthesized list of parenthesized lists
Output: (72,57), (89,55), (36,84), (10), (95), (99), (35)
Expect: [ [72,57], [89,55], [36,84], [10], [95], [99], [35] ]

# Parenthesized list of parenthesized lists (special case!)
Output: ( (72,57), (89,55), (36,84), (10), (95), (99), (35) )
Expect: [ [72,57], [89,55], [36,84], [10], [95], [99], [35] ]

Output: 1, 2, 3
Expect: [ 1, 2, 3 ]

Output: ( 1, 2, 3 )
Expect: [ [ 1, 2, 3 ]]

Output: [ 1, 2, 3 ]
Expect: [ [ 1, 2, 3 ] ]

Output: [1,2,3], [3,4,5]
Expect: [ [ 1, 2, 3 ], [ 3, 4, 5 ] ]

# Multi line list
Output: [ ["A", "a1@a.com", "a2@a.com"],
          ["A", "a3@a.com"],
          ["B", "b1@b.com", "b2@b.com"] ]
Expect: [ [ [ 'A', 'a1@a.com', 'a2@a.com' ], [ 'A', 'a3@a.com' ], [ 'B', 'b1@b.com', 'b2@b.com' ] ] ]
