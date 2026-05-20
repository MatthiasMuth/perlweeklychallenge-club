#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 372 Task 2: Largest Substring
#
#       Perl solution by Matthias Muth.
#

use v5.20;
use warnings;
use experimental 'signatures';
no warnings 'experimental::signatures';

use List::Util qw( max );
sub largest_substring( $str ) {
    my %seq_start;
    return max(
        map $_ - ( $seq_start{ substr( $str, $_, 1 ) } //= $_ + 1 ),
            0 .. length( $str ) - 1
    ) // -1;
}

# (No changes needed below!)

# Read the test data from the JSON file.
use File::JSON::Slurper qw( read_json );
my $json_file = $0 =~ s/\.pl$/.json/r;
my $json_data = -f $json_file && read_json( $json_file )
    or die "ERROR: could not read test data from '$json_file\n";

# Run the tests, calling the subroutine whose name is generated.
use Test2::V0 qw( -no_srand );
no strict 'refs';
my $sub = lc( $json_data->{challenge}{name} ) =~ s/[^_a-z]+/_/gr;
is [ $sub->( @{ $_->{in} } ) ], $_->{out}, $_->{name}
    for @{ $json_data->{examples} };
done_testing;
