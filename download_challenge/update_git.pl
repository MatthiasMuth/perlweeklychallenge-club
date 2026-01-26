#!/usr/bin/env perl
#
#	update_git.pl
#	Refresh the Perl Weekly Challenge repository by
#	- stashing the current state if necessary,
#	- update the master branch from upstream (manwar), fast-forwards only,
#	- update the dev branch from master (but keep the .gitignore file),
#	- push everything,
#	- restore the stashed state (if there is one).
#

use v5.36;
use feature 'try';
use builtin qw( true false );

use Verbose;
use Dsay;

use Git;

sub git_command( $repo, $command, @args ) {
    local $d_area = "git_command";
    $debug{GIT_COMMAND} and dsay "git_command", pp( $command, @args );
    my ( $stderr_output, $return_success );
    try {
	if ( ! defined wantarray ) {
	    my @output = $repo->command( $command, @args );
	    $debug{GIT_COMMAND} and dsay map "$_\n", @output;
	    return;
	}
	elsif ( wantarray ) {
	    my @output = $repo->command( $command, @args );
	    $debug{GIT_COMMAND} and dsay map "$_\n", @output;
	    return @output;
	}
	else {
	    if ( @args && ref $args[-1] ) {
		( $stderr_output, $return_success ) =
		    ( $args[-1]{STDERR}, delete $args[-1]{RETURN_SUCCESS} );
	    }
	    my $output = $repo->command( $command, @args ) =~ s/\n\z//r;
	    $debug{GIT_COMMAND} and dsay $output;
	    return $return_success ? ( $output || 1 ) : $output;
	}
    }
    catch ( $e ) {
	$debug{GIT_COMMAND} and dsay pp $e;
	my $msg = $e->{'-text'} // ( "$e" =~ s/ at .*$//r );
	$msg =~ s/^fatal: *//;
	if ( defined wantarray ) {
	    say STDERR 
		"ERROR: 'git $command @args' failed:\n",
		$msg =~ s/^/       /mgr
		unless defined $stderr_output && ! $stderr_output;
	    return;
	}
	else {
	    die "ERROR: 'git $command @args' failed:\n",
		$msg =~ s/^/       /mgr, "\n";
	}
    }
}

my $repo;
try {
    $repo = Git->repository();
}
catch ( $e ) {
    %debug and dsay pp $e;
    my $msg = $e->{'-text'} =~ s/^fatal: *//r;
    die "ERROR: $msg\n";
}

qsay "updating the index";
$repo->command( qw( update-index --refresh -q ) );

my $use_stash = false;
git_command( $repo,
    [ qw( diff-index --quiet --exit-code HEAD -- ) ],
    { STDERR => 0, RETURN_SUCCESS => 1 } )
    or $use_stash = true;
%debug and dsay "use stash: ", $use_stash ? "yes" : "no";

if ( $use_stash  ) {
    qsay "stashing current changes";
    git_command( $repo, qw( stash push --quiet ) );
    if ( $verbose ) {
	say git_command( $repo, qw( stash show --name-status ) );
    }
}

qsay "updating master";
git_command( $repo, qw( checkout --quiet master ) );
git_command( $repo, qw( pull --quiet ) );
git_command( $repo, qw( fetch --quiet upstream ) );
git_command( $repo, qw( merge --ff-only --quiet upstream/master ) );

qsay "updating dev";
git_command( $repo, qw( checkout --quiet dev ) );
git_command( $repo, qw( merge --quiet --strategy ort -X ours ),
    "-m", "Merge branch 'master' into dev (keeping our changes)",
    "master" );

qsay "pushing changes";
git_command( $repo, qw( push --quiet --all ) );
git_command( $repo, qw( push --quiet --tags ) );

if ( $use_stash  ) {
    qsay "getting back previous changes from stash";
    git_command( $repo, qw( stash pop --quiet ) );
}

git_command( $repo, qw( status ) );
