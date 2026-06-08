#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 370 Task 2: Scramble String
#
#       Perl solution by Matthias Muth.
#

use v5.36;
use builtin qw( indexed true false );

use List::Util qw( any );

# sub scrambles( $str )
# Returns all possible scrambles for a string.
# Implemented for testing the 'is_reverse_scramble' subroutine.
sub scrambles( $str ) {
    return $str
        if length( $str ) == 1;
    my %results;
    for ( 1 .. length( $str ) - 1 ) {
        my @part1_scrambles = scrambles( substr( $str, 0, $_ ) );
        my @part2_scrambles = scrambles( substr( $str, $_ ) );
        for my $a ( @part1_scrambles ) {
            for my $b ( @part2_scrambles ) {
                ++$results{"$a$b"};
                ++$results{"$b$a"};
            }
        }
    }
    return keys %results;
}

# Challenge task solution v1.0 (brute force):
sub is_scramble( $str1, $str2 ) {
    return any { $_ eq $str2 } scrambles( $str1 );
}

# Challenge task solution v2.0 ('Reverse Scramble'):
sub is_reverse_scramble( $str1, $str2 ) {

    # Convert the strings into sequences of index numbers,
    # taking care of assigning different numbers to duplicate
    # characters.
    my %indexes;
    for my ( $index, $letter ) ( indexed split "", $str1 ) {
        push $indexes{$letter}->@*, $index;
    }

    # Create single number streaks.
    my @streaks =
        map [ shift $indexes{$_}->@* // return false ],
            split "", $str2;

    # Repetitively combine adjacent streaks if they form a contiguous
    # new streak.
    while ( @streaks > 1 ) {
        # Use a separate array for building the combined streaks,
        # because manipulating the @streaks array within the loop
        # is too dangerous.
        my @new_streaks = ( $streaks[0] );
        my $could_combine = false;
        for ( @streaks[ 1 .. $#streaks ] ) {
            if ( $_->[0] == $new_streaks[-1][-1] + 1 ) {
                # Combine in current order.
                $could_combine = true;
                push $new_streaks[-1]->@*, $_->@*;
            }
            elsif ( $new_streaks[-1][0] == $_->[-1] + 1 )
            {
                # Combine in exchanged order.
                $could_combine = true;
                unshift $new_streaks[-1]->@*, $_->@*;
            }
            else {
                # No combination.
                push @new_streaks, $_;
            }
        }
        # No combinations were possible. Return failure.
        return false
            if ! $could_combine;

        # Prepare the next iteration.
        @streaks = @new_streaks;
    }
    return true;
}

no warnings 'once';
*scramble_string = \&is_scramble;
*scramble_string_reverse = \&is_reverse_scramble;

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
