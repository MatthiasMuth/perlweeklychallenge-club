# Alternating Alternations
**Challenge 394 solutions in Perl by Matthias Muth**

## Task 1: Alternate Case

> You are given a string containing an equal number of uppercase and lowercase English letters.<br/>
> Write a script to the minimum number of adjacent character swaps needed to turn the given string into an alternate case string.
>
> **Example 1**
>
> ```text
> Input: $str = "aAbB"
> Output: 0
> ```
>
> **Example 2**
>
> ```text
> Input: $str = "AAbb"
> Output: 1
> 
> Swap 1: "AbAb"
> ```
>
> **Example 3**
>
> ```text
> Input: $str = "AAAbbb"
> Output: 3
> 
> Swap 1: "AAbAbb"
> Swap 2: "AbAAbb"
> Swap 3: "AbAbAb"
> ```
>
> **Example 4**
>
> ```text
> Input: $str = "aABb"
> Output: 1
> 
> Swap 1: "aAbB"
> ```
>
> **Example 5**
>
> ```text
> Input: $str = "bBBAaa"
> Output: 2
> 
> Swap 1: "BbBAaa"
> Swap 2: "BbBaAa"
> ```

My approach follows this idea:
Let's consider the upper case letters only. Each one of them has to move from its current position to the correct position in the final alternate case string. Moving is done by a sequence of swaps, but we only need the *number* of swaps. That number is equal to the distance of the character's initial position and its final position.

So if we number the uppercase letters $i \in \{1 \dots n \}$, we can call the actual positions of all upper case letters $p_i$.

There are two types of alternate case strings:

* those starting with an upper case letter, like `"AbAbAb"`,
* those starting with a lower case letter, like `"aBaBaB"`.

For the first form, the positions

We have to compute the number of swaps needed to move all upper case
letters into the first form, and also for the second form.
Then we take the minimum of the two sums.


```perl
use v5.36;
use List::Util qw( sum min );

sub alternate_case( $str ) {
    my @uc_indices =
        map { substr( $str, $_, 1 ) =~ /[A-Z]/ ? $_ : () }
            0 .. length( $str ) - 1;
    return min(
        sum( map {
                my $target_index = 2 * $_;
                abs( $target_index - $uc_indices[$_] );
            } keys @uc_indices ),
        sum( map {
                my $target_index = 2 * $_ + 1;
                abs( $target_index - $uc_indices[$_] );
            } keys @uc_indices ),
    );
}
```

## Task 2: Alternating Vowels Consonants

> You are given three strings containing English alphabetic characters.<br/>
> Find all the longest contiguous substrings common to all three strings that strictly alternate between vowels and consonants.
>
> **Example 1**
>
> ```text
> Input: @str = ("relocate", "delocate", "allocate")
> Output: ("locate")
> ```
>
> **Example 2**
>
> ```text
> Input: @str = ("apple", "banana", "cherry")
> Output: ()
> ```
>
> **Example 3**
>
> ```text
> Input: @str = ("navigate", "cavity", "gravity")
> Output: ("avi")
> ```
>
> **Example 4**
>
> ```text
> Input: @str = ("pedalgia", "pedalboard", "pedantic")
> Output: ("peda")
> ```
>
> **Example 5**
>
> ```text
> Input: @strings = ("schoolmaster", "schoolhouse", "schooling")
> Output: ("ho", "ol")
> ```


Lorem ipsum dolor sit amet...

```perl
sub alternating_vowels_consonants() {
    ...;
}
```

#### **Thank you for the challenge!**
