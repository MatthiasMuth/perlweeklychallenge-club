# Challenge 391 tasks: Array Median - Arrange Box
**Challenge 391 solutions in Perl by Matthias Muth**

## Task 1: Array Median

> You are given two sorted arrays.<br/>
> Write a script to merge the two given sorted arrays and return the median of the merged array.
>
> **Example 1**
>
> ```text
> Input: @arr1 = (2), @arr2 = (4)
> Output: 3.0
>
> Merged array: (2,4)
> Median: (2+4)/2 => 3
> ```
>
> **Example 2**
>
> ```text
> Input: @arr1 = (1,2,3), @arr2 = (7,8,9,10)
> Output: 7.0
>
> Merged array: (1,2,3,7,8,9,10)
> Length of merged array is 7, the 4th element is 7.
> ```
>
> **Example 3**
>
> ```text
> Input: @arr1 = (), @arr2 = (10,20,30,40)
> Output: 25.0
>
> Merged array: (10,20,30,40)
> Median: (20+30)/2 => 25
> ```
>
> **Example 4**
>
> ```text
> Input: @arr1 = (100), @arr2 = (1,2,3,4,5,6,7)
> Output: 4.5
>
> Merged array: (1,2,3,4,5,6,7,100)
> Median: (4+5)/2 => 4.5
> ```
>
> **Example 5**
>
> ```text
> Input: @arr1 = (1,2,2), @arr2 = (2,2,3)
> Output: 2.0
>
> Merged array: (1,2,2,2,2,3)
> Median: (2+2)/2 => 2
> ```


Lorem ipsum dolor sit amet...

```perl
sub array_median() {
    ...;
}
```

## Task 2: Arrange Box

> You are given an array of box dimensions.<br/>
> Write a script to determine the maximum number of these boxes that can fit inside each other in a single stack. For a box to fit inside another, it must be smaller in both dimensions.
>
> **Example 1**
>
> ```text
> Input: @boxes = ([1, 3], [3, 5], [6, 8], [2, 4])
> Output: 4
>
> Sort by width ascending: ([1, 3], [2, 4], [3, 5], [6, 8])
> Extract heights: [3, 4, 5, 8]
> [1, 3] -> [2, 4] -> [3, 5] -> [6, 8]
> ```
>
> **Example 2**
>
> ```text
> Input: @boxes = ([4, 5], [4, 6], [6, 7], [2, 3], [4, 3])
> Output: 3
>
> Sort by width ascending: ([2, 3], [4, 6], [4, 5], [4, 3], [6, 7])
> Extract heights: (3, 6, 5, 3, 7)
> [2, 3] -> [4, 5] -> [6, 7]
> ```
>
> **Example 3**
>
> ```text
> Input: @boxes = ([5, 5], [5, 5], [5, 5])
> Output: 1
>
> Sort by width ascending: ([5, 5], [5, 5], [5, 5])
> Extract heights: (5, 5, 5)
> [5, 5]
> ```
>
> **Example 4**
>
> ```text
> Input: @boxes = ([2, 100], [3, 200], [4, 300], [5, 50], [5, 400])
> Output: 4
>
> Sort by width ascending: ([2, 100], [3, 200], [4, 300], [5, 400], [5, 50])
> Extract heights: (100, 200, 300, 400, 50)
> [2, 100] -> [3, 200] -> [4, 300] -> [5, 400]
> ```
>
> **Example 5**
>
> ```text
> Input: @boxes = ([10, 20], [15, 10], [20, 30], [12, 18], [16, 25])
> Output: 3
>
> Sort by width ascending: ([10, 20], [12, 18], [15, 10], [16, 25], [20, 30])
> Extract heights: (20, 18, 10, 25, 30)
> [15, 10] -> [16, 25] -> [20, 30]
> ```


Lorem ipsum dolor sit amet...

```perl
sub arrange_box() {
    ...;
}
```

#### **Thank you for the challenge!**
