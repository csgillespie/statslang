% Load dataset. Note: this example uses MATLAB's table data structure to 
% store the content of the .csv file (table is available since 
% MATLAB R2013b)
data = readtable('../data/regression.csv');

% Convert the Sex column from strings to MATLAB's categorical data type.
data.Sex = categorical(data.Sex);

% Plot the data and colour the points by gender. The third argument (empty
% square brackets, i.e. []) tells MATLAB to use its default.
figure;
scatter(data.Age, data.OI, [], data.Sex, 'filled');
xlabel('Age');
ylabel('OI');

% Clean up the data by removing rows with negative age
data = data(data.Age > 0, :);

% Log transform OI for data fitting
data.logOI = log(data.OI);

% Fit a multiple regression model according to the formula:
%   log(OI) ~ Age + Sex
% Note that by not terminating the line with ; we get the ANOVA summary
model = fitlm(data, 'logOI ~ Age + Sex')

% Standard residual plot. Other residuals are available: Raw, Pearson, 
% Standardized, Studentized
figure;
qqplot(model.Residuals.Raw);

% Fitted values vs residual plot
figure;
scatter(model.Fitted, model.Residuals.Raw, [], data.Sex, 'filled');
xlabel('Fitted values');
ylabel('Residual');

% Age vs residual plot coloured by gender
figure;
scatter(data.Age, model.Residuals.Raw, [], data.Sex, 'filled');
xlabel('Age');
ylabel('Residual');

% Boxplot of residuals separated by gender
figure;
boxplot(model.Residuals.Raw, data.Sex)
xlabel('Sex');
ylabel('Residual');
