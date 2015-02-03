options formdlim = '*' nodate pageno = 1 ls=64 ps=45;

data delim;
 infile 'C:\Documents and Settings\eyoung.STAT-45\
Desktop\eyoung\SAS data sets\delimiter.txt' dsd dlm=',';
 input name $ age birthdate $ salary;
run;

proc print;run;


data long;
 infile 'C:\Documents and Settings\eyoung.STAT-45\
Desktop\eyoung\SAS data sets\long.txt' lrecl=287 pad;
 input name $ 1-16 citystate $ 18-39 age salary x1-x24;
run;

proc print;
run;
