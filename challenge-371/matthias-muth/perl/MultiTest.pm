#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       MultiTest.pm - run tests and/or a benchmark
#                      for multiple implementations
#

use v5.36;

package MultiTest;
use parent 'Exporter';

use Test2::V0 qw( -no_srand );

our @EXPORT    = ( qw( run run_tests ), @Test2::V0::EXPORT );
our @EXPORT_OK = ( qw( run_benchmarks ), @Test2::V0::EXPORT_OK );

# Accept --tests and --benchmark command line options
# (which can be abbreviated to -t and -b, respectively).
# The default is to run tests only (equivalent to --tests --nobenchmark).
# If --benchmark is given, --tests has to be given explicitly if you also
# want to run tests. In that case, the tests will be run first, and the
# benchmark will only be run if the tests succeed.
my ( $do_tests, $do_benchmark );
use Getopt::Long qw( :config pass_through auto_abbrev );
GetOptions(
    "benchmark!", \$do_benchmark,
    "tests!",     \$do_tests,
) or die "Usage!\n!";
$do_tests //= ! $do_benchmark;
Getopt::Long::Configure( "default" );

sub run( $sub_base_name, $tests, $benchmark_params = undef ) {
    # Run the tests and/or the benchmark, depending on the command line options.
    # If tests are run, run the benchmark only if the tests succeed.
    ! $do_tests || run_tests( $sub_base_name, $tests->@* )
        and $do_benchmark && run_benchmark( $sub_base_name, $benchmark_params );
}

sub run_tests( $sub_base_name, @tests ) {
    # This runs the tests not only for the sub named "$sub_base_name",
    # but also for all variants with any suffix ("$sub_base_name<suffix>").
    use Data::Dump qw( pp );

    # Avoid messages about table width in case of test failures.
    use Term::Table::Util qw( term_size );
    my $term_size = ( $ENV{TABLE_TERM_SIZE} //= term_size() );

    my @sub_names = sort grep /^${sub_base_name}/, keys %::;
    for my $sub ( @sub_names ) {
        note "\n", "Testing $sub:\n", "\n";
        for ( @tests ) {
            my ( $test, $input, $expected ) = $_->@*;
            my $descr = $test;
            $descr .= " $sub"
                . "( " . ( pp( $input->@* ) =~ s/^\((.*?)\)$/$1/r ) . " )"
                . "\n    "
                . "=> " . pp $expected->@*
                if substr( $descr, -1, 1 ) eq ":";
            $descr =~ s/\n   (?= =>)//
                if length( $descr ) - length( "\n   " ) <= $term_size - 8;
            no strict 'refs';
            my $output = [ "::$sub"->( $input->@* ) ];
            is $output, $expected, $descr
                or do {
                    note "input:    ", pp $input->@*;
                    note "expected: ", pp $expected;
                    note "got:      ", pp $output;
                };
        }
    }
    done_testing;

    # Get the Test2 context and check for failures.
    my $ctx = context();
    my $hub = $ctx->hub;
    $ctx->release;
    return $hub->is_passing;
}

sub run_benchmark( $sub_base_name, $benchmark_params ) {
    use Benchmark qw( cmpthese );
    my @sub_names = sort grep /^${sub_base_name}/, keys %::;
    my %subs = map {
        my $id = s/^${sub_base_name}_*(.+)/$1/r;
        my $sub_name = $_;      # to get a closure.
        no strict 'refs';
        ( $id => sub { "::$sub_name"->( $benchmark_params->@* ) } )
    } @sub_names;
    cmpthese( -1, \%subs );
}

1;
