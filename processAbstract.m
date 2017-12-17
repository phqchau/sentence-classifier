function word_indices = processAbstract(contents)

% Load Vocabulary
vocabList = getVocabList();

% Init return value
word_indices = [];

% Lower case
contents = lower(contents);

% Handle Numbers
% Look for one or more characters between 0-9
contents = regexprep(contents, '[0-9]+', 'NUMBER');

% Handle URLS
% Look for strings starting with http:// or https://
contents = regexprep(contents, ...
                           '(http|https)://[^\s]*', 'httpaddr');

% Handle Email Addresses
% Look for strings with @ in the middle
contents = regexprep(contents, '[^\s]+@[^\s]+', 'emailaddr');

while ~isempty(contents)
    [word, contents] = ...
       strtok(contents, ...
              [' @$/#.-:&*+=[]?!(){},''">_<;%' char(10) char(13)]);

    % Remove any non alphanumeric characters
    word = regexprep(word, '[^a-zA-Z0-9]', '');

    % Stem the word
    % (the porterStemmer sometimes has issues, so we use a try catch block)
    try word = porterStemmer(strtrim(word));
    catch word = ''; continue;
    end;

    % Skip the word if it is too short
    if length(word) < 1
       continue;
    end

    for i = 1:length(vocabList)
      if(strcmp(word, vocabList{i}))
        word_indices = [ word_indices ; i];
      end
    end
end

end
