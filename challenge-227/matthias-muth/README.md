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
If we wanted to supply a different date with them, we would need to compute a Unix epoch time to do so.
No way.

But we can use the `Time::Piece->strptime(STRING, FORMAT)` subroutine as a constructor.
We hand in a date string like `"2023-07-13"`, and a format of `'%Y-%m-%d'`,
and there we have our time object.

Everything in one pipeline:
- month numbers from 1 to 12,
- mapped to newly created objects for the 13th of each month in the `$year` year,
- grep those of the objects that have a day_of_week of 5 (Friday),
- and count them using `scalar`.

```perl
use v5.36;
use Time::Piece;
sub friday_13th( $year ) {
    # Time::Piece->day_of_the_week: 0 = Sunday.
    return scalar grep { $_->day_of_week == 5 }
        map Time::Piece->strptime( "$year-$_-13", "%Y-%m-%d" ),
            1..12;
}
```

Maybe `strptime` is not the fastest solution, but its usage is much clearer than
converting month numbers from 1..12 to 0..11 and years to be offsets from 1900,
which would be necessary if we used a `timegm` from `Time::Local`.
There are some subtleties there:

```perl
use v5.36;
use Time::Local;
use Time::Piece;
sub friday_13th( $year ) {
    # Time::Piece->day_of_the_week: 0 = Sunday.
    return scalar grep { $_->day_of_week == 5 }
        map scalar gmtime( timegm( 0, 0, 0, 13, $_ - 1, $year - 1900 ) ),
            1..12;
}
```

Note that we need the first `scalar` to enforce scalar context for the list,
to return the number of elements, very familiar.<br/>
And the second `scalar` is needed to enforce scalar context for
`Time::Piece::gmtime`, in order to return the object, not the list of values.<br/>
Not very obvious.<br/>
I prefer the first version!

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

I'm sure it's an interesting exercise to convert Roman numerals to arabic (common) numbers
and vice versa, but here, I am not going to reinvent the wheel.<br/>
The `Roman` module from CPAN is my friend in this case.

The more interesting aspect is how to implement the arithmetic operations
in a more elegant way than a nested if-then-else statement.

I chose a hash lookup to return an anonymous subroutine that implements
the respective operation.

The rest looks quite self-explanatory to me. Or is it only in my eyes??

```perl
use v5.36;
use Roman;

my %ops = (
    '+'  => sub { $_[0] + $_[1] },
    '-'  => sub { $_[0] - $_[1] },
    '*'  => sub { $_[0] * $_[1] },
    '/'  => sub { $_[0] / $_[1] },
    '**' => sub { $_[0] ** $_[1] },
);

sub roman_maths( @input ) {
    my $result = $ops{$input[1]}->( arabic( $input[0] ), arabic( $input[2] ) );
    return
        $result == 0
            ? "nulla (they knew about zero but didn't have a symbol)" :
        $result != int( $result )
            ? "non potest (they didn't do fractions)" :
        $result > 3999
            ? "non potest (they only went up to 3999)" :
        $result < 0
            ? "non potest (they didn't do negative numbers)" :
        Roman( $result );
}
```

#### **Thank you for the challenge!**
