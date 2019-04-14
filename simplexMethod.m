%Author Bradley Olson
%Version 3/17/19
%
% Attempts to solve a linear program using the simplex method
%
% Arguements:
% c - objective function values
% A - constraing matrix
% b - RHS constraints
%
% Output:
% optimum - optimal value of LP
% solution - point at which solution exists

function [optimum, solution] = simplexMethod(c, A, b)
% Checking for compatible dimensions
if size(A,2) ~= size(c,1)
    error("The number of columns in A and the number of rows in c do not match. They must match for the LP to be in canonical form. Check c and A.");
    return
end
if size(A,1) ~= size(b,1)
    error("The number of rows in A and b do not match. They must match for the LP to be in canonical form. Check A and b.");
    return
end
%putting basic columns of A into one array and nonbasic ones into another.
[basics, nonbasics] = originBasics(A);
numBasics = size(basics,1);
numNonbasics = size(nonbasics,1);
%getting B
B = findB(A,basics,numBasics);
%Deriving initial point at origin
currLocation = zeros(numBasics+numNonbasics,1);
partial = B\b;
for i=1:numBasics
    currLocation(basics(i)) = partial(i);
end
% Checking for feasibility
for i=1:size(currLocation,1)
    if currLocation(i,1) < 0
        error("The given LP is infeasible at the origin. Since the assignment says we can assume that the origin is feasible in all feasible cases, we can conclude that the given LP is infeasible. Check constraints.");
        return
    end
end
%entering main loop
while 1
    %Computing simplex directions
    directions = getDirections(basics,nonbasics,A);
    %Computing reduced costs
    reducedCosts = getReduced(c,directions);
    %ending if no improving direction
    if max(reducedCosts) <= 0
        break
    end
    %Getting chosen direction according to bland's rule
    [dirChosen,dirNonbasicPos] = chooseDirection(directions, reducedCosts);
    entering = nonbasics(dirNonbasicPos,1);
    %Computing step size
    [stepSize,leaving,hasDecreasingElement] = getStepSize(currLocation, dirChosen);
    %Checking for unboundedness
    if hasDecreasingElement == 0
        error("The given LP is unbounded. Thus there is no solution. Check constraints.");
        return
    end
    %Moving to new point
    currLocation = currLocation + (stepSize * dirChosen);
    %switching basic and nonbasic for entering and leaving
    [basics,nonbasics] = resetBasics(basics,nonbasics,entering,leaving);
end
solution = currLocation;
optimum = dot(c,solution);
