function result = rating()

trainData = fileReader();

testPair = testReader();

[trainData, testPair] = dataProcessor(trainData, testPair);

predictMatrix = matrixFactor(double(trainData(:,2:size(trainData, 2))), size(trainData, 2) - 1, 7000, 0.00015, 0.002, 0.002);

predict = [trainData(:,1) predictMatrix];

roundPredict = round(predict);

numOfRow = size(testPair, 1);

count = 0;

for n = 1 : numOfRow
    curUserId = testPair(n, 2);
    curMovId = testPair(n, 1);
    rowOfUser = find(roundPredict(:, 1) == curUserId);
    if (roundPredict(rowOfUser, curMovId - 10000 + 1) >= 3) && (testPair(n, 3) >= 3)
        count = count + 1;
    end
end

result = count / numOfRow;
end