# Check and Chunk

**Challenge 373 solutions in Perl by Matthias Muth**

## Task 1: Equal List

> You are given two arrays of strings.<br/>
> Write a script to return true if the two given array represent the same strings otherwise false.
>
> **Example 1**
>
> ```text
> Input: @arr1 = ("a", "bc")
>        @arr2 = ("ab", "c")
> Output: true
>
> Array 1: "a" + "bc" = "abc"
> Array 2: "ab" + "c" = "abc"
> ```
>
> **Example 2**
>
> ```text
> Input: @arr1 = ("a", "b", "c")
>        @arr2 = ("a", "bc")
> Output: true
>
> Array 1: "a" + "b" + "c" = "abc"
> Array 2: "a" + "bc" = "abc"
> ```
>
> **Example 3**
>
> ```text
> Input: @arr1 = ("a", "bc")
>        @arr2 = ("a", "c", "b")
> Output: false
>
> Array 1: "a" + "bc" = "abc"
> Array 2: "a" + "c" + "b" = "acb"
> ```
>
> **Example 4**
>
> ```text
> Input: @arr1 = ("ab", "c", "")
>        @arr2 = ("", "a", "bc")
> Output: true
>
> Array 1: "ab" + "c" + "" = "abc"
> Array 2: ""  + "a" + "bc" = "abc"
> ```
>
> **Example 5**
>
> ```text
> Input: @arr1 = ("p", "e", "r", "l")
>        @arr2 = ("perl")
> Output: true
>
> Array 1: "p" + "e" + "r" + "l" = "perl"
> Array 2: "perl"
> ```

There's not a lot to say about my solution. Perl has the `join` function for concatenating strings, and the `eq` operator for comparing them.

Voilà!  

```perl
use v5.36;

sub equal_list( $arr1, $arr2 ) {
    return join( "", $arr1->@* ) eq join( "", $arr2->@* );
}
```

## Task 2: List Division

> You are given a list and a non-negative integer.<br/>
> Write a script to divide the given list into given non-negative integer equal parts. Return -1 if the integer is more than the size of the list.
>
> **Example 1**
>
> ```text
> Input: @list = (1,2,3,4,5), $n = 2
> Output: ((1,2,3), (4,5))
>
> 5 / 2 = 2 remainder 1.
> The extra element goes into the first chunk.
> ```
>
> **Example 2**
>
> ```text
> Input: @list = (1,2,3,4,5,6), $n = 3
> Output: ((1,2), (3,4), (5,6))
>
> 6 / 3 = 2 remainder 0.
> ```
>
> **Example 3**
>
> ```text
> Input: @list = (1,2,3), $n = 2
> Output: ((1,2), (3))
> ```
>
> **Example 4**
>
> ```text
> Input: @list = (1,2,3,4,5,6,7,8,9,10), $n = 5
> Output: ((1,2), (3,4), (5,6), (7,8), (9,10))
> ```
>
> **Example 5**
>
> ```text
> Input: @list = (1,2,3), $n = 4
> Output: -1
> ```
>
> **Example 6**
>
> ```text
> Input: @list = (72,57,89,55,36,84,10,95,99,35), $n = 7;
> Output: ((72,57), (89,55), (36,84), (10), (95), (99), (35))
> ```

This one is a bit more tricky.

The easy part is the input check. We need to return `-1` if `$n` is larger than the size of the list, because we will not be able to return `$n` parts when we have less than `$n` elements. I extend the check to `$n` being greater than zero, because dividing a list into zero parts does not make sense, neither. We have to do that check explicitly.

The output parts can only have two sizes: Either the integer part of the input list size divided by `$n`,    



```perl
use v5.36;

sub list_division( $list, $n ) {
    return -1
        unless $n > 0 && $list->@* >= $n;
    my ( $base_size, $rest ) = ( int( $list->@* / $n ), $list->@* % $n );
    my $next = 0;
    return map {
        my $size = ( $base_size + ( $_ <= $rest ) );
        ( my $this, $next ) = ( $next, $next + $size );
        [ $list->@[ $this .. $next - 1 ] ];
    } 1..$n;
}
```

#### **Thank you for the challenge!**
