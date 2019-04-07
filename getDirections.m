% calculates simplex directions given basic and nonbasic variables
%
% Arguements:
% basics - set of basic variables
% nonbasics - set of nonbasic variables
% 
% Output:
% directions - set of possible simplex directions


function directions = getDirections(basics,nonbasics,A)
%getting B
B = findB(A,basics,size(basics,1));
%getting a values
as = zeros(size(A,1),size(nonbasics,1));
for i=1:size(nonbasics,1)
    as(:,i) = A(:,nonbasics(i));
end
%initializing directions
directions = zeros(size(basics,1) + size(nonbasics,1),size(nonbasics,1));
partials = zeros(size(basics,1),size(nonbasics,1));
for i = 1:size(nonbasics,1)
    %B d^i_B = -a
    aNeg = - A(:,nonbasics(i,1));
    partials(:,i) = B\aNeg;
end
%setting direction values from chosen nonbasics
for i = 1:size(nonbasics,1)
    directions(nonbasics(i),i) = 1;
end
%setting direction values from partials
for i = 1:size(nonbasics,1)
    for j = 1:size(A,1)
        directions(basics(j),i) = partials(j,i);
    end
end
