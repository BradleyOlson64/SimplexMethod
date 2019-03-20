%finds which columns of A are basic at the origin
function [basics,nonbasics] = originBasics(A)
n = size(A,2);
m = size(A,1);
nonbasics = zeros(n-m,1);
basics = zeros(m,1);
numVals = n-m;
for i = 1:size(A,2)
    if i<= numVals
    nonbasics(i) = i;
    else
        basics(i-numVals) = i;
    end
end