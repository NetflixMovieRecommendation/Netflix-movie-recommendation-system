% function [Pmf, Qmf] = mf(R, P, Q, K, steps, alpha, beta)
function Rmf = mf(R, K)
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

% prepare the parameters
steps = 5000;
alpha = 0.00015;
beta = 0.2;
[nrow, ncol] = size(R);
P = rand(nrow, K);
Q = rand(ncol, K);

Q = transpose(Q);
for step = 1 : steps
    display(step);
    for i = 1 : size(R, 1)
        for j = 1 : size(R, 2)
            if R(i, j) > 0
                eij = R(i, j) - P(i,:) * Q(:,j);
                for k = 1 : K
                    P(i, k) = P(i, k) + alpha * (2 * eij * Q(k, j) - beta * P(i, k));
                    Q(k, j) = Q(k, j) + alpha * (2 * eij * P(i, k) - beta * Q(k, j));
                end
            end
        end
    end
    % eR = dot(P,Q);
    e = 0;
    for i = 1 : size(R, 1)
        for j = 1 : size(R, 2)
            if R(i, j) > 0
                e = e + power(R(i, j) - P(i, :) * Q(:, j), 2);
                for k = 1 : K
                    e = e + (beta / 2) * (power(P(i, k), 2) + power(Q(k, j), 2));
                end
            end
        end
    end
    if e < 0.001
        break;
    end
    
    Pmf = P;
    Qmf = transpose(Q);
    
    Rmf = Pmf * Qmf';
end