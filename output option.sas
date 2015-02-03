options nodate formdlim = '*';

data one; 
 input x y z; 
 cards; 
 1 3 5 
 4 2 7 
 8 6 5 
 8 . 9 
 5 6 6 
 ; 
run;

proc print data = one; 
run;  

data dropping; 
 set one;
 *drop x;
 keep y z; /* You can also use this */
run;

proc print data = dropping;
run;

data deleting; 
 set one; 
 if y = . then delete;
run;

proc print data = deleting;
run;

/**************************************************/

data deleted;  
 set one; 
 if y ^= . then output;
run;

proc print data = deleted;
run;

data new; 
 set one end = last;  /* you can use any name instead of "last"*/
 *if last = 1 then output; 
 if last = 0 then output; 
run;

proc print data = new;
run;

data smallx largex;
set one;
	if x <= 5 then output smallx;
	          else output largex;
proc print data=smallx;
proc print data=largex;
run;

/*****************************************/
data x_sum;  
   set one end = last; 
    xsum + x; 
	happy + y;
	myzsum + z;
   if last = 1 then output; 
   drop x y z ; 
 run;

proc print data = x_sum; 
run;  
