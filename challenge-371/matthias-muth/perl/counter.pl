#!/usr/bin/env perl

use v5.36;
use builtin qw( false true );

use Cwd;
say "Current working directory: " . getcwd;

say "$ENV{PERL5LIB}";
say "   $_" for @INC;

use lib '.';
require "ch-2.pl";

subset_equilibrium_diff_pack( 1..5 );
