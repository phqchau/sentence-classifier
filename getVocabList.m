% Original code obtained from Coursera, Machine Learning Week 7: SVMs

function vocabList = getVocabList()

% Read the fixed vocabulary list
fid = fopen('vocab.txt');

% Store all dictionary words in cell array vocab{}
n = 1899;  % Total number of words in the dictionary

vocabList = cell(n, 1);
for i = 1:n
    fscanf(fid, '%d', 1);
    vocabList{i} = fscanf(fid, '%s', 1);
end
fclose(fid);

end
