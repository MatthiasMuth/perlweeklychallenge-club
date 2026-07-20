# Challenge 383 tasks: Similar List - Nearest RGB
**Challenge 383 solutions in Perl by Matthias Muth**

## Task 1: Similar List

> You are given three list of strings.<br/>
> Write a script to find out if the first two list are similar with the help the third list. The third list contains the similar words map.
>
> **Example 1**
>
> ```text
> Input: $list1 = ("great", "acting")
>        $list2 = ("fine", "drama")
>        $list3 = (["great", "fine"], ["acting", "drama"])
> Output: true
> ```
>
> **Example 2**
>
> ```text
> Input: $list1 = ("apple", "pie")
>        $list2 = ("banana", "pie")
>        $list3 = (["apple", "peach"], ["peach", "banana"])
> Output: false
> ```
>
> **Example 3**
>
> ```text
> Input: $list1 = ("perl4", "python")
>        $list2 = ("raku", "python")
>        $list3 = (["perl4", "perl5", "raku"])
> Output: true
> ```
>
> **Example 4**
>
> ```text
> Input: $list1 = ("enjoy", "challenge")
>        $list2 = ("love", "weekly", "challenge")
>        $list3 = (["enjoy", "love"])
> Output: false
> ```
>
> **Example 5**
>
> ```text
> Input: $list1 = ("fast", "car")
>        $list2 = ("quick", "vehicle")
>        $list3 = (["quick", "fast"], ["vehicle", "car"])
> Output: true
> ```


Lorem ipsum dolor sit amet...

```perl
sub similar_list() {
    ...;
}
```

## Task 2: Nearest RGB

> You are given a 6-digit hex color.<br/>
> Write a script to round the RGB channels to the nearest web-safe value and return the nearest RGB color.<br/>
> 00 (0), 33 (51), 66 (102), 99 (153), CC (204) and FF (255)
>
> **Example 1**
>
> ```text
> Input: $color = "#F4B2D1"
> Output: "#FF99CC"
>
> Red: F4 (Decimal 244), closer to 255 => FF
> Green: B2 (Decimal 178), closer to 153 => 99
> Blue: D1 (Decimal 209), closer to 204 => CC
> So the nearest RGB: "#FF99CC"
> ```
>
> **Example 2**
>
> ```text
> Input: $color = "#15E6E5"
> Output: "#00FFCC"
>
> Red: 15 (Decimal 21), closer to 0 => 00
> Green: E6 (Decimal 230), closer to 255 => FF
> Blue: E5 (Decimal 229), closer to 204 => CC
> ```
>
> **Example 3**
>
> ```text
> Input: $color = "#191A65"
> Output: "#003366"
>
> Red: 19 (Decimal 25), closer to 0 => 00
> Green: 1A (Decimal 26), closer to 51 => 33
> Blue: 65 (Decimal 101), closer to 102 => 66
> ```
>
> **Example 4**
>
> ```text
> Input: $color = "#2D5A1B"
> Output: "#336633"
>
> Red: 2D (Decimal 45), closer to 51 => 33
> Green: 5A (Decimal 90), closer to 102 => 66
> Blue: 1B (Decimal 27), closer to 51 => 33
> ```
>
> **Example 5**
>
> ```text
> Input: $color = "#00FF66"
> Output: "#00FF66"
>
> Red: 00 (Decimal 0), closer to 0 => 00
> Green: FF (Decimal 255), closer to 255 => FF
> Blue: 66 (Decimal 102), closer to 102 => 66
> ```


Lorem ipsum dolor sit amet...

```perl
sub nearest_rgb() {
    ...;
}
```

#### **Thank you for the challenge!**
