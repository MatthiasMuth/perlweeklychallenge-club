#!/usr/bin/env python3
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 261 Task 1: Element Digit Sum
#
#       Python solution by Matthias Muth.
#

def element_digit_sum( ints ):
    return abs( sum( ints )
            - sum( [ int(digit) for n in ints for digit in [*str(n)] ] ) )

import unittest

class TestChallenge( unittest.TestCase ):
    function = "element_digit_sum"
    tests = (
            [ "Example 1", [ 1, 2, 3, 45 ], 36 ],
            [ "Example 2", [ 1, 12, 3 ], 9 ],
            [ "Example 3", [ 236, 416, 336, 350 ], 1296 ]
    )

    def test_examples( self ):

        for test in self.tests:
            descr = ( test[0] + " " + self.function + "(" + str( test[1] )
                    + " ) == " + str( test[2] ) )
            print( descr )

            with self.subTest( descr ):
                self.assertEqual(
                    element_digit_sum( test[1] ), test[2] )

            print( self )
            print( "ok " + descr )

if __name__ == '__main__':
    unittest.main()
