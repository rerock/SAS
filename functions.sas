options formdlim = '_' nodate pageno = 1;

data one;
 input x1-x4;
 cards;
 1 2 3 4 
 13.75 . 5 7
 0.5 . . 8
 ;
run;

/*These functions go across rows: for a single observation
across variables!  To get these results down columns (for a
single variable down observations), use proc univariate,
among other things.*/
data sums;
 set one;
 total1 = x1 + x2 + x3 + x4;
 total2 = sum(of x1-x4);
 total3 = sum(x1, x2, x3, x4);
run;

proc print data = sums;
run;

data means;
 set one;
 mean1 = (x1+x2+x3+x4)/4;
 mean2 = mean(of x1-x4);
 mean3 = mean(x1, x2, x3, x4);
run;

proc print data = means;
run;

data rounds;
 set one;
 round1 = round(x1);
 round2 = round(x1,1);
 round3 = round(x1,0.1);
 round4 = round(x1,0.01);
 int = int(x1);
run;

proc print data = rounds;
run;

/* Here are some common numeric functions:
sqrt
exp
abs
sin
cos
tan
int
log     This is log base e, not log base 10!!
log10
max
min
mean
sum
round
*/
