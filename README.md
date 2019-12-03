# LinProg
Linear Regression as Linear Programming (LAD in AMPL)



To see a wiki page for this project go to:
http://math.ucdenver.edu/~sborgwardt/wiki/index.php/Linear_Regression_as_Linear_Programming

Linear regression is one of the most commonly used statistical modelling methods. 
In linear regression, we model the dependent variable as a linear function of the independent variables. 
The model's parameters should be chosen to minimize the discrepancy between the dependent variable predicted by the model and 
the observed dependent variable. In essence, one's parameters should minimize some "lack of fit" function.
In this project we show that, when using the Least Absolute Deviations (LAD) lack of fit function,
linear regression can be formulated as a linear program. We demonstrate this by constructing two examples in AMPL. 
The mtcars and iris default datasets from R are used.
