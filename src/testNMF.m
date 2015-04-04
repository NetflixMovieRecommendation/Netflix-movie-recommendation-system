function [W, H] = testNMF(k)

% set up five users and their rating for different movies
p1 = [5, 4, 0, 1, 1];
p2 = [4, 5, 1, 0, 1];
p3 = [1, 1, 5, 0, 5];
p4 = [1, 1, 3, 4, 5];
p5 = [1, 5, 1, 5, 4];
p6 = [5, 1, 1, 1, 5];

% merge into a matrix r
r = [p1; p2; p3; p4; p5; p6];

% use the function nnmf, k is the number of movies
% W is user feature matrix, dimenstion 
% H is movie feature matrix
[W,H] = nnmf(r, k);

