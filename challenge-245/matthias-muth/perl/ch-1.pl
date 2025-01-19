#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 245 Task 1: Sort Language
#
#       Perl solution by Matthias Muth.
#

use v5.20;
use strict;
use warnings;
use feature 'signatures';
no warnings 'experimental::signatures';

use lib '.';
use TestExtractor;

sub sort_language( $lang, $popularity ) {
    return map $lang->[$_],
	sort { $popularity->[$a] <=> $popularity->[$b] } 
	    0..$lang->$#*;
}

run_tests;
