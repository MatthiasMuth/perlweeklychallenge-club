# Challenge 385 tasks: Uncommon Words - Outermost Parentheses
**Challenge 385 solutions in Perl by Matthias Muth**

## Task 1: Uncommon Words

>
>
> **Example 1**
>
> ```text
> Input: $sentence1 = "apple banana apple"
>        $sentence2 = "banana orange"
> Output: ("orange")
> ```
>
> **Example 2**
>
> ```text
> Input: $sentence1 = "cat dog"
>        $sentence2 = "bird fish"
> Output: ("cat", "dog", "bird", "fish")
> ```
>
> **Example 3**
>
> ```text
> Input: $sentence1 = "the quick brown fox"
>        $sentence2 = "the quick"
> Output: ("brown", "fox")
> ```
>
> **Example 4**
>
> ```text
> Input: $sentence1 = "hello"
>        $sentence2 = "hello"
> Output: ()
> ```
>
> **Example 5**
>
> ```text
> Input: $sentence1 = "blue blue red"
>        $sentence2 = "red green green yellow"
> Output: ("yellow")
> ```


Lorem ipsum dolor sit amet...

```perl
sub uncommon_words() {
    ...;
}
```

## Task 2: Outermost Parentheses

>
>
> **Example 1**
>
> ```text
> Input: $str = "()()()"
> Output: ""
>
> Primitive Decomposition: "()" + "()" + "()"
> ```
>
> **Example 2**
>
> ```text
> Input: $str = "(((())))"
> Output: "((()))"
>
> Primitive Decomposition: "(((())))"
> ```
>
> **Example 3**
>
> ```text
> Input: $str = "(()())(())"
> Output: "()()()"
>
> Primitive Decomposition: "(()())" + "(())"
> ```
>
> **Example 4**
>
> ```text
> Input: $str = "()((()))()"
> Output: "((()))"
>
> Primitive Decomposition: "()" + "((()))" + "()"
> ```
>
> **Example 5**
>
> ```text
> Input: $str = "(()(()))(()())"
> Output: "()(())()()"
>
> Primitive Decomposition: "(()(()))" + "(()())"
> ```


Lorem ipsum dolor sit amet...

```perl
sub outermost_parentheses() {
    ...;
}
```

#### **Thank you for the challenge!**
