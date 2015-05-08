function testPair = testReader()

    % specify the block size
   % N = 2;

    % get the path of test file
    path = 'smallTest/';
    fileNames = dir(fullfile(path, '*.txt'));
    fullLocation = strcat(path, fileNames.name);
    fileID = fopen(fullLocation);

    
    % skip the first row
    % textscan(file, '%*s', 1);
    % userID, rating, date omitted here
    % testDataCell = textscan(file, formatSpec, 'Delimiter', ',');
        
    % read the test file
    % k = 0;
    %testData = [];

    testDate = [];

    %while ~feof(fileID)
        % movid = textscan(fileID, '%s',1,'Delimiter','\n');
        % testDataCell = textscan(fileID, formatSpec, 'Delimiter', ',','HeaderLines',1);
        formatSpec = '%u32 %s';
        testDataCell = textscan(fileID, formatSpec);
    
    %end
    fclose(fileID);
    
    testPair = [];
    testDate = [];

    for i = 1: size(testDataCell{2},1)
        temp = str2num(testDataCell{2}{i});
        if size(temp) == 0
            testDate = [testDate;0];
            movTrack = testDataCell{1}(i);
            
        else
            testDate = [testDate;temp];
            tempvec = [movTrack testDataCell{1}(i)];
            testPair = [testPair;tempvec];
        end
    end
 
end