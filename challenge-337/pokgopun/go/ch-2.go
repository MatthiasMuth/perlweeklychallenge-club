//# https://theweeklychallenge.org/blog/perl-weekly-challenge-337/
/*#

Task 2: Odd Matrix

Submitted by: [41]Mohammad Sajid Anwar
     __________________________________________________________________

   You are given row and col, also a list of positions in the matrix.

   Write a script to perform action on each location (0-indexed) as
   provided in the list and find out the total odd valued cells.

   For each location (r, c), do both of the following:
a) Increment by 1 all the cells on row r.
b) Increment by 1 all the cells on column c.

Example 1

Input: $row = 2, $col = 3, @locations = ([0,1],[1,1])
Output: 6

Initial:
[ 0 0 0 ]
[ 0 0 0 ]

Apply [0,1]:
Increment row 0:
Before     After
[ 0 0 0 ]  [ 1 1 1 ]
[ 0 0 0 ]  [ 0 0 0 ]
Increment col 1:
Before     After
[ 1 1 1 ]  [ 1 2 1 ]
[ 0 0 0 ]  [ 0 1 0 ]

Apply [1,1]:
Increment row 1:
Before     After
[ 1 2 1 ]  [ 1 2 1 ]
[ 0 1 0 ]  [ 1 2 1 ]
Increment col 1:
Before     After
[ 1 2 1 ]  [ 1 3 1 ]
[ 1 2 1 ]  [ 1 3 1 ]

Final:
[ 1 3 1 ]
[ 1 3 1 ]

Example 2

Input: $row = 2, $col = 2, @locations = ([1,1],[0,0])
Output: 0

Initial:
[ 0 0 ]
[ 0 0 ]

Apply [1,1]:
Increment row 1:
Before    After
[ 0 0 ]   [ 0 0 ]
[ 0 0 ]   [ 1 1 ]
Increment col 1:
Before    After
[ 0 0 ]   [ 0 1 ]
[ 1 1 ]   [ 1 2 ]

Apply [0,0]:
Increment row 0:
Before    After
[ 0 1 ]   [ 1 2 ]
[ 1 2 ]   [ 1 2 ]
Increment col 0:
Before    After
[ 1 2 ]   [ 2 2 ]
[ 1 2 ]   [ 2 2 ]

Final:
[ 2 2 ]
[ 2 2 ]

Example 3

Input: $row = 3, $col = 3, @locations = ([0,0],[1,2],[2,1])
Output: 0

Initial:
[ 0 0 0 ]
[ 0 0 0 ]
[ 0 0 0 ]

Apply [0,0]:
Increment row 0:
Before     After
[ 0 0 0 ]  [ 1 1 1 ]
[ 0 0 0 ]  [ 0 0 0 ]
[ 0 0 0 ]  [ 0 0 0 ]
Increment col 0:
Before     After
[ 1 1 1 ]  [ 2 1 1 ]
[ 0 0 0 ]  [ 1 0 0 ]
[ 0 0 0 ]  [ 1 0 0 ]

Apply [1,2]:
Increment row 1:
Before     After
[ 2 1 1 ]  [ 2 1 1 ]
[ 1 0 0 ]  [ 2 1 1 ]
[ 1 0 0 ]  [ 1 0 0 ]
Increment col 2:
Before     After
[ 2 1 1 ]  [ 2 1 2 ]
[ 2 1 1 ]  [ 2 1 2 ]
[ 1 0 0 ]  [ 1 0 1 ]

Apply [2,1]:
Increment row 2:
Before     After
[ 2 1 2 ]  [ 2 1 2 ]
[ 2 1 2 ]  [ 2 1 2 ]
[ 1 0 1 ]  [ 2 1 2 ]
Increment col 1:
Before     After
[ 2 1 2 ]  [ 2 2 2 ]
[ 2 1 2 ]  [ 2 2 2 ]
[ 2 1 2 ]  [ 2 2 2 ]

Final:
[ 2 2 2 ]
[ 2 2 2 ]
[ 2 2 2 ]

Example 4

Input: $row = 1, $col = 5, @locations = ([0,2],[0,4])
Output: 2

Initial:
[ 0 0 0 0 0 ]

Apply [0,2]:
Increment row 0:
Before         After
[ 0 0 0 0 0 ]  [ 1 1 1 1 1 ]
Increment col 2:
Before         After
[ 1 1 1 1 1 ]  [ 1 1 2 1 1 ]

Apply [0,4]:
Increment row 0:
Before         After
[ 1 1 2 1 1 ]  [ 2 2 3 2 2 ]
Increment col 4:
Before         After
[ 2 2 3 2 2 ]  [ 2 2 3 2 3 ]

Final:
[ 2 2 3 2 3 ]

Example 5

Input: $row = 4, $col = 2, @locations = ([1,0],[3,1],[2,0],[0,1])
Output: 8

Initial:
[ 0 0 ]
[ 0 0 ]
[ 0 0 ]
[ 0 0 ]

Apply [1,0]:
Increment row 1:
Before     After
[ 0 0 ]    [ 0 0 ]
[ 0 0 ]    [ 1 1 ]
[ 0 0 ]    [ 0 0 ]
[ 0 0 ]    [ 0 0 ]
Increment col 0:
Before     After
[ 0 0 ]    [ 1 0 ]
[ 1 1 ]    [ 2 1 ]
[ 0 0 ]    [ 1 0 ]
[ 0 0 ]    [ 1 0 ]

Apply [3,1]:
Increment row 3:
Before     After
[ 1 0 ]    [ 1 0 ]
[ 2 1 ]    [ 2 1 ]
[ 1 0 ]    [ 1 0 ]
[ 1 0 ]    [ 2 1 ]
Increment col 1:
Before     After
[ 1 0 ]    [ 1 1 ]
[ 2 1 ]    [ 2 2 ]
[ 1 0 ]    [ 1 1 ]
[ 2 1 ]    [ 2 2 ]

Apply [2,0]:
Increment row 2:
Before     After
[ 1 1 ]    [ 1 1 ]
[ 2 2 ]    [ 2 2 ]
[ 1 1 ]    [ 2 2 ]
[ 2 2 ]    [ 2 2 ]
Increment col 0:
Before     After
[ 1 1 ]    [ 2 1 ]
[ 2 2 ]    [ 3 2 ]
[ 2 2 ]    [ 3 2 ]
[ 2 2 ]    [ 3 2 ]

Apply [0,1]:
Increment row 0:
Before     After
[ 2 1 ]    [ 3 2 ]
[ 3 2 ]    [ 3 2 ]
[ 3 2 ]    [ 3 2 ]
[ 3 2 ]    [ 3 2 ]
Increment col 1:
Before     After
[ 3 2 ]    [ 3 3 ]
[ 3 2 ]    [ 3 3 ]
[ 3 2 ]    [ 3 3 ]
[ 3 2 ]    [ 3 3 ]

Final:
[ 3 3 ]
[ 3 3 ]
[ 3 3 ]
[ 3 3 ]
     __________________________________________________________________

   Last date to submit the solution 23:59 (UK Time) Sunday 7th September
   2025.
     __________________________________________________________________

SO WHAT DO YOU THINK ?
#*/
//# solution by pokgopun@gmail.com

package main

import (
	"io"
	"os"

	"github.com/google/go-cmp/cmp"
)

type pos struct {
	r, c int
}

type locations []pos

type Input struct {
	row, col  int
	locations locations
}

func (in Input) process() int {
	m := make(map[int]int)
	for _, v := range in.locations {
		m[v.r]++
		m[-1-v.c]++
	}
	cnto := 0
	for r := 0; r < in.row; r++ {
		for c := 0; c < in.col; c++ {
			if (m[r]+m[-1-c])%2 == 1 {
				cnto++
			}
		}
	}
	return cnto
}

func main() {
	for _, data := range []struct {
		input  Input
		output int
	}{
		{Input{2, 3, locations{pos{0, 1}, pos{1, 1}}}, 6},
		{Input{2, 2, locations{pos{1, 1}, pos{0, 0}}}, 0},
		{Input{3, 3, locations{pos{0, 0}, pos{1, 2}, pos{2, 1}}}, 0},
		{Input{1, 5, locations{pos{0, 2}, pos{0, 4}}}, 2},
		{Input{4, 2, locations{pos{1, 0}, pos{3, 1}, pos{2, 0}, pos{0, 1}}}, 8},
	} {
		io.WriteString(os.Stdout, cmp.Diff(data.input.process(), data.output)) // blank if ok, otherwise show the difference
	}
}
