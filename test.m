clear ; close all; clc

data = load("ex1data1.txt");


y = data(:, 2);
m = length(y); % number of training examples
X = [ones(m, 1) data(:,1)];
theta = [0; 0]
alpha = 0.01;
iterations = 10000;

[theta, history] = gradientDescent(X, y, theta, alpha, iterations);

% Compute using the normal equation
% theta = pinv(X' * X) * X' * y



% Display the data and the hyphothesis
figure;
% the data
plot(X(:, 2), y, 'rx', 'MarkerSize', 10);

hold on;
% the hyphothesis
max_x = max(X(:, 2)) % largest x value on the graph
max_y = max(theta(1) + theta(2) * max_x, max(y)) % largest y value on the graph

H = [
    0     (theta(1) + 0     * theta(2)); 
    max_x (theta(1) + max_x * theta(2))
    ];
plot(H(:, 1), H(:, 2), 'cg');

% axis([0 max_x 0 max_y], "square");

theta

hold off;

figure;

% Cost over iterations -- useful to check if this shit is working
plot((1:iterations)', history);
xlabel('iteration');
ylabel('cost J(theta)');



