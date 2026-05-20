#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 372 Task 1: Rearrange Spaces
#
#       Perl solution by Matthias Muth.
#

use v5.10;
use strict;
use warnings;

sub rearrange_spaces {
    my ( $str ) = @_;
    my @words = split " ", $str;
    my $n_gaps = scalar @words - 1;
    my $n_spaces = $str =~ tr/ //;
    my $gap_length = $n_gaps > 0 ? int( $n_spaces / $n_gaps ) : 0;
    my $n_trailing = $n_spaces - $n_gaps * $gap_length;
    return join( " " x $gap_length, @words ) . " " x $n_trailing;
}

# (No changes needed below!)

use Test2::V0 qw( -no_srand );
use JSON::Slurper qw( slurp_json );

# Read the test data from the JSON file.
( my $json_file = __FILE__ ) =~ s/\.pl$/.json/;
my $json_data = -f $json_file && slurp_json( $json_file )
    or die "ERROR: could not read test data from '$json_file\n";

# Run the tests, calling the subroutine whose name is generated.
no strict 'refs';
( my $sub_name = lc $json_data->{challenge}{name} ) =~ s/[^_a-z]+/_/g;
is [ $sub_name->( @{ $_->{in} } ) ], $_->{out}, $_->{name}
    for @{ $json_data->{examples} };
done_testing;
