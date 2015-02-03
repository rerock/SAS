options formdlim = '*' nodate pageno = 1 ls=64 ps=45;

data excel1;
  infile 'C:\Documents and Settings\eyoung.STAT-45\
Desktop\eyoung\SAS data sets\excel.txt' firstobs = 2 expandtabs;
  length date $ 10;
  input name $ date $ age height;
run;
 
proc print data = excel1;
run;

/*Here's another method for getting data into SAS from Excel:*/

proc import datafile="C:\Documents and Settings\eyoung.STAT-45\
Desktop\eyoung\SAS data sets\excel.xls" out=excel2 replace;
 getnames=yes;
run;

proc print data = excel2;
run;

/*I can also export data from SAS to Excel*/

data exporting;
 input name $ height;
 cards;
Bob 71
Joe 68
Mary 62
Jeff 67
;
run;

proc export data = exporting outfile="C:\Documents and Settings\eyoung.STAT-45\
Desktop\eyoung\SAS data sets\exporting.xls" replace;
run;
 
 
