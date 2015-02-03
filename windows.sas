options formdlim = '*' nodate pageno = 1;

data mine;
 input name $ age x y;
 cards;
 Bob 24 16.43 781.23
 Joe 36 18.97 654.33
 Alice 48 17.44 187.64
 George 39 17.52 536.45
 ;
run;

proc print data = mine;
run;

proc ttest data = mine h0=15; 
 var x;
run;
options formdlim = '&' nodate ls=69;
 
data one;
 length y $ 23;
 y = "Thank you for your help";
 subt = substr(y,1,5);
 suby = substr(y,7,3);
run;

proc print;
run;

data two;
 name = 'radioshock';
 test = 'id7381k2';
run;
data more;
 set two;
 substr(name, 6, 5) = 'andTV';
 substr(test, 5, 2) = 'a4';
run;
proc print data = more;run;


data three;
 len = 'low, moderate, high';
 h = scan(len, 3, ',');  /*Now h has the value 'high'.*/
 address = "209 radcliffe road, center city, ny, 92716";
 state = scan(address, 3, ',');  /*state is ny*/
 rd = scan(address, 3);
run;
proc print data = three;
run;

data four;
 length toname $ 9 fromname $ 12;
 toname = ' Susan  ';
 fromname = 'Christopher ';
 ask = 'Dear '||trim(left(toname))||', Do you like me? Check yes or no. Love, '
   ||trim(fromname);
run;

proc print;run;

data five;
 a = '    Thank you';
 b = left(a);
 c = b || 'very much!';
 d = trim(left(a))|| ' very much!';
proc print;
 var b c d;
run;

