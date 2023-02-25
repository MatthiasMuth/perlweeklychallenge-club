#!/usr/bin/env perl

use v5.26;
use strict;
use warnings;

use Data::Dump 'pp';
use List::Util qw( reduce reductions uniq );

sub uniq1 {
    my %elements = map { ( $_ => 1 ) } @_;
    return keys %elements;
}

sub uniq2 {
    return reductions { $b != $a ? $b : () } @_;
}

sub uniq2a {
    return grep defined $_, reductions { $b != $a ? $b : undef } @_;
}

sub uniq3 {
    my $a_ref = reduce { [ @$a, ! @$a || $b != $a->[-1] ? $b : () ] } [], @_;
    return @$a_ref;
}

sub uniq4 {
    return uniq @_;
}

sub uniq5 {
    my @a;
    push @a, ! @a || $_ != $a[-1] ? $_ : ()
        for @_;
    return @a;
}

sub uniq6 {
    return unless @_;
    my @a = $_[0];
    push @a, $_[$_] != $a[-1] ? $_[$_] : ()
        for 1..$#_;
    return @a;
}

sub uniq7 {
    say "uniq7( @_ )";
    my %seen;
    return grep { ! $seen{$_}++ } @_;
}

sub third_highest {
    my @a = uniq reverse sort @_;
    return @a >= 3 ? $a[2] : $a[0];
}

my @uniq_tests = (
    [] => [],
    [ 3 ] => [ 3 ],
    [ 3, 4, 5 ] => [ 3, 4, 5 ],
    [ 5, 6 ] => [ 5, 6 ],
    [ 5, 4, 4, 4, 3, 3 ] => [ 5, 4, 3 ],
);
my %uniq_tests = ( @uniq_tests );
my @ordered_keys = grep $_ % 2 == 0, @uniq_tests;
for my $input ( @ordered_keys ) {
    my $expected = $uniq_tests{$input};
    say "@$input";
    say "uniq1:  ", join " ", map "<$_>", reverse( sort( uniq1( @$input ) ) );
    # say "uniq2:  ", join " ", map "<$_>", uniq2( @$input );
    # say "uniq2a: ", join " ", map "<$_>", uniq2a( @$input );
    say "uniq3:  ", join " ", map "<$_>", uniq3( @$input );
    say "uniq4:  ", join " ", map "<$_>", uniq4( @$input );
    say "uniq5:  ", join " ", map "<$_>", uniq5( @$input );
    say "uniq6:  ", join " ", map "<$_>", uniq6( @$input );
    say "uniq7:  ", join " ", map "<$_>", uniq7( @$input );
    say "";
}

use Test::More;

my @tests = (
    [ [],             undef ],
    [ [ 6 ],          6 ],
    [ [ 5, 3, 4 ],    3 ],
    [ [ 5, 6 ],       6 ],
    [ [ 5, 4, 4, 3 ], 3 ],
);

is third_highest( @{$_->[0]} ), $_->[1],
    "third_highest( @{$_->[0]} ) == " . ( $_->[1] // "undef" )
    for @tests;

done_testing;
