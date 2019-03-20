function [dirChosen,dirNonbasicPos] = chooseDirection(directions,reducedCosts)
dirChosen = zeros(size(directions,1),1);
%resolving improving direction
for i=1:size(directions,2)
    if reducedCosts(1,i) > 0
        dirChosen = directions(:,i);
        dirNonbasicPos = i;
        break
    end
end