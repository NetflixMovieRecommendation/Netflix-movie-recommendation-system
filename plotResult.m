numOfRow = size(testPair, 1);
predRating = [];
for n = 1 : numOfRow
    curUserId = testPair(n, 2);
    curMovId = testPair(n, 1);
    rowOfUser = find(predict(:, 1) == curUserId);
    predRating = [predRating; predict(rowOfUser, curMovId - 10000 + 1)];
    
end

xx = 1 : size(testPair, 1);
scatter(xx.', testPair(:, 3)); 
axis([0 550 0 5.5]);
hold on;
scatter(xx.', predRating);
axis([0 550 0 5.5]);