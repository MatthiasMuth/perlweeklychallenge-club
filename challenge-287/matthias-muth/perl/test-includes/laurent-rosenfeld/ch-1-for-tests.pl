use strict;
use warnings;

sub strong_password {
    my $pwd = shift;
    my $count = 0;
    # At least one uppercase letter
    $pwd .= "A" and $count++ if $pwd !~ /[A-Z]/;
    # At least one lowercase letter
    $pwd .= "b" and $count++ if $pwd !~ /[a-z]/;
    # At least one digit
    $pwd .= "3" and $count++ if $pwd !~ /\d/;
    # no repeating characters
    while ($pwd =~ /(.)\1{2}/) {
        my $subst = chr (1 + ord $1);
        $pwd =~ s/(.)$1{2}/$1$1$subst/;
        $count++;
    }
    for my $ch ('a'..'z') {
        last if length $pwd >= 6;
        $count++;
        $pwd .= $ch
    }
    return $count;
}

1;
