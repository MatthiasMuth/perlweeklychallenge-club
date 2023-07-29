# Friday XIII
**Challenge 227 solutions in Perl by Matthias Muth**

## Task 1: Friday 13th

> You are given a year number in the range 1753 to 9999.<br/>
> Write a script to find out how many dates in the year are Friday 13th, assume that the current Gregorian calendar applies.<br/>
> <br/>
> Example<br/>
> Input: $year = 2023<br/>
> Output: 2<br/>
> Since there are only 2 Friday 13th in the given year 2023 i.e. 13th Jan and 13th Oct.<br/>

Before starting night debugging sessions dealing to get a lot of calculations on Unix epoch seconds right,
I prefer using a core module that gives me everythng I need: `Time::Piece`.

For the given year, we create twelve `Time::Piece` objects, one for each 13th of a month in that year.
We do so for checking whether the day is a Friday using the `day_of_week` method.

`Time::Piece`'s typical usage is for dealing with 'current' times,
which are returned by the `localtime` and `gmtime` subroutines when called without parameter.
If we want to supply a different date with them, we would need to compute a Unix epoch time to do so.
No way.

But we can use the `Time::Piece->strptime(STRING, FORMAT)` subroutine as a constructor.
We hand in a date string like `"2023-07-13"`, and a format of `'%Y-%m-%d'`,
and there we have our time object.



```perl
use v5.36;

use Time::Piece;

sub friday_13th( $year ) {
    # Time::Piece->day_of_the_week: 0 = Sunday.
    return scalar grep $_->day_of_week == 5,
        map Time::Piece->strptime( "$year-$_-13", "%Y-%m-%d" ),
            1..12;
}
```

## Task 2: Roman Maths

> Write a script to handle a 2-term arithmetic operation expressed in Roman numeral.<br/>
> <br/>
> Example<br/>
> IV + V     => IX<br/>
> M - I      => CMXCIX<br/>
> X / II     => V<br/>
> XI * VI    => LXVI<br/>
> VII ** III => CCCXLIII<br/>
> V - V      => nulla (they knew about zero but didn't have a symbol)<br/>
> V / II     => non potest (they didn't do fractions)<br/>
> MMM + M    => non potest (they only went up to 3999)<br/>
> V - X      => non potest (they didn't do negative numbers)<br/>

Lorem ipsum dolor sit amet...

```perl
sub task_2() {
    ...;
}
```

#### **Thank you for the challenge!**
