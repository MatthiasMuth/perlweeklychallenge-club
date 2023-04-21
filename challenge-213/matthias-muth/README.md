# Wow: A Oneliner and a complete BFS traversal. 
*Challenge 213 solutions in Perl by Matthias Muth*

## Task 1: Fun Sort

> You are given a list of positive integers.<br/>
Write a script to sort the all even integers first then all odds in ascending order.

Ok, let's see!
A typical approach would be to split up the list of integers into all even ones and all odd ones,
then sort both lists separately, and then concatenate them back together.<br/>
Absolutely ok!<br/>
But way below what Perl's `sort` can do for us!

Why don't we use `sort` as it is supposed to be?<br/>
It is defined as 
```perl
sort BLOCK LIST
```
and `BLOCK` is a comparison that decides which of two values goes first in the result.

For us here, we know that all even numbers go before all odd numbers.<br/>
To determine whether the number is even or odd, we can use the modulo operator, `%`.
We just check whether the number modulo 2 is 0 (even) or 1 (odd).<br/>
For determining the sort order, using Perl's *number comparison* operator `<=>` is our best choice.<br/>
Combining these two, we get the first part of our comparison for `sort`:
```perl
    $a % 2 <=> $b % 2
```
That's all we need to make all even numbers 'go left', and all odd numbers 'go right'.

If both numbers are even, or both are odd, the `<=>` operator returns zero.
For that case, we append the standard numeric comparison to define the order within all even (or all odd) numbers:
```perl
    $a % 2 <=> $b % 2 || $a <=> $b
```

Thus, a quite short, but complete solution for this challenge can look like this:
```perl
sub fun_sort {
    sort { $a % 2 <=> $b % 2 || $a <=> $b } @_;
}
```
I don't think there will be a much more efficient way of solving this!


# Shortest Route

> You are given a list of bidirectional routes defining a network of nodes, as well as source and destination node numbers.<br/>
Write a script to find the route from source to destination that passes through fewest nodes.


Funny that I found it more difficult to describe the process than to implement it!<br/>
Maybe it will help me if I ever read my own code again... :-)

**Thank you for the challenge!**

