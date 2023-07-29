# Challenge 226 tasks: Shuffle String - Zero Array
**Challenge 226 solutions in Perl by Matthias Muth**

## Task 1: Shuffle String

> You are given a string and an array of indices of same length as string.<br/>
> Write a script to return the string after re-arranging the indices in the correct order.<br/>
> Example 1<br/>
> <br/>
> Input: $string = 'lacelengh', @indices = (3,2,0,5,4,8,6,7,1)<br/>
> Output: 'challenge'<br/>
> <br/>
> Example 2<br/>
> Input: $string = 'rulepark', @indices = (4,7,3,1,0,5,2,6)<br/>
> Output: 'perlraku'<br/>

It took me a moment to understand
that the array of indices is not where the letters *come from*,
but where the letters *go to*. <br/>
So we could write something like this for a `$result` string:
```perl
    my $result = " " x $indices->$#*;
    substr( $result, $indices->[$_], 1 ) = substr( $string, $_, 1 )
        for 0..$indices->$#*;
```
or this for a `@result` array:
```perl
    $result[ $indices->[$_] ] = substr( $string, $_, 1 )
        for 0..$indices->$#*;
```

But of course there is more than one way to do it. :-)<br/>
For example, we can switch from manipulating things one by one,
and work with whole lists instead.
This most often results in shorter, more 'elegant' code,
because it is less cluttered with all the details needed just to do things repeatedly.
Very often this makes the code easier to understand.

So for making the letters from the string available as a list,
we can use the common Perl idiom
```perl
    $string =~ /./g
```
or we can use the also very common (and faster) 
```perl
    split //, $string
```

For assigning the letters to the result array,
Perl has the wonderful array slice syntax,
that can not only retrieve selected parts of an array or list,
but also assign to selected elements of an array, even in random order.
Exactly what we need!

So actually we can
assign the letters to the given indexes
with just one assigment,
and solve the whole task with three lines of code, and no loop:
```perl
use v5.36;

sub shuffle_string( $string, $indices ) {
    my @results;
    @results[ @$indices ] = split //, $string;
    return join "", @results;
}
```

## Task 2: Zero Array

> You are given an array of non-negative integers, @ints.<br/>
> Write a script to return the minimum number of operations to make every element equal zero.<br/>
> In each operation, you are required to pick a positive number less than or equal to the smallest element in the array, then subtract that from each positive element in the array.<br/>
> <br/>
> Example 1:<br/>
> <br/>
> Input: @ints = (1, 5, 0, 3, 5)<br/>
> Output: 3<br/>
> <br/>
> operation 1: pick 1 => (0, 4, 0, 2, 4)<br/>
> operation 2: pick 2 => (0, 2, 0, 0, 2)<br/>
> operation 3: pick 2 => (0, 0, 0, 0, 0)<br/>
> <br/>
> Example 2:<br/>
> <br/>
> Input: @ints = (0)<br/>
> Output: 0<br/>
> <br/>
> Example 3:<br/>
> <br/>
> Input: @ints = (2, 1, 4, 0, 3)<br/>
> Output: 4<br/>
> <br/>
> operation 1: pick 1 => (1, 0, 3, 0, 2)<br/>
> operation 2: pick 1 => (0, 0, 2, 0, 1)<br/>
> operation 3: pick 1 => (0, 0, 1, 0, 0)<br/>
> operation 4: pick 1 => (0, 0, 0, 0, 0)<br/>

Lorem ipsum dolor sit amet...


        1  5  0  3  5
  
  5 ------ 5 ------ 5 -------------------------------
  4
  3 ------------ 3 ----------------------------------
  2
  1 --- 1 --------------------------------------------
  0 --------- 0 -------------------------------------


```perl
sub task_2() {
    ...;
}
```

#### **Thank you for the challenge!**
