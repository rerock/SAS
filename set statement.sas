options formdlim = '*' nodate pageno = 1 ls=64 ps=45;

data class;
 input gender $ grade @@;
 cards;
 m 78 f 82 m 93
 f 88 f 96 f 73
 m 64 m 73 m 84
 ;

data girls;
 set class;
 if gender = 'm' then delete;
run;

data boys; 
 set class;
 if gender = 'f' then delete;
run;

proc print data = girls;
run;

proc print data = boys;
run; 

