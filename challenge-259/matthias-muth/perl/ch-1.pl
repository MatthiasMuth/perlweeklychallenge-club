#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 259 Task 1: Banking Day Offset
#
#       Perl solution by Matthias Muth.
#

use v5.36;
use Data::Dump qw( pp );

use Time::Piece;
use Time::Seconds;

# Time::Piece::wday starts with 1 == Sunday.
use constant { WDAY_SUNDAY => 1, WDAY_MONDAY => 2, WDAY_FRIDAY => 6,
	       WDAY_SATURDAY => 7 };

sub banking_day_offset( $start_date, $offset, $bank_holidays = [] ) {
    # Turn start date into a Time::Piece object.
    $start_date = Time::Piece->strptime( $start_date, "%Y-%m-%d" );
    say "start_date: ", $start_date->ymd, " offset: $offset";

    # If the original starting date is a Saturday or Sunday, we move it back to
    # Friday. This avoids jumping too far when we skip over Saturdays and
    # Sundays later.
    # This is not relevant for the 'offset'. (For example, an offset of 1
    # results in the following Monday for all of Friday, Saturday and Sunday.)
    $start_date -= ONE_DAY
	until WDAY_MONDAY <= $start_date->wday <= WDAY_FRIDAY;

    # Now we calculate the beginning of the working week (Monday), so that
    # later, we can increment weekwise by seven calendar days for every five
    # banking days in 'offset', skipping over the weekends.
    # Of course we need to increase the 'offset' by the number of days we
    # shifted to compensate for this.
    my $days_from_monday = $start_date->wday - WDAY_MONDAY;
    my $start_monday = $start_date - $days_from_monday * ONE_DAY;
    $offset += $days_from_monday;

    # For getting the (preliminary) resulting date we add 'offset' number of
    # days, plus 2 weekend days for every full 5 banking days.
    my $end_date = $start_monday
	+ $offset * ONE_DAY
	+ int( $offset / 5 ) * 2 * ONE_DAY;
    say "end_date: ", $end_date->ymd;

    # We still need to skip over bank holidays that occur between the original
    # start date and the end date, if they are not on a Saturday or Sunday.
    # Assuming that the bank holidays are ordered, we are safe even when
    # there are several of them in a row at the end of our time period,
    # because we move the end date by one day before processing the next one.
    for ( $bank_holidays->@* ) {
	my $bank_holiday = Time::Piece->strptime( $_, "%Y-%m-%d" );
	if ( $start_date <= $bank_holiday <= $end_date
	    && WDAY_MONDAY <= $bank_holiday->wday <= WDAY_FRIDAY )
	{
	    say "skipping over ", $bank_holiday->ymd, " bank holiday";
	    $end_date += ONE_DAY;
	    say "end_date: ", $end_date->ymd;
	}
    }

    return $end_date->ymd;
}

use Test2::V0 qw( -no_srand );

my @tests = (
    [ "2018-06-28", 0, "2018-06-28" ],
    [ "2018-06-28", 1, "2018-06-29" ],
    [ "2018-06-28", 2, "2018-07-02" ],
    [ "2018-06-28", 3, "2018-07-03" ],
    [ "2018-06-28", 4, "2018-07-04" ],
    [ "2018-06-28", 5, "2018-07-05" ],
    [ "2018-06-28", 6, "2018-07-06" ],
    [ "2018-06-28", 7, "2018-07-09" ],
    [ "2018-06-28", 8, "2018-07-10" ],
    [ "2018-06-28", 9, "2018-07-11" ],
);
for ( 0..$#tests ) {
    my ( $start_date, $offset, $expected ) = $tests[$_]->@*;
    is banking_day_offset( $start_date, $offset ), $expected,
	'Test $_: banking_day_offset( "$start_date", $offset ) => "$expected"';
}

is banking_day_offset( "2018-06-28", 3, ["2018-07-03"] ), "2018-07-04",
    'Example 1: banking_day_offset( "2018-06-28", 3, ["2018-07-03"] ) => "2018-07-04"';
is banking_day_offset( "2018-06-28", 3 ), "2018-07-03",
    'Example 2: banking_day_offset( "2018-06-28", 3 ) => "2018-07-03"';
done_testing;
