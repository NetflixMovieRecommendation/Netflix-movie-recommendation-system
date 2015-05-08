function join = fullOutJoin(a,b)
    % a has many rows and b has only one
    col = size(a,2);
    
    [keys,~,ind] = unique([a(:,1);b(:,1)]);

    ind1 = ind(1:size(a,1));
    ind2 = ind(size(a,1)+1:end);
    
    join(:,1) = keys;    
    for i = 2:col
        join(ind1,i) = a(:,i); 
    end
    join(ind2,col+1) = b(:,2);   
    
end 