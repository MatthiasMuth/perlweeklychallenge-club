#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 373 Task 2: List Division
#
#       Perl solution by Matthias Muth.
#

use v5.36;

sub list_division( $list, $n ) {
    return -1 unless $n > 0 && $list->@* >= $n;
    return map {
        [ splice $list->@*,
            0, int( $list->@* / $n ) + ( $list->@* % $n-- > 0 ), () ]
    } 1..$n;
}

# (No changes needed below!)

use Test2::V0 qw( -no_srand );
use JSON::Slurper qw( slurp_json );

# Read the test data from the JSON file.
( my $json_file = __FILE__ ) =~ s/\.pl$/.json/;
my $json_data = -f $json_file && slurp_json( $json_file )
    or die "ERROR: could not read test data from '$json_file\n";

# Adjust expected output "true" and "false" to be boolean values,
# checked with T and F (from Test2::V0::Compare).
for ( @{ $json_data->{examples} } ) {
    $_->{out} = [ $1 ? T : F ]
        if scalar @{ $_->{out} } == 1
            && $_->{out}[0] =~ /^(?:(true)|(false))/i;
}

# Run the tests, calling the subroutine whose name is generated.
( my $sub = lc $json_data->{challenge}{name} ) =~ s/[^_a-z]+/_/g;
no strict 'refs';
is [ $sub->( @{ $_->{in} } ) ], $_->{out}, $_->{name}
    for @{ $json_data->{examples} };
done_testing;
