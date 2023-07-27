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
> <br/>
> Input: $string = 'rulepark', @indices = (4,7,3,1,0,5,2,6)<br/>
> Output: 'perlraku'<br/>

Lorem ipsum dolor sit amet...

```perl
sub task_1() {
    ...;
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
