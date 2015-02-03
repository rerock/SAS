options formdlim = '*' nodate pageno = 1;


/*one-to-one merging*/
/*all variables different*/
data a;
 input x y;
 cards;
 1 2
 3 4
 5 6
 ;
data b;
 input u v;
 cards;
 10 20 
 30 40
 ;
data c;
 merge a b;
proc print;run;


/*one-to-one merging*/
/*some variables common to a and b*/
data a;
 input x y;
 cards;
 1 2
 3 4
 5 6
 ;
data b;
 input x v;
 cards;
 10 20 
 30 40
 ;
data c;
 merge a b;
proc print;run;

/*compare that to merging in the other order:
now what gets replaced?*/
data c;
 merge b a;
run;
proc print;run;
