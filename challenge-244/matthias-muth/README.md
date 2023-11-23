# Challenge 244 tasks: Count Smaller - Group Hero
**Challenge 244 solutions in Perl by Matthias Muth**

## Task 1: Count Smaller

> You are given an array of integers.<br/>
> Write a script to calculate the number of integers smaller than the integer at each index.<br/>
> Example 1<br/>
> <br/>
> Input: @int = (8, 1, 2, 2, 3)<br/>
> Output: (4, 0, 1, 1, 3)<br/>
> <br/>
> For index = 0, count of elements less 8 is 4.<br/>
> For index = 1, count of elements less 1 is 0.<br/>
> For index = 2, count of elements less 2 is 1.<br/>
> For index = 3, count of elements less 2 is 1.<br/>
> For index = 4, count of elements less 3 is 3.<br/>
> <br/>
> Example 2<br/>
> <br/>
> Input: @int = (6, 5, 4, 8)<br/>
> Output: (2, 1, 0, 3)<br/>
> <br/>
> Example 3<br/>
> <br/>
> Input: @int = (2, 2, 2)<br/>
> Output: (0, 0, 0)<br/>

Lorem ipsum dolor sit amet...

```perl
sub task_1() {
    ...;
}
```

## Task 2: Group Hero

> You are given an array of integers representing the strength.<br/>
> Write a script to return the sum of the powers of all possible combinations; power is defined as the square of the largest number in a sequence, multiplied by the smallest.<br/>
> <br/>
> Example 1<br/>
> <br/>
> Input: @nums = (2, 1, 4)<br/>
> Output: 141<br/>
> <br/>
> Group 1: (2) => square(max(2)) * min(2) => 4 * 2 => 8<br/>
> Group 2: (1) => square(max(1)) * min(1) => 1 * 1 => 1<br/>
> Group 3: (4) => square(max(4)) * min(4) => 16 * 4 => 64<br/>
> Group 4: (2,1) => square(max(2,1)) * min(2,1) => 4 * 1 => 4<br/>
> Group 5: (2,4) => square(max(2,4)) * min(2,4) => 16 * 2 => 32<br/>
> Group 6: (1,4) => square(max(1,4)) * min(1,4) => 16 * 1 => 16<br/>
> Group 7: (2,1,4) => square(max(2,1,4)) * min(2,1,4) => 16 * 1 => 16<br/>
> <br/>
> Sum: 8 + 1 + 64 + 4 + 32 + 16 + 16 => 141<br/>

Lorem ipsum dolor sit amet...

```perl
sub task_2() {
    ...;
}
```

#### **Thank you for the challenge!**
