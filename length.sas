options formdlim = '*' nodate pageno = 1 ls=64 ps=45;

data employees;
 infile 'C:\Documents and Settings\eyoung.STAT-45\
Desktop\eyoung\SAS data sets\infile options.txt' firstobs=4 obs=7;
 length fname $ 9;
 length lname $ 9;
 input fname $ lname $ age salary;
run;

proc print;
run;
