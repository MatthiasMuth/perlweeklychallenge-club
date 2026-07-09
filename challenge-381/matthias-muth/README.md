# Smaller? Greater? Same!
**Challenge 381 solutions in Perl by Matthias Muth**

## Task 1: Same Row Column

> You are given a n x n matrix containing integers from 1 to n.<br/>
> Write a script to find if every row and every column contains all the integers from 1 to n.
>
> **Example 1**
>
> ```text
> Input: @matrix = ([1, 2, 3, 4],
>                   [2, 3, 4, 1],
>                   [3, 4, 1, 2],
>                   [4, 1, 2, 3],)
> Output: true
> ```
>
> **Example 2**
>
> ```text
> Input: @matrix = ([1])
> Output: true
> ```
>
> **Example 3**
>
> ```text
> Input: @matrix = ([1, 2, 5],
>                   [5, 1, 2],
>                   [2, 5, 1],)
> Output: false
>
> Elements are out of range 1..3.
> ```
>
> **Example 4**
>
> ```text
> Input: @matrix = ([1, 2, 3],
>                   [1, 2, 3],
>                   [1, 2, 3],)
> Output: false
> ```
>
> **Example 5**
>
> ```text
> Input: @matrix = ([1, 2, 3],
>                   [3, 1, 2],
>                   [3, 2, 1],)
> Output: false
> ```


Lorem ipsum dolor sit amet...

```perl
sub same_row_column() {
    ...;
}
```

## Task 2: Smaller Greater Element

> You are given an array of integers.<br/>
> Write a script to find the number of elements that have both a strictly smaller and greater element in the given array.
>
> **Example 1**
>
> ```text
> Input: @int = (2,4)
> Output: 0
>
> Not enough elements in the array.
> ```
>
> **Example 2**
>
> ```text
> Input: @int = (1, 1, 1, 1)
> Output: 0
> ```
>
> **Example 3**
>
> ```text
> Input: @int = (1, 1, 4, 8, 12, 12)
> Output: 2
>
> The elements are 4 and 8.
> ```
>
> **Example 4**
>
> ```text
> Input: @int = (3, 6, 6, 9)
> Output: 2
>
> Both instances of 6.
> ```
>
> **Example 5**
>
> ```text
> Input: @int = (0, -5, 10, -2, 4)
> Output: 3
>
> The elements are 0, -2, and 4.
> ```


Lorem ipsum dolor sit amet...

```perl
sub smaller_greater_element() {
    ...;
}
```

#### **Thank you for the challenge!**
