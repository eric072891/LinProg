#Linear Regression as Linear Programming
#12/2/2019
#Eric Olberding
#Dr. Borgwardt

param NUMIND;   				#number of independent variables
param N;						#number of observations
param DEP{1..N};      			#dependent variable
param IND{1..N,1..NUMIND}; 		#independent variables

var Beta {i in 1..NUMIND+1};	#coefficients
var t 	 {j in 1..N} >= 0;		#bounding values

#This minimization is the same as minmizing the sum of the absolute values of the error for each observation
minimize Loss: sum {j in 1..N} t[j];

#These conditions ensure that each absolute value term is less than or equal to its corresponding t_i
subject to lowerbound {j in 1..N}: -t[j] <= DEP[j] - Beta[1] - sum {i in 1..NUMIND} (Beta[i+1]*IND[j,i]);


subject to upperbound {j in 1..N}: 	DEP[j] - Beta[1] - sum {i in 1..NUMIND} (Beta[i+1]*IND[j,i]) <= t[j];