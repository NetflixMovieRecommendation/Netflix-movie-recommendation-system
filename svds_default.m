function pre = svds_default(train)
    %p = [5,3,0,1;4,0,0,1;1,1,0,5;1,0,0,4;0,1,5,4];
    k = 6;
    [U,S,V] = svds(double(train),k);
    u = U(:,1:k);
    s = S(1:k,1:k);
    v = V(:,1:k);
    pre = u*s*v';
end