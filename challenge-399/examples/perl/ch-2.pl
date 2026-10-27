#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 399 Task 2: Longest Absolute Path
#
#       Perl solution template.
#       Uses test data extracted from the challenge task examples
#       to test the solution during development.
#       (Template by Matthias Muth)
#

use v5.20;
use warnings;
use feature 'signatures';
no warnings 'experimental::signatures';

sub longest_absolute_path( $fs ) {
    my @results;
    return @results;
}

use Test2::V0 qw( -no_srand );

my @tests = (
    [ "Example 1", "dir\n\tsubdir1\n\t\tsubsubdir1\n\tsubdir2", 0 ],
    [ "Example 2", "file1.txt\nfile2.ext\na.png", 9 ],
    [ "Example 3",
        "my documents\n\tproject v1.0\n\t\tnotes v1.txt\n\timage.png",
        36 ],
    [ "Example 4", "root\n\ta\n\t\tb\n\t\t\tc.txt\n\td\n\t\te.txt", 14 ],
    [ "Example 5",
        "a\n\tb\n\t\tc\n\t\t\td\n\t\t\t\te.txt\n\tvery_long_directory_name\n\t\tf.txt",
        32 ],
);

is longest_absolute_path( $_->[1] ), $_->[2], $_->[0]
    for @tests;

done_testing;
