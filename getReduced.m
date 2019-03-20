function reducedCosts = getReduced(c, directions)
reducedCosts = zeros(1,size(directions,2));
for i= 1:size(directions,2)
    reducedCosts(1,i) = dot(c, directions(:,i));
end