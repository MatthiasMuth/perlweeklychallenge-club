#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       The Test Data Extraction Machine (tm).
#
#       Perl solution by Matthias Muth.
#

use strict;
use warnings;
use feature 'say';
use feature 'signatures';
no warnings 'experimental::signatures';

package TestExtractor;
use Exporter 'import';
our @EXPORT = qw( run_tests $verbose %options );

use Data::Dump qw( pp );
use Getopt::Long;
use Cwd qw( abs_path );
use File::Basename;
use Test2::V0;
no warnings 'experimental::signatures';

our ( $verbose, %options );

sub run_tests {

    $| = 1;

    GetOptions(
        "v|verbose!" => \$verbose,
    ) or do { say "usage!"; exit 2 };

    my $dir = dirname abs_path $0;
    my ( $challenge_no, $task_no ) =
        abs_path( $0 ) =~ m{challenge-(\d+) .* (\d+)[^[/\\]*$}x;
    unless ( $challenge_no && $task_no ) {
        say STDERR "ERROR: ",
            "Cannot determine challenge number or task number. Exiting.";
        exit 1;
    }

    no warnings 'once';
    my ( undef, $local_tests ) = read_tests( *::DATA );
    use warnings 'once';
    my ( $task, $challenge_examples ) =
        read_tests( "$dir/challenge.txt", $task_no );
    my @tests = ( @$local_tests, @$challenge_examples );
    # say pp @tests;

    ( my $test_object = lc $task ) =~ s/\W+/_/g;
    my $test_sub = \&{"::$test_object"};

    do {
        is $test_sub->( @{$_->{INPUT}} ),
            @{$_->{OUTPUT}} > 1 ? @{$_->{OUTPUT}} : $_->{OUTPUT}[0],
            "$_->{TEST}: $test_object( " . pp( @{$_->{INPUT}} ) . " ) == "
            . pp( @{$_->{OUTPUT}} );
    } for @tests;

    done_testing;
}

sub read_tests( $fd_or_filename, $wanted_task_no = undef ) {

    my $fd;
    if ( ref \$fd_or_filename eq 'SCALAR' ) {
        open $fd, "<", $fd_or_filename
            or die "ERROR: cannot open '$fd_or_filename': $!\n";
    }
    else {
        # non-SCALARs, like __DATA__ GLOB.
        $fd = $fd_or_filename;
    }

    my @tests;
    my ( $task_no, $task ) = ( -1, undef );
    while ( <$fd> ) {
        chomp $_;

        /^Task (\d+):\s*(.*?)\s*$/ and do {
            $task_no = $1;
            $task = $2
                if $wanted_task_no && $task_no == $wanted_task_no;
            next;
        };

        next
            unless ! $wanted_task_no || $task_no == $wanted_task_no;

        /^((?:Example|Test).*?)\W*$/ and do {
            push @tests, { TEST => $1 };
            next;
        };

        /^Input: / and do {
            /\@\w+ = \(\s*(.*?)\s*[,]?\)/ and do {
                my @list = map { s/'(.*?)'/$1/; $_ } split /, ?/, $1;
                push @{$tests[-1]{INPUT}}, [ @list ];
            };
            /\$\w+ = (?:'(.*?)'|(\d+))/ and do {
                push @{$tests[-1]{INPUT}}, $1 // $2;
            };
            next;
        };

        /^Output: (.*)/ and do {
            my $expected = $1;
            /\(\s*(.*?)\s*[,]?\)/ and do {
                my @list = map { s/'(.*?)'/$1/; $_ } split /, ?/, $1;
                push @{$tests[-1]{OUTPUT}}, [ @list ];
                next;
            };
            push @{$tests[-1]{OUTPUT}}, $expected;
            next;
        };
    }
    return $task, \@tests;
}

1;
