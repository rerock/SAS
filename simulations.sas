options formdlim ='*';
title1 'Random Number Generation';

/*Example 1*/
title2 'Using Functions';
data one;
 seed1=1234; seed2=5678; seed3=12345;
 do i = 1 to 5;
   x1=ranuni(seed1);
   x2=ranuni(seed2);
   x3=ranuni(seed3);
   output;
 end;
 drop i;
run;
proc print;
run;

title2 'Using Call Routines';
data two;
 seed1=1234; seed2=5678; seed3=12345;
 do i = 1 to 5;
   call ranuni(seed1, y1);
   call ranuni(seed2, y2);
   call ranuni(seed3, y3);
   output;
 end;
 drop i;
run;
proc print; 
run;


ranbin(seed, n, p)
ranexp(seed)
rannor(seed)
ranpoi(seed,m)
ranuni(seed)





/*Example 2*/
title2 'CALL STREAMINIT routine with RAND function';
data random;
   *call streaminit(123);
   do i=1 to 10;
      x1=rand('normal');
      output; 
   end; 

proc print data=random; 
   id i; 
run;

rand('beta',a,b)
rand('binomial',n,p)
rand('chisquare',df)
rand('exponential')
rand('f',ndf,ddf)
rand('geometric',p)
rand('negbinom',k,p)
rand('poisson',m)
rand('t',df)
rand('uniform')



/*Example 3*/
title2 ;
data rannorm;
 mu = 10; sigma = 2;
 do i = 1 to 10;
     z = rannor(0);
	 x = mu + sigma*z;
	 output;
 end;
run;

proc print;
run;

/*subtract 10 from each X to check the hypothesis test on PROC TTEST*/
data new;
 set rannorm;
  xnew = x - 10;
run;

/*xnew should have a mean somewhere around 0, so in general our p-value 
for the t-test that tests whether the mean of a variable is 0 should 
not be small, although 1 time in 20 it should be below .05*/
proc ttest;
 var xnew;
run;




/*Example 4*/
data simreg;
  b0 = -10; b1 = 0.3; b2 = 3;
  sigma = 10;
  n = 20;
  do i = 1 to n;
     x1 = i;
	 x2 = i**2;
	 error = rannor(0)*sigma;
	 y = b0 + b1*x1 + b2*x2 + error;
	 output;
  end;
  keep x1 x2 error y;
*proc print;
run;
proc reg data = simreg;
 model y=x1 x2;
run;


