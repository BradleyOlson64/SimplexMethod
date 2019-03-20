function [stepSize,leaving,hasDecreasingElement] = getStepSize(currLocation, dirChosen)
%loop through rows of inputs dividing currLocation(i,1) by -dirChosen(i,1)
%wherever dirChosen(i,1) < 0;
smallestMax = -1;
hasDecreasingElement = 0;
for i = 1:size(dirChosen,1)
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