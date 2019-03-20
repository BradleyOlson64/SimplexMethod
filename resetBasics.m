function [basics,nonbasics] = resetBasics(basics,nonbasics,entering,leaving)
basics(find(basics == leaving)) = entering;
nonbasics(find(nonbasics == entering)) = leaving;
basics = sort(basics);
nonbasics = sort(nonbasics);