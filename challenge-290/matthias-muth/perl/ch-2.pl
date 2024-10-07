#!/usr/bin/env perl
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 290 Task 2: Luhn’s Algorithm
#
#       Perl solution by Matthias Muth.
#

use v5.20;
use feature 'signatures';
no warnings 'experimental::signatures';

use Algorithm::LUHN qw( is_valid );

sub luhn_s_algorithm_by_module( $input ) {
    return is_valid( $input =~ s/\D//gr );
}

use List::Util qw( sum pairmap );

#use builtin 'indexed';
sub indexed :prototype(@) ( @array ) {
    my $index = 0;
    return map { $index++ => $_ } @array;
}

sub luhn_s_algorithm_pairmap( $input ) {
    my ( $check_digit, @digits ) = reverse $input =~ /\d/g;
    my $checksum = sum(
        pairmap {
            $a % 2 == 0
            ? $b <= 4 ? ( 2 * $b ) : ( 2 * $b ) - 9
            : $b
        } indexed @digits
    );
    $checksum = ( 10 - $checksum % 10 ) % 10;
    return $check_digit == $checksum;
}

$^V >= v5.36.0 and eval <<'EOF';
    sub luhn_s_algorithm_for_list( $input ) {
	my ( $check_digit, @digits ) = reverse $input =~ /\d/g;
	my $checksum = 0;
	for my ( $index, $digit ) ( indexed @digits ) {
	    $checksum +=
		$index % 2 == 0
		? $digit <= 4 ? ( 2 * $digit ) : ( 2 * $digit ) - 9
		: $digit;
	}
	$checksum = ( 10 - $checksum % 10 ) % 10;
	return $check_digit == $checksum;
    }
EOF


$^V >= v5.36.0 and eval <<'EOF';
    my @values = (
	[ 0, 2, 4, 6, 8, 1, 3, 5, 7, 9 ],   # for even positions
	[ 0..9 ],                           # for odd positions
    );
    my @check_digits = ( 0, 9, 8, 7, 6, 5, 4, 3, 2, 1 );

    sub luhn_s_algorithm_lookup( $input ) {
	my ( $check_digit, @digits ) = reverse $input =~ /\d/g;
	my $checksum = 0;
	for my ( $index, $digit ) ( indexed @digits ) {
	    $checksum += $values[ $index % 2 ][ $digit ];
	}
	return $check_digits[ $checksum % 10 ];
    }
EOF

use List::Util qw( sum0 );
use constant DIGIT_VALUES => (
    [ 0..9 ],                           # for even positions
    [ 0, 2, 4, 6, 8, 1, 3, 5, 7, 9 ],   # for odd positions
);
sub luhn_s_algorithm( $input ) {
    my $index = 0;
    my $checksum = sum0(
        map { (DIGIT_VALUES)[ $index++ % 2 ][ $_ ] }
            reverse $input =~ /\d/g
    );
    return ( $checksum % 10 ) == 0;
}

use Test2::V0 qw( -no_srand );
use Data::Dump qw( pp );

=for original

ok luhn_s_algorithm( "17893729974" ),
    'Example 1: luhn_s_algorithm( 17893729974 ) is true';
ok luhn_s_algorithm( "4137 8947 1175 5904" ),
    'Example 2: luhn_s_algorithm( "4137 8947 1175 5904" ) is true';
ok ! luhn_s_algorithm( "4137 8974 1175 5904" ),
    'Example 3: luhn_s_algorithm( "4137 8974 1175 5904" ) is false';
ok luhn_s_algorithm( "4242 4242 4242 4242" ),
    'Example 3: luhn_s_algorithm( "4242 4242 4242 4242" ) is true';
for ( "00", "18", "26", "34", "42", "59", "67", "75", "83", "91", "" ) {
    ok luhn_s_algorithm( $_ ),
        "Example 3: luhn_s_algorithm( \"$_\" ) is true";
}

done_testing;
=cut

use constant { false => !1, true => !0 };
my $sub_name = "luhn_s_algorithm";
my $i = 0;
my @tests = (
    [ 'Example 1:', 17893729974, true ],
    [ 'Example 2:', "4137 8947 1175 5904", true ],
    [ 'Example 3:', "4137 8974 1175 5904", false ],
    map( [ 'Extra ' . ++$i . ':', $_, true ],
	"4242 4242 4242 4242",
	"00", "18", "26", "34", "42", "59", "67", "75", "83", "91", "" ),
);

use feature 'postderef';
no warnings 'experimental::postderef';

# This runs the tests not only for the sub named "$sub_name",
# but also for all variants with any suffix ("$subname<suffix>").
for my $sub ( sort grep /^${sub_name}/, keys %:: ) {
    note "\n", "Testing $sub:\n", "\n";
    for ( @tests ) {
        my ( $descr, $input, $output ) = $_->@*;
        $descr .= " $sub( " . pp( $input ) . " ) is "
	    . ( $output ? 'true' : 'false' )
            if substr( $descr, -1, 1 ) eq ":";
        no strict 'refs';
	$output
	? ok( $sub->( $input ), $descr )
	: ok( ! $sub->( $input ), $descr );
    }
}

done_testing;
