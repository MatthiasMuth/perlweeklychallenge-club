#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 372 Task 1: Rearrange Spaces
#
#       Perl solution by Matthias Muth.
#

use v5.36;

sub rearrange_spaces( $str ) {
    my @words = split " ", $str;
    my $n_gaps = scalar @words - 1;
    my $n_spaces = $str =~ tr/ //;
    my $gap_length = $n_gaps > 0 ? int( $n_spaces / $n_gaps ) : 0;
    my $n_trailing = $n_spaces - $n_gaps * $gap_length;
    return join( " " x $gap_length, @words ) . " " x $n_trailing;
}

# (No changes needed below!)

use Test2::V0 qw( -no_srand );
use File::JSON::Slurper qw( read_json );

# Read the test data from the JSON file.
my $json_file = $0 =~ s/\.pl$/.json/r;
my $json_data = -f $json_file && read_json( $json_file )
    or die "ERROR: could not read test data from '$json_file\n";

# Run the tests, calling the subroutine whose name is generated.
my $sub = lc( $json_data->{challenge}{name} ) =~ s/[^_a-z]+/_/gr;
no strict 'refs';
is [ $sub->( $_->{in}->@* ) ], $_->{out}, $_->{name}
    for $json_data->{examples}->@*;
done_testing;
