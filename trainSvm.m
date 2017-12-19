function data_files = trainSvm(data_files)
%  Feature Extraction from Training Data
%  Convert each sentence of an abstract into a vector of features in R^n.
%  The extracted feature vectors will be used to train the SVM.

fprintf('\nExtracting features from training data\n');

% Assuming all labeled data files are in a folder called data, in txt format
file_list = dir(data_files);
X = [];
y = [];
for iFile = 1:numel(file_list)
  file_name = strcat('data/', file_list(iFile).name);
  [X, y] = trainSen(file_name);
end

save('senTrain.mat', 'X');
save('senTrain.mat', 'y');
end
