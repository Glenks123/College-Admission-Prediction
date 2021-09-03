%% Initialization
clear; close all; clc

%% Load Data
data = load('data.txt');
X = data(:, [1, 2]); y = data(:, 3);

%% Plotting our data
fprintf('Plotting our data... \n');
plotData(X, y)

hold on;
xlabel('Exam 1 score');
ylabel('Exam 2 score');

legend('Admitted', 'Not admitted');
hold off;

fprintf('\nProgram paused. Press enter to continue.\n');
pause;


%% Compute cost and gradient
[m, n] = size(X);

% Adding intercept term to X
X = [ones(m, 1) X];
initial_theta = zeros(n+1, 1);

options = optimset('GradObj', 'on', 'MaxIter', 400);
% fminunc to obtain the optimal theta
[theta, cost] = ...
	fminunc(@(t)(costFunction(t, X, y)), initial_theta, options);


fprintf('Cost at theta found by fminunc: %f\n', cost);
fprintf('theta: \n');
fprintf(' %f \n', theta);

% Plotting decision boundary
plotDecisionBoundary(theta, X, y);

hold on;
xlabel('Exam 1 score')
ylabel('Exam 2 score')

legend('Admitted', 'Not admitted')
hold off;

fprintf('\nProgram paused. Press enter to continue.\n');
pause;


%% Predicting the probability for a student with 89 on exam 2 and 34 on exam 2
prob = sigmoid([1 45 85]*theta);
fprintf(['For a student with scores 45 and 85, we predict an admission ' ...
    'probability of %f\n'], prob);


%% Computing the accuracy on our training set
p = predict(theta, X);
fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);
