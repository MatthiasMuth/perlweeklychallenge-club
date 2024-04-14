# Challenge 264 tasks: Greatest English Letter - Target Array
**Challenge 264 solutions in Perl by Matthias Muth**

## Task 1: Greatest English Letter

> You are given a string, $str, made up of only alphabetic characters [a..zA..Z].<br/>
> Write a script to return the greatest english letter in the given string.<br/>
> A letter is greatest if it occurs as lower and upper case. Also letter ‘b’ is greater than ‘a’ if ‘b’ appears after ‘a’ in the English alphabet.<br/>
> Example 1<br/>
> <br/>
> Input: $str = 'PeRlwEeKLy'<br/>
> Output: L<br/>
> <br/>
> There are two letters E and L that appears as lower and upper.<br/>
> The letter L appears after E, so the L is the greatest english letter.<br/>
> <br/>
> Example 2<br/>
> <br/>
> Input: $str = 'ChaLlenge'<br/>
> Output: L<br/>
> <br/>
> Example 3<br/>
> <br/>
> Input: $str = 'The'<br/>
> Output: ''<br/>

Lorem ipsum dolor sit amet...

```perl
sub task_1() {
    ...;
}
```

## Task 2: Target Array

> You are given two arrays of integers, @source and @indices. The @indices can only contains integers 0 <= i < size of @source.<br/>
> Write a script to create target array by insert at index $indices[i] the value $source[i].<br/>
> Example 1<br/>
> <br/>
> Input: @source  = (0, 1, 2, 3, 4)<br/>
>        @indices = (0, 1, 2, 2, 1)<br/>
> Output: (0, 4, 1, 3, 2)<br/>
> <br/>
> @source  @indices  @target<br/>
> 0        0         (0)<br/>
> 1        1         (0, 1)<br/>
> 2        2         (0, 1, 2)<br/>
> 3        2         (0, 1, 3, 2)<br/>
> 4        1         (0, 4, 1, 3, 2)<br/>
> <br/>
> Example 2<br/>
> <br/>
> Input: @source  = (1, 2, 3, 4, 0)<br/>
>        @indices = (0, 1, 2, 3, 0)<br/>
> Output: (0, 1, 2, 3, 4)<br/>
> <br/>
> @source  @indices  @target<br/>
> 1        0         (1)<br/>
> 2        1         (1, 2)<br/>
> 3        2         (1, 2, 3)<br/>
> 4        3         (1, 2, 3, 4)<br/>
> 0        0         (0, 1, 2, 3, 4)<br/>
> <br/>
> Example 3<br/>
> <br/>
> Input: @source  = (1)<br/>
>        @indices = (0)<br/>
> Output: (1)<br/>

Lorem ipsum dolor sit amet...

```perl
sub task_2() {
    ...;
}
```

#### **Thank you for the challenge!**
