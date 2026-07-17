# Challenge 382 tasks: Hamiltonian Cycle - Replace Question Mark
**Challenge 382 solutions in Perl by Matthias Muth**

## Task 1: Hamiltonian Cycle

> You are given a target number.<br/>
> Write a script to arrange all the whole numbers from 1 up to the given target number into a circle so that every pair of side-by-side numbers adds up to a perfect square. Please make sure, the last number and the first must also add up to a square.
>
> **Example 1**
>
> ```text
> Input: $n = 32
> Output: 1, 8, 28, 21, 4, 32, 17, 19, 30, 6, 3, 13, 12, 24, 25, 11, 5, 31, 18, 7, 29, 20, 16, 9, 27, 22, 14, 2, 23, 26, 10, 15
>
> 1  + 8  = 9
> 8  + 28 = 36
> 28 + 21 = 49
> 21 + 4  = 25
> 4  + 32 = 36
> 32 + 17 = 49
> 17 + 19 = 36
> 19 + 30 = 49
>
> so on, all the way through the sequence.
> ```
>
> **Example 2**
>
> ```text
> Input: $n = 15
> Output: ()
>
> No valid circular list of numbers exists.
> ```
>
> **Example 3**
>
> ```text
> Input: $n = 34
> Output: 1, 8, 28, 21, 4, 32, 17, 19, 6, 30, 34, 15, 10, 26, 23, 2, 14, 22, 27, 9, 16, 33, 31, 18, 7, 29, 20, 5, 11, 25, 24, 12, 13, 3
>
> [2026-07-13 11:45]: Output was incorrect, corrected by E. Choroba.
> ```


Lorem ipsum dolor sit amet...

```perl
sub hamiltonian_cycle() {
    ...;
}
```

## Task 2: Replace Question Mark

> You are given a string that contains only 0, 1 and ? characters.<br/>
> Write a script to generate all possible combinations when replacing the question marks with a zero or one.
>
> **Example 1**
>
> ```text
> Input: $str = "01??0"
> Output: ("01000", "01010", "01100", "01110")
> ```
>
> **Example 2**
>
> ```text
> Input: $str = "101"
> Output: ("101")
> ```
>
> **Example 3**
>
> ```text
> Input: $str = "???"
> Output: ("000", "001", "010", "011", "100", "101", "110", "111")
> ```
>
> **Example 4**
>
> ```text
> Input: $str = "1?10"
> Output: ("1010", "1110")
> ```
>
> **Example 5**
>
> ```text
> Input: $str = "1?1?0"
> Output: ("10100", "10110", "11100", "11110")
> ```


Lorem ipsum dolor sit amet...

```perl
sub replace_question_mark() {
    ...;
}
```

#### **Thank you for the challenge!**
