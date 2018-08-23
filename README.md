# NumberSorter
A compoment that sorts 6 given binary numbers from high to low.

This was an assigment in the course "Logic Design", and is meant to teach the principal of planning an architecture with a controller and a datapath.

In this assigment - the datapath is a "compare2" unit, that compares two binary numbers and returns them sorted.
In the "contcomp" file you can find the controller, a finite state machine that sorts 6 numbers from high to low using only one compare2 unit.
The "top" file connects the datapath and controller and other compomenets such as D-FF and mux.

files with tb ending are testbench files
