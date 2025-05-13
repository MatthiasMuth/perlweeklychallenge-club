# Task 1 of the Weekly Challenge 320
# https://theweeklychallenge.org/blog/perl-weekly-challenge-320/#TASK1

my @ints = -3, -2, -1, 1, 2, 3; # 3
# my @ints = -2, -1, 0, 0, 1; # 2
# my @ints = 1, 2, 3, 4; # 4

my @pos = @ints.grep: * > 0;
my @neg = @ints.grep: * < 0;

say max(@pos.elems, @neg.elems);
