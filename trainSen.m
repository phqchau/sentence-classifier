% Parses labeled data to produce features vectors used to train the SVM
function [X, y] = trainSen(file_name)

X = [];
y = [];
contents = readFile(file_name);
sentence_list = strsplit(contents, '\n');
numRows = size(sentence_list, 2);
for rowIdx = 1:numRows
  str = sentence_list{1, rowIdx};
  word_indices = processAbstract(str);
  X = [X ; abstractFeatures(word_indices)];

  [word, str] = strtok(str, "\t");

  if (strcmp(word,"AIMX") == 1)
    y = [y ; 1];
  else
    y = [y ; 0];
  end
end
end
