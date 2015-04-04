    
    % path = '/training_set';
    path = 'smallTrain/';
    fileNames = dir(fullfile(path, '*.txt'));
    fileLen = length(fileNames);
    data = [];
    s = [];
    for i = 1:fileLen
        fullLocation = strcat(path,fileNames(i).name);
        file = fopen(fullLocation);
        % skip ythe first row
        textscan(file, '%*s', 1);
        % userID, rating, date omitted here
        dataCell = textscan(file, '%u32 %u32 %*[^\n]','Delimiter',',');
        % cell merge by columns
        tempData = [dataCell{1} dataCell{2}];
        if  i == 1
            s = [s; size(dataCell{1},1)];
        else
            s = [s; s(i-1)+size(dataCell{1},1)];
        end
        data = [data; tempData];
        fclose(file);
    end
    
    
    
