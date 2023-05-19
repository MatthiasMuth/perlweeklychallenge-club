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
our @EXPORT = qw( run_tests $verbose %options vsay pp );

use Data::Dump qw( pp );
use Getopt::Long;
use Cwd qw( abs_path );
use File::Basename;
use Test2::V0;
no warnings 'experimental::signatures';

our ( $verbose, %options );
sub vsay { say @_ if $verbose };

sub run_tests {

    $| = 1;

    GetOptions(
        "v|verbose!" => \$verbose,
    ) or do { say "usage!"; exit 2 };

    my $dir = dirname abs_path $0;
    my ( $challenge, $task ) =
        abs_path( $0 ) =~ m{challenge-(\d+) .* (\d+)[^[/\\]*$}x;
    unless ( $challenge && $task ) {
        say STDERR "ERROR: ",
            "Cannot determine challenge number or task number. Exiting.";
        exit 1;
    }

    no warnings 'once';
    my ( undef, $local_tests ) = read_task( *::DATA );
    # vsay pp( $local_tests );
    use warnings 'once';

    my ( $task_title, $task_description ) =
        read_task( "$dir/challenge-${challenge}.txt", $task );
    vsay $task_title;

    my @tests = (
        extract_tests( $local_tests ),
	extract_tests( $task_description ),
    );
    vsay pp( @tests );

    ( my $test_object = lc $task_title ) =~ s/\W+/_/g;
    my $test_sub = \&{"::$test_object"};

    do {
        is $test_sub->( @{$_->{INPUT}} ),
	    ref $_->{OUTPUT} eq 'ARRAY' ? @{$_->{OUTPUT}} : $_->{OUTPUT},
            "$_->{TEST}: $test_object( " . pp( @{$_->{INPUT}} ) . " ) == "
            . pp( $_->{OUTPUT} );
    } for @tests;

    done_testing;
}

sub read_task( $fd_or_filename, $wanted_task = undef ) {

    my $fd;
    if ( ref \$fd_or_filename eq 'SCALAR' ) {
        open $fd, "<", $fd_or_filename
            or die "ERROR: cannot open '$fd_or_filename': $!\n";
    }
    else {
        # non-SCALARs, like __DATA__ GLOB.
        $fd = $fd_or_filename;
    }

    my ( $task, $task_title, $task_text ) = ( -1, undef );
    while ( <$fd> ) {
        /^Task (\d+):\s*(.*?)\s*$/ and do {
            $task = $1;
            $task_title = $2
                if $wanted_task && $task == $wanted_task;
            next;
        };

        next
            if $wanted_task && $task != $wanted_task;

	$task_text .= $_;
    }

    # vsay "task title:", $task_title // "undef";
    # vsay "task text:\n", $task_text;
    return $task_title, $task_text;
}

sub extract_tests( $task_text ) {
    vsay "extract_tests( ", pp( $task_text ), " )";

    # These regular expressions are used for extracting input or output
    # test data.
    my $var_name  = qr/ [\@\$]\w+ /x;
    my $literal   = qr/ ".*?" | '.*?' | [+-]?\d+ /x;
    my $bracketed = qr/ \[ [^\[]*? \] /xs;
    my $entry     = qr/ $literal | $bracketed /x;
    my $list      = qr/ $entry (?: \s*,\s* $entry )* /xs;

    # The combination of what we expect as input or output data.
    # Capture unparenthesized lists for special handling.
    my $data_re = qr/ (?<lit>      $literal )
		    | (?<list>     \[ \s* (?:$list)? \s* \] )
		    | (?<no_paren> $list ) /x;

    my @tests;
    while ( $task_text =~
	/^((?:Example|Test).*?)\s*:?\s*$ .*?
	    ^Input: \s* ( .*? ) \s*
	    ^Output: \s* ( .*? ) \s*?$ (?=(?: ^$ | \Z ))
	/xmsg )
    {
	my ( $test, $input, $output) = ( $1, $2, $3 );
	vsay "decomposed: ", pp( $test, $input, $output );

	push @tests, { TEST => $test };

	for ( $input, $output ) {
	    # To avoid misinterpretations of '@' or '$' when the data is
	    # 'eval'ed, we turn all double quotes into single quotes.
	    s/"/'/g;

	    # We convert 'barewords' into quoted strings.
	    # We search for these patterns, but we just skip them without
	    # changing them:
	    #  * 'Input:', 'Output:' at the beginning of the string,
	    #  * quoted strings,
	    #  * variable names having a $ or @ sigil.
	    # After we are sure it's none of those, we also check unquoted
	    # 'barewords' (here: combinations of letters, digits or underscores,
	    # starting with a letter) and enclose them in single quotes.
	    my $bareword = qr/[a-z_][a-z0-9_]*/i;
	    while ( / ^Input: | ^Output: | '.*?' | [\$\@]$bareword
		    | ( $bareword ) /xg )
	    {
		if ( $1 ) {
		    my $p = pos();
		    substr $_, $p - length( $1 ), length( $1 ), "'$1'";
		    pos = $p + 2;
		}
	    }

	    # As all arrays will be stored as array references, so we just
	    # convert parentheses (...) to angle brackets [...].
	    s/\(/\[/g;
	    s/\)/\]/g;

	    # Add missing commas between literals.
	    while ( s/($literal)\s+($literal)/$1, $2/ ) {}
	}

	vsay "checking input <$input>";
	while ( $input =~ / ($var_name) \s* = \s* ($data_re) /xg ) {
	    # vsay "found: <$&>";
	    # vsay pp( \%+ );
	    push @{$tests[-1]{VARIABLE_NAMES}}, $1;
	    push @{$tests[-1]{INPUT}}, eval( $+{no_paren} ? "[ $2 ]" : $2 );
        };

	vsay "checking output <$output>";
	while ( $output =~ /^\s* ($data_re) $/xg ) {
	    vsay "found: <$&> \$1:<$1>";
	    vsay pp( \%+ );
	    $tests[-1]{OUTPUT} = eval( $+{no_paren} ? "[ $1 ]" : $1 );
        };
    }
    return @tests;
}

1;
