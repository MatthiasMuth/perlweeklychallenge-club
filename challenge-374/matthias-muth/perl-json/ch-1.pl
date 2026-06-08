#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 374 Task 1: Count Vowel
#
#       Perl solution by Matthias Muth.
#

use v5.36;
use builtin qw( indexed );
use List::Util qw( max );

sub count_vowel( $str ) {
    # First, split the string into separate sequences of vowel only strings.
    my @vowel_strings = split " ", ( lc $str ) =~ s/[^aeiou]/ /gr;

    my @results;
    # For each of the vowel strings, find the correct vowel substrings.
    for my $vowel_string ( @vowel_strings ) {
        # Separate the vowel string into an array of characters.
        my @a = split "", $vowel_string;
        # For each vowel, create an ordered list of all its positions in the
        # string.
        my %positions;
        push $positions{ $a[$_] }->@*, $_
            for keys @a;
        # Now we move from left to right.
        # If we have available positions for all five vowels,
        # there is at least one valid substring.
        next if %positions < 5;
        # Starting from the beginning of the string, we can use all positions
        # as starting positions, as long as all five vowels are still
        # available.
        for my $start_pos ( keys @a ) {
            # A valid substring has to include all vowels.
            # If it includes the first occurrence of the vowel that is furthest
            # away, it will automatically include all the others.
            # That means that all valid substrings have to include at least that
            # position. They also can be longer than that, up to the end of the
            # complete string.
            my $first_end_pos = max( map $_->[0], values %positions );
            push @results,
                map { join "", @a[ $start_pos .. $_ ] } $first_end_pos .. $#a;
            # Remove the current vowel's position now that it was used.
            shift $positions{ $a[$start_pos] }->@*;
            # If this was the last available position for this vowel, there
            # cannot be any more valid substrings within this vowel string,
            # and we can shortcut the loop.
            last if $positions{ $a[$start_pos] }->@* == 0;
        }
    }
    return @results;
}

sub count_vowel_substr( $str ) {
    my @results;
    for my $vowel_string ( split " ", ( lc $str ) =~ s/[^aeiou]/ /gr ) {
        my $string_end = length( $vowel_string ) - 1;
        my %positions;
        push $positions{ substr( $vowel_string, $_, 1 ) }->@*, $_
            for 0..$string_end;
        next if %positions < 5;
        for my $current_pos ( 0..$string_end ) {
            my $current_vowel = substr( $vowel_string, $current_pos, 1 );
            my $fifth_vowel_pos = max( map $_->[0], values %positions );
            push @results, map {
                    substr( $vowel_string, $current_pos, $_ - $current_pos + 1 )
                } $fifth_vowel_pos .. $string_end;
            shift $positions{$current_vowel}->@*;
            last if $positions{$current_vowel}->@* == 0;
        }
    }
    return @results;
}

# use Test2::V0 qw( -no_srand );

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
