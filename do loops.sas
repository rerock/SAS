options formdlim = '+' nodate;
data three_4;
 input id class score @@;
 cards;
 345 3 26  322 3 46 308 3 50 321 3 38 364 3 44
 429 4 55  411 4 58 461 4 32 478 4 47 421 4 62
 ;
run;
proc print;run;
data kids;
 set three_4;
 if class = 3 then do;
   grade = 'U';
   if score >= 40 then grade = 'S';
 end;
 else do;
   grade = 'U';
   if score >= 50 then grade = 'S';
 end;
run;

proc print data = kids;
run;

data salary;
 do i= 1 to 20;
   x=ranuni(0);
   if x < 0.5 then do;
      gender='f';
      income=1000+ 200*normal(0);
	  salary=round(income);
   end;
   else do;
	  gender='m'; 
	  income=1000+ 300*normal(0);
	  salary=round(income);
   end;
   output;
 end;
 drop i;
run;

proc print; 
run;

