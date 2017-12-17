function x = abstractFeatures(word_indices)

% Total number of words in the dictionary
n = 1899;

x = zeros(1, n);

for i = word_indices
  x(i) = 1;
end

end
