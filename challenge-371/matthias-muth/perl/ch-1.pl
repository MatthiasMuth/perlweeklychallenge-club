#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 371 Task 1: Missing Letter
#
#       Perl solution by Matthias Muth.
#

use v5.36;

=for comment
    incr0 = b-a or d-c
    incr1 = c-b or e-d
    
    question mark position  question mark is  op        used relative indexes  
    ( ? b c d e )                             addition not possible      
                               b - (d-c)      subtract  +1 +3 +2
                            (= b + c - d)     add       +1 +2 +3

    ( a ? c d e )              a + (d-c)      add       -1 +1 +2
                            or c - (e-d)      subtract  +1 +3 +2
                            (= c + d - e)     add       +1 +2 +3

    ( a b ? d e )              b + (e-d)      add       -1 +1 +2
                            or d - (b-a)      subtract  +1 -1 -2
                            (= d + a - b)     add       +1 -2 -1

    ( a b c ? e )              c + (b-a)      add       -1 -2 -3
                            or e - (c-b)      subtract  +1 -1 -2
                            (= e + b - c)     add       +1 -2 -1

    ( a b c d ? )              d + (c-b)      add       -1 -2 -1
                                              subtraction not possible

Possible strategy:
    if there are three numbers to the left: use them to add.
    else: if there are three numbers to the right: use them to subtract.
    else: use the two numbers to the right to add their diff to the
          number on the left.

=cut

sub missing_letter( @seq ) {
    my @nums = map ord, @seq;
    my $qm_index = ( grep $seq[$_] eq "?", keys @seq )[0];
    my ( $base, $add, $subtract ) =
        map $nums[ $qm_index + $_ ],
            # If we have three numbers to the left, do an add
            $qm_index >= 3         ? ( -1, -2, -3 ) :
            $qm_index <= $#nums - 3 ? ( +1, +2, +3 )
                                   : ( -1, +2, +1 );
    return chr( $base + $add - $subtract );
}

use Test2::V0 qw( -no_srand );

is missing_letter( qw(a c ? g i) ), "e",
    'Example 1: missing_letter( qw(a c ? g i) ) eq "e"';
is missing_letter( qw(a d ? j m) ), "g",
    'Example 2: missing_letter( qw(a d ? j m) ) eq "g"';
is missing_letter( qw(a e ? m q) ), "i",
    'Example 3: missing_letter( qw(a e ? m q) ) eq "i"';
is missing_letter( qw(a c f ? k) ), "h",
    'Example 4: missing_letter( qw(a c f ? k) ) eq "h"';
is missing_letter( qw(b e g ? l) ), "j",
    'Example 5: missing_letter( qw(b e g ? l) ) eq "j"';

done_testing;
