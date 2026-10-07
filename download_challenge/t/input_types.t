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

my %tests_to_run;
GetOptions(
    "v|verbose!" => \$TestExtractor::verbose,
    "run:s"      =>
        sub {
            while ( $_[1] =~ /(\d+)\s*-s*(\d+)|(\d+)/g ) {
                $tests_to_run{$_} = 1
                    for $1 ? ( $1..$2 ) : $3;
            }
        },
) or do { say "usage!"; exit 2 };

my $last_test_to_run = %tests_to_run ? max( keys %tests_to_run ) : undef;

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
    /^Input:\s*(.*)$/ and do {
	my $test = "Test " . ++$test_no;
        push @tests, {
	    TEST => $test,
	    INPUT => $1,
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

my $sep_line = "";
for ( @tests ) {
    SKIP: {
        if ( %tests_to_run ) {
            next SKIP unless $_->{TEST};
            ( my $test_no ) = $_->{TEST} =~ /(\d+)/;
            if ( $test_no > $last_test_to_run ) {
                done_testing;
                exit 0;
            }
            $sep_line = "\n";
            skip unless $tests_to_run{$test_no};
        }

        if ( $_->{COMMENT} ) {
            note $_
                for "", $_->{COMMENT}, "";
            next;
        }

        my $expected = eval $_->{EXPECTED};
        $verbose and do {
            $sep_line and vsay ""; $sep_line = "\n";
            note "input: ", pp( $_->{INPUT} ), "\n",
                "expected: ", pp( $expected ), "\n\n";
        };

        0 and vsay "passing in <",
                "$_->{TEST}\nInput: \$dummy = \"dummy\"\n",
                "Output: $_->{OUTPUT}", ">";
        my @extracted = TestExtractor::extract_tests(
                "$_->{TEST}\n"
                . "Input: $_->{INPUT}\n"
                . "Output: none\n" );
        $verbose and note "extracted:", pp \@extracted;

        my $source = delete $_->{SOURCE};
        is [ $extracted[0]{VARIABLE_NAMES}, $extracted[0]{INPUT} ],
            $expected,
            $_->{TEST},
            $source ? "$_->{TEST}, defined in $source:\n" : (),
            $_->{INPUT},
            "  => " . $_->{EXPECTED},
            "extracted variable names: $extracted[0]{VARIABLE_NAMES}->@*\n",
            "extracted input data:     " . pp( $extracted[0]{INPUT} );
    }
}

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

Input: @seq = qw(a c ? g i)
Expect: [ [ '@seq' ], [ [ "a", "c", "?", "g", "i" ] ] ]

# Strings containing special characters.
Input: $str = "you're given\nthe job"
Expect: [ [ '$str' ], [ "you're given\nthe job" ] ]

Input: $str = "this: (parenthesized) [bracketed] end"
Expect: [ [ '$str' ], [ "this: (parenthesized) [bracketed] end" ] ]

Input: $str = "my $variable"
Expect: [ [ '$str' ], [ 'my $variable' ] ]

Input: $str = "my @variable"
Expect: [ [ '$str' ], [ 'my @variable' ] ]

Input: @matrix = ([1, 2, 3], [2, 3, 4], [3, 4, 1], [4, 1, 2])
Expect: [ [ '@matrix' ], [ [1, 2, 3], [2, 3, 4], [3, 4, 1], [4, 1, 2] ] ]

Input: @seq = qw( 123 abc )
Expect: [ [ '@seq' ], [ [ "123", "abc" ] ] ]
