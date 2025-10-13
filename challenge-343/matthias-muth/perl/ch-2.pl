#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 343 Task 2: Champion Team
#
#       Perl solution by Matthias Muth.
#

use v5.36;

use List::Util qw( sum max reduce );

sub champion_team( $grid ) {
    my @scores = map sum( $_->@* ), $grid->@*;
    my $best_score = max( @scores );
    my @best_teams = grep { $scores[$_] == $best_score } keys @scores;
    return "Team " . reduce { $grid->[$a][$b] ? $a : $b } @best_teams;
}

use Test2::V0 qw( -no_srand );

is champion_team( [ [ 0, 1, 1, 1, 0, 0 ],
                    [ 0, 0, 1, 0, 1, 1 ],
                    [ 0, 0, 0, 0, 1, 1 ],
                    [ 0, 1, 1, 0, 1, 1 ],
                    [ 1, 0, 0, 0, 0, 0 ],
                    [ 1, 0, 0, 0, 1, 0 ] ] ),
    "Team 3",
    'Test 1: champion_team( <6x6 edge case matrix> ) == "Team 3"';

is champion_team( [[0, 1, 1], [0, 0, 1], [0, 0, 0]] ),
    "Team 0",
    'Example 1: champion_team( [[0, 1, 1], [0, 0, 1], [0, 0, 0]] ) == "Team 0"';
is champion_team( [[0, 1, 0, 0], [0, 0, 0, 0], [1, 1, 0, 0], [1, 1, 1, 0]] ),
    "Team 3",
    'Example 2: champion_team( [[0, 1, 0, 0], [0, 0, 0, 0], [1, 1, 0, 0],
        [1, 1, 1, 0]] ) == "Team 3"';
is champion_team( [[0, 1, 0, 1], [0, 0, 1, 1], [1, 0, 0, 0], [0, 0, 1, 0]] ),
    "Team 0",
    'Example 3: champion_team( [[0, 1, 0, 1], [0, 0, 1, 1], [1, 0, 0, 0],
        [0, 0, 1, 0]] ) == "Team 0"';
is champion_team( [[0, 1, 1], [0, 0, 0], [0, 1, 0]] ),
    "Team 0",
    'Example 4: champion_team( [[0, 1, 1], [0, 0, 0], [0, 1, 0]] ) == "Team 0"';
is champion_team( [ [0, 0, 0, 0, 0], [1, 0, 0, 0, 0], [1, 1, 0, 1, 1],
        [1, 1, 0, 0, 0], [1, 1, 0, 1, 0], ] ),
    "Team 2",
    'Example 5: champion_team( [ [0, 0, 0, 0, 0], [1, 0, 0, 0, 0],
        [1, 1, 0, 1, 1], [1, 1, 0, 0, 0], [1, 1, 0, 1, 0], ] ) == "Team 2"';

done_testing;


