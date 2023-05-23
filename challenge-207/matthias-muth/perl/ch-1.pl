#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 207 Task 1: Keyboard Word
#
#       Perl solution by Matthias Muth.
#

use strict;
use warnings;
use feature 'say';

use lib '.';
use TestExtractor;

sub keyboard_word {
    return grep /^( [qwertyuiop]* | [asdfghjkl]* | [zxcvbnm]* )$/xi, @_;
}

run_tests;
