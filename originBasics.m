%finds which columns of A are basic at the origin
%
% Arguements:
% A - constraint matrix
%
% Output:
% basics - set of basic variables
% nonbasics -set of nonbasic variables

function [basics,nonbasics] = originBasics(A)
%get matrix dimension size
n = size(A,2);
m = size(A,1);
%construct column vectors to hold nonbasic and basic vars
nonbasics = zeros(n-m,1);
basics = zeros(m,1);
%number of nonbasic vars
numVals = n-m;
%set first vals up numVals as nonbasic else basic var
for i = 1:size(A,2)
    if i<= numVals
    nonbasics(i) = i;
    else
        basics(i-numVals) = i;
    end
end
