% Original code obtained from Coursera, Machine Learning Week 7: SVMs

function sim = linearKernel(x1, x2)
% Returns a linear kernel between x1 and x2
% sim = linearKernel(x1, x2) returns a linear kernel between x1 and x2
% and returns the value in sim

% Ensure that x1 and x2 are column vectors
x1 = x1(:); x2 = x2(:);

% Compute the kernel
sim = x1' * x2;  % dot product

end
