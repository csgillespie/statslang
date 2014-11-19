## Example MATLAB code

Author: Miguel O. Bernabeu (miguel.bernabeu@ucl.ac.uk)

### Regression example

1. Load the data set, `data/regression.csv` 
1. Plot the variables `OI` against `Age` and colour according to `Sex`
1. Remove any rows with a negative `Age` value
1. Fit the multiple linear regression model `log(OI) ~ Age + Sex`
1. Generate standard residual plots. 

See `src/html/example1_regression.pdf` for the MATLAB solution.

### Monte Carlo example

The aim is to integrate the standard normal distribution from -5 to 5, using a 
simpe Monte Carlo rejection scheme. Bonus points for running in parallel.

See `src/monte_carlo.pdf` for the R solution.

