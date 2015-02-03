options formdlim = '_' nodate ls=84;

data inverse_fns;
 /*Given probability and df, find critical values*/
 cinv_95_1 = cinv(.95,1);  /*chi-square*/
 finv_95_2_26 = finv(.95, 2, 26); /*F with 2 num and 26 denom df*/
 tinv_95_45 = tinv(.95, 45); /*t with 45 df*/
 probit_95 = probit(.95);  /*normal*/
run;

proc print;
run;

data prob_fns;
 /*Given critical value and df, find probability*/
 probchi = probchi(3.84146,1);  /*chi-square*/
 p_value = 1 - probchi;
 probf = probf(3.36902,2,26);   /*F with 2 and 26 df*/
 probt = probt(1.67943,45);  /*t with 45 df*/
 probnorm = probnorm(1.64485);  /*normal*/
run;

proc print;run;
