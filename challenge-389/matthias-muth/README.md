# Challenge 389 tasks: Reorder Notes - ZigZag Subarray
**Challenge 389 solutions in Perl by Matthias Muth**

## Task 1: Reorder Notes

> You are given an array [composer, notes, permutation], reconstruct the melody by using each permutation value as the destination position of the corresponding note. Use no explicit for, foreach, or while loops. Output each result as COMPOSER => reordered notes.<br/>
> ASSUMPTION: Input is valid; the notes array and permutation array have identical lengths, and the permutation contains each position from 1 to N exactly once.
>
> **Example 1**
>
> ```text
> Input: $melody = ['Bach', [qw(C D E F# G A B)], [7, 1, 6, 2, 5, 3, 4]]
> Output: BACH => D F# A B G E C
>
> Note 1 (C)  moves to position 7.
> Note 2 (D)  moves to position 1.
> Note 3 (E)  moves to position 6.
> Note 4 (F#) moves to position 2.
> Note 5 (G)  moves to position 5.
> Note 6 (A)  moves to position 3.
> Note 7 (B)  moves to position 4.
> ```
>
> **Example 2**
>
> ```text
> Input: $melody = ['Beethoven', [qw(C D F# G Ab)], [1, 3, 5, 2, 4]]
> Output: BEETHOVEN => C G D Ab F#
>
> Note 1 (C)  stays at position 1.
> Note 2 (D)  moves to position 3.
> Note 3 (F#) moves to position 5.
> Note 4 (G)  moves to position 2.
> Note 5 (Ab) moves to position 4.
> ```
>
> **Example 3**
>
> ```text
> Input: $melody = [ 'Brahms', [qw(C Db Eb F G Ab Bb C D)], [9, 3, 7, 1, 8, 5, 2, 6, 4] ]
> Output: BRAHMS => F Bb Db D Ab C Eb G C
> ```
>
> **Example 4**
>
> ```text
> Input: $melody = [ 'Bruckner', [qw(G F# Bb C D Eb F)], [4, 7, 2, 6, 1, 5, 3] ]
> Output: BRUCKNER => D Bb F G Eb C F#
> ```
>
> **Example 5**
>
> ```text
> Input: $melody = ['Berg', [qw(C#)], [1]]
> Output: BERG => C#
> ```


Lorem ipsum dolor sit amet...

```perl
sub reorder_notes() {
    ...;
}
```

## Task 2: ZigZag Subarray

> You are given an array of integers.<br/>
> Write a script to find the length of the longest contiguous subarray where the numbers alternate between strictly increasing and strictly decreasing (a ZigZag pattern).<br/>
> A sequence of numbers $A = [a0, a1, …, ak]$ with length $k >= 1 is considered a ZigZag sequence if every adjacent pair alternates direction:<br/>
> a_0 < a_1 > a_2 < a_3 > ...<br/>
> OR<br/>
> a_0 > a_1 < a_2 > a_3 < ...<br/>
> <br/>
> NOTE: A single element (length 1) or any two distinct elements (length 2) are automatically valid ZigZag sequences. Equal adjacent numbers (e.g., 5, 5) break the pattern.
>
> **Example 1**
>
> ```text
> Input: @nums = (9, 4, 2, 10, 7, 8, 8, 1, 9)
> Output: 5
>
> ZigZag subarray: (4, 2, 10, 7, 8)
> ```
>
> **Example 2**
>
> ```text
> Input: @nums = (1, 7, 4, 9, 2, 5)
> Output: 6
>
> ZigZag subarray: (1, 7, 4, 9, 2, 5)
> ```
>
> **Example 3**
>
> ```text
> Input: @nums = (1, 2, 3, 4, 5)
> Output: 2
>
> ZigZag subarray: (1, 2)
> ```
>
> **Example 4**
>
> ```text
> Input: @nums = (4, 4, 4)
> Output: 1
> ```
>
> **Example 5**
>
> ```text
> Input: @nums = (10, 20, 15, 12, 18)
> Output: 3
>
> ZigZag subarray: (10, 20, 15)
> ```


Lorem ipsum dolor sit amet...

```perl
sub zigzag_subarray() {
    ...;
}
```

#### **Thank you for the challenge!**
