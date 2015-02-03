options formdlim = '_' nodate;

data one; 
 input x @@;
 cards;
 1 4 8 8 5
 ;
run;

data newone;
 set one;
  sum_x + x;
  sum_xsq + x**2;
run;

proc print;run;


data new1;
 set one;
 sum_x = sum_x + x;
 sum_xq = sum_xq + x**2;
run;

proc print;run;

data tryagain;
 set one end=last;
 retain sum_x 0 sum_xq 0 prod_x 1;
 sum_x = sum_x + x;
 sum_xq = sum_xq + x**2;
 prod_x = prod_x * x;
 if last = 1;  /*equivalent to: if last = 0 then delete;*/
run;

proc print;run;
