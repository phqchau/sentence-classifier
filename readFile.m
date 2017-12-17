% Original code obtained from Coursera, Machine Learning Week 7: SVMs

function file_contents = readFile(filename)

fid = fopen(filename);
if fid
    file_contents = fscanf(fid, '%c', inf);
    fclose(fid);
else
    file_contents = '';
    fprintf('Unable to open %s\n', filename);
end

end
