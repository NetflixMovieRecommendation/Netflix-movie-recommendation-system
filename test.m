% calculate origin data matrix and predict all the unrated score
data = fileReader();
predict = matrixFactor(double(data(:,2:size(data, 2))), size(data, 2) - 1, 6000, 0.0002, 0.002, 0.002);