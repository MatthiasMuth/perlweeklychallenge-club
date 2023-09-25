# Challenge 236 tasks: Exact Change - Array Loops
**Challenge 236 solutions in Perl by Matthias Muth**

## Task 1: Exact Change

> You are asked to sell juice each costs $5. You are given an array of bills. You can only sell ONE juice to each customer but make sure you return exact change back. You only have $5, $10 and $20 notes. You do not have any change in hand at first.<br/>
> Write a script to find out if it is possible to sell to each customers with correct change.<br/>
> Example 1<br/>
> <br/>
> Input: @bills = (5, 5, 5, 10, 20)<br/>
> Output: true<br/>
> <br/>
> From the first 3 customers, we collect three $5 bills in order.<br/>
> From the fourth customer, we collect a $10 bill and give back a $5.<br/>
> From the fifth customer, we give a $10 bill and a $5 bill.<br/>
> Since all customers got correct change, we output true.<br/>
> <br/>
> Example 2<br/>
> <br/>
> Input: @bills = (5, 5, 10, 10, 20)<br/>
> Output: false<br/>
> <br/>
> From the first two customers in order, we collect two $5 bills.<br/>
> For the next two customers in order, we collect a $10 bill and give back a $5 bill.<br/>
> For the last customer, we can not give the change of $15 back because we only have two $10 bills.<br/>
> Since not every customer received the correct change, the answer is false.<br/>
> <br/>
> Example 3<br/>
> <br/>
> Input: @bills = (5, 5, 5, 20)<br/>
> Output: true<br/>

Lorem ipsum dolor sit amet...

```perl
sub task_1() {
    ...;
}
```

## Task 2: Array Loops

> You are given an array of unique integers.<br/>
> Write a script to determine how many loops are in the given array.<br/>
> <br/>
> To determine a loop: Start at an index and take the number at array[index] and then proceed to that index and continue this until you end up at the starting index.<br/>
> <br/>
> Example 1<br/>
> <br/>
> Input: @ints = (4,6,3,8,15,0,13,18,7,16,14,19,17,5,11,1,12,2,9,10)<br/>
> Output: 3<br/>
> <br/>
> To determine the 1st loop, start at index 0, the number at that index is 4, proceed to index 4, the number at that index is 15, proceed to index 15 and so on until you're back at index 0.<br/>
> <br/>
> Loops are as below:<br/>
> [4 15 1 6 13 5 0]<br/>
> [3 8 7 18 9 16 12 17 2]<br/>
> [14 11 19 10]<br/>
> <br/>
> Example 2<br/>
> <br/>
> Input: @ints = (0,1,13,7,6,8,10,11,2,14,16,4,12,9,17,5,3,18,15,19)<br/>
> Output: 6<br/>
> <br/>
> Loops are as below:<br/>
> [0]<br/>
> [1]<br/>
> [13 9 14 17 18 15 5 8 2]<br/>
> [7 11 4 6 10 16 3]<br/>
> [12]<br/>
> [19]<br/>
> <br/>
> Example 3<br/>
> <br/>
> Input: @ints = (9,8,3,11,5,7,13,19,12,4,14,10,18,2,16,1,0,15,6,17)<br/>
> Output: 1<br/>
> <br/>
> Loop is as below:<br/>
> [9 4 5 7 19 17 15 1 8 12 18 6 13 2 3 11 10 14 16 0]<br/>

Lorem ipsum dolor sit amet...

```perl
sub task_2() {
    ...;
}
```

#### **Thank you for the challenge!**
