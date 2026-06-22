#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 378 Task 1: Second Largest Digit
#
#       Perl solution by Matthias Muth.
#

use v5.36;
use List::Util qw( uniq );

sub second_largest_digit( $str ) {
    my @sorted_digits = sort { $b <=> $a } uniq $str =~ /\d/g;
    return $sorted_digits[1] // -1;
}

# Read test data from the accompanying '.json' file and run the tests.
# (Fixed boilerplate code, no changes needed.)

use Test2::V0 qw( -no_srand );
# Avoid messages about table width in case of test failures.
# (Term::Table::Util::term_size comes with Test2::V0.)
$ENV{TABLE_TERM_SIZE} //= Term::Table::Util::term_size() // 80;

# Look for the JSON file in the same directory as the script itself.
# Assuming that the script is in 'challenge-NNN/<user>/perl', also
# look in all peer directories (such as 'challenge-NNN/<user>/json-examples')
# and in the standard place 'challenge-NNN/examples/json'
# itself. Look in the ../* peer directories if the file is not found.
use JSON::PP qw( decode_json );
( my $json_file = $0 ) =~ s/\.pl$/.json/;
unless ( -f $json_file ) {
    require File::Basename;
    File::Basename->import();
    require File::Spec::Functions;
    File::Spec::Functions->import();
    my @other_files = glob(
        catfile( dirname( $json_file ), updir(), "*", basename( $json_file ) ) )
        or die "did not find a '$json_file' test data file\n";
    $json_file = $other_files[0];
}
my $json_text = do { local ( @ARGV, $/ ) = $json_file; <> }
    or die "could not read test data from '$json_file'\n";
note "using example test data from '$json_file'";
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

use Scalar::Util qw( blessed );
use Data::Dump qw( pp );

( my $sub_name = lc $json_data->{challenge}{name} ) =~ s/[^_a-z]+/_/g;
my @vars = @{ $json_data->{input_vars} };
for ( @{ $json_data->{examples} } ) {
    # Give the example text.
    my @input = @{ $_->{in} };
    my @output = @{ $_->{out} };
    note "$_->{name}:\n";
    note "    Input: ",
        join( ", ",
            map pp( $input[$_] ), 0..$#input ), "\n";
    note "    Output: ",
        join( ", ",
            map ref $output[$_] ? lc $output[$_]->name() : pp( $output[$_] ),
                0..$#output ), "\n";

    # Run the test, calling the subroutine by its generated name.
    no strict 'refs';
    is [ "::$sub_name"->( @{ $_->{in} } ) ], $_->{out}, $_->{name};
}
done_testing;
