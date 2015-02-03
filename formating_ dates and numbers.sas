options formdlim = '*' nodate pageno = 1 ls=64 ps=45;

data dates0;
 infile 'C:\Documents and Settings\eyoung.STAT-45\
Desktop\eyoung\SAS data sets\format\date sal.txt';
 length ssn $ 11;
 informat date mmddyy10. salary dollar10.2;
 input ssn $ date salary;
* format date worddate20. salary dollar10.2;
run;

proc print data = dates0;
run;

data dates1;
 infile 'C:\Documents and Settings\eyoung.STAT-45\
Desktop\eyoung\SAS data sets\format\date sal.txt';
 length ssn $ 11;
 informat date mmddyy10. salary dollar10.2;
 input ssn $ date salary;
 format date worddate20. salary dollar10.2;
run;

proc print data = dates1;
run;

/*Try it with a different date length*/
data dates2;
 infile 'C:\Documents and Settings\eyoung.STAT-45\
Desktop\eyoung\SAS data sets\format\date sal.txt';
 length ssn $ 11;
 informat date mmddyy10. salary dollar10.2;
 input ssn $ date salary;
 format date worddate12. salary dollar10.2;
run;

proc print data = dates2;
run;

/*Another date format*/
data dates3;
 infile 'C:\Documents and Settings\eyoung.STAT-45\
Desktop\eyoung\SAS data sets\format\date sal.txt';
 length ssn $ 11;
 informat date mmddyy10. salary dollar10.2;
 input ssn $ date salary;
 format date mmddyy8. salary dollar10.2;
run;

proc print data = dates3;
run;

/*get rid of informat statement*/
data dates4;
 infile 'C:\Documents and Settings\eyoung.STAT-45\
Desktop\eyoung\SAS data sets\format\date sal.txt';
 length ssn $ 11;
 input ssn $ date mmddyy10. salary dollar10.2;
 format date mmddyy8. salary dollar10.2;
run;

proc print data = dates4;
run;

/*use attrib statement instead*/
data dates5;
 infile 'C:\Documents and Settings\eyoung.STAT-45\
Desktop\eyoung\SAS data sets\format\date sal.txt';
 length ssn $ 11;
 label ssn='Social Security Number';
 attrib date informat=mmddyy10. format=worddate12. label='Birth Date';
 attrib salary informat=dollar10.2 format=dollar10.2 label='Annual Salary';
 input ssn $ date salary;
run;

proc print data = dates5 label;
run;
