function [J, grad] = costFunction(theta, X, y)

% number of training examples
m = length(y);

J = 0;
grad = zeros(size(theta));

hyp = sigmoid(X*theta);
J = (1/m) * (-y' * log(hyp) - (1-y)' * log(1-hyp));
grad = (1/m) * (X' * (hyp-y));

end