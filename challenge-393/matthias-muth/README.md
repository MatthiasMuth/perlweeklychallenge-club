# Challenge 393 tasks: Pythagoras Multiplied - Prime Step
**Challenge 393 solutions in Perl by Matthias Muth**

## Task 1: Pythagoras Multiplied

> You are given a positive integer n.<br/>
> Find the number of all positive integer triplets (a, b, c) so that a^2 + b^2 = c^2 and a, b and c are integers <= n.
>
> **Example 1**
>
> ```text
> Input: $n = 20
> Output: 12
>
> (3,4,5),  (4,3,5),   (5,12,13),(6,8,10),
> (8,6,10), (8,15,17), (9,12,15),(12,5,13),
> (12,9,15),(12,16,20),(15,8,17),(16,12,20)
> ```
>
> **Example 2**
>
> ```text
> Input: $n = 7
> Output: 2
>
> (3,4,5),(4,3,5)
> ```
>
> **Example 3**
>
> ```text
> Input: $n = 1
> Output: 0
> ```
>
> **Example 4**
>
> ```text
> Input: $n = 15
> Output: 8
> ```
>
> **Example 5**
>
> ```text
> Input: $n = 30
> Output: 22
> ```


Lorem ipsum dolor sit amet...

```perl
sub pythagoras_multiplied() {
    ...;
}
```

## Task 2: Prime Step

> You are given a string with English alphabetic characters only.<br/>
> What is the absolute difference of the sum of the ASCII values of the characters in the string to the nearest prime number?
>
> **Example 1**
>
> ```text
> Input: $str = "hello"
> Output: 9
>
> The ordinal values of "hello" are [104,101,108,108,111], summing up to 532.
> The nearest prime number to 532 is 523, resulting in an absolute difference of 9.
> ```
>
> **Example 2**
>
> ```text
> Input: $str = "football"
> Output: 2
>
> Starting with the values [102,111,111,116,98,97,108,108] and the sum 841.
> We find 839 as the nearest prime number, so the difference is 2.
> ```
>
> **Example 3**
>
> ```text
> Input: $str = "a"
> Output: 0
> ```
>
> **Example 4**
>
> ```text
> Input: $str = "challenge"
> Output: 2
>
> The ordinal values of "challenge" are [99, 104, 97, 108, 108, 101, 110, 103, 101], which sum up to 931.
> The nearest prime number to 931 is 929, so the difference is 2.
> ```
>
> **Example 5**
>
> ```text
> Input: $str = "perl"
> Output: 2
>
> The ordinal values of "perl" are [112, 101, 114, 108], summing up to 435.
> Nearest prime is 433, so the difference is 2.
> ```


Lorem ipsum dolor sit amet...

```perl
sub prime_step() {
    ...;
}
```

#### **Thank you for the challenge!**
