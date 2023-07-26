include "globals.mzn";
 
function array[int] of var int:
subgrid(array[int,int] of var int: grid, int: i, int: j) = 
  [grid[3*(i-1)+p, 3*(j-1)+q] | p in 1..3, q in 1..3];
 
array[1..9,1..9] of var 1..9: grid = [|
  5, _, _, _, 7, _, _, _, _ |
  6, _, _, 1, 9, 5, _, _, _ |
  _, 9, _, _, _, 4, _, 6, _ |
  8, _, _, _, 6, _, _, _, _ |
  4, _, _, 8, _, 3, _, _, 1 |
  7, _, _, _, 2, _, _, _, 6 |
  _, 6, _, _, _, _, 2, 8, _ |
  _, _, _, 4, 1, _, _, _, 5 |
  _, _, _, _, 8, _, _, 7, 9
|];
constraint forall (i in 1..9) (all_different([grid[i,j] | j in 1..9]));
constraint forall (j in 1..9) (all_different([grid[i,j] | i in 1..9]));
constraint forall (i in 1..3, j in 1..3) (all_different(subgrid(grid, i,j)));

solve satisfy;

output ["╔═══════════╦═══════════╦═══════════╗\n║ "] ++ [show(grid[i,j]) ++ 
         if j < 9 then if j mod 3 = 0 then " ║ " else " │ "  endif
         elseif i < 9 then 
           if i mod 3 = 0 then " ║ \n╠═══════════╬═══════════╬═══════════╣\n║ "
           else " ║ \n║───┼───┼───║───┼───┼───║───┼───┼───║\n║ " endif
         else " ║ \n╚═══════════╩═══════════╩═══════════╝" endif  
         | i in 1..9, j in 1..9
       ]
       