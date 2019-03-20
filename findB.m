function B = findB(A,basics,numBasics)
B = zeros(size(A,1),numBasics);
for i=1:numBasics
    B(:,i) = A(:,basics(i));
end