# Challenge 400 tasks: Largest Interval - Minimum Genetic Mutation
**Challenge 400 solutions in Perl by Matthias Muth**

## Task 1: Largest Interval

> You are given a positive integer.<br/>
> Write a script that generates a sequence of integers from 1 to given positive integer, filtering out any numbers that contain repeating digits (e.g., 11, 99, 100, and 101 are excluded) and return the biggest jump.
>
> **Example 1**
>
> ```text
> Input: $int = 20
> Output: 2
>
> Biggest jump between 10 and 12.
> ```
>
> **Example 2**
>
> ```text
> Input: $int = 110
> Output: 4
>
> Biggest jump between 98 and 102.
> ```
>
> **Example 3**
>
> ```text
> Input: $int = 500
> Output: 11
>
> Biggest jump between:
> a) 109 and 120 => 11
> b) 219 and 230 => 11
> c) 329 and 340 => 11
> d) 439 and 450 => 11
> ```
>
> **Example 4**
>
> ```text
> Input: $int = 2026
> Output: 105
>
> Biggest jump between 1098 and 1203.
> ```
>
> **Example 5**
>
> ```text
> Input: $int = 10000
> Output: 105
>
> The largest gap is 105, between 1098 and 1203. And again between 8796 and 8901.
> ```


Lorem ipsum dolor sit amet...

```perl
sub largest_interval() {
    ...;
}
```

## Task 2: Minimum Genetic Mutation

> You are given start and end gene string along with gene bank.<br/>
> Write a script to return the minimum number of mutations required to mutate from start to end gene. Return -1 if there is no such mutation. A gene must be in a bank to make it a valid gene string.<br/>
> A gene string can be represented by an 8-character long string, with choices from ‘A’, ‘C’, ‘G’, and ‘T’.
>
> **Example 1**
>
> ```text
> Input: $start_gene = "AACCGGTT"
>        $end_gene   = "AACCGGTA"
>        @gene_bank  = ("AACCGCTA", "AAACGGTA")
> Output: -1
>
> To reach end gene, every intermediate gene and the end gene itself must exist in bank.
> Since "AACCGGTA" is missing from bank, it is impossible to complete the mutation sequence.
> ```
>
> **Example 2**
>
> ```text
> Input: $start_gene = "AACCGGTT"
>        $end_gene   = "AACCGGAA"
>        @gene_bank  = ("AACCGGTA", "AACCGGAA", "AACCGCTA", "AACCCTAA", "AACCGTAA")
> Output: 2
>
> Path 1 (2 steps): "AACCGGTT" => "AACCGGTA" => "AACCGGAA"
> Path 2 (3 steps): "AACCGGTT" => "AACCGGTA" => "AACCGTAA" => "AACCGGAA"
> ```
>
> **Example 3**
>
> ```text
> Input: $start_gene = "AAAAAAAA"
>        $end_gene   = "AAAAACCC"
>        @gene_bank  = ("CAAAAAAA", "CCAAAAAA", "AAAAAAAC")
> Output: -1
> ```
>
> **Example 4**
>
> ```text
> Input: $start_gene = "GAAAAAAA"
>        $end_gene   = "GCCCCCCC"
>        @gene_bank  = ("GCAAAAAA", "GCCAAAAA", "GCCCAAAA", "GCCCCAAA", "GCCCCCAA", "GCCCCCCA", "GCCCCCCC")
> Output: 7
>
> "GAAAAAAA" => "GCAAAAAA"
> "GCAAAAAA" => "GCCAAAAA"
> "GCCAAAAA" => "GCCCAAAA"
> "GCCCAAAA" => "GCCCCAAA"
> "GCCCCAAA" => "GCCCCCAA"
> "GCCCCCAA" => "GCCCCCCA"
> "GCCCCCCA" => "GCCCCCCC"
> ```
>
> **Example 5**
>
> ```text
> Input: $start_gene = "AACCGGTT"
>        $end_gene   = "AACCGGTT"
>        @gene_bank = ("AACCGGTA")
> Output: 0
>
> The current genetic sequence already matches the desired end gene.
> No mutations are necessary, so the result is 0.
> ```


Lorem ipsum dolor sit amet...

```perl
sub minimum_genetic_mutation() {
    ...;
}
```

#### **Thank you for the challenge!**
