function result = rating()

trainData = fileReader();

testPair = testReader();

[trainData, testPair] = dataProcessor(trainData, testPair);

% predictMatrix = matrixFactor(double(trainData(:,2:size(trainData, 2))), size(trainData, 2) - 1, 7000, 0.00015, 0.002, 0.002);

predictMatrix = mf(double(trainData(:,2:size(trainData, 2))), size(trainData, 2) - 1);

predict = [trainData(:,1) predictMatrix];

roundPredict = round(predict);

roundPredict(find(roundPredict==6)) = 5;

numOfRow = size(testPair, 1);

count = 0;

predRating = [];
for n = 1 : numOfRow
    curUserId = testPair(n, 2);
    curMovId = testPair(n, 1);
    rowOfUser = find(roundPredict(:, 1) == curUserId);
    predRating = [predRating; roundPredict(rowOfUser, curMovId - 10000 + 1)];
    if ((roundPredict(rowOfUser, curMovId - 10000 + 1) >= 3) && (testPair(n, 3) >= 3)) || ((roundPredict(rowOfUser, curMovId - 10000 + 1) < 3) && (testPair(n, 3) < 3))
        count = count + 1;
    end
    % if (roundPredict(rowOfUser, curMovId - 10000 + 1) == testPair(n, 3))
    %     count = count + 1;
    % end
end

result = count / numOfRow;

end