options formdlim = '*' nodate pageno = 1;

/*match merging:  all variables unique*/
data a;
 input id x y;
 cards;
 1 1 2
 3 3 4
 4 5 6
 ;
data b;
 input id u v;
 cards;
 1 10 20 
 2 30 40
 ;
proc sort data = a;
 by id;
proc sort data = b;
 by id;
data c;
 merge a b;
 by id;
proc print;run;


/*some variables same*/
data a;
 input id x y;
 cards;
 1 1 2
 3 3 4
 4 5 6
 ;
data b;
 input id x v;
 cards;
 1 10 20 
 2 30 40
 ;
data c;
 merge a b;
 by id;
proc print;run;

/*compare to merge in opposite order!*/
data c;
 merge b a;
 by id;
proc print;run;


/*multiple copies of id: all variables different*/
data a;
 input id x y;
 cards;
 1 1 2
 2 3 4
 2 5 6
 2 7 8
 ;
data b;
 input id u v;
 cards;
 1 10 20 
 2 30 40
 3 50 60
 ;
data c;
 merge a b;
 by id;
proc print;run;

/*Now if some variables are the same*/
data a;
 input id x y;
 cards;
 1 1 2
 2 3 4
 2 5 6
 2 7 8
 ;
data b;
 input id x v;
 cards;
 1 10 20 
 2 30 40
 3 50 60
 ;
data c;
 merge a b;
 by id;
proc print;run;

data c; 
 merge b a;
 by id;
proc print;run;
