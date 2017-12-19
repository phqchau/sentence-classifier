%% Initialization
clear ; close all; clc

%% =========== Part 1: Train Linear SVM for Sentence Classification ========
% Load the labeled training dataset
load('senTrain.mat');

fprintf('\nTraining Linear SVM (Sentence Classification)\n')
fprintf('(this may take 1 to 2 minutes) ...\n')

C = 0.1;
model = svmTrain(X, y, C, @linearKernel);

p = svmPredict(model, X);

fprintf('Training Accuracy: %f\n', mean(double(p == y)) * 100);
pause;

%% =========== Part 2: Top Predictors of Problem Sentence ================
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

%% =================== Part 3: Analyze Unlabeled Data =====================
filename = 'abstractsample1.txt';

contents = readFile(filename);
sentence_list = strsplit(contents, '\n');
numRows = size(sentence_list, 2);
for rowIdx = 1:numRows
  str = sentence_list{1, rowIdx};
  word_indices = processAbstract(str);
  x = abstractFeatures(word_indices);
  p = svmPredict(model, x);
  if (p == 1)
    fprintf('%s ', str);
    fprintf('\nProcessed %s\n\nSentence Classification: %d\n', str, p);
  end
end
