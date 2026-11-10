# Challenge 399 tasks: Longest Repeating Character - Longest Absolute Path
**Challenge 399 solutions in Perl by Matthias Muth**

## Task 1: Longest Repeating Character

> You are given a string str and an integer k > 0.<br/>
> Write a script to choose any character of str and change it to another character. You may perform this operation up to k times. Return the length of the longest reachable substring of a single letter.
>
> **Example 1**
>
> ```text
> Input: $str = "AAAAA", $k = 2
> Output: 5
>
> Every character in the string is already the same letter "A".
> The maximum operations allowed (k = 2) do not even need to be used.
> The entire string of length 5 is already the longest valid substring.
> ```
>
> **Example 2**
>
> ```text
> Input: $str = "ABCDE", $k = 4
> Output: 5
>
> All 5 characters in the string are distinct.
> The most frequent character occurs only 1 time.
> To turn the entire string into a single repeated character, we need to replace 5 - 1 = 4 characters.
> Since k = 4, we can replace "B","C","D", and "E" with "A" to form "AAAAA".
> ```
>
> **Example 3**
>
> ```text
> Input: $str = "AAABBBBAA", $k = 1
> Output: 5
>
> If we target "A", we could change the "B" in "AAAB" (k=1 replacement) to get length 4 ("AAAA").
> If we target "B", we can pick the substring "BBBBA" and change the single trailing "A" to "B" (k=1 replacement) to form "BBBBB", which gives a length of 5.
> Targeting "B" gives better result than targeting "A".
> ```
>
> **Example 4**
>
> ```text
> Input: $str = "ABACADA", $k = 2
> Output: 5
>
> Look at the substring [0..4] which is "ABACA" (length 5).
> In this window, "A" appears 3 times, and there are 2 non-"A" characters ("B" and "C").
> With k = 2, we can replace "B" and "C" with "A" to form "AAAAA".
>
> Look at the substring [2..6] which is "ACADA" (length 5).
> Here, "A" appears 3 times, and non-"A" characters ("C" and "D") count to 2.
> Replacing them gives "AAAAA".
>
> In both cases, the maximum valid length is 5.
> ```
>
> **Example 5**
>
> ```text
> Input: $str = "BAAABAAAA", $k = 1
> Output: 8
>
> The string has two groups of "A"s separated by a single "B" ("AAABAAAA").
>
> We can replace the character 4 "B" with an "A" to get a sequence of 8 "A".
> ```


Lorem ipsum dolor sit amet...

```perl
sub longest_repeating_character() {
    ...;
}
```

## Task 2: Longest Absolute Path

> You are given a filesystem as string.<br/>
> Write a script to return the length of the longest absolute path to a file in the abstracted file system. If there is no file in the system, return 0.<br/>
> dir<br/>
> - subdir1<br/>
>   - file1.ext<br/>
>   - subsubdir1<br/>
> - subdir2<br/>
>   - subsubdir2<br/>
>     - file2.ext<br/>
> <br/>
> The above filesystem can be represented as below:<br/>
> "dir\n\tsubdir1\n\t\tfile1.ext\n\t\tsubsubdir1\n\tsubdir2\n\t\tsubsubdir2\n\t\t\tfile2.ext"
>
> **Example 1**
>
> ```text
> Input: $fs = "dir\n\tsubdir1\n\t\tsubsubdir1\n\tsubdir2"
> Output: 0
>
> There are no files in the system (a file must contain a . character separating a name and extension).
> Since there are no files, the answer is 0.
> ```
>
> **Example 2**
>
> ```text
> Input: $fs = "file1.txt\nfile2.ext\na.png"
> Output: 9
>
> All entries are located at root depth (0 tabs).
> Found File Paths:
>     "file1.txt" (length = 9)
>     "file2.ext" (length = 9)
>     "a.png"     (length = 5)
> The longest absolute file path length is 9.
> ```
>
> **Example 3**
>
> ```text
> Input: $fs = "my documents\n\tproject v1.0\n\t\tnotes v1.txt\n\timage.png"
> Output: 38
>
> Notice project v1.0 is a directory (it has children beneath it), while notes v1.txt and image.png are files.
> Found File Paths:
>     "my documents/project v1.0/notes v1.txt" (length = 38)
>     "my documents/image.png" (length = 22)
> The maximum absolute length is 38.
> ```
>
> **Example 4**
>
> ```text
> Input: $fs = "root\n\ta\n\t\tb\n\t\t\tc.txt\n\td\n\t\te.txt"
> Output: 14
>
> Found File Paths:
>     "root/a/b/c.txt" => 4 + 1 + 1 + 1 + 1 + 1 + 5 = 14
>     "root/d/e.txt"   => 4 + 1 + 1 + 1 + 5 = 12
> The longest file path is "root/a/b/c.txt" with length 14.
> ```
>
> **Example 5**
>
> ```text
> Input: $fs = "a\n\tb\n\t\tc\n\t\t\td\n\t\t\t\te.txt\n\tvery_long_directory_name\n\t\tf.txt"
> Output: 32
>
> Found File Paths:
>     "a/b/c/d/e.txt" => 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 5 = 13
>     "a/very_long_directory_name/f.txt" => 1 + 1 + 24 + 1 + 5 = 32
> The long directory name compensates for depth, giving a max length of 32.
> ```


Lorem ipsum dolor sit amet...

```perl
sub longest_absolute_path() {
    ...;
}
```

#### **Thank you for the challenge!**
