function join = fullouterjoin(a,b)
    % a and b has only one row
    [keys,~,ind] = unique([a(:,1);b(:,1)]);

    ind1 = ind(1:size(a,1));
    ind2 = ind(size(a,1)+1:end);

    %join = cell(numel(keys),3);
    %join(:) = {NaN};            %# fill with NaNs
    join(:,1) = keys;           %# union of keys
    join(ind1,2) = a(:,2);      %# insert 1st dataset values
    join(ind2,3) = b(:,2);      %# insert 2nd dataset balues

end