function data = fileReader(location)

    %path = location;
    path = 'netflix/training_set/';
    % path = 'smallTrain/';
    fileNames = dir(fullfile(path, '*.txt'));
    fileLen = length(fileNames);

    for i = 1 : fileLen
        fullLocation = strcat(path,fileNames(i).name);
        file = fopen(fullLocation);
        % skip the first row
        textscan(file, '%*s', 1);
        % userID, rating, date omitted here
        dataCell = textscan(file, '%u32 %u32 %*[^\n]','Delimiter',',');
        
        tempData = [dataCell{1} dataCell{2}];
        if i == 1
            data = tempData;
        else
            data = fullOutJoin(data, tempData);
        end
%         % cell merge by columns
%         % store the size of current file
%         fileSize = [fileSize; size(dataCell{1},1)];
%         % store the size of current file plus the previous one to get index
%         if  i == 1
%             fileIndex = [fileIndex; size(dataCell{1},1)];
%         else
%             fileIndex = [fileIndex; fileIndex(i-1) + size(dataCell{1},1)];
%         end
%         % store the two columns content into data
%         data = [data; tempData];
        fclose(file);
    end
end



