%updates the basic and nonbasic variables
%
% Arguments:
% basics - set of old basic variables
% nonbasics - set of old nonbasic variables
% entering - entering variables
% leaving - leaving variables
%
% Output:
% basics - new basic variables
% nonbasics - new nonbasic variables

function [basics,nonbasics] = resetBasics(basics,nonbasics,entering,leaving)
%update values with entering and leaving variables
basics(find(basics == leaving)) = entering;
nonbasics(find(nonbasics == entering)) = leaving;
%reorder variables
basics = sort(basics);
nonbasics = sort(nonbasics);
