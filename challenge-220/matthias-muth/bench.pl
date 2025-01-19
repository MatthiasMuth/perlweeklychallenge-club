#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';

my $text = do { local ( @ARGV, $/ ) = <perl/challenge*.txt>; <> };

use Benchmark qw( cmpthese );

cmpthese( -3, {
    split => sub { my @a = split "", $text; scalar @a },
    reg   => sub { my @a = $text =~ /./g;   scalar @a },
} );

1;
