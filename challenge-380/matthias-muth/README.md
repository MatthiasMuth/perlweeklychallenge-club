# Challenge 380 tasks: Sum of Frequencies - Reverse Degree
**Challenge 380 solutions in Perl by Matthias Muth**

## Task 1: Sum of Frequencies

>
>
> **Example 1**
>
> ```text
> Input: $str = "banana"
> Output: 5
>
> Vowel: "a" appears 3 times.
> Consonant: "n" appears 2 times, "b" appears 1 time.
>
> Max frequency of vowel: 3
> Max frequency of consonant: 2
> ```
>
> **Example 2**
>
> ```text
> Input: $str = "teestett"
> Output: 7
>
> Vowel: "e" appears 3 times.
> Consonant: "t" appears 4 times, "s" appears 1 time.
>
> Max frequency of vowel: 3
> Max frequency of consonant: 4
> ```
>
> **Example 3**
>
> ```text
> Input: $str = "aeiouuaa"
> Output: 3
>
> Vowel: "a" appears 3 times, "u" 2 times, "e", "i", "o" 1 time each.
> Consonant: None.
>
> Max frequency of vowel: 3
> Max frequency of consonant: 0
> ```
>
> **Example 4**
>
> ```text
> Input: $str = "rhythm"
> Output: 2
>
> Vowel: None
> Consonant: "h" appears 2 times, "r", "y", "t", "m" 1 time each.
>
> Max frequency of vowel: 0
> Max frequency of consonant: 2
> ```
>
> **Example 5**
>
> ```text
> Input: $str = "x"
> Output: 1
>
> Vowel: None
> Consonant: "x" appears 1 time.
>
> Max frequency of vowel: 0
> Max frequency of consonant: 1
> ```


Lorem ipsum dolor sit amet...

```perl
sub sum_of_frequencies() {
    ...;
}
```

## Task 2: Reverse Degree

>
>
> **Example 1**
>
> ```text
> Input: $str = "z"
> Output: 1
>
> Reverse alphabet value of "z" is 1.
> Position 1: 1 x 1
> Sum of product: 1
> ```
>
> **Example 2**
>
> ```text
> Input: $str = "a"
> Output: 26
>
> Reverse alphabet value of "a" is 26.
> Position 1: 1 x 26
> Sum of product: 26
> ```
>
> **Example 3**
>
> ```text
> Input: $str = "bbc"
> Output: 147
>
> Reverse alphabet value of "b" is 25 and "c" is 24.
> Position 1: 1 x 25
> Position 2: 2 x 25
> Position 3: 3 x 24
> Sum of product: 25 + 50 + 72 => 147
> ```
>
> **Example 4**
>
> ```text
> Input: $str = "racecar"
> Output: 560
>
> Reverse alphabet value of "r" is 9, "a" is 26, "c" is 24 and "e" is 24.
> Position 1: 1 x 9
> Position 2: 2 x 26
> Position 3: 3 x 24
> Position 4: 4 x 22
> Position 5: 5 x 24
> Position 6: 6 x 26
> Position 7: 7 x 9
> Sum of product: 9 + 52 + 72 + 88 + 120 + 156 + 63
> ```
>
> **Example 5**
>
> ```text
> Input: $str = "zyx"
> Output: 14
>
> Reverse alphabet value of "z" is 1, "y" is 2 and "x" is 3.
> Position 1: 1 x 1
> Position 2: 2 x 2
> Position 3: 3 x 3
> Sum of product: 1 + 4 + 9
> ```


Lorem ipsum dolor sit amet...

```perl
sub reverse_degree() {
    ...;
}
```

#### **Thank you for the challenge!**
