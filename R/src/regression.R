#' ---
#' title: "Regression example"
#' author: "Colin Gillespie"
#' output:
#'  pdf_document:
#'     fig_height: 4
#'     fig_width: 4 
#' ---

#' Load data set
r = read.csv("../data/regression.csv", header=TRUE)

#' Plot the data and colour the points by gender
plot(r$Age, r$OI, pch=21, bg=r$Sex)

#' Bad data, so remove the negative age
r = r[r$Age > 0,]

#' Fit a multiple linear regression model. Predict OI using Age and Sex
#' However, we need to log transform OI
(m = lm(log(OI) ~ Age + Sex, data=r))

#' Standard ANOVA output
summary(m)

#' Standard residual plots
#' Could use rstandard(m) for standardised residuals
qqnorm(residuals(m), pch=21, bg=r$Sex)
plot(fitted.values(m), residuals(m), bg=r$Sex, pch=21)
plot(r$Age, residuals(m), bg=r$Sex, pch=21)
boxplot(residuals(m) ~ r$Sex)

