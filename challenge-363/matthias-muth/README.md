# I Don't Lie, Sherrif!
**Challenge 363 solutions in Perl by Matthias Muth**

## Task 1: String Lie Detector

> You are given a string.<br/>
> Write a script that parses a self-referential string and determines whether its claims about itself are true. The string will make statements about its own composition, specifically the number of vowels and consonants it contains.
>
> **Example 1**
>
> ```text
> Input: $str = "aa — two vowels and zero consonants"
> Output: true
> ```
>
> **Example 2**
>
> ```text
> Input: $str = "iv — one vowel and one consonant"
> Output: true
> ```
>
> **Example 3**
>
> ```text
> Input: $str = "hello - three vowels and two consonants"
> Output: false
> ```
>
> **Example 4**
>
> ```text
> Input: $str = "aeiou — five vowels and zero consonants"
> Output: true
> ```
>
> **Example 5**
>
> ```text
> Input: $str = "aei — three vowels and zero consonants"
> Output: false
> ```

The first step is to separate the string itself from the statement about the string.

It seems to be a sort of a convention that there is a separator character between the two: A minus sign in some examples, a dash (Unicode U+2014 EM-DASH) in some others.

In any case, this separator character is a 'non-word' character, so we could use `/\W/` as a regex for the separator. But this would also split on the first whitespace character, because a whitespace character is a 'non-word' character, too. I would like to be a bit more generous about the format of the string, allowing embedded space characters, for example, like in<br/>
`"abc def - two vowels and four consonants"`.

So I choose the separator to be the first 'non-whitespace, non-word' character: `/[^\w\s]/`.<br/>Actually the whitespace surrounding the separator can be removed, too: `/\s*[^\w\s]\s*/`.

I will use `split` to separate the string into the two parts, explicitly telling `split` about that. And while at it, I also remove the whitespace around the separator. string, and leading whites And 

```perl
sub string_lie_detector() {
    ...;
}
```

## Task 2: Subnet Sheriff

> You are given an IPv4 address and an IPv4 network (in CIDR format).<br/>
> Write a script to determine whether both are valid and the address falls within the network. For more information see the Wikipedia article.
>
> **Example 1**
>
> ```text
> Input: $ip_addr = "192.168.1.45"
>        $domain  = "192.168.1.0/24"
> Output: true
> ```
>
> **Example 2**
>
> ```text
> Input: $ip_addr = "10.0.0.256"
>        $domain  = "10.0.0.0/24"
> Output: false
> ```
>
> **Example 3**
>
> ```text
> Input: $ip_addr = "172.16.8.9"
>        $domain  = "172.16.8.9/32"
> Output: true
> ```
>
> **Example 4**
>
> ```text
> Input: $ip_addr = "172.16.4.5"
>        $domain  = "172.16.0.0/14"
> Output: true
> ```
>
> **Example 5**
>
> ```text
> Input: $ip_addr = "192.0.2.0"
>        $domain  = "192.0.2.0/25"
> Output: true
> ```


Lorem ipsum dolor sit amet...

```perl
sub subnet_sheriff() {
    ...;
}
```

#### **Thank you for the challenge!**
