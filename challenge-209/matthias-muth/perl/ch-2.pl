#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 209 Task 2: Merge Account
#
#       Perl solution by Matthias Muth.
#

use strict;
use warnings;

sub merge_accounts {

    my @merged_accounts;
    my %merged_accounts_by_address;

    for ( @{$_[0]} ){
        my ( $name, @addresses ) = @$_;
        my $merged_account =
            ( map $merged_accounts_by_address{$_},
                grep $merged_accounts_by_address{$_}, @addresses )[0];
        push @merged_accounts, $merged_account = [ $name ]
            unless $merged_account;
        $merged_accounts_by_address{$_} = $merged_account
            for @addresses;
    }

    # Add the addresses to the accounts they belong to.
    # Sorted, so that they look nice on output.
    push @{$merged_accounts_by_address{$_}}, $_
        for sort keys %merged_accounts_by_address;

    # Also for output, sort the merged accounts by name and their first address.
    @merged_accounts =
        sort { $a->[0] cmp $b->[0] || $a->[1] cmp $b->[1] }
            @merged_accounts;

    return \@merged_accounts;
}


use Test::More;

my @tests = (
    { TEST_NAME => "Example 1",
      INPUT    => [ [ 'A', 'a1@a.com', 'a2@a.com' ],
                    [ 'B', 'b1@b.com' ],
                    [ 'A', 'a3@a.com', 'a1@a.com' ] ],
      EXPECTED => [ [ 'A', 'a1@a.com', 'a2@a.com', 'a3@a.com' ],
                    [ 'B', 'b1@b.com' ] ] },
    { TEST_NAME => "Example 2",
      INPUT    => [ [ 'A', 'a1@a.com', 'a2@a.com' ],
                    [ 'B', 'b1@b.com' ],
                    [ 'A', 'a3@a.com'],
                    [ 'B', 'b2@b.com', 'b1@b.com' ] ],
      EXPECTED => [ [ 'A', 'a1@a.com', 'a2@a.com' ],
                    [ 'A', 'a3@a.com'],
                    [ 'B', 'b1@b.com', 'b2@b.com' ] ] },
);

for ( @tests ) {
    is_deeply
        merge_accounts( $_->{INPUT} ), $_->{EXPECTED}, $_->{TEST_NAME};
}

done_testing;
