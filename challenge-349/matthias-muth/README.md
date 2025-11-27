# Challenge 349 tasks: Power String - Meeting Point
**Challenge 349 solutions in Perl by Matthias Muth**

## Task 1: Power String

> You are given a string.<br/>
> Write a script to return the power of the given string.<br/>
> The power of the string is the maximum length of a non-empty substring that contains only one unique character.
>
> **Example 1**
>
> ```text
> Input: $str = "textbook"
> Output: 2
>
> Breakdown: "t", "e", "x", "b", "oo", "k"
> The longest substring with one unique character is "oo".
> ```
>
> **Example 2**
>
> ```text
> Input: $str = "aaaaa"
> Output: 5
> ```
>
> **Example 3**
>
> ```text
> Input: $str = "hoorayyy"
> Output: 3
>
> Breakdown: "h", "oo", "r", "a", "yyy"
> The longest substring with one unique character is "yyy".
> ```
>
> **Example 4**
>
> ```text
> Input: $str = "x"
> Output: 1
> ```
>
> **Example 5**
>
> ```text
> Input: $str = "aabcccddeeffffghijjk"
> Output: 4
>
> Breakdown: "aa", "b", "ccc", "dd", "ee", "ffff", "g", "h", "i", "jj", "k"
> The longest substring with one unique character is "ffff".
> ```


Lorem ipsum dolor sit amet...

```perl
sub power_string() {
    ...;
}
```

## Task 2: Meeting Point

> You are given instruction string made up of U (up), D (down), L (left) and R (right).<br/>
> Write a script to return true if following the instruction, you meet the starting point (0,0).
>
> **Example 1**
>
> ```text
> Input: $path = "ULD"
> Output: false
>
> (-1,1) <- (0,1)
>    |        ^
>    v        |
> (-1,0)    (0,0)
> ```
>
> **Example 2**
>
> ```text
> Input: $path = "ULDR"
> Output: true
>
>  (-1,1) <- (0,1)
>     |        ^
>     v        |
>  (-1,0) -> (0,0)
> ```
>
> **Example 3**
>
> ```text
> Input: $path = "UUURRRDDD"
> Output: false
>
> (0,3) -> (1,3) -> (2,3) -> (3,3)
>   ^                          |
>   |                          v
> (0,2)                      (3,2)
>   ^                          |
>   |                          v
> (0,1)                      (3,1)
>   ^                          |
>   |                          v
> (0,0)                      (3,0)
> ```
>
> **Example 4**
>
> ```text
> Input: $path = "UURRRDDLLL"
> Output: true
>
> (0,2) -> (1,2) -> (2,2) -> (3,2)
>   ^                          |
>   |                          v
> (0,1)                      (3,1)
>   ^                          |
>   |                          v
> (0,0) <- (1,0) <- (1,1) <- (3,0)
> ```
>
> **Example 5**
>
> ```text
> Input: $path = "RRUULLDDRRUU"
> Output: true
>
> (0,2) <- (1,2) <- (2,2)
>   |                 ^
>   v                 |
> (0,1)             (2,1)
>   |                 ^
>   v                 |
> (0,0) -> (1,0) -> (2,1)
> ```


Lorem ipsum dolor sit amet...

```perl
sub meeting_point() {
    ...;
}
```

#### **Thank you for the challenge!**
