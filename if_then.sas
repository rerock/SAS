options formdlim = '*' nodate;

data score;
infile 'E:\6360\June15\6360 June 15_score.txt';
input name $ gender $ score;
run;

proc print data = score;
run;

data score1; 
 infile 'E:\6360\June15\6360 June 15_score.txt';
 input name $ gender $ score;
 if gender='m';  
run;

proc print data = score1;
run;

data score2; 
 infile 'E:\6360\June15\6360 June 15_score.txt';
 input name $ gender $ score;
 if score;
run;

proc print data = score2;
run;

data score3; 
  set score;
  *if name = 'Mary' then delete; 
   if name ^= 'Mary'; /* This also works */
run;

proc print data = score3;
run;

data score4;
  set score;
  if name = 'Mary' | name = 'Gary' then delete;
run;

proc print data = score4;
run;

data score4; 
  set score;
  if name in ('Mary', 'mary', 'Gary', 'gary') then delete;
run;

proc print data = score4;
run;

options formdlim = '+';

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
