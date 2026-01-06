# Challenge 355 tasks: Thousand Separator - Mountain Array
**Challenge 355 solutions in Perl by Matthias Muth**

## Task 1: Thousand Separator

> You are given a positive integer, $int.<br/>
> Write a script to add thausand separator, , and return as string.
>
> **Example 1**
>
> ```text
> Input: $int = 123
> Output: "123"
> ```
>
> **Example 2**
>
> ```text
> Input: $int = 1234
> Output: "1,234"
> ```
>
> **Example 3**
>
> ```text
> Input: $int = 1000000
> Output: "1,000,000"
> ```
>
> **Example 4**
>
> ```text
> Input: $int = 1
> Output: "1"
> ```
>
> **Example 5**
>
> ```text
> Input: $int = 12345
> Output: "12,345"
> ```


Lorem ipsum dolor sit amet...

```perl
sub thousand_separator() {
    ...;
}
```

## Task 2: Mountain Array

> You are given an array of integers, @ints.<br/>
> Write a script to return true if the given array is a valid mountain array.<br/>
> An array is mountain if and only if:<br/>
> 1) arr.length >= 3<br/>
> and<br/>
> 2) There exists some i with 0 < i < arr.length - 1 such that:<br/>
> arr[0] < arr[1]     < ... < arr[i - 1] < arr[i]<br/>
> arr[i] > arr[i + 1] > ... > arr[arr.length - 1]
>
> **Example 1**
>
> ```text
> Input: @ints = (1, 2, 3, 4, 5)
> Output: false
> ```
>
> **Example 2**
>
> ```text
> Input: @ints = (0, 2, 4, 6, 4, 2, 0)
> Output: true
> ```
>
> **Example 3**
>
> ```text
> Input: @ints = (5, 4, 3, 2, 1)
> Output: false
> ```
>
> **Example 4**
>
> ```text
> Input: @ints = (1, 3, 5, 5, 4, 2)
> Output: false
> ```
>
> **Example 5**
>
> ```text
> Input: @ints = (1, 3, 2)
> Output: true
> ```


Lorem ipsum dolor sit amet...

```perl
sub mountain_array() {
    ...;
}
```

#### **Thank you for the challenge!**
