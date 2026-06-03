# Challenge 373 tasks: Equal List - List Division
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


Lorem ipsum dolor sit amet...

```perl
sub equal_list() {
    ...;
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


Lorem ipsum dolor sit amet...

```perl
sub list_division() {
    ...;
}
```

#### **Thank you for the challenge!**
