% calculates the stepsize of a given direction and point
%
% Arguments:
% currLocation - the current point
% dirChosen - the direction to move in
%
% Output:
% stepSize - the step size
% leaving - index of leaving var
% hasDecreasingElement - states if direction has a decreasing element(unbounded)

function [stepSize,leaving,hasDecreasingElement] = getStepSize(currLocation, dirChosen)
%loop through rows of inputs dividing currLocation(i,1) by -dirChosen(i,1)
%wherever dirChosen(i,1) < 0;
leaving = -1;
smallestMax = -1;
hasDecreasingElement = 0;
for i = 1:size(dirChosen,1) %loop throgh components
    if dirChosen(i,1) < 0
        hasDecreasingElement = 1;
        currMax = currLocation(i,1)/(dirChosen(i,1) * -1);
        if currMax < smallestMax || smallestMax < 0
            smallestMax = currMax;
            leaving = i;
        end
    end
end
stepSize = smallestMax;
