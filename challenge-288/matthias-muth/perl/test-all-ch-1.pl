#!/usr/bin/env perl

use v5.36;

# Read the source file, remove testing code, and eval the rest.
my $source_file = "ch-1.pl";
my $code = do { local ( @ARGV, $/ ) = $source_file; <> }
    =~ s/^use Test2::V0.*//msr;
# Make sure we get a non-zero value back from the eval in case of success.
eval $code . "1;"
    or die "Can't parse $source_file:\n$@\n";

use Test2::V0 qw( -no_srand );
use Data::Dump qw( pp );

my $sub_name = "closest_palindrome";
my @tests = (
    [ 'Example 1:', 123, 121 ],
    [ 'Example 2:', 2, 1 ],
    [ 'Example 3:', 1400, 1441 ],
    [ 'Example 4:', 1001, 999 ],
    [ 'Extra 1:', 1, 0 ],
    [ 'Extra 1:', 0, 1 ],
    [ 'Extra 2:', -5, 0 ],
    [ 'Extra 3:', 9999, 10001 ],
    [ 'Extra 4:', 10001, 9999 ],
    [ 'Extra 5:', 99999, 100001 ],
    [ 'Extra 6:', 100001, 99999 ],
    [ 'Extra 7:', 345678, 345543 ],
);

sub run_test( $sub, $descr, $input, $output ) {
    if ( ! ref $output && $output =~ /^(?:(true)|false)$/i ) {
        my $expected_true = $1;
        $descr .=
            " $sub( " . join( ", ", map pp( $_ ), $input->@* ) . " )"
            . " is $output"
            if substr( $descr, -1, 1 ) eq ":";
        no strict 'refs';
        $expected_true
        ? ok $sub->( $input ), $descr
        : ok ! $sub->( $input ), $descr;
    }
    else {
        $descr .= " " . pp( $input ) . " => $output"
            if substr( $descr, -1, 1 ) eq ":";
        no strict 'refs';
        is $sub->( $input ), $output, $descr;
    }
}

# This runs the tests not only for the sub named "$sub_name",
# but also for all variants with any suffix ("$subname<suffix>").
for my $sub ( sort grep /^${sub_name}/, keys %:: ) {
    note "\n", "Testing $sub:\n", "\n";
    run_test( $sub, $_->@* )
        for @tests;
}

done_testing;
