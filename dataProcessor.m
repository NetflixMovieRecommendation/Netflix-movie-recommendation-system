function [trainData, testPair] = dataProcessor(trainData, testPair)

    numOfRow = size(testPair, 1);
    extra = zeros(numOfRow, 1);

    for num = 1 : numOfRow
        curUserId = testPair(num, 2);
        curMovId = testPair(num, 1);
        rowOfUser = find(trainData(:, 1) == curUserId);
        % !!!!!!!!!!!!!movie index related!!!!!!!!!!!!!! 
        extra(num) = trainData(rowOfUser, curMovId - 10000 + 1);
        trainData(rowOfUser, curMovId - 10000 + 1) = 0;
    end
    testPair = [testPair extra];
end