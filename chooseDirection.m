%choses a given simplex direction to traverse
%
%input:
%directions- the set of potential simplex directions
%reducedCosts - reduced costs associated with each simplex direction
%
%output:
%dirChosen - the chosen simplex direction
%dirNonbasicPos - column of nonbasic var
function [dirChosen,dirNonbasicPos] = chooseDirection(directions,reducedCosts)
dirChosen = zeros(size(directions,1),1); %initilize 
%resolving improving direction
for i=1:size(directions,2) %loop thorugh directions
    if reducedCosts(1,i) > 0 %if reduced cost > 0 it is a valid direction
        dirChosen = directions(:,i);
        dirNonbasicPos = i;
        break
    end
end
