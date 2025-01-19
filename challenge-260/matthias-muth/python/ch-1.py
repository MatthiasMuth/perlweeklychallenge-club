#!/usr/bin/env python3
#
#       The Weekly Challenge - Perl & Raku
#       (https://theweeklychallenge.org)
#
#       Challenge 260 Task 1: Unique Occurrences
#
#       Python solution by Matthias Muth.
#

def unique_occurrences( ints ):
    freq = dict()
    for i in ints:
        freq[i] = freq.get( i, 0 ) + 1
    return 1 if len( set( freq.values() ) ) == len( freq ) else 0

import unittest

class TestChallenge( unittest.TestCase ):
    function = "unique_occurrences"
    tests = (
            [ "Example 1", [ 1, 2, 2, 1, 1, 3 ], 1 ],
            [ "Example 2", [ 1, 2, 3 ], 0 ],
            [ "Example 3", [ -2, 0, 1, -2, 1, 1, 0, 1, -2, 9 ], 1 ]
        )

    def setUp(self):
        pass

    def tearDown(self):
        if hasattr(self._outcome, 'errors'):
            # Python 3.4 - 3.10  (These two methods have no side effects)
            result = self.defaultTestResult()
            self._feedErrorsToResult(result, self._outcome.errors)
        else:
            # Python 3.11+
            result = self._outcome.result
        ok = all(test != self for test, text in result.errors + result.failures)

        # Demo output:  (print short info immediately - not important)
        if ok:
            print('\nOK: %s' % (self.id(),))
        for typ, errors in (('ERROR', result.errors), ('FAIL', result.failures)):
            for test, text in errors:
                print( "test", test )
                print( "    text:<", text, ">" )
                if test.id() == self.id():
                    #  the full traceback is in the variable `text`
                    msg = [x for x in text.split('\n')[1:]
                           if not x.startswith(' ')][0]
                    print("\n\n%s: %s\n     %s" % (typ, self.id(), msg))

    def test_examples( self ):

        for test_no, test in enumerate( self.tests ):
            descr = ( test[0] + " " + self.function + "(" + str( test[1] )
                    + " ) == " + str( test[2] ) )
            # print( descr )

        descr = 'Example 1: unique_occurrences( 1, 2, 2, 1, 1, 3 ) == 1';
        with self.subTest( descr ):
            with self.subTest( i = 1 ):
                self.assertEqual(
                    unique_occurrences( [ 1, 2, 2, 1, 1, 3 ] ), 99, descr
                )
        # print( self )
        # print( "ok " + test );

        descr = 'Example 2: unique_occurrences( 1, 2, 3 ) == 0';
        with self.subTest( descr ):
            with self.subTest( i = 2 ):
                self.assertEqual(
                    unique_occurrences( [ 1, 2, 3 ] ), 99, descr
                )
        # print( "ok " + test );

        descr = (
            'Example 3: unique_occurrences( -2, 0, 1, -2, 1, 1, 0, 1, -2, 9 )'
                + ' == 1' ) ;
        with self.subTest( descr ):
            with self.subTest( i = 3 ):
                self.assertEqual(
                    unique_occurrences( [ -2, 0, 1, -2, 1, 1, 0, 1, -2, 9 ] ), 1, descr
                )
        # print( "ok " + test ); 

if __name__ == '__main__':
    unittest.main()
