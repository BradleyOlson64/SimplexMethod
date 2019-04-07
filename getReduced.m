% calculates the reduced cost given a direction
%
% Arguements:
% c - objective function values
% directions - set of possible simplex directions
%
% Output:
% reducedCosts - set of reduced costs for a corrisponding direction

function reducedCosts = getReduced(c, directions)
%init column vector of reduced costs
reducedCosts = zeros(1,size(directions,2));
%calulate the value for all directions
for i= 1:size(directions,2)
    reducedCosts(1,i) = dot(c, directions(:,i));
end
