# Challenge 372 tasks: Rearrange Spaces - Largest Substring
**Challenge 372 solutions in Perl by Matthias Muth**

## Task 1: Rearrange Spaces

> You are given a string text of words that are placed among number of spaces.<br/>
> Write a script to rearrange the spaces so that there is an equal number of spaces between every pair of adjacent words and that number is maximised. If you can’t distribute, place the extra spaces at the end. Finally return the string.
>
> **Example 1**
>
> ```text
> Input: $str = "  challenge  "
> Output: "challenge    "
>
> We have 4 spaces and 1 word. So all spaces go to the end.
> ```
>
> **Example 2**
>
> ```text
> Input: $str = "coding  is  fun"
> Output: "coding  is  fun"
>
> We have 4 spaces and 3 words (2 gaps). So 2 spaces per gap.
> ```
>
> **Example 3**
>
> ```text
> Input: $str = "a b c  d"
> Output: "a b c d "
>
> We have 4 spaces and 4 words (3 gaps). So 1 space per gap and 1 remainder.
> ```
>
> **Example 4**
>
> ```text
> Input: $str = "  team      pwc  "
> Output: "team          pwc"
>
> We have 10 spaces and 2 words (1 gap). So 10 spaces per gap.
> ```
>
> **Example 5**
>
> ```text
> Input: $str = "   the  weekly  challenge  "
> Output: "the    weekly    challenge "
>
> We have 9 spaces and 3 words (2 gaps). So 4 spaces per gap and 1 remainder.
> ```


Lorem ipsum dolor sit amet...

```perl
sub rearrange_spaces() {
    ...;
}
```

## Task 2: Largest Substring

> You are given a string.<br/>
> Write a script to return the length of the largest substring between two equal characters excluding the two characters. Return -1 if there is no such substring.
>
> **Example 1**
>
> ```text
> Input: $str = "aaaaa"
> Output: 3
>
> For character "a", we have substring "aaa".
> ```
>
> **Example 2**
>
> ```text
> Input: $str = "abcdeba"
> Output: 5
>
> For character "a", we have substring "bcdeb".
> ```
>
> **Example 3**
>
> ```text
> Input: $str = "abbc"
> Output: 0
>
> For character "b", we have substring "".
> ```
>
> **Example 4**
>
> ```text
> Input: $str = "abcaacbc"
> Output: 4
>
> For character "a", we have substring "bca".
> For character "b", we have substring "caac".
> For character "c", we have substring "aacb".
> ```
>
> **Example 5**
>
> ```text
> Input: $str = "laptop"
> Output: 2
>
> For character "p", we have substring "to".
> ```


Lorem ipsum dolor sit amet...

```perl
sub largest_substring() {
    ...;
}
```

#### **Thank you for the challenge!**
