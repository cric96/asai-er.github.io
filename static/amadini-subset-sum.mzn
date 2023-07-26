% Are there N numbers in a set S adding up to K?
include "globals.mzn";

set of int: S = {7, 10, 23, 13, 4, 16};
int: N = 4;
int: K = 34;

array[1..N] of var S: X;
constraint all_different(X);
constraint sum(X) = K;

solve satisfy;
