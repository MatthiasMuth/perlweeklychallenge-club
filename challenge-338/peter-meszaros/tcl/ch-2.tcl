#!/usr/bin/env tclsh
#
# Task 2: Max Distance
# 
# Submitted by: Mohammad Sajid Anwar
# 
# You are given two integer arrays, @arr1 and @arr2.
# 
# Write a script to find the maximum difference between any pair of values from
# both arrays.
# 
# Example 1
# 
#     Input: @arr1 = (4, 5, 7)
#            @arr2 = (9, 1, 3, 4)
#     Output: 6
# 
#     With element $arr1[0] = 4
#     | 4 - 9 | = 5
#     | 4 - 1 | = 3
#     | 4 - 3 | = 1
#     | 4 - 4 | = 0
#     max distance = 5
# 
#     With element $arr1[1] = 5
#     | 5 - 9 | = 4
#     | 5 - 1 | = 4
#     | 5 - 3 | = 2
#     | 5 - 4 | = 1
#     max distance = 4
# 
#     With element $arr1[2] = 7
#     | 7 - 9 | = 2
#     | 7 - 1 | = 6
#     | 7 - 3 | = 4
#     | 7 - 4 | = 4
#     max distance = 6
# 
#     max (5, 6, 6) = 6
# 
# Example 2
# 
#     Input: @arr1 = (2, 3, 5, 4)
#            @arr2 = (3, 2, 5, 5, 8, 7)
#     Output: 6
# 
#     With element $arr1[0] = 2
#     | 2 - 3 | = 1
#     | 2 - 2 | = 0
#     | 2 - 5 | = 3
#     | 2 - 5 | = 3
#     | 2 - 8 | = 6
#     | 2 - 7 | = 5
#     max distance = 6
# 
#     With element $arr1[1] = 3
#     | 3 - 3 | = 0
#     | 3 - 2 | = 1
#     | 3 - 5 | = 2
#     | 3 - 5 | = 2
#     | 3 - 8 | = 5
#     | 3 - 7 | = 4
#     max distance = 5
# 
#     With element $arr1[2] = 5
#     | 5 - 3 | = 2
#     | 5 - 2 | = 3
#     | 5 - 5 | = 0
#     | 5 - 5 | = 0
#     | 5 - 8 | = 3
#     | 5 - 7 | = 2
#     max distance = 3
# 
#     With element $arr1[3] = 4
#     | 4 - 3 | = 1
#     | 4 - 2 | = 2
#     | 4 - 5 | = 1
#     | 4 - 5 | = 1
#     | 4 - 8 | = 4
#     | 4 - 7 | = 3
#     max distance = 4
# 
#     max (5, 6, 3, 4) = 6
# 
# Example 3
# 
#     Input: @arr1 = (2, 1, 11, 3)
#            @arr2 = (2, 5, 10, 2)
#     Output: 9
# 
#     With element $arr1[0] = 2
#     | 2 - 2  | = 0
#     | 2 - 5  | = 3
#     | 2 - 10 | = 8
#     | 2 - 2  | = 0
#     max distance = 8
# 
#     With element $arr1[1] = 1
#     | 1 - 2  | = 1
#     | 1 - 5  | = 4
#     | 1 - 10 | = 9
#     | 1 - 2  | = 1
#     max distance = 9
# 
#     With element $arr1[2] = 11
#     | 11 - 2  | = 9
#     | 11 - 5  | = 6
#     | 11 - 10 | = 1
#     | 11 - 2  | = 9
#     max distance = 9
# 
#     With element $arr1[3] = 3
#     | 3 - 2  | = 1
#     | 3 - 5  | = 2
#     | 3 - 10 | = 7
#     | 3 - 2  | = 1
#     max distance = 7
# 
#     max (8, 9, 9, 7) = 9
# 
# Example 4
# 
#     Input: @arr1 = (1, 2, 3)
#            @arr2 = (3, 2, 1)
#     Output: 2
# 
#     With element $arr1[0] = 1
#     | 1 - 3 | = 2
#     | 1 - 2 | = 1
#     | 1 - 1 | = 0
#     max distance = 2
# 
#     With element $arr1[1] = 2
#     | 2 - 3 | = 1
#     | 2 - 2 | = 0
#     | 2 - 1 | = 1
#     max distance = 1
# 
#     With element $arr1[2] = 3
#     | 3 - 3 | = 0
#     | 3 - 2 | = 1
#     | 3 - 1 | = 2
#     max distance = 2
# 
#     max (2, 1, 2) = 2
# 
# Example 5
# 
#     Input: @arr1 = (1, 0, 2, 3)
#            @arr2 = (5, 0)
#     Output: 5
# 
#     With element $arr1[0] = 1
#     | 1 - 5 | = 4
#     | 1 - 0 | = 1
#     max distance = 4
# 
#     With element $arr1[1] = 0
#     | 0 - 5 | = 5
#     | 0 - 0 | = 0
#     max distance = 5
# 
#     With element $arr1[2] = 2
#     | 2 - 5 | = 3
#     | 2 - 0 | = 2
#     max distance = 3
# 
#     With element $arr1[3] = 3
#     | 3 - 5 | = 2
#     | 3 - 0 | = 3
#     max distance = 3
# 
#     max (4, 5, 3, 3) = 5
# 

package require tcltest

set cases {
    {{{4 5  7}   {9 1  3 4}}     6 "Example 1"}
    {{{2 3  5 4} {3 2  5 5 8 7}} 6 "Example 2"}
    {{{2 1 11 3} {2 5 10 2}}     9 "Example 3"}
    {{{1 2  3}   {3 2  1}}       2 "Example 4"}
    {{{1 0  2 3} {5 0}}          5 "Example 5"}
}

proc max_distance {p} {
    set arr1 [lindex $p 0]
    set arr2 [lindex $p 1]

    set max 0
    foreach i $arr1 {
        foreach j $arr2 {
            set dist [expr abs($i - $j)]
            if {$dist > $max} {
                set max $dist
            }
        }
    }
    return $max
}

tcltest::configure -verbose {pass}
foreach case $cases {
    tcltest::test [lindex $case 2] {} {
        max_distance [lindex $case 0]
    } [lindex $case 1]
}

exit 0

