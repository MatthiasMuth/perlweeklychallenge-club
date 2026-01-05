#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 354 Task 2: Shift Grid
#
#       Perl solution by Matthias Muth.
#

use v5.36;

sub shift_grid( $matrix, $k ) {
    my @array = map $_->@*, $matrix->@*;
    unshift @array, splice( @array, -( $k % @array ) );
    my ( $i, $w ) = ( 0, scalar $matrix->[0]->@* );
    return map { $i += $w; [ @array[ $i - $w .. $i - 1 ] ] } keys $matrix->@*;
}

use List::MoreUtils qw( arrayify );

sub shift_grid_arrayify( $matrix, $k ) {
    my @array = arrayify $matrix;
    unshift @array, splice( @array, -( $k % @array ) );
    my ( $i, $w ) = ( 0, scalar $matrix->[0]->@* );
    return map { $i += $w; [ @array[ $i - $w .. $i - 1 ] ] } keys $matrix->@*;
}

my @tests = (
    [ 'Example 1',
        [ [[1, 2, 3], [4, 5, 6], [7, 8, 9]], 1 ],
        [ [9, 1, 2], [3, 4, 5], [6, 7, 8] ],
    ],
    [ 'Example 2',
        [ [[10, 20], [30, 40]], 1 ],
        [ [40, 10], [20, 30] ],
    ],
    [ 'Example 3',
        [ [[1, 2], [3, 4], [5, 6]], 1 ],
        [ [6, 1], [2, 3], [4, 5] ],
    ],
    [ 'Example 4',
        [ [[1, 2, 3], [4, 5, 6]], 5 ],
        [ [2, 3, 4], [5, 6, 1] ],
    ],
    [ 'Example 5',
        [ [[1 .. 4]], 1 ],
        [ [4, 1, 2, 3] ],
    ],
);

my $sub_base_name = "shift_grid";

use Getopt::Long;
my ( $do_tests, $do_benchmark );
GetOptions(
    "benchmark!", \$do_benchmark,
    "tests!",     \$do_tests,
) or die "Usage!\n!";
$do_tests //= ! $do_benchmark;

# Run the tests and/or the benchmark.
# If tests are run, run the benchmark only if the tests succeed.
! $do_tests || run_tests( $sub_base_name, @tests )
    and $do_benchmark && run_benchmark( $sub_base_name );

sub run_tests( $sub_base_name, @tests ) {
    # This runs the tests not only for the sub named "$sub_base_name",
    # but also for all variants with any suffix ("$sub_base_name<suffix>").
    use Test2::V0 qw( -no_srand );
    use Data::Dump qw( pp );
    my @sub_names = sort grep /^${sub_base_name}/, keys %::;
    for my $sub ( @sub_names ) {
        note "\n", "Testing $sub:\n", "\n";
        for ( @tests ) {
            my ( $descr, $input, $expected ) = $_->@*;
            $descr .= " $sub" . pp( $input->@* ) . " => "
                . pp $expected->@*
                if substr( $descr, -1, 1 ) eq ":";
            no strict 'refs';
            my $output = [ $sub->( $input->@* ) ];
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
    use Test2::API qw( context );
    my $ctx = context();
    my $hub = $ctx->hub;
    $ctx->release;
    return $hub->is_passing;
}

sub run_benchmark( $sub_base_name, @subs ) {
    use Benchmark qw( :all );
    #     srand( 0 );

    my ( $w, $h, $i ) = ( 4, 4, 1 );
    my $matrix = [ map { $i += $w; [ $i - $w .. $i - 1 ] } 1..$h ];
    my $k = 4;
    my @params = ( $matrix, $k );

    my @sub_names = sort grep /^${sub_base_name}/, keys %::;
    my %subs = map {
        my $id = s/^${sub_base_name}_*(.+)/$1/r;
        my $sub_name = $_;      # to get a closure.
        no strict 'refs';
        ( $id => sub { $sub_name->( @params ) } )
    } @sub_names;
    cmpthese( -1, \%subs );
}
