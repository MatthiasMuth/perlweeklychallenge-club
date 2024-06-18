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
our @EXPORT = qw(
    run_tests
    run_tests_for_subs
    $verbose %options vprint vsay
    done_testing
    pp np carp croak
);

use Data::Dump qw( pp );
use Data::Printer;
use Getopt::Long;
use Cwd qw( abs_path );
use File::Basename;
use List::Util qw( any );
use Carp;
use Test2::V0 qw( -no_srand );
use Carp;
no warnings 'experimental::signatures';

our ( $verbose, %options );
sub vprint { print @_ if $verbose };
sub vsay   { say   @_ if $verbose };

my $local_tests;	# Tests read from main's __DATA__ section.
			# Sort of 'memoizing' those tests, so we won't need to
			# read *DATA more than once.

sub extract_and_run_tests( $sub_name ) {

    $| = 1;

    GetOptions(
        "v|verbose!" => \$verbose,
        "g|generate!" => \$options{GENERATE},
    ) or do { say "usage!"; exit 2 };

    # 'Local' tests are read from main's __DATA__ section.
    # We are sort of 'memoizing' those tests, so we won't need to read *DATA
    # more than once.
    # Local tests are not linked to any task number (1 or 2).
    # We also won't get back a task description.
    ( undef, $local_tests ) = read_task( *::DATA, undef )
	if ! $local_tests && fileno *::DATA;

    # For extracting the tests from the challenge description, first get the
    # challenge number and the task number (1 or 2) from the script's path.
    my $dir = dirname abs_path $0;
    my ( $challenge, $task ) =
        abs_path( $0 ) =~ m{challenge-(\d+) .* (\d+)[^[/\\]*$}x;
    unless ( $challenge && $task ) {
        say STDERR "ERROR: ",
            "Cannot determine challenge number or task number. Exiting.";
        exit 1;
    }

    my ( $task_title, $task_description ) =
        read_task( "$dir/challenge-${challenge}.txt", $task );
	# vsay $task_title;

    my @tests = (
        $local_tests      ? extract_tests( $local_tests )      : (),
	$task_description ? extract_tests( $task_description ) : (),
    );
    # vsay pp( @tests );

    # If the name of the subroutine to call is not given as a parameter, we
    # generate it from the task title.
    ( $sub_name //= lc $task_title ) =~ s/\W+/_/g;
    my $sub = \&{"::$sub_name"};

    my $n_failures = 0;

    my @generated_code;
    for ( @tests ) {
        my @input_params =
	    @{$_->{INPUT}} == 1
	    ? ( ref $_->{INPUT}[0] eq 'ARRAY'
		&& ! grep( ref $_, @{$_->{INPUT}[0]} ) )
		? @{$_->{INPUT}[0]}
		: $_->{INPUT}[0]
	    : @{$_->{INPUT}};
	my $expected = $_->{OUTPUT};
	my $diag =
	    "$sub_name( " . pp( @input_params ) . " ) "
	    . ( ( @$expected == 1 && $expected->[0] =~ /^(?:(true)|false)/ )
	        ? "is $expected->[0]"
		: ( "== " . pp( @{$_->{OUTPUT}} ) ) );

	my $name = "$_->{TEST}";
	$name .= ": $diag"
	    if $_->{TEST} =~ /^(Test|Example)(?:\s+\d+)?$/;
	$diag = "test: $diag";

	if ( @$expected == 1 && $expected->[0] =~ /^(?:(true)|false)/ ) {
	    # push @test_calls, join( " ",
	    if ( $options{GENERATE} ) {
		push @generated_code, join( "",
		    "ok", $1 ? "" : " !",
			" $sub_name( ",
			    join( ", ", map( pp( $_ ), @input_params ) ),
			    " ),\n",
			"    '$name'",
			defined $diag ? ",\n    '$diag'" : "", ";"
		    );
	    }
	    else {
		my @output = $sub->( @input_params );
		ok $1 ? $output[0] : ! $output[0], $name, $diag // ()
		    or ++$n_failures;
	    }
	}
	else {
	    if ( $options{GENERATE} ) {
		push @generated_code, join( "",
		    "is [ $sub_name( ",
			    join( ", ", map( pp( $_ ), @input_params ) ),
			    " ) ], [ ", map( pp( $_ ), @$expected ), " ],\n",
			"    '$name'",
			defined $diag ? ",\n    '$diag'" : "", ";"
		    );
	    }
	    else {
		my @output = $sub->( @input_params );
		is \@output, $expected, $name, $diag // ()
		    or ++$n_failures;
	    }
	}

        # vsay "";

    }
    if ( @generated_code ) {
	say $_
	    for (
		"use Test2::V0 qw( -no_srand );",
		@generated_code,
		"done_testing;",
	    );
    };

    return $n_failures;
}

sub generate_tests( $sub_name, @tests ) {
    # vsay "generate_tests( $sub_name, ", pp @tests;
    my @generated_code;

    my $result_is_array = 
	! $tests[0] || any { scalar $_->{OUTPUT}->@* > 1 } @tests;

    for ( @tests ) {
	$_->{INPUT} or do {
	    say STDERR "WARNING: ",
		"Cannot determine input parameters",
		$_->{TEST} ? " for test '$_->{TEST}'" : "", ".";
	};
        my @input_params =
	    exists $_->{INPUT}
	    ? @{$_->{INPUT}} == 1
		? ( ref $_->{INPUT}[0] eq 'ARRAY'
		    && ! grep( ref $_, @{$_->{INPUT}[0]} ) )
		    ? @{$_->{INPUT}[0]}
		    : $_->{INPUT}[0]
		: @{$_->{INPUT}}
	    : ();
	my $expected = $_->{OUTPUT};
	my $diag =
	    "$sub_name( "
		. join( ", ", map( pp( $_ ), @input_params ) )
		. " ) "
	    . ( ( @$expected == 1 && $expected->[0] =~ /^(?:(true)|false)/ )
	        ? "is $expected->[0]"
		: ( "== " . pp( @{$_->{OUTPUT}} ) ) );

	my $name = "$_->{TEST}";
	$name .= ": $diag"
	    if $_->{TEST} =~ /^(Test|Example)(?:\s+\d+)?$/;
	$diag = "test: $diag";

	if ( @$expected == 1 && $expected->[0] =~ /^(?:(true)|false)/ ) {
	    push @generated_code, join "",
		"ok", $1 ? "" : " !", " $sub_name( ",
		join( ", ", map( pp( $_ ), @input_params ) ),
		" ),\n",
		"    '$name'",
		# defined $diag ? ",\n    '$diag'" : "",
		";";
	}
	else {
	    push @generated_code, join "",
		$result_is_array
		? ( "is [ $sub_name( ",
		    join( ", ", map( pp( $_ ), @input_params ) ),
		    " ) ], [ ",
		    join( ", ", map( pp( $_ ), @$expected ) ), " ],\n", )
		: ( "is $sub_name( ",
		    join( ", ", map( pp( $_ ), @input_params ) ),
		    " ), ",
		    join( ", ", map( pp( $_ ), @$expected ) ), ",\n", ),
		    "    '$name'",
		# defined $diag ? ",\n    '$diag'" : "",
		";";
	}
    }
    return join "\n",
	"use Test2::V0 qw( -no_srand );",
	@generated_code,
	"done_testing;";
}

sub run_tests( @sub_names ) {
    my $n_failures = 0;
    my $add_newline = 0;
    for my $sub ( @sub_names ? @sub_names : ( undef ) ) {
	$add_newline ? say "" : ( $add_newline = 1 );
	say "Running tests for '$sub':"
	    if $sub;
	$n_failures += extract_and_run_tests( $sub );
    }
    done_testing;
    return $n_failures == 0;
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

    return $task_title, $task_text;
}

sub extract_tests( $task_text ) {
    # vsay "extract_tests( ", pp( $task_text ), " )";

    # These regular expressions are used for extracting input or output
    # test data.
    my $var_name      = qr/ [\@\$]\w+ /x;
    my $literal       = qr/ ".*?" | '.*?' | [+-]?\d+ | undef /x;
    my $bracketed     = qr/ \[ [^\[]*? \] /xs;
    my $parenthesized = qr/ \( [^\[]*? \) /xs;
    my $entry         = qr/ $literal | $bracketed | $parenthesized /x;
    my $list          = qr/ $entry (?: \s*,\s* $entry )* \s*,? /xs;

    # The combination of what we expect as input or output data.
    # Capture unparenthesized lists for special handling.
    my $data_re = qr/ (?<lit>      $literal )
		    | (?<br_list>     \[ \s* (?:$list)? \s* \] )
		    | (?<par_list>    \( \s* (?:$list)? \s* \) )
		    | (?<no_paren> $list ) /x;

    my @tests;
    while ( $task_text =~
	/^((?:Example|Test).*?)\s*:?\s*$ .*?
	    ^ \s* Input: \s* ( .*? ) \s*
	    ^ \s* Out?put: \s* ( .*? ) \s*? (?=(?: ^$ | ^\S | \Z ))
	/xmsg )
    {
	my ( $test, $input, $output) = ( $1, $2, $3 );
	# vsay pp $test, $input, $output;
	# vsay "input:", pp $input;

	push @tests, { TEST => $test };

	# Check whether the Input: part contains any variable sigils.
	# If not, we try to convert '<Sequence of Words> = ...'
	# into '$sequence_of_words = ...'.
	# This is for specification like
	# Input: Year = 2024, Month = 4, Weekday of month = 3, day of week = 2
	unless ( $input =~ /[\$\@]\w+/ ) {
	    if ( $input =~ s{(\w+?(?: \w+?)*?)(\s*=)}{
		    my ( $var_name, $equals ) = ( $1, $2 );
		    '$' . lc ( $var_name =~ s/ /_/gr ) . $equals;
		}eg )
	    {
		say STDERR "INFO ",
		    "No variables found in input specification.",
		    " Trying alternative input format.";
		# vsay "changed \$input to '$input'";
	    }
	    else {
		say STDERR "WARNING: ",
		    "Cannot determine any input variable names.",
		    " Using '\@input' instead.";
		$input = "\@input = $input";
	    }
	}

	for ( $input, $output ) {
	    # To avoid misinterpretations of '@' or '$' within strings when the
	    # data is 'eval'ed, we turn all double quotes into single quotes.
	    s/\"/'/g;

	    # We convert 'barewords' into quoted strings.
	    # We search for these patterns, but we just skip them without
	    # changing them:
	    #  * 'Input:', 'Output:' at the beginning of the string,
	    #  * quoted strings,
	    #  * variable names having a $ or @ sigil.
	    # After we are sure it's none of those, we also check unquoted
	    # 'barewords' (here: combinations of letters, digits or underscores,
	    # starting with a letter) and enclose them in single quotes.
	    my $bareword = qr/ \b (?!undef) [a-z_][a-z0-9_]* \b /ix;
	    while ( / ^Input: | ^Output: | '.*?' | [\$\@]$bareword
		    | ( $bareword ) /xg )
	    {
		if ( $1 ) {
		    my $p = pos();
		    substr $_, $p - length( $1 ), length( $1 ), "'$1'";
		    pos = $p + 2;
		}
	    }

	    # As all arrays will be stored as array references, we just
	    # convert parentheses (...) to angle brackets [...].
	    # s/\(/\[/g;
	    # s/\)/\]/g;

	    # Add missing commas between literals.
	    while ( s/($literal)\s+($literal)/$1, $2/ ) {}
	}

	while ( $input =~ / ($var_name) \s* = \s* ($data_re) /xg ) {
	    push @{$tests[-1]{VARIABLE_NAMES}}, $1;
	    push @{$tests[-1]{INPUT}},
		eval( ( $+{no_paren} || $+{par_list} ) ? "[ $2 ]" : $2 );
        };

	while ( $output =~ /^\s* ($data_re) $/xg ) {
	    local $_ = $1;
	    # vsay "\$_: <$_>";
	    # Special case:  (1,2),(3,4),(5,6)
	    # should become: [1,2],[3,4],[5,6] ]
	    if ( $+{no_paren} && /$parenthesized/ ) {
		# vsay "found special case <$_>";
		s/\(/\[/g;
		s/\)/\]/g;
	    }
	    push @{$tests[-1]{OUTPUT}},
		eval( $+{no_paren} ? "( $_ )" : $_ );
        };
    }

    unless ( @tests ) {
	# Try an alternative description format:
	# <input...> => <output...>
	my $n_examples = 0;
	while ( $task_text =~ /^( .*? ) \s* => \s* ( .* )$/xmg ) {
	    # vsay pp @{^CAPTURE};
	    push @tests, {
	        TEST => "Example " . ++$n_examples,
		INPUT => [ split " ", $1 ],
		OUTPUT => [ $2 ],
		VARIABLE_NAMES => [ '@input' ],
	    }
	}
    }

    # Use array refs for all OUTPUT lists if at least one of tests does.
    if ( any { ref $_->{OUTPUT}[0] } @tests ) {
	$_->{OUTPUT} = [ $_->{OUTPUT} ]
	    for grep { ! ref $_->{OUTPUT}[0] } @tests;
    }

    return @tests;
}

1;
