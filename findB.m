%finds matrix B with given basic variables
%
% Arguments:
% A - constraint matrix
%
% Output:
% B - matrix with corrisponding basic var values

function B = findB(A,basics,numBasics)
%init matrix size with number of basic variables
B = zeros(size(A,1),numBasics);
%grab corresponding values from matrix A
for i=1:numBasics
    B(:,i) = A(:,basics(i));
end
