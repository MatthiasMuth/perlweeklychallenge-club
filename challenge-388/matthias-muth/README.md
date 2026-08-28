# Challenge 388 tasks: Dyck Words - Secret Santa
**Challenge 388 solutions in Perl by Matthias Muth**

## Task 1: Dyck Words

> A Dyck Word of order $n is a string of length 2x$n consisting of $n ‘U’ (Up) characters and $n ‘D’ (Down) characters such that no initial prefix of the string contains more ‘D’s than ‘U’s.<br/>
> Write a script to return a list of all valid Dyck words of length 2x$n, sorted in lexicographical (alphabetical) order.
>
> **Example 1**
>
> ```text
> Input: $n = 1
> Output: ("UD")
> ```
>
> **Example 2**
>
> ```text
> Input: $n = 2
> Output: ("UDUD","UUDD")
> ```
>
> **Example 3**
>
> ```text
> Input: $n = 3
> Output: ("UDUDUD", "UDUUDD", "UUDDUD", "UUDUDD", "UUUDDD")
> ```
>
> **Example 4**
>
> ```text
> Input: $n = 0
> Output: ("")
> ```
>
> **Example 5**
>
> ```text
> Input: $n = 4
> Output: ("UDUDUDUD", "UDUDUUDD", "UDUUDDUD", "UDUUDUDD", "UDUUUDDD",
>          "UUDDUDUD", "UUDDUUDD", "UUDUDDUD", "UUDUDUDD", "UUDUUDDD",
>          "UUUDDDUD", "UUUDDUDD", "UUUDUDDD", "UUUUDDDD")
> ```


Lorem ipsum dolor sit amet...

```perl
sub dyck_words() {
    ...;
}
```

## Task 2: Secret Santa

> A company with $n employees is running a Secret Santa exchange. Each employee buys one gift and receives one gift.<br/>
> Write a script to return the total number of valid gift assignments where no employee receives the gift they originally bought (i.e., employee $i must not be assigned gift $i).
>
> **Example 1**
>
> ```text
> Input: $n = 1
> Output: 0
>
> Only 1 participant exists. They would have to receive their own gift, which is invalid.
> ```
>
> **Example 2**
>
> ```text
> Input: $n = 2
> Output: 1
>
> Participants 1 and 2 must swap gifts ([2, 1]).
> ```
>
> **Example 3**
>
> ```text
> Input: $n = 3
> Output: 2
>
> The 2 valid gift arrays where array[i] is who person i+1 receives from:
> [2, 3, 1]
> [3, 1, 2]
> ```
>
> **Example 4**
>
> ```text
> Input: $n = 4
> Output: 9
>
> The 9 valid arrays are:
> [2, 1, 4, 3], [2, 3, 4, 1], [2, 4, 1, 3],
> [3, 1, 4, 2], [3, 4, 1, 2], [3, 4, 2, 1],
> [4, 1, 2, 3], [4, 3, 1, 2], [4, 3, 2, 1],
> ```
>
> **Example 5**
>
> ```text
> Input: $n = 5
> Output: 44
>
> There are 44 valid permutations out of 5! = 120 total possible arrangements.
> ```


Lorem ipsum dolor sit amet...

```perl
sub secret_santa() {
    ...;
}
```

#### **Thank you for the challenge!**
