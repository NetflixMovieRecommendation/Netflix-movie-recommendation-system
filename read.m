    
    % path = '/training_set';
    path = 'smallTrain/';
    fileNames = dir(fullfile(path, '*.txt'));
    fileLen = length(fileNames);
    data = [];
    s = [];
    for i = 1:fileLen
        fullLocation = strcat(path,fileNames(i).name);
        file = fopen(fullLocation);
        % skip the first row
        textscan(file, '%*s', 1);
        % userID, rating, date omitted here
        dataCell = textscan(file, '%u32 %u32 %*[^\n]','Delimiter',',');
        % cell merge by columns
        tempData = [dataCell{1} dataCell{2}];
       
       
 
        
        fclose(file);
    end
    
    
    
