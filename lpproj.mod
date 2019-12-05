#Linear Regression as Linear Programming
#12/2/2019
#Eric Olberding
#Dr. Borgwardt

param NUMIND;   				#number of independent variables
param N;						#number of observations
param DEP{1..N};      			#dependent variable
param IND{1..N,1..NUMIND}; 		#independent variables

var Beta {i in 1..NUMIND+1};	#coefficients




#Least absolute deviations bounding form
#var t 	 {j in 1..N} >= 0;		#bounding values

#This minimization is the same as minmizing the sum of the absolute values of the error for each observation
#minimize Loss: sum {j in 1..N} t[j];

#These conditions ensure that each absolute value term is less than or equal to its corresponding t_i
#subject to lowerbound {j in 1..N}: -t[j] <= DEP[j] - Beta[1] - sum {i in 1..NUMIND} (Beta[i+1]*IND[j,i]);


#subject to upperbound {j in 1..N}: 	DEP[j] - Beta[1] - sum {i in 1..NUMIND} (Beta[i+1]*IND[j,i]) <= t[j];





#splitting variables LAD
var rp {j in 1..N} >=0;        #positive part of error term
var rn {j in 1..N} >=0;		   # negative part of error term

minimize Loss: sum {j in 1..N} (rp[j]+rn[j]);

subject to data {j in 1..N}: rp[j]-rn[j] = DEP[j] - Beta[1] - sum {i in 1..NUMIND} (Beta[i+1]*IND[j,i]);
















#maximum absolute deviations
#var t>=0;						#bounding value

#minmization and constraints similar to above
#minimize Loss: t;

#subject to lowerbound {j in 1..N}: -t <= DEP[j] -Beta[1]-sum{i in 1..NUMIND}(Beta[i+1]*IND[j,i]);

#subject to upperbound {j in 1..N}: DEP[j] -Beta[1]-sum{i in 1..NUMIND}(Beta[i+1]*IND[j,i]) <= t;