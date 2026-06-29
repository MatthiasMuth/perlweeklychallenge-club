#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 380 Task 2: Reverse Degree
#
#       Perl solution by Matthias Muth.
#

use v5.36;

sub reverse_degree( $str ) {
    my @results;
    return @results;
}

# Read test data from the accompanying '.json' file and run the tests.
# (Fixed boilerplate code, no changes needed.)

use Test2::V0 qw( -no_srand );
# Avoid messages about table width in case of test failures.
# (Term::Table::Util::term_size comes with Test2::V0.)
$ENV{TABLE_TERM_SIZE} //= Term::Table::Util::term_size() // 80;

# Look for the JSON file in the same directory as the script itself,
# or in all sibling directories (<dir>/../*) if necessary.
use JSON::PP qw( decode_json );
( my $json_file = $0 ) =~ s/\.pl$/.json/;
unless ( -f $json_file ) {
    require File::Basename;        File::Basename->import();
    require File::Spec::Functions; File::Spec::Functions->import();
    my @other_files = glob(
        catfile( dirname( $json_file ), updir(), "*", basename( $json_file ) ) )
        or die "did not find a '$json_file' test data file\n";
    $json_file = $other_files[0];
}

# Read the JSON file.
my $json_text = do { local ( @ARGV, $/ ) = $json_file; <> }
    or die "could not read test data from '$json_file'\n";
note "using test data from '$json_file'";
my $json_data = decode_json( $json_text );

# Convert any expected output strings "true" and "false"
# as well as JSON Boolean constants true and false
# into Test2::V0::Compare T and F conditions.
for ( @{ $json_data->{examples} } ) {
    for ( @{ $_->{out} } ) {
        if ( /^(?:(true)|(false))$/i || JSON::PP::is_bool( $_ ) ) {
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
