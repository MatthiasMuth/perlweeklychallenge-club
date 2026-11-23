# Challenge 401 tasks: Fractional Addition Substraction - Reconstruct Digits
**Challenge 401 solutions in Perl by Matthias Muth**

## Task 1: Fractional Addition Substraction

> You are given a string representing an expression of fraction addition and substraction.<br/>
> Write a script that returns the calculation result of given expression in string format. If final result is an integer, change it to the format of fraction that has a denominator 1.
>
> **Example 1**
>
> ```text
> Input: $expr = "1/2+3/2"
> Output: "2/1"
>
> 1/2 + 3/2 => 4/2 => 2
>
> As specified by the rules, an integer result must be represented as a fraction with denominator 1, yielding "2/1".
> ```
>
> **Example 2**
>
> ```text
> Input: $expr = "-5/2-3/2"
> Output: "-4/1"
>
> -5/2 - 3/2 => -8/2 => -4 => "-4/1".
> ```
>
> **Example 3**
>
> ```text
> Input: $expr = "5/3-5/3"
> Output: "0/1"
>
> 5/3 - 5/3 => 0/3
> Zero divided by any valid non-zero denominator reduces to "0/1".
> ```
>
> **Example 4**
>
> ```text
> Input: $expr = "10/10-1/10+2/5"
> Output: "13/10"
>
> 10/10 - 1/10 + 2/5 => 9/10 + 4/10 => 13/10.
> 13/10 is already irreducible, so the output is "13/10".
> ```
>
> **Example 5**
>
> ```text
> Input: $expr = "1/6+1/6+1/6"
> Output: "1/2"
>
> 1/6 + 1/6 + 1/6 => 3/6 => 1/2
> ```


Lorem ipsum dolor sit amet...

```perl
sub fractional_addition_substraction() {
    ...;
}
```

## Task 2: Reconstruct Digits

> You are given a string containing an out-of-order English representation of digits 0-9.<br/>
> Write a script to return the digits in ascending order.
>
> **Example 1**
>
> ```text
> Input: $str = "zroezerotwotwotwo"
> Output: "00222"
>
> 'z' appears two times => two "zero"
> 'w' appears three times => three "two"
> ```
>
> **Example 2**
>
> ```text
> Input: $str = "sveeneinght"
> Output: "78"
>
> 'g' appears one time => one "eight"
> Removing the letters of "eight" leaves "sveen".
> Now 'v' appears one time => one "seven"
> ```
>
> **Example 3**
>
> ```text
> Input: $str = "onenineninefive"
> Output: "1599"
>
> 'f' appears one time => one "five"
> After removing "five", 'o' appears one time => one "one".
> The remaining letters are "ninenine", where 'i' appears two times => two "nine".
> ```
>
> **Example 4**
>
> ```text
> Input: $str = "zeroonetwothreeeightfivesixsevenninefour"
> Output: "0123456789"
>
> The input contains the scrambled letters of every single digit from 0 through 9 exactly once:
> "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine".
> ```
>
> **Example 5**
>
> ```text
> Input: $str = "ninenineninenine"
> Output: "9999"
>
> Character counts: 'n' = 8, 'i' = 4, 'e' = 4.
> Every set of letters matches "nine", giving four 9s.
> ```


Lorem ipsum dolor sit amet...

```perl
sub reconstruct_digits() {
    ...;
}
```

#### **Thank you for the challenge!**
