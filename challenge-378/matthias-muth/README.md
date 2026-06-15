# Challenge 378 tasks: Second Largest Digit - Sum of Words
**Challenge 378 solutions in Perl by Matthias Muth**

## Task 1: Second Largest Digit

> You are given an alphanumeric string.<br/>
> Write a script to find the second largest distinct digit in the given string. Return -1 if none found.
>
> **Example 1**
>
> ```text
> Input: $str = "aaaaa77777"
> Output: -1
>
> The only digit in the given string is 7 and there is no second digit.
> ```
>
> **Example 2**
>
> ```text
> Input: $str = "abcde"
> Output: -1
>
> No numerical digits in the given string.
> ```
>
> **Example 3**
>
> ```text
> Input: $str = "9zero8eight7seven9"
> Output: 8
> ```
>
> **Example 4**
>
> ```text
> Input: $str = "xyz9876543210"
> Output: 8
> ```
>
> **Example 5**
>
> ```text
> Input: $str = "4abc4def2ghi8jkl2"
> Output: 4
> ```


Lorem ipsum dolor sit amet...

```perl
sub second_largest_digit() {
    ...;
}
```

## Task 2: Sum of Words

> You are given three strings consisting of lower case English letters ‘a’ to ‘j’ only. The letter value of a = 0, b = 1, c = 3, etc.<br/>
> Write a script to find if sum of first two strings return the third string.
>
> **Example 1**
>
> ```text
> Input: $str1 = "acb", $str2 = "cba", $str3 = "cdb"
> Output: true
>
> $str1 = "acb" = 021
> $str2 = "cba" = 210
> $str3 = "cdb" = 231
> $str1 + $str2 = $str3
> ```
>
> **Example 2**
>
> ```text
> Input: $str1 = "aab", $str2 = "aac", $str3 = "ad"
> Output: true
>
> $str1 = "aab" = 001
> $str2 = "aac" = 002
> $str3 = "ad"  = 03
> ```
>
> **Example 3**
>
> ```text
> Input: $str1 = "bc", $str2 = "je", $str3 = "jg"
> Output: false
>
> $str1 = "bc" = 12
> $str2 = "je" = 94
> $str3 = "jg" = 96
> ```
>
> **Example 4**
>
> ```text
> Input: $str1 = "a", $str2 = "aaaa", $str3 = "aa"
> Output: true
>
> $str1 = "a"    = 0
> $str2 = "aaaa" = 0000
> $str3 = "aa"   = 00
> ```
>
> **Example 5**
>
> ```text
> Input: $str1 = "c", $str2 = "d", $str3 = "h"
> Output: false
>
> $str1 = "c" = 2
> $str2 = "d" = 3
> $str3 = "h" = 7
> ```
>
> **Example 6**
>
> ```text
> Input: $str1 = "gfi", $str2 = "hbf", $str3 = "bdhd"
> Output: true
>
> $str1 =  "gfi" =  658
> $str2 =  "hbf" =  715
> $str3 = "bdhd" = 1373
> ```


Lorem ipsum dolor sit amet...

```perl
sub sum_of_words() {
    ...;
}
```

#### **Thank you for the challenge!**
