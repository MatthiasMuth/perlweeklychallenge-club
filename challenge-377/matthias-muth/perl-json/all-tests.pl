#!/usr/bin/env perl

use 5.018;
use strict;
use warnings;

use Data::Printer;

use Test2::V0 qw( -no_srand );
# Avoid messages about table width in case of test failures.
# (Term::Table::Util::term_size comes with Test2::V0.)
$ENV{TABLE_TERM_SIZE} //= Term::Table::Util::term_size() // 80;

use JSON::PP;

use builtin qw(true false);
note "builtin";

# use boolean qw(true false);
# note "boolean";

is 1,      T, q{ 1, T };                # ok
is "1",    T, q{"1", T};                # ok
is "x",    T, q{"x", T };             #?# ok
is true,   T, q{true, T };              # ok
is "true", T, q{"true", T };            # ok

is 0,       F, q{0, F };                # ok
is "0",     F, q{"0", F };              # ok
is "",      F, q{"", F };               # ok
is false,   F, q{false, F };            # ok
is "false", F, q{"false", F };          # not ok

is 1,      true, q{ 1, true };        #?# builtin not ok - boolean ok
is "1",    true, q{"1", true};        #?# builtin not ok - boolean ok
is "x",    true, q{"x", true };         # not ok
is true,   true, q{true, true };        # ok
is "true", true, q{"true", true };      # not ok

is 0,       false, q{0, false };        # not ok
is "0",     false, q{"0", false };      # not ok
is "",      false, q{"", false };     #?# builtin not ok - boolean ok
is false,   false, q{false, false };    # ok
is "false", false, q{"false", false };  # not ok

is 1,   JSON::PP::true, q{1, JSON::PP::true };                # not ok
is "1", JSON::PP::true, q{"1", JSON::PP::true };              # not ok
is "x", JSON::PP::true, q{"x", JSON::PP::true };              # not ok
is true, JSON::PP::true, q{true, JSON::PP::true };          #?# builtin not ok - boolean ok
is "true", JSON::PP::true, q{"true", JSON::PP::true };        # not ok

is 0,       JSON::PP::false, q{0, JSON::PP::false };          # not ok
is "0",     JSON::PP::false, q{"0", JSON::PP::false };        # not ok
is "",      JSON::PP::false, q{"", JSON::PP::false };         # not ok
is false,   JSON::PP::false, q{false, JSON::PP::false };    #?# builtin not ok - boolean ok
is "false", JSON::PP::false, q{"false", JSON::PP::false };    # not ok

is JSON::PP::true, 1,      q{JSON::PP::true, 1};              # ok
is JSON::PP::true, "1",    q{JSON::PP::true, "1"};            # ok
is JSON::PP::true, "x",    q{JSON::PP::true, "x"};            # not ok
is JSON::PP::true, true,   q{JSON::PP::true, true};           # ok
is JSON::PP::true, "true", q{JSON::PP::true,  "true"};        # not ok

is JSON::PP::false, 0,   q{JSON::PP::false, 0};               # ok
is JSON::PP::false, "0", q{JSON::PP::false, "0"};             # ok
is JSON::PP::false, "",  q{JSON::PP::false, ""};              # not ok
is JSON::PP::false, false, q{JSON::PP::false, false};       #?# builtin not ok - boolean ok
is JSON::PP::false, "false", q{JSON::PP::false, "false"};     # not ok

done_testing;
