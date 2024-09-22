#!/usr/bin/perl

# Blog: http://ccgi.campbellsmiths.force9.co.uk/challenge

use v5.26;    # The Weekly Challenge - 2024-09-16
use utf8;     # Week 287 - task 1 - Strong password
use warnings; # Peter Campbell Smith
binmode STDOUT, ':utf8';

sub strong_password {
	
	my ($password, $comment, $steps, @upper, @lower, @digit, $props, $r, $insert, $length);
	
	($password, $comment) =  @_;
	$steps = 0;
	@upper = ('A' .. 'Z');
	@lower = ('a' .. 'z');
	@digit = ('0' .. '9');

	# stage 1 - deal with triplets
	while (1) {
		$props = assess($password);
		$r = $props->{triplet};
		last unless $r;
		$insert = '';
		do {
			$insert = $digit[rand(10)] unless $props->{digit};
			$insert = $lower[rand(26)] unless $props->{lower};
			$insert = $upper[rand(26)] unless $insert;
		} until $insert ne $r;
		$password =~ s|$r$r$r|$r$r$insert$r|;
		$steps ++;
	}
	
	# stage 2 - append any missing class of character
	$length = length($password);
	$password .= $lower[rand(26)] unless $props->{lower};
	$password .= $upper[rand(26)] unless $props->{upper};
	$password .= $digit[rand(10)] unless $props->{digit};
	
	# stage 3 - pad if necessary to 6 chars
	$password .= $lower[rand(26)] while length($password) < 6;
	$steps += length($password) - $length;
		
	return $steps;
}

sub assess {
	
	my ($password, %props);
	
	# get properties of password
	$password = $_[0];
	$props{lower} = $password =~ m|[a-z]|;
	$props{upper} = $password =~ m|[A-Z]|;
	$props{digit} = $password =~ m|[0-9]|;
	$props{triplet} = $password =~ m|(.)\1\1| ? $1 : '';
	return \%props;
}
	
