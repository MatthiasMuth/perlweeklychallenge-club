# Challenge 223 tasks: Count Primes - Box Coins
**Challenge 223 solutions in Perl by Matthias Muth**

## Task 1: Count Primes

> You are given a positive integer, $n.<br/>
> Write a script to find the total count of primes less than or equal to the given integer.<br/>
> <br/>
> Example 1<br/>
> Input: $n = 10<br/>
> Output: 4<br/>
> Since there are 4 primes (2,3,5,7) less than or equal to 10.<br/>
> <br/>
> Example 2<br/>
> Input: $n = 1<br/>
> Output: 0<br/>
> <br/>
> Example 3<br/>
> Input: $n = 20<br/>
> Output: 8<br/>
> Since there are 4 primes (2,3,5,7,11,13,17,19) less than or equal to 20.<br/>

Lore ipsum...

```perl
sub erathostenes( $n ) {

    use List::Util qw( first );

    my @non_primes;
    my $sqrt = sqrt( $n );
    my $i = 2;
    while ( $i <= $sqrt ) {
        vsay "trying $i:";
        for ( my $j = 2 * $i; $j <= $n; $j += $i ) {
            vsay "    mark $j as non-prime";
            $non_primes[$j] = 1;
        }
        $i = first { ! $non_primes[$_] } $i + 1 .. $n;
        vsay "    next \$i to try: $i";
    }
    vsay "$i is larger than sqrt( $n ) ($sqrt)";
    vsay pp( grep { ! $non_primes[$_] } 2..$n );
    return grep { ! $non_primes[$_] } 2..$n;
}

sub count_primes( $n ) {
    return scalar erathostenes( $n );
}
```

## Task 2: Box Coins

> You are given an array representing box coins, @box.<br/>
> Write a script to collect the maximum coins until you took out all boxes. If we pick box[i] then we collect the coins $box[i-1] * $box[i] * $box[i+1]. If $box[i+1] or $box[i-1] is out of bound then treat it as 1 coin.<br/>
> <br/>
> Example 1:<br/>
> <br/>
> Input: @box = (3, 1, 5, 8)<br/>
> Output: 167<br/>
> <br/>
> Step 1: pick box [i=1] and collected coins 3 * 1 * 5 => 15.  Boxes available (3, 5, 8).<br/>
> Step 2: pick box [i=1] and collected coins 3 * 5 * 8 => 120. Boxes available (3, 8).<br/>
> Step 3: pick box [i=0] and collected coins 1 * 3 * 8 => 24.  Boxes available (8).<br/>
> Step 4: pick box [i=0] and collected coins 1 * 8 * 1 => 8.   No more box available.<br/>
> <br/>
> Example 2:<br/>
> <br/>
> Input: @box = (1, 5)<br/>
> Output: 10<br/>
> <br/>
> Step 1: pick box [i=0] and collected coins 1 * 1 * 5 => 5. Boxes available (5).<br/>
> Step 2: pick box [i=0] and collected coins 1 * 5 * 1 => 5. No more box available.<br/>

Lorem ipsum...

```perl
sub box_coins {
    my ( @box ) = @_;

    return $box[0]
        if @box == 1;

    my $max = 0;
    for ( 0..$#box ) {
        my $value = ( $box[$_]
                * ( $_ > 0     ? $box[ $_ - 1 ] : 1 )
                * ( $_ < $#box ? $box[ $_ + 1 ] : 1 )
            ) + box_coins( @box[ 0 .. $_ - 1, $_ + 1 .. $#box ] );
        $max = $value
            if $value > $max;
    }
    return $max;
}
```

#### **Thank you for the challenge!**
