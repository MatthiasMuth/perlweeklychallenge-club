# Challenge 398 tasks: Divisible Average - String Difference
**Challenge 398 solutions in Perl by Matthias Muth**

## Task 1: Divisible Average

> You are given an array of positive integers.<br/>
> Write a script to return the closest integer to the mean value of all even integers that are divisible by 3. If none is divisible, return 0.
>
> **Example 1**
>
> ```text
> Input: @arr = (18, 5, 7, 11)
> Output: 18
>
> 18 is the only even number and divisible by 3.
> Average: 18 / 1 = 18.
> ```
>
> **Example 2**
>
> ```text
> Input: @arr = (6, 12, 18, 24, 30, 40)
> Output: 18
>
> The qualifying numbers are 6, 12, 18, 24, and 30.
> Average: (6 + 12 + 18 + 24 + 30) / 5 = 90 / 5 = 18
> ```
>
> **Example 3**
>
> ```text
> Input: @arr = (3, 9, 15, 21, 27)
> Output: 0
>
> None of the elements are even.
> Since no elements qualify, return 0.
> ```
>
> **Example 4**
>
> ```text
> Input: @arr = (6, 12, 14, 20)
> Output: 9
>
> The qualifying numbers are 6 and 12.
> Average: (6 + 12) / 2 = 9.
> ```
>
> **Example 5**
>
> ```text
> Input: @arr = (6, 6, 6, 12, 12)
> Output: 8
>
> All five numbers are even and divisible by 3.
> Average: (6 + 6 + 6 + 12 + 12) / 5 = 8.4 => 8
> ```


Lorem ipsum dolor sit amet...

```perl
sub divisible_average() {
    ...;
}
```

## Task 2: String Difference

> You are given an array of equal length strings.<br/>
> Write a script to find the difference integer array of each word in the given array. There will be one word with a different array; return that word.<br/>
> Each words[i] can be converted into a difference integer array difference[i] of length n - 1 where difference[i][j] = words[i][j+1] - words[i][j]
>
> **Example 1**
>
> ```text
> Input: @words = ("ab", "bc", "cd", "zy")
> Output: "zy"
>
> "ab" => [1 - 0] = [1]
> "bc" => [2 - 1] = [1]
> "cd" => [3 - 2] = [1]
> "zy" => [24 - 25] = [-1]
> ```
>
> **Example 2**
>
> ```text
> Input: @words = ("cba", "fed", "azy")
> Output: "azy"
>
> "cba" => [1 - 2, 0 - 1] = [-1, -1]
> "fed" => [4 - 5, 3 - 4] = [-1, -1]
> "azy" => [25 - 0, 24 - 25] = [25, -1]
> ```
>
> **Example 3**
>
> ```text
> Input: @words = ("pop", "ada", "beb", "cfc")
> Output: "pop"
>
> "pop" => [14 - 15, 15 - 14] = [-1, 1]
> "ada" => [3 - 0, 0 - 3] = [3, -3]
> "beb" => [4 - 1, 1 - 4] = [3, -3]
> "cfc" => [5 - 2, 2 - 5] = [3, -3]
> ```
>
> **Example 4**
>
> ```text
> Input: @words = ("aaaa", "zzzz", "mmmm", "aaba")
> Output: "aaba"
>
> "aaaa" => [0 - 0, 0 - 0, 0 - 0] = [0, 0, 0]
> "zzzz" => [25 - 25, 25 - 25, 25 - 25] = [0, 0, 0]
> "mmmm" => [12 - 12, 12 - 12, 12 - 12] = [0, 0, 0]
> "aaba" => [0 - 0, 1 - 0, 0 - 1] = [0, 1, -1]
> ```
>
> **Example 5**
>
> ```text
> Input: @words = ("aceg", "bdfh", "cegi", "azbz")
> Output: "azbz"
>
> "aceg" => [2 - 0, 4 - 2, 6 - 4] = [2, 2, 2]
> "bdfh" => [3 - 1, 5 - 3, 7 - 5] = [2, 2, 2]
> "cegi" => [4 - 2, 6 - 4, 8 - 6] = [2, 2, 2]
> "azbz" => [25 - 0, 1 - 25, 25 - 1] = [25, -24, 24]
> ```


Lorem ipsum dolor sit amet...

```perl
sub string_difference() {
    ...;
}
```

#### **Thank you for the challenge!**
