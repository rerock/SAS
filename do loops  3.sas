data doloop;
first=10;
last=1;
 do i = first to last by -2;
    x=i;
   output;
 end;
 output;
run;

proc print;
run;

data one;
 do i = 1 to 3;
  do j = 1 to 2;
   input y @@;
   output;
  end;
 end;
 cards;
 1 2 3 4 5 6
 ;
run;
proc print data = one;
run;

/*Nested do loop: experiments*/
data sleep;
 do time = 'A.M.', 'P.M.';
  do rep = 1 to 3;
     subject + 1;
	do drug = 'Control', 'Drug';
	  input y @@;
	  output;
	end;
  end;
 end;
 drop rep;
 cards;
55 60 62 68 80 87 
45 50 54 58 70 75
;
run;

proc print;run;
