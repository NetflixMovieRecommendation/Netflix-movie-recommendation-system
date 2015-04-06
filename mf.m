function [P, Q] = mf(R, P, Q, k, steps, alpha, beta)
% INPUT:
% R: a matrix to be factorized, dimension N x M
% P: an initial matrix of dimension N x K
% Q: an initial matrix of dimension M x K
% K: the number of latent features
% steps : the maximum number of steps to perform the optimisation
% alpha : the learning rate
% beta  : the regularization parameter
% OUTPUT:
% final matrices P and Q