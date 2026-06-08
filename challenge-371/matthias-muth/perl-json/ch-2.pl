#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 371 Task 2: Subset Equilibrium
#
#       Perl solution by Matthias Muth.
#

use v5.36;

use Algorithm::Combinatorics qw( subsets );
use List::Util qw( sum );

sub subset_equilibrium( @nums ) {
    # Pre-compute the difference between each element and its position
    # (using 1-based position numbers).
    # If the sum of elements is equal to the sum of their positions,
    # the sum of these differences must be zero.
    # We then need only one array for summing up, and only half the
    # number of additions.
    my @diffs = map $nums[$_] - ( $_ + 1 ), keys @nums;
    my @results;
    for my $subset_size ( 2 .. @nums - 1 ) {
        my $iter = subsets( [ keys @nums ], $subset_size );
        while ( my $indices = $iter->next ) {
            push @results, [ map $nums[$_], $indices->@* ]
                if sum( map $diffs[$_], $indices->@* ) == 0;
        }
    }
    return @results;
}

# Read test data from the accompanying 'ch-?.json' file and run the tests.
# (Fixed boilerplate code, no changes needed.)

use Test2::V0 qw( -no_srand );
# Avoid messages about table width in case of test failures.
# (Term::Table::Util::term_size comes with Test2::V0.)
$ENV{TABLE_TERM_SIZE} //= Term::Table::Util::term_size() // 80;

# Read the test data from the JSON file.
use JSON::PP qw( decode_json );
( my $json_file = $0 ) =~ s/\.pl$/.json/;
note "reading tests from $json_file";
my $json_text = -f $json_file
    && do { local ( @ARGV, $/ ) = $json_file; <> }
    or die "could not read test data from $json_file\n";
my $json_data = decode_json( $json_text );

# Convert any expected output strings "true" and "false"
# as well as JSON Boolean constants true and false
# into Test2::V0::Compare T and F conditions. 
for ( @{ $json_data->{examples} } ) {
    for ( @{ $_->{out} } ) {
        if ( /^(?:(true)|(false))$/i || ref $_ eq "JSON::PP::Boolean" ) {
            $_ = $1 ? T : $2 ? F : $_ ? T : F;
        }
    }
}

# Run the tests, calling the subroutine by its generated name.
( my $sub_name = lc $json_data->{challenge}{name} ) =~ s/[^_a-z]+/_/g;
no strict 'refs';
is [ "::$sub_name"->( @{ $_->{in} } ) ], $_->{out}, $_->{name}
    for @{ $json_data->{examples} };
done_testing;
