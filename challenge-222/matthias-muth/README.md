# Challenge 222 tasks: Matching Members - Last Member
**Challenge 222 solutions in Perl by Matthias Muth**

## Task 1: Matching Members

> You are given a list of positive integers, @ints.<br/>
> Write a script to find the total matching members after sorting the list increasing order.<br/>
> <br/>
> Example 1<br/>
> <br/>
> Input: @ints = (1, 1, 4, 2, 1, 3)<br/>
> Output: 3<br/>
> <br/>
> Original list: (1, 1, 4, 2, 1, 2)<br/>
> Sorted list  : (1, 1, 1, 2, 3, 4)<br/>
> <br/>
> Compare the two lists, we found 3 matching members (1, 1, 2).<br/>
> <br/>
> Example 2<br/>
> <br/>
> Input: @ints = (5, 1, 2, 3, 4)<br/>
> Output: 0<br/>
> <br/>
> Original list: (5, 1, 2, 3, 4)<br/>
> Sorted list  : (1, 2, 3, 4, 5)<br/>
> <br/>
> Compare the two lists, we found 0 matching members.<br/>
> <br/>
> Example 3<br/>
> <br/>
> Input: @ints = (1, 2, 3, 4, 5)<br/>
> Output: 5<br/>
> <br/>
> Original list: (1, 2, 3, 4, 5)<br/>
> Sorted list  : (1, 2, 3, 4, 5)<br/>
> <br/>
> Compare the two lists, we found 5 matching members.<br/>

Lore ipsum...

```perl
sub task_1() {
    ...;
}
```

## Task 2: Last Member

> You are given an array of positive integers, @ints.<br/>
> Write a script to find the last member if found otherwise return 0. Each turn pick 2 biggest members (x, y) then decide based on the following conditions, continue this until you are left with 1 member or none.<br/>
> a) if x == y then remove both members<br/>
> b) if x != y then remove both members and add new member (y-x)<br/>
> <br/>
> Example 1:<br/>
> <br/>
> Input: @ints = (2, 7, 4, 1, 8, 1)<br/>
> Output: 1<br/>
> <br/>
> Step 1: pick 7 and 8, we remove both and add new member 1 => (2, 4, 1, 1, 1).<br/>
> Step 2: pick 2 and 4, we remove both and add new member 2 => (2, 1, 1, 1).<br/>
> Step 3: pick 2 and 1, we remove both and add new member 1 => (1, 1, 1).<br/>
> Step 4: pick 1 and 1, we remove both => (1).<br/>
> <br/>
> Example 2:<br/>
> <br/>
> Input: @ints = (1)<br/>
> Output: 1<br/>
> <br/>
> Example 3:<br/>
> <br/>
> Input: @ints = (1, 1)<br/>
> Output: 0<br/>
> <br/>
> Step 1: pick 1 and 1, we remove both and we left with none.<br/>

Lorem ipsum...

```perl
sub task_2() {
    ...;
}
```

#### **Thank you for the challenge!**
