# Challenge 257 tasks: Smaller than Current - Reduced Row Echelon
**Challenge 257 solutions in Perl by Matthias Muth**

## Task 1: Smaller than Current

> You are given a array of integers, @ints.<br/>
> Write a script to find out how many integers are smaller than current i.e. foreach ints[i], count ints[j] < ints[i] where i != j.<br/>
> <br/>
> Example 1<br/>
> Input: @ints = (5, 2, 1, 6)<br/>
> Output: (2, 1, 0, 3)<br/>
> For $ints[0] = 5, there are two integers (2,1) smaller than 5.<br/>
> For $ints[1] = 2, there is one integer (1) smaller than 2.<br/>
> For $ints[2] = 1, there is none integer smaller than 1.<br/>
> For $ints[3] = 6, there are three integers (5,2,1) smaller than 6.<br/>
> <br/>
> Example 2<br/>
> Input: @ints = (1, 2, 0, 3)<br/>
> Output: (1, 2, 0, 3)<br/>
> <br/>
> Example 3<br/>
> Input: @ints = (0, 1)<br/>
> Output: (0, 1)<br/>
> <br/>
> Example 4<br/>
> Input: @ints = (9, 4, 9, 2)<br/>
> Output: (2, 1, 2, 0)<br/>

Lorem ipsum dolor sit amet...

```perl
sub task_1() {
    ...;
}
```

## Task 2: Reduced Row Echelon

> Given a matrix M, check whether the matrix is in reduced row echelon form.<br/>
> A matrix must have the following properties to be in reduced row echelon form:<br/>
> 1. If a row does not consist entirely of zeros, then the first<br/>
>    nonzero number in the row is a 1. We call this the leading 1.<br/>
> 2. If there are any rows that consist entirely of zeros, then<br/>
>    they are grouped together at the bottom of the matrix.<br/>
> 3. In any two successive rows that do not consist entirely of zeros,<br/>
>    the leading 1 in the lower row occurs farther to the right than<br/>
>    the leading 1 in the higher row.<br/>
> 4. Each column that contains a leading 1 has zeros everywhere else<br/>
>    in that column.<br/>
> <br/>
> For example:<br/>
> [<br/>
>    [1,0,0,1],<br/>
>    [0,1,0,2],<br/>
>    [0,0,1,3]<br/>
> ]<br/>
> <br/>
> The above matrix is in reduced row echelon form since the first nonzero number in each row is a 1, leading 1s in each successive row are farther to the right, and above and below each leading 1 there are only zeros.<br/>
> For more information check out this wikipedia article.<br/>
> <br/>
> Example 1<br/>
>     Input: $M = [<br/>
>                   [1, 1, 0],<br/>
>                   [0, 1, 0],<br/>
>                   [0, 0, 0]<br/>
>                 ]<br/>
>     Output: 0<br/>
> <br/>
> Example 2<br/>
>     Input: $M = [<br/>
>                   [0, 1,-2, 0, 1],<br/>
>                   [0, 0, 0, 1, 3],<br/>
>                   [0, 0, 0, 0, 0],<br/>
>                   [0, 0, 0, 0, 0]<br/>
>                 ]<br/>
>     Output: 1<br/>
> <br/>
> Example 3<br/>
>     Input: $M = [<br/>
>                   [1, 0, 0, 4],<br/>
>                   [0, 1, 0, 7],<br/>
>                   [0, 0, 1,-1]<br/>
>                 ]<br/>
>     Output: 1<br/>
> <br/>
> Example 4<br/>
>     Input: $M = [<br/>
>                   [0, 1,-2, 0, 1],<br/>
>                   [0, 0, 0, 0, 0],<br/>
>                   [0, 0, 0, 1, 3],<br/>
>                   [0, 0, 0, 0, 0]<br/>
>                 ]<br/>
>     Output: 0<br/>
> <br/>
> Example 5<br/>
>     Input: $M = [<br/>
>                   [0, 1, 0],<br/>
>                   [1, 0, 0],<br/>
>                   [0, 0, 0]<br/>
>                 ]<br/>
>     Output: 0<br/>
> <br/>
> Example 6<br/>
>     Input: $M = [<br/>
>                   [4, 0, 0, 0],<br/>
>                   [0, 1, 0, 7],<br/>
>                   [0, 0, 1,-1]<br/>
>                 ]<br/>
>     Output: 0<br/>

Lorem ipsum dolor sit amet...

```perl
sub task_2() {
    ...;
}
```

#### **Thank you for the challenge!**
