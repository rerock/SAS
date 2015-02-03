options formdlim = '*' nodate pageno = 1;

data a;
 input id x y;
 cards;
 1 1 2
 2 3 4
 3 5 6
 ;
data b;
 input id x y;
 cards;
 1 10 20 
 2 . 40
 ;
proc sort data = a;
 by id;
proc sort data = b;
 by id;
data c;
 update a b;
 by id;
proc print;run;


*multiple update;
data a;
 input id x y;
 cards;
 1 1 2
 2 3 4
 3 5 6
 ;
data b;
 input id x y;
 cards;
 1 10 20 
 1 100 200
 2 . 40
 ;
data c;
 update a b;
 by id;
 title 'update';
proc print;run;

/*contrast the update to the merge*/
data c;
 merge a b;
 by id;
title 'merge';
proc print;run;
