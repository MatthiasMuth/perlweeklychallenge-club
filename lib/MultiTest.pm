#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       MultiTest.pm - run tests and/or a benchmark
#                      for multiple implementations
#

use v5.36;
use builtin qw( true false );

package MultiTest;
use parent 'Exporter';

use Test2::V0 qw( -no_srand );

our @EXPORT    = (
    @Test2::V0::EXPORT,
    qw( run run_tests run_benchmarks ),
);

use List::Util qw( all );
use Dsay;

# Accept --tests and --benchmark command line options
# (which can be abbreviated to -t and -b, respectively).
# The default is to run tests only (equivalent to --tests --nobenchmark).
# If --benchmark is given, --tests has to be given explicitly if you also
# want to run tests. In that case, the tests will be run first, and the
# benchmark will only be run if the tests succeed.
# TODO: Write some pod for usage.
use Getopt::Long qw( :config auto_abbrev );
use Carp;

my ( $do_tests, $do_benchmark, @tests_to_run_patterns );

sub get_options() {
    state $done = false;
    return if $done;

    GetOptions(
        "benchmark!" => \$do_benchmark,
        "tests!"     => \$do_tests,
        "example=s" =>
            sub {
                push @tests_to_run_patterns, qr/^Example $_\b/
                    for split /,|\s+/, $_[1];
            },
        "own-tests|ot=s" =>
            sub {
                push @tests_to_run_patterns, qr/Test.*\b$_\b/i
                    for split /,|\s+/, $_[1];
            },
    ) or die "Usage!\n";

    $do_tests //= ! $do_benchmark;
    Getopt::Long::Configure( "default" );

    dsay "tests_to_run_patterns: ", pp @tests_to_run_patterns
        if @tests_to_run_patterns;

    $done = true;
}

sub run( $sub_base_name, $tests, $benchmark_params = undef ) {
    get_options;

    # Run the tests and/or the benchmark, depending on the command line options.
    # If tests are run, run the benchmark only if the tests succeed.
    ! $do_tests || run_tests( $sub_base_name, $tests->@* )
        and $do_benchmark && run_benchmark( $sub_base_name, $benchmark_params );
}

sub run_tests( $sub_base_name, @tests ) {
    get_options;

    # This runs the tests not only for the sub named "$sub_base_name",
    # but also for all variants with any suffix ("$sub_base_name<suffix>").

    use constant HAS_DATA_DUMP =>
        defined eval { require Data::Dump and Data::Dump->import( 'pp' ); 1 };
    note "\n",
        "Please install Data::Dump from CPAN for nicer test result output.",
        "\n"
        unless HAS_DATA_DUMP;

    # Avoid messages about table width in case of test failures.
    my $term_size = $ENV{TABLE_TERM_SIZE}
        //= Term::Table::Util::term_size() // 80;

    my @sub_names = sort grep /^${sub_base_name}/, keys %::;
    my $single_input = all { ref $_->[1] ne "ARRAY" } @tests;
    my $single_output = all { ref $_->[2] ne "ARRAY" } @tests;
    # note "single_input: ", qw( no yes )[$single_input];
    # note "single_output: ", qw( no yes )[$single_output];

    # Reduce the list of tests if -example or -own were given.
    if ( @tests_to_run_patterns ) {
        my $pattern = join "|", @tests_to_run_patterns;
        @tests = grep { $_->[0] =~ /$pattern/ } @tests;
    }

    for my $sub ( @sub_names ) {
        note "\n", "Testing $sub:\n", "\n"
            if @sub_names > 1;
        for ( @tests ) {
            my ( $test, $input, $expected ) = $_->@*;
            my $descr = $test;
            if ( HAS_DATA_DUMP ) {
                $descr .= " $sub"
                    . "( " . ( pp( $input->@* ) =~ s/^\((.*?)\)$/$1/r ) . " )"
                    . "\n    "
                    . "=> " . pp( $expected->@* )
                    if HAS_DATA_DUMP && substr( $descr, -1, 1 ) eq ":";
                $descr =~ s/\n   (?= =>)//
                    if length( $descr ) - length( "\n   " ) <= $term_size - 8;
            }
            else {
                $descr =~ s/:$//;
            }
            no strict 'refs';
            $input = [ $input ]
                if $single_input;
            my $output =
                $single_output
                ? "::$sub"->( $input->@* )
                : [ "::$sub"->( $input->@* ) ];
            use Scalar::Util qw( blessed );
            is $output, $expected, $descr
                or HAS_DATA_DUMP && do {
                    note "input:    ", pp( $input->@* );
                    note "expected: ",
                        blessed $expected && $expected->{name}
                        || pp $expected;
                    note "got:      ", pp( $output );
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
