# Challenge 376 tasks: Chessboard Squares - Doubled Words
**Challenge 376 solutions in Perl by Matthias Muth**

## Task 1: Chessboard Squares

> You are given two coordinates of a square on 8x8 chessboard.<br/>
> Write a script to find the given two coordinates have the same colour.<br/>
> 8 W B W B W B W B<br/>
> 7 B W B W B W B W<br/>
> 6 W B W B W B W B<br/>
> 5 B W B W B W B W<br/>
> 4 W B W B W B W B<br/>
> 3 B W B W B W B W<br/>
> 2 W B W B W B W B<br/>
> 1 B W B W B W B W<br/>
>   a b c d e f g h
>
> **Example 1**
>
> ```text
> Input: $c1 = "a7", $c2 = "f4"
> Output: true
> ```
>
> **Example 2**
>
> ```text
> Input: $c1 = "c1", $c2 = "e8"
> Output: false
> ```
>
> **Example 3**
>
> ```text
> Input: $c1 = "b5", $c2 = "h2"
> Output: false
> ```
>
> **Example 4**
>
> ```text
> Input: $c1 = "f3", $c2 = "h1"
> Output: true
> ```
>
> **Example 5**
>
> ```text
> Input: $c1 = "a1", $c2 = "g8"
> Output: false
> ```


Lorem ipsum dolor sit amet...

```perl
sub chessboard_squares() {
    ...;
}
```

## Task 2: Doubled Words

> You are given a string (which may contain embedded newlines) which is taken from a page on a website. The string will not contain brackets qw{ [ ] }.<br/>
> Write a script that will find doubled words (such as “this this”) and highlight (wrap in brackets) each doubled word.<br/>
> The script should:<br/>
> - Work across lines, even finding situations where a word at the end of<br/>
>   one line is repeated at the beginning of the next.<br/>
> <br/>
> - Find doubled words despite capitalization differences, such as with<br/>
>   'The the...', as well as allow differing amounts of whitespace (spaces,<br/>
>   tabs, newlines, and the like) to lie between the words.<br/>
> <br/>
> - Find doubled words even when separated by HTML tags. For example, to<br/>
>   make a word bold: '...it is <B>very</B> very important...'. Only show<br/>
>   lines containing doubled words.<br/>
> <br/>
> Adapted from Mastering Regular Expressions, Third Edition by Jeffrey E. F. Friedl
>
> **Example 1**
>
> ```text
> Input: $str = "you're given the job of checking the pages on a\nweb server for doubled words (such as 'this this'), a common problem\nwith documents subject to heavy editing."
> Output: "web server for doubled words (such as '[this] [this]'), a common problem"
> ```
>
> **Example 2**
>
> ```text
> Input: $str = "Find doubled words despite capitalization differences, such as with 'The\nthe...', as well as allow differing amounts of whitespace (spaces,\ntabs, newlines, and the like) to lie between the words."
> Output: "Find doubled words despite capitalization differences, such as with '[The]\n[the]...', as well as allow differing amounts of whitespace (spaces,"
> ```
>
> **Example 3**
>
> ```text
> Input: $str = "to make a word bold: '...it is <B>very</B> very important...'."
> Output: "to make a word bold: '...it is <B>[very]</B> [very] important...'."
> ```
>
> **Example 4**
>
> ```text
> Input: $str = "Perl officially stands for Practical Extraction and Report Language, except when it doesn't."
> Output: ""
> ```
>
> **Example 5**
>
> ```text
> Input: $str = "There's more than one one way to do it.\nEasy things should be easy and hard things should be possible."
> Output: "There's more than [one] [one] way to do it."
> ```


Lorem ipsum dolor sit amet...

```perl
sub doubled_words() {
    ...;
}
```

#### **Thank you for the challenge!**
