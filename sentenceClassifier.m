%% Initialization
clear ; close all; clc

%% ========== Part 1: Feature Extraction from Training Data ================
%  Convert each sentence of an abstract into a vector of features in R^n.
%  The extracted feature vectors will be used to train the SVM.
fprintf('\nExtracting features from training data\n');

file_list = dir('data/*.txt');
X = [];
y = [];
for iFile = 1:numel(file_list)
  file_name = strcat('data/', file_list(iFile).name);
  [X, y] = trainSen(file_name);
end
save('senTrain.mat', 'X');
save('senTrain.mat', 'y');

fprintf('Program paused. Press enter to continue.\n');
pause;

%% =========== Part 2: Train Linear SVM for Sentence Classification ========
% Load the labeled training dataset
load('senTrain.mat');

fprintf('\nTraining Linear SVM (Sentence Classification)\n')
fprintf('(this may take 1 to 2 minutes) ...\n')

C = 0.1;
model = svmTrain(X, y, C, @linearKernel);

p = svmPredict(model, X);

fprintf('Training Accuracy: %f\n', mean(double(p == y)) * 100);
pause;

%% ================= Part 3: Top Predictors of Spam ====================
%  Finds the words with the highest weights in the classifier.

[weight, idx] = sort(model.w, 'descend');
vocabList = getVocabList();

fprintf('\nTop predictors of problem sentence: \n');
for i = 1:15
    fprintf(' %-15s (%f) \n', vocabList{idx(i)}, weight(i));
end

fprintf('\n\n');
fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%% =================== Part 4: Analyze Unlabeled Data =====================
filename = 'abstractsample1.txt';

contents = readFile(filename);
sentence_list = strsplit(contents, '\n');
numRows = size(sentence_list, 2);
for rowIdx = 1:numRows
  str = sentence_list{1, rowIdx};
  word_indices = processAbstract(str);
  x = abstractFeatures(word_indices);
  p = svmPredict(model, x);
  fprintf('\nProcessed %s\n\nSentence Classification: %d\n', str, p);
  if (p == 1)
    %fprintf('%s ', str);
    %fprintf('\nProcessed %s\n\nSentence Classification: %d\n', str, p);
  end
end
