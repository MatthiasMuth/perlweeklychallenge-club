#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 254 Task 1: Three Power
#
#       Perl solution by Matthias Muth.
#

use v5.20;
use warnings;
use experimental 'signatures';

our $verbose = $ENV{VERBOSE};
sub vsay { say @_ if $verbose }

sub three_power( $n ) {
    vsay "three_power( $n )";
    return 1 if $n == 0;
    my $i = 1;
    my $cubed;
    do { 
	$i = int( ( 2 * $i + ( $n / ( $i * $i ) ) ) / 3 );
    } until ( $cubed = $i ** 3 ) <= $n;
    return $cubed == $n;
}

use Getopt::Long;
GetOptions( "v!" => \$verbose ) or die "Usage!\n";

use Test2::V0 qw( -no_srand );
ok three_power( 0 ),
    'Test 0: three_power( 0 ) is true',
    'test: three_power( 0 ) is true';
ok three_power( 1 ),
    'Test 1: three_power( 1 ) is true',
    'test: three_power( 1 ) is true';
ok ! three_power( 2 ),
    'Test 2: three_power( 2 ) is false',
    'test: three_power( 2 ) is false';
ok ! three_power( 7 ),
    'Test 7: three_power( 7 ) is false',
    'test: three_power( 7 ) is false';
ok three_power( 8 ),
    'Test 8: three_power( 8 ) is true',
    'test: three_power( 8 ) is true';
ok ! three_power( 9 ),
    'Test 9: three_power( 9 ) is false',
    'test: three_power( 9 ) is false';
ok three_power( 27 ),
    'Example 1: three_power( 27 ) is true',
    'test: three_power( 27 ) is true';
ok three_power( 0 ),
    'Example 2: three_power( 0 ) is true',
    'test: three_power( 0 ) is true';
ok ! three_power( 6 ),
    'Example 3: three_power( 6 ) is false',
    'test: three_power( 6 ) is false';
done_testing;


__DATA__

Test 0:
Input: $n = 0
Output: true

Test 1:
Input: $n = 1
Output: true

Test 2:
Input: $n = 2
Output: false

Test 7:
Input: $n = 7
Output: false

Test 8:
Input: $n = 8
Output: true

Test 9:
Input: $n = 9
Output: false
