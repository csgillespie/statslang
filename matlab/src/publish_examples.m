% Generate HTML and PDF versions of the examples along with the output plots
publish('example1_regression.m');
publish('example1_regression.m', 'pdf');

publish('example2_monte_carlo.m');
publish('example2_monte_carlo.m', 'pdf');

% Tidyng up: close all windows
close all;
