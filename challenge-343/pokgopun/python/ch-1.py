### https://theweeklychallenge.org/blog/perl-weekly-challenge-343/
"""

Task 1: Zero Friend

Submitted by: [39]Mohammad Sajid Anwar
     __________________________________________________________________

   You are given a list of numbers.

   Find the number that is closest to zero and return its distance to
   zero.

Example 1

Input: @nums = (4, 2, -1, 3, -2)
Output: 1

Values closest to 0: -1 and 2 (distance = 1)

Example 2

Input: @nums = (-5, 5, -3, 3, -1, 1)
Output: 1

Values closest to 0: -1 and 1 (distance = 1)

Example 3

Input: @ums = (7, -3, 0, 2, -8)
Output: 0

Values closest to 0: 0 (distance = 0)
Exact zero wins regardless of other close values.

Example 4

Input: @nums = (-2, -5, -1, -8)
Output: 1

Values closest to 0: -1 and -2 (distance = 1 and 2)

Example 5

Input: @nums = (-2, 2, -4, 4, -1, 1)
Output: 1

Values closest to 0: -1 and 1 (distance = 1)

Task 2: Champion Team
"""
### solution by pokgopun@gmail.com

def zf(nums: list[int]) -> int:
    return min(-e if e < 0 else e for e in nums)

import unittest

class TestZf(unittest.TestCase):
    def test(self):
        for inpt, otpt in {
                (4, 2, -1, 3, -2): 1,
                (-5, 5, -3, 3, -1, 1): 1,
                (7, -3, 0, 2, -8): 0,
                (-2, -5, -1, -8): 1,
                (-2, 2, -4, 4, -1, 1): 1,
                }.items():
            self.assertEqual(zf(inpt),otpt)

unittest.main()
