options formdlim = '*' nodate pageno = 1 ls=64 ps=45;

data seven;
infile 'E:\6360\June13\6360 June 13_ex7.txt';
input @1 ID 3.          
      @4 gender $ 1.
	@6 age 2.
	@8 wt 5.1
	@15 number 6.;
*input id 1-3 gender $ 4-5 age 6-7 weight 5.1 number 15-20;


proc print data = seven;
run;

data eight;
infile 'E:\6360\June13\6360 June 13_ex8.txt';
input #1 ID 1-3 age 5-6 ht 8-9 wt 11-13
      #2 SBP 5-7 DBP 8-10
	#3 salary 1-5 yrs 7-8;

proc print data = eight;
run;

data nine; 
infile 'E:\6360\June13\6360 June 13_ex9.txt';
input id @14 tax dollar8.2 @31 value comma10. @47 date mmddyy8.;
format tax dollar8.2 value comma10. date mmddyy8.;

proc print data = nine;
run;

data nine2;
infile  'E:\6360\June13\6360 June 13_ex9.txt';
input id  tax  value  date;
Attrib tax informat = dollar8.2 format= dollar8.2 ; 
Attrib value informat = comma10. format= comma10.; 
Attrib date informat = mmddyy8. format= mmddyy8.; 

proc print data = nine2;
run;

data ten;
infile 'E:\6360\June13\6360 June 13_ex10.txt';
input type $ @;
if type = 'surface' then delete;
input name $ 9-12 amtraffic pmtraffic;

proc print data = ten;
run;
