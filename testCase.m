%testing script, creates a problem instance to run through the
%simplexMethod
c = [3
     2
     0
     0];
 
 A = [2 -1 1 0
      2 1 0 1];
  
 d = [6
      10];
  
 [optimum, solution] = simplexMethod(c,A,d);
 optimum
 solution