#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 349 Task 2: Meeting Point
#
#       Perl solution by Matthias Muth.
#

use v5.36;
use builtin qw( true false );

sub meeting_point_eq_if_then_else( $path ) {
    my ( $x, $y ) = ( 0, 0 );
    for ( split "", $path ) {
        $_ eq "U" ? ++$y :
        $_ eq "D" ? --$y :
        $_ eq "L" ? --$x :
        $_ eq "R" ? ++$x : ();
        return true
            if $x == 0 && $y == 0;
    }
    return false;
}

sub meeting_point_incr( $path ) {
    my ( $x, $y ) = ( 0, 0 );
    my %incr_x = ( U => 0,  D => 0,  L => -1, R => +1 );
    my %incr_y = ( U => +1, D => -1, L => 0,  R => 0  );
    for ( split "", $path ) {
        $x += $incr_x{$_};
        $y += $incr_y{$_};
        return true
            if $x == 0 && $y == 0;
    }
    return false;
}

sub meeting_point_my_subs( $path ) {
    my ( $x, $y ) = ( 0, 0 );
    state %move_subs = (
        U => sub { ++$y },
        D => sub { --$y },
        L => sub { --$x },
        R => sub { ++$x },
    );
    for ( split "", $path ) {
        $move_subs{$_}->();
        return true
            if $x == 0 && $y == 0;
    }
    return false;
}

sub meeting_point_state_subs( $path ) {
    my ( $x, $y ) = ( 0, 0 );
    state %move_subs = (
        U => sub { ++$_[1] },
        D => sub { --$_[1] },
        L => sub { --$_[0] },
        R => sub { ++$_[0] },
    );

    for ( split "", $path ) {
        $move_subs{$_}->( $x, $y );
        return true
            if $x == 0 && $y == 0;
    }
    return false;
}

*meeting_point = \&meeting_point_eq_if_then_else;
*meeting_point = \&meeting_point_state_subs;

use Test2::V0 qw( -no_srand );

is meeting_point( "ULD" ), F,
    'Example 1: meeting_point( "ULD" ) is false';
is meeting_point( "ULDR" ), T,
    'Example 2: meeting_point( "ULDR" ) is true';
is meeting_point( "UUURRRDDD" ), F,
    'Example 3: meeting_point( "UUURRRDDD" ) is false';
is meeting_point( "UURRRDDLLL" ), T,
    'Example 4: meeting_point( "UURRRDDLLL" ) is true';
is meeting_point( "RRUULLDDRRUU" ), T,
    'Example 5: meeting_point( "RRUULLDDRRUU" ) is true';

done_testing;

use Benchmark qw( :all );

my @dirs = split "", "UDLR";
my $test_data = join "", map $dirs[ rand( @dirs ) ], 1..10000;

cmpthese( -3, {
    eq_if_then_else => sub { meeting_point_eq_if_then_else( $test_data ) },
    incr            => sub { meeting_point_incr( $test_data ) },
    my_subs         => sub { meeting_point_my_subs( $test_data ) },
    state_subs      => sub { meeting_point_state_subs( $test_data ) },
} );
