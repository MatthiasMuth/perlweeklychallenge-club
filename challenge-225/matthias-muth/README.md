# Challenge 225 tasks: Max Words - Left Right Sum Diff
**Challenge 225 solutions in Perl by Matthias Muth**

## Task 1: Max Words

> You are given a list of sentences, @list.<br/>
> <br/>
> A sentence is a list of words that are separated by a single space with no leading or trailing spaces.<br/>
> <br/>
> Write a script to find out the maximum number of words that appear in a single sentence.<br/>
> Example 1<br/>
> <br/>
> Input: @list = (qw/Perl and Raku belong to the same family./,<br/>
>                 qw/I love Perl./,<br/>
>                 qw/The Perl and Raku Conference./)<br/>
> Output: 8<br/>
> <br/>
> Example 2<br/>
> <br/>
> Input: @list = (qw/The Weekly Challenge./,<br/>
>                 qw/Python is the most popular guest language./,<br/>
>                 qw/Team PWC has over 300 members./)<br/>
> Output: 7<br/>

Lorem ipsum dolor sit amet...

```perl
sub task_1() {
    ...;
}
```

## Task 2: Left Right Sum Diff

> You are given an array of integers, @ints.<br/>
> Write a script to return left right sum diff array as shown below:<br/>
> <br/>
> @ints = (a, b, c, d, e)<br/>
> <br/>
> @left  = (0, a, (a+b), (a+b+c))<br/>
> @right = ((c+d+e), (d+e), e, 0)<br/>
> @left_right_sum_diff = ( | 0 - (c+d+e) |,<br/>
>                          | a - (d+e)   |,<br/>
>                          | (a+b) - e   |,<br/>
>                          | (a+b+c) - 0 | )<br/>
> <br/>
> <br/>
> Example 1:<br/>
> <br/>
> Input: @ints = (10, 4, 8, 3)<br/>
> Output: (15, 1, 11, 22)<br/>
> <br/>
> @left  = (0, 10, 14, 22)<br/>
> @right = (15, 11, 3, 0)<br/>
> <br/>
> @left_right_sum_diff = ( |0-15|, |10-11|, |14-3|, |22-0|)<br/>
>                      = (15, 1, 11, 22)<br/>
> <br/>
> Example 2:<br/>
> <br/>
> Input: @ints = (1)<br/>
> Output: (0)<br/>
> <br/>
> @left  = (0)<br/>
> @right = (0)<br/>
> <br/>
> @left_right_sum_diff = ( |0-0| ) = (0)<br/>
> <br/>
> Example 3:<br/>
> <br/>
> Input: @ints = (1, 2, 3, 4, 5)<br/>
> Output: (14, 11, 6, 1, 19)<br/>
> <br/>
> @left  = (0, 1, 3, 6, 10)<br/>
> @right = (14, 12, 9, 5, 0)<br/>
> <br/>
> @left_right_sum_diff = ( |0-14|, |1-12|, |3-9|, |6-5|, |10-0|)<br/>
>                      = (14, 11, 6, 1, 10)<br/>

Lorem ipsum dolor sit amet...

```perl
sub task_2() {
    ...;
}
```

#### **Thank you for the challenge!**
