% Input data
int: available_Corn = 480; % Quantity of Corn available
int: available_Hop = 160;  % Quantity of Hops available
int: available_Malt = 1190; % Quantity of Malt available

int: profit_Ale = 13; % Profit per unit of Ale
int: profit_Beer = 23; % Profit per unit of Beer

% Decision variables
var int: num_Ales;  % Number of Ales produced
var int: num_Beers; % Number of Beers produced

% Constraints
constraint num_Ales >= 0;  % Non-negativity constraint
constraint num_Beers >= 0; % Non-negativity constraint

% Resource constraints
constraint 5 * num_Ales + 15 * num_Beers <= available_Corn;
constraint 4 * num_Ales +  4 * num_Beers <= available_Hop;
constraint 35 * num_Ales + 20 * num_Beers <= available_Malt;

% Objective: Maximize Profit
var int: total_profit = profit_Ale * num_Ales + profit_Beer * num_Beers;
solve maximize total_profit;

% Output the optimal solution
output ["Optimal Number of Ales: \(num_Ales)\n"];
output ["Optimal Number of Beers: \(num_Beers)\n"];
output ["Maximum Profit: \(total_profit)\n"];
