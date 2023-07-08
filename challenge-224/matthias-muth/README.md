# Challenge 224 tasks: Special Notes - Additive Number
**Challenge 224 solutions in Perl by Matthias Muth**

## Task 1: Special Notes

> You are given two strings, $source and $target.<br/>
> Write a script to find out if using the characters (only once) from source, a target string can be created.<br/>
> <br/>
> Example 1<br/>
> Input: $source = "abc"<br/>
>        $target = "xyz"<br/>
> Output: false<br/>
> <br/>
> Example 2<br/>
> Input: $source = "scriptinglanguage"<br/>
>        $target = "perl"<br/>
> Output: true<br/>
> <br/>
> Example 3<br/>
> Input: $source = "aabbcc"<br/>
>        $target = "abc"<br/>
> Output: true<br/>

Again, I let the magical Perl regex engine do the work for me.<br/>
The idea is the same as in my solution to Challenge 221 Task 1 'Good Strings'
([read here](https://github.com/MatthiasMuth/perlweeklychallenge-club/muthm-221/challenge-221/matthias-muth/README.md)).<br/>

What seems to be a bit counterintuitive at first,
is that we match the `$source` (all the possible letters) against the `$target` word,
not vice versa!

We need to sort the `$source` characters first.<br/>
Then we to turn the `$target` characters into a regular expression.
This regular expression will match those characters from `$source`
that are contained in the `$target` word.
All other characters from `$source` that are not needed
will be matched by `.*` patterns and ignored.

To illustrate this, here is how Example 2 is solved using a pattern match:
```perl
special_notes( 'scriptinglanguage', 'perl' )
    ordered source: 'aacegggiilnnprstu'
    target pattern: qr/^.*e.*l.*p.*r.*$/
    pattern match:  'aacegggiilnnprstu' =~ /^.*e.*l.*p.*r.*$/
```

What is left for us is to prepare the sorted source and the pattern.<br/>
Not a big deal:
```perl
    my $ordered_chars = join "", sort split '', $source;
    my $pattern = '^.*' . join( '.*', sort split '', $target ) . '.*$';
```

So all in all it's actually only three lines of code,
to which I added some debugging output
(`vsay` is a subroutine that does the same as `say`
if the global variable `$verbose` is set;
it can be set using the `-v` option in my environment).<br/>
Here is the whole thing:

```perl
sub special_notes {
    my ( $source, $target ) = @_;
    vsay "special_notes( '$source', '$target' )";

    my $ordered_source = join "", sort split '', $source;
    vsay "    ordered source: '$ordered_source'";

    my $pattern = '^.*' . join( '.*', sort split '', $target ) . '.*$';
    vsay "    target pattern: qr/$pattern/";

    vsay "    pattern match:  '$ordered_source' =~ /$pattern/";
    return $ordered_source =~ /${pattern}/ // 0;
}
```

## Task 2: Additive Number

> You are given a string containing digits 0-9 only.<br/>
> Write a script to find out if the given string is additive number. An additive number is a string whose digits can form an additive sequence.<br/>
> A valid additive sequence should contain at least 3 numbers. Except the first 2 numbers, each subsequent number in the sequence must be the sum of the preceding two.<br/>
> <br/>
> Example 1:<br/>
> Input: $string = "112358"<br/>
> Output: true<br/>
> The additive sequence can be created using the given string digits: 1,1,2,3,5,8<br/>
> 1 + 1 => 2<br/>
> 1 + 2 => 3<br/>
> 2 + 3 => 5<br/>
> 3 + 5 => 8<br/>
> <br/>
> Example 2:<br/>
> Input: $string = "12345"<br/>
> Output: false<br/>
> No additive sequence can be created using the given string digits.<br/>
> <br/>
> Example 3:<br/>
> Input: $string = "199100199"<br/>
> Output: true<br/>
> The additive sequence can be created using the given string digits: 1,99,100,199<br/>
>  1 +  99 => 100<br/>
> 99 + 100 => 199<br/>

 

```perl
sub additive_number {
    my ( $string ) = @_;
    vsay "additive_number( '$string' )";

    my $len = length $string;
    my $is_additive_number = 0;
    for my $len1 ( 1 .. int( ( $len - 1 ) / 2 ) ) {
        vsay "len1: $len1, trying len2 1 .. min( ",
            $len - 2 * $len1, ", ",
            int( ( $len - $len1 ) / 2 ), " )";
        for my $len2 (
            1 .. min( $len - 2 * $len1, int( ( $len - $len1 ) / 2 ) ) )
        {
            my $n1 = substr $string, 0, $len1;
            my $n2 = substr $string, $len1, $len2;
            my $rest = substr $string, $len1 + $len2;
            vsay "    trying $n1 and $n2, leaving '$rest'";
            while ( $rest ne "" ) {
                my $sum = $n1 + $n2;
                $rest =~ s/^($sum)// or do {
                    vsay "        sum $sum can't be found";
                    last;
                };
                vsay "        sum $sum is there";
                ( $n1, $n2 ) = ( $n2, $sum );
            }
            if ( $rest eq "" ) {
                return 1
                    unless $verbose;
                vsay "        SUCCESS!";
                $is_additive_number = 1;
            }
        }
    }
    return $is_additive_number;
}
```

#### **Thank you for the challenge!**
