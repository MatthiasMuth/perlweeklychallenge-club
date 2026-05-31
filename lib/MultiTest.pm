#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       MultiTest.pm - run tests and/or a benchmark
#                      for multiple implementations
#

use v5.20;
use warnings;
use feature 'signatures';
no warnings 'experimental::signatures';

package MultiTest;
use parent 'Exporter';

our @EXPORT = (
    @Test2::V0::EXPORT,
    qw( run run_tests run_json_tests run_benchmarks ),
);

use Test2::V0 qw( -no_srand );
use List::Util qw( all );
use Dsay;

no warnings 'experimental::signatures';     # Have to repeat it after Test2::V0.

# Avoid messages about table width in case of test failures.
my $term_size = $ENV{TABLE_TERM_SIZE}
    //= Term::Table::Util::term_size() // 80;

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
    state $done = 0;
    return if $done;

    $options{USE_JSON} = $ENV{USE_JSON_TESTS};
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
        "json!" => \$options{USE_JSON},
    ) or die "Usage!\n";
    Getopt::Long::Configure( "default" );

    $do_tests //= ! $do_benchmark;

    dsay "tests_to_run_patterns: ", pp @tests_to_run_patterns
        if @tests_to_run_patterns;

    $done = 1;
}

sub run( $sub_base_name, $tests, $benchmark_params = undef ) {
    get_options;

    # Run the tests and/or the benchmark, depending on the command line options.
    # If tests are run, run the benchmark only if the tests succeed.
    ! $do_tests || run_tests( $sub_base_name, $tests->@* )
        and $do_benchmark && run_benchmark( $sub_base_name, $benchmark_params );
}

sub run_tests( $sub_base_name = undef, @tests ) {
    get_options;

    if ( $options{USE_JSON} || ! $sub_base_name ) {
        # We will generate the subroutine name and read the test data
        # from the .json file.
        # A subroutine name that was given may overrride the generated one.
        return run_json_tests( $sub_base_name );
    }

    # This runs the tests not only for the sub named "$sub_base_name",
    # but also for all variants with any suffix ("$sub_base_name<suffix>").

    use constant HAS_DATA_DUMP =>
        defined eval { require Data::Dump and Data::Dump->import( 'pp' ); 1 };
    note "\n",
        "Please install Data::Dump from CPAN for nicer test result output.",
        "\n"
        unless HAS_DATA_DUMP;

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

sub run_json_tests( $sub_name ) {
    # Load the JSON module only when needed.
    require JSON::PP;
    JSON::PP->import( 'decode_json' );

    # Read the test data from the JSON file.
    ( my $json_file = $0 ) =~ s/\.pl$/.json/;
    vsay "reading tests from $json_file";
    my $json_text = -f $json_file
        && do { local ( @ARGV, $/ ) = $json_file; <> }
        or die "could not read test data from '$json_file\n";
    my $json_data = decode_json( $json_text );

    for ( @{ $json_data->{examples} } ) {
        for ( @{ $_->{out} } ) {
            if ( ref $_ eq "JSON::PP::Boolean" ) {
                # Convert JSON true and false constants 
                # into Test2::V0::Compare T and F conditions. 
                $_ = $_ ? T : F;
            }
            elsif ( /^(?:(true)|(false))/i ) {
                # The same for strings "true" and "false"
                $_ = $1 ? T : F;
            }
        }
    }

    # Run the tests, calling the subroutine whose name is generated.
    ( $sub_name = lc $json_data->{challenge}{name} ) =~ s/[^_a-z]+/_/g
        unless defined $sub_name;
    no strict 'refs';
    do {
        %debug && dsay ":json", pp $_;
        is [ "::$sub_name"->( @{ $_->{in} } ) ], $_->{out}, $_->{name}
    } for @{ $json_data->{examples} };
    done_testing;
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
