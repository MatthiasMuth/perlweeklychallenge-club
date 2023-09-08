# Tune in to the right frequency!
**Challenge 233 solutions in Perl by Matthias Muth**

## Task 1: Similar Words

> You are given an array of words made up of alphabets only.<br/>
> Write a script to find the number of pairs of similar words. Two words are similar if they consist of the same characters.<br/>
> <br/>
> Example 1<br/>
> Input: @words = ("aba", "aabb", "abcd", "bac", "aabc")<br/>
> Output: 2<br/>
> Pair 1: similar words ("aba", "aabb")<br/>
> Pair 2: similar words ("bac", "aabc")<br/>
> <br/>
> Example 2<br/>
> Input: @words = ("aabb", "ab", "ba")<br/>
> Output: 3<br/>
> Pair 1: similar words ("aabb", "ab")<br/>
> Pair 2: similar words ("aabb", "ba")<br/>
> Pair 3: similar words ("ab", "ba")<br/>
> <br/>
> Example 3<br/>
> Input: @words = ("nba", "cba", "dba")<br/>
> Output: 0<br/>

### Alphabet words ###
To decide whether two words are 'similar' in the sense of this challenge task,
we first compute each word's 'alphabet word'.<br/>
An alphabet word consists of one of each of the letters contained in the word,
ordered alphabetically and concatenated into a string.<br/>
Examples:
```
    "aba"       => "ab"
    "aabb"      => "ab"
    "bac"       => "abc"
    "challenge" => "aceghln"
```
Then, two words are 'similar' if their alphabet words are equal.<br/>

For computing the alphabet words of an input word,
we split the word up into single characters,
let `uniq` remove the doubles,
the `sort` them in string comparison oder (which is the default),
and `join` them into a single string.

We then keep a counter (or *frequency*!) of how often the same alphabet word
was produced,
which gives us the number of similar words for each alphabet
which we will need in the next step.

### Counting the pairs ###
We are asked to get the number of *pairs* of 'similar' words.

Now we could go and produce all combinations of two out of any $n$ words
that we found being similar.<br/>
But we won't!<br/>
We are not asked for all the pairs, but just for *how many* there are<br/>
So let's compute the number of pairs without actually producing them.

For getting the number of possible pairs, if $n$ is the number of words
that have the same alphabet, we have $n$ ways to choose the first element
of the pair, and $(n-1)$ to choose the second one.
As we don't want to count the same pair again when it's just reversed,
we divide by two.

Actually this corresponds to the more scientific form of computing
the 'n choose k' combinations, which is

```math
    \binom{n}{k} = \frac{n!}{k!(n-k)!}
```
For $k = 2$ we get
```math
    \binom{n}{2} = \frac{n!}{2(n-2)!}
              = \frac{ n (n-1) (n-2) \dots 1 )}{2 ( (n-2) \dots 1 )}
              = \frac{n (n-1)}{2}
```

So the whole thing of computing and returning the number of pairs fits into one line,
which even includes summing up the pairs of all different alphabets.

The complete solution looks like this:
```perl
use List::Util qw( sum uniq );

sub similar_words( @words ) {

    my %alphabet_counts;
    for my $word ( @words ) {
        my $alphabet = join "", sort( uniq( split "", $word ) );
        ++$alphabet_counts{$alphabet};
    }

    return sum( map $_ * ( $_ - 1 ) / 2, values %alphabet_counts );
}
```

## Task 2: Frequency Sort

> You are given an array of integers.<br/>
> Write a script to sort the given array in increasing order based on the frequency of the values. If multiple values have the same frequency then sort them in decreasing order.<br/>
> <br/>
> Example 1<br/>
> Input: @ints = (1,1,2,2,2,3)<br/>
> Ouput: (3,1,1,2,2,2)<br/>
> '3' has a frequency of 1<br/>
> '1' has a frequency of 2<br/>
> '2' has a frequency of 3<br/>
> <br/>
> Example 2<br/>
> Input: @ints = (2,3,1,3,2)<br/>
> Ouput: (1,3,3,2,2)<br/>
> '2' and '3' both have a frequency of 2, so they are sorted in decreasing order.<br/>
> <br/>
> Example 3<br/>
> Input: @ints = (-1,1,-6,4,5,-6,1,4,1)<br/>
> Ouput: (5,-1,4,4,-6,-6,1,1,1)<br/>

What sounds very complicated is actually an easy job.

### Frequencies
For each number in the list we compute the frequency with which it occurs in the list.<br/>
We could use a typical Perl idiom for this:
```perl
    my %frequencies;
    ++$frequencies{$_}
        for @ints;
```

If performance was an issue, we could go for an alternative
that hides the loop in a function call, like `frequency` from `List::MoreUtils`.
Which makes it
```perl
    use List::MoreUtils qw( frequency );
    my %frequencies = frequency @ints;
```
(I think I've said it before that this CPAN module should probably be installed in
any Perl installation by default). 

But let's stay strictly 'Core' here.

### Sort, clever!
Now we have all the data to do the sorting in one go.<br/>
Great that `sort` lets us specify the ordering criteria in a code block.<br/>
And nice that within that c


```perl
sub task_2() {
    ...;
}
```

#### **Thank you for the challenge!**
