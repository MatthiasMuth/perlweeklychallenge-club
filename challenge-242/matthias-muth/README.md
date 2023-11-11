# Challenge 242 tasks: Missing Members - Flip Matrix
**Challenge 242 solutions in Perl by Matthias Muth**

## Task 1: Missing Members

> You are given two arrays of integers.<br/>
> Write a script to find out the missing members in each other arrays.<br/>
> Example 1<br/>
> <br/>
> Input: @arr1 = (1, 2, 3)<br/>
>        @arr2 = (2, 4, 6)<br/>
> Output: ([1, 3], [4, 6])<br/>
> <br/>
> (1, 2, 3) has 2 members (1, 3) missing in the array (2, 4, 6).<br/>
> (2, 4, 6) has 2 members (4, 6) missing in the array (1, 2, 3).<br/>
> <br/>
> Example 2<br/>
> <br/>
> Input: @arr1 = (1, 2, 3, 3)<br/>
>        @arr2 = (1, 1, 2, 2)<br/>
> Output: ([3])<br/>
> <br/>
> (1, 2, 3, 3) has 2 members (3, 3) missing in the array (1, 1, 2, 2). Since they are same, keep just one.<br/>
> (1, 1, 2, 2) has 0 member missing in the array (1, 2, 3, 3).<br/>

Lorem ipsum dolor sit amet...

```perl
sub task_1() {
    ...;
}
```

## Task 2: Flip Matrix

> You are given n x n binary matrix.<br/>
> Write a script to flip the given matrix as below.<br/>
> <br/>
> 1 1 0<br/>
> 0 1 1<br/>
> 0 0 1<br/>
> <br/>
> a) Reverse each row<br/>
> <br/>
> 0 1 1<br/>
> 1 1 0<br/>
> 1 0 0<br/>
> <br/>
> b) Invert each member<br/>
> <br/>
> 1 0 0<br/>
> 0 0 1<br/>
> 0 1 1<br/>
> <br/>
> <br/>
> Example 1<br/>
> <br/>
> Input: @matrix = ([1, 1, 0], [1, 0, 1], [0, 0, 0])<br/>
> Output: ([1, 0, 0], [0, 1, 0], [1, 1, 1])<br/>
> <br/>
> Example 2<br/>
> <br/>
> Input: @matrix = ([1, 1, 0, 0], [1, 0, 0, 1], [0, 1, 1, 1], [1, 0, 1, 0])<br/>
> Output: ([1, 1, 0, 0], [0, 1, 1, 0], [0, 0, 0, 1], [1, 0, 1, 0])<br/>

Lorem ipsum dolor sit amet...

```perl
sub task_2() {
    ...;
}
```

#### **Thank you for the challenge!**
