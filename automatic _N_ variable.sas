options formdlim = '_' nodate;

data one; 
 input x @@; 
 cards; 
 1 4 8 8 5 
 ; 
run;

proc print;
run;

data new; 
 set one end = last; 
    sumx + x; 
 if last = 1 then do; 
    xbar = sumx/_N_; 
  output; 
  end; 
keep xbar;
run;

proc print data = new;
run;

/*Goal:  get a single observation into a data set*/
data two; 
 set one end=lastobs;
  sumx + x;
 if lastobs = 1 then output;
 keep sumx;
run;

proc print data = two;
run;

data three; 
 set one;
 if _N_ =1  then set two;
run;

proc print data = three;
run;


/*t-test*/
data four;
 input x @@;
 retain null 6;
 cards;
 4 6 5 7 5 7 6 4 3 5
 ;
run;

proc print;run;

data ttest; set four end = last;
    sumx + x;
    ssqx + x*x;
    n+1;
    if last= 1 then do;
       xbar = sumx / _N_;  
       var = (ssqx-sumx**2/_N_)/(_N_-1);
       stderr = sqrt(var/_N_);
       t = (xbar - null ) / stderr;
       df = n-1;
       pvalue = 2*probt(-abs(t), df);
       output;
       end;
 keep pvalue;

proc print; 
run;

proc ttest data = four h0=6;
 var x;
run;
