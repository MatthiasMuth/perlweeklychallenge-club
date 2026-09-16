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
memoize( 'find_longest_fit' )
    unless $debug{'NO_MEMOIZE'};

sub arrange_box( @boxes ) {
    @boxes = sort { $a->[0] <=> $b->[0] || $a->[1] <=> $b->[1] } @boxes;
    dsay pp @boxes;
    flush_cache( 'find_longest_fit' )
        unless $debug{'NO_MEMOIZE'};
    return max( map { find_longest_fit( \@boxes, $_ ) } keys @boxes );
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

sub create_boxes( $n, $max_width, $max_height ) {
    my ( @boxes, %have );
    while ( @boxes < $n ) {
        my ( $w, $h ) = map { int rand( $_ ) + 1 } $max_width, $max_height;
        push @boxes, [ $w, $h ]
            unless $have{$w}{$h}++;
    }
    return @boxes;
}

=head2 Box Matrix:

    10 |        [10,10] [5, 7]  
       +--------+-------+
     5 | [5, 7] | 
       +--------+-------+

sub show_box_matrix( @boxes ) {

    my $all
=cut

push @tests, ( 
    [ "Generated Test 1 (4 boxes)",   [ create_boxes( 4, 8, 8 ) ], 2 ],
    [ "Generated Test 2 (100 boxes)", [ create_boxes( 100, 100, 100 ) ], 15 ],
    [ "Generated Test 3 (1000 boxes)",
        [ create_boxes( 1000, 1000, 1000 ) ], 63 ],
);

run( "arrange_box", \@tests );

__END__
is arrange_box( $_->[1]->@* ), $_->[2], $_->[0]
    for @tests;

done_testing;
