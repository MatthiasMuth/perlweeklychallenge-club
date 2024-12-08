//# https://theweeklychallenge.org/blog/perl-weekly-challenge-297/
/*#

Task 1: Contiguous Array

Submitted by: [45]Mohammad Sajid Anwar
     __________________________________________________________________

   You are given an array of binary numbers, @binary.

   Write a script to return the maximum length of a contiguous subarray
   with an equal number of 0 and 1.

Example 1

Input: @binary = (1, 0)
Output: 2

(1, 0) is the longest contiguous subarray with an equal number of 0 and 1.

Example 2

Input: @binary = (0, 1, 0)
Output: 2

(1, 0) or (0, 1) is the longest contiguous subarray with an equal number of 0 an
d 1.

Example 3

Input: @binary = (0, 0, 0, 0, 0)
Output: 0

Example 4

Input: @binary = (0, 1, 0, 0, 1, 0)
Output: 4

Task 2: Semi-Ordered Permutation
#*/
//# solution by pokgopun@gmail.com

package main

import (
	"io"
	"os"

	"github.com/google/go-cmp/cmp"
)

type binaries []int

func (bs binaries) ca() int {
	for i, v := range bs {
		if v == 0 {
			bs[i] = -1
		}
	}
	l := len(bs)
	c := 0
	for i := range l - 1 {
		j := l - ((l - i) % 2)
		for j > i+1 {
			sm := 0
			for _, v := range bs[i:j] {
				sm += v
			}
			if sm == 0 {
				c = max(c, j-i)
				if c >= l-i-((l-i)%2)-2 {
					return c
				}
			}
			j -= 2
		}
	}
	return c
}

func main() {
	for _, data := range []struct {
		input  binaries
		output int
	}{
		{binaries{1, 0}, 2},
		{binaries{0, 1, 0}, 2},
		{binaries{0, 0, 0, 0, 0}, 0},
		{binaries{0, 1, 0, 0, 1, 0}, 4},
		{binaries{0, 1, 1, 0, 1, 0}, 6},
		{binaries{0, 1, 1, 0, 1, 0, 1, 1}, 6},
		{binaries{0, 0, 1, 0, 1, 0, 0, 0, 1, 1, 0, 1}, 10},
	} {
		//fmt.Println(data.input, data.output)
		io.WriteString(os.Stdout, cmp.Diff(data.input.ca(), data.output)) // blank if ok, otherwise show the difference
	}
}
