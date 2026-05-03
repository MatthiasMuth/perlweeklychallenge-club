# Challenge 371 tasks: Missing Letter - Subset Equilibrium
**Challenge 371 solutions in Perl by Matthias Muth**

## Task 1: Missing Letter

> You are given a sequence of 5 lowercase letters, with one letter replaced by ‘?’. Each letter maps to its position in the alphabet (‘a = 1’, ‘b = 2’, …, ‘z = 26’). The sequence follows a repeating pattern of step sizes between consecutive letters. The pattern is either a constant step (e.g., ‘+2, +2, +2, +2’) or a simple alternating pattern of two distinct steps (e.g., ‘+2, +3, +2, +3’).
>
> **Example 1**
>
> ```text
> Input: $seq = qw(a c ? g i)
> Output: e
>
> The pattern of the sequence is +2,+2,+2,+2.
> 1: a
> 3: c
> 5: e
> 7: g
> 9: i
> ```
>
> **Example 2**
>
> ```text
> Input: $seq = qw(a d ? j m)
> Output: g
>
> The pattern of the sequence is +3,+3,+3,+3.
> 1: a
> 4: d
> 7: g
> 10: j
> 13: m
> ```
>
> **Example 3**
>
> ```text
> Input: $seq = qw(a e ? m q)
> Output: i
>
> The pattern of the sequence is +4,+4,+4,+4.
> 1: a
> 5: e
> 9: i
> 13: m
> 17: q
> ```
>
> **Example 4**
>
> ```text
> Input: $seq = qw(a c f ? k)
> Output: h
>
> The pattern of the sequence is +2,+3,+2,+3.
> 1: a
> 3: c
> 6: f
> 8: h
> 11: k
> ```
>
> **Example 5**
>
> ```text
> Input: $seq = qw(b e g ? l)
> Output: j
>
> The pattern of the sequence is +3,+2,+3,+2.
> 2: b
> 5: e
> 7: g
> 10: j
> 12: l
> ```


Lorem ipsum dolor sit amet...

```perl
sub missing_letter() {
    ...;
}
```

## Task 2: Subset Equilibrium

> You are given an array of numbers.<br/>
> Write a script to find all subsets where the sum of elements equals the sum of their indices.
>
> **Example 1**
>
> ```text
> Input: @nums = (2, 1, 4, 3)
> Output: (2, 1), (1, 4), (4, 3), (2, 3)
>
> Subset 1: (2, 1)
> Values: 2 + 1 = 3
> Positions: 1 + 2 = 3
>
> Subset 2: (1, 4)
> Values: 1 + 4 = 5
> Positions: 2 + 3 = 5
>
> Subset 3: (4, 3)
> Values: 4 + 3 = 7
> Positions: 3 + 4 = 7
>
> Subset 4: (2, 3)
> Values: 2 + 3 = 5
> Positions: 1 + 4 = 5
> ```
>
> **Example 2**
>
> ```text
> Input: @nums = (3, 0, 3, 0)
> Output: (3, 0), (3, 0, 3)
>
> Subset 1: (3, 0)
> Values: 3 + 0 = 3
> Positions: 1 + 2 = 3
>
> Subset 2: (3, 0, 3)
> Values: 3 + 0 + 3 = 6
> Positions: 1 + 2 + 3 = 6
> ```
>
> **Example 3**
>
> ```text
> Input: @nums = (5, 1, 1, 1)
> Output: (5, 1, 1)
>
> Subset 1: (5, 1, 1)
> Values: 5 + 1 + 1 = 7
> Positions: 1 + 2 + 4 = 7
> ```
>
> **Example 4**
>
> ```text
> Input: @nums = (3, -1, 4, 2)
> Output: (3, 2), (3, -1, 4)
>
> Subset 1: (3, 2)
> Values: 3 + 2 = 5
> Positions: 1 + 4 = 5
>
> Subset 2: (3, -1, 4)
> Values: 3 + (-1) + 4 = 6
> Positions: 1 + 2 + 3 = 6
> ```
>
> **Example 5**
>
> ```text
> Input: @nums = (10, 20, 30, 40)
> Output: ()
> ```


Lorem ipsum dolor sit amet...

```perl
sub subset_equilibrium() {
    ...;
}
```

#### **Thank you for the challenge!**
