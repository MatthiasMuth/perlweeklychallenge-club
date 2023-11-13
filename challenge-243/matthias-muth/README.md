# Challenge 243 tasks: Reverse Pairs - Floor Sum
**Challenge 243 solutions in Perl by Matthias Muth**

## Task 1: Reverse Pairs

> You are given an array of integers.<br/>
> Write a script to return the number of reverse pairs in the given array.<br/>
> A reverse pair is a pair (i, j) where: a) 0 <= i < j < nums.length and b) nums[i] > 2 * nums[j].<br/>
> Example 1<br/>
> <br/>
> Input: @nums = (1, 3, 2, 3, 1)<br/>
> Output: 2<br/>
> <br/>
> (1, 4) => nums[1] = 3, nums[4] = 1, 3 > 2 * 1<br/>
> (3, 4) => nums[3] = 3, nums[4] = 1, 3 > 2 * 1<br/>
> <br/>
> Example 2<br/>
> <br/>
> Input: @nums = (2, 4, 3, 5, 1)<br/>
> Output: 3<br/>
> <br/>
> (1, 4) => nums[1] = 4, nums[4] = 1, 4 > 2 * 1<br/>
> (2, 4) => nums[2] = 3, nums[4] = 1, 3 > 2 * 1<br/>
> (3, 4) => nums[3] = 5, nums[4] = 1, 5 > 2 * 1<br/>

Lorem ipsum dolor sit amet...

```perl
sub task_1() {
    ...;
}
```

## Task 2: Floor Sum

> You are given an array of positive integers (>=1).<br/>
> Write a script to return the sum of floor(nums[i] / nums[j]) where 0 <= i,j < nums.length. The floor() function returns the integer part of the division.<br/>
> <br/>
> Example 1<br/>
> <br/>
> Input: @nums = (2, 5, 9)<br/>
> Output: 10<br/>
> <br/>
> floor(2 / 5) = 0<br/>
> floor(2 / 9) = 0<br/>
> floor(5 / 9) = 0<br/>
> floor(2 / 2) = 1<br/>
> floor(5 / 5) = 1<br/>
> floor(9 / 9) = 1<br/>
> floor(5 / 2) = 2<br/>
> floor(9 / 2) = 4<br/>
> floor(9 / 5) = 1<br/>
> <br/>
> Example 2<br/>
> <br/>
> Input: @nums = (7, 7, 7, 7, 7, 7, 7)<br/>
> Output: 49<br/>

Lorem ipsum dolor sit amet...

```perl
sub task_2() {
    ...;
}
```

#### **Thank you for the challenge!**
