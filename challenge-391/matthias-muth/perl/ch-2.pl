#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 391 Task 2: Arrange Box
#
#       Perl solution by Matthias Muth.
#

use v5.36;
use Dsay;

use List::Util qw( max );

no warnings 'recursion';
sub find_longest_fit( $boxes, $start ) {
    return max( 1,
        map 1 + find_longest_fit( $boxes, $_ ),
            grep {
                $boxes->[$_][0] > $boxes->[$start][0]
                    && $boxes->[$_][1] > $boxes->[$start][1]
            } $start + 1 .. $boxes->$#*
    );
}

use Memoize qw( memoize flush_cache );
if ( $debug{'NO_MEMOIZE'} ) {
    vsay "switching off memoizing";
}
else {
    memoize( 'find_longest_fit' );
}

sub arrange_box_recursive( @boxes ) {
    @boxes = sort { $a->[0] <=> $b->[0] || $a->[1] <=> $b->[1] } @boxes;
    # dsay pp @boxes;
    flush_cache( 'find_longest_fit' )
        unless $debug{'NO_MEMOIZE'};
    return max( map { find_longest_fit( \@boxes, $_ ) } keys @boxes );
}

sub arrange_box_loops ( @boxes ) {
    @boxes = sort { $a->[0] <=> $b->[0] || $a->[1] <=> $b->[1] } @boxes;
 
    my @path_lengths = map { 1 } keys @boxes;
    for my $start ( keys @boxes ) {
        %debug and dsay "start: box $start (", pp( $boxes[$start] ), "),",
            " path length $path_lengths[$start]";
        for my $next ( $start + 1 .. $#boxes ) {
            my $fits = $boxes[$next][0] > $boxes[$start][0]
                && $boxes[$next][1] > $boxes[$start][1];
            %debug and dprint "  box $next (", pp( $boxes[$next] ),
                ", path length $path_lengths[$next] )",
                $fits ? "fits" : "does not fit\n";
            next unless $fits;
            %debug and dsay
                $path_lengths[$start] + 1 > $path_lengths[$next]
                ? ( "updating path length to ", $path_lengths[$start] + 1 )
                : "no change to path length";
            $path_lengths[$next] = $path_lengths[$start] + 1
                if $path_lengths[$start] + 1 > $path_lengths[$next];
        }
    }
    return max( @path_lengths );
}

use lib qw( . ../../../lib );
use MultiTest;

my @tests = (
    [ "Example 1", [[1, 3], [3, 5], [6, 8], [2, 4]], 4 ],
    [ "Example 2", [[4, 5], [4, 6], [6, 7], [2, 3], [4, 3]], 3 ],
    [ "Example 3", [[5, 5], [5, 5], [5, 5]], 1 ],
    [ "Example 4", [[2, 100], [3, 200], [4, 300], [5, 50], [5, 400]], 4 ],
    [ "Example 5", [[10, 20], [15, 10], [20, 30], [12, 18], [16, 25]], 3 ],
);

use Test2::Plugin::SRand seed => 20260917;

sub create_ordered_boxes( $n ) {
    return map { [ $_, $_ ] } 1..$n; 
}

sub create_random_boxes( $n, $max_width, $max_height ) {
    my ( @boxes, %have );
    while ( @boxes < $n ) {
        my ( $w, $h ) = map { int rand( $_ ) + 1 } $max_width, $max_height;
        push @boxes, [ $w, $h ]
            unless $have{$w}{$h}++;
    }
    return @boxes;
}

my $i = 0;
push @tests, ( 
    ( map {
        [ sprintf( "Generated Test %02d (%d boxes)", ++$i, $_ ),
            [ create_ordered_boxes( $_ ) ], $_ ]
    } 4..30, 31, 100, 1000 ),
    ( map {
        [ sprintf( "Generated Test %02d (%d random boxes)", ++$i, $_->[0] ),
            [ create_random_boxes( $_->[0], $_->[0], $_->[0] ) ], $_->[1] ]
    } [ 1000, 62 ] ),
);

use Benchmark qw( :all :hireswallclock );

if ( $debug{RUNTIME} ) {
    timethese( 1, {
        map {
            my $test_id = $_;
            $tests[$test_id][0]
                . " (" . scalar( $tests[$test_id][1]->@* ) . " boxes)"
                => sub { arrange_box_recursive( $tests[$test_id][1]->@* ) }
        } keys @tests
    } );
    exit 0;
}

my @benchmark_data = ( $tests[-1][1]->@* );

run( "arrange_box", \@tests, \@benchmark_data );

__END__
is arrange_box( $_->[1]->@* ), $_->[2], $_->[0]
    for @tests;

done_testing;
