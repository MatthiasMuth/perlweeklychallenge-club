#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 234 Task 1: Common Characters
#
#       Perl solution by Matthias Muth.
#
#	Call this script using
#	    $ ch-1.pl
#	or
#	    $ ch-1.pl -v
#	to get more output.
#

use v5.20;
use strict;
use warnings;
use feature 'signatures';
no warnings 'experimental::signatures';

use lib '.';
use TestExtractor;

use List::Util qw( all );

sub char_freqs( $word ) {
    # Return an anonymous hash containing the frequencies of the characters
    # in $word.
    # Example:
    #    char_freqs( "coffee" )
    #    returns { "c" => 1, "e" => 2, "f" => 2, "o" => 1 }.

    my %freqs;
    ++$freqs{$_}
	for split //, $word;
    return \%freqs;
}

sub common_characters( @words ) {
    # Prepare the number of available characters for each word.
    my @available_chars = map char_freqs( $_ ), @words;
    vsay pp \@available_chars;

    # For each possible result character (cannot be more than the characters
    # in $word[0]) check whether all words have at least one of that character
    # available. Decrease its availability count in each word.
    return
	grep {
	    my $char = $_;
	    all { ( $available_chars[$_]{$char}-- // 0 ) > 0 } 1..$#words
	} split //, $words[0];
}

sub common_characters_2( @words ) {
    my @sorted_words = map join( "", sort split //, $_ ), @words;
    my $result = $sorted_words[0];
    for ( @sorted_words[1..$#sorted_words] ) {
	my $re = join " ", map "(?(?!$_)[a-$_])* ($_?)", split //, $result;
	$re = qr/^$re/x;
	$result = join "", /^$re/x;
    }
    return split //, $result;
}

run_tests;
