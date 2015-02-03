*This is a comment!  I can write anything here, with
the exception of semicolons.;
*options formdlim = '*' nodate pageno = 1 ls=64 ps=45;

data mine;
 input id name $ y x1 x2 $;
 cards;
 1001 Bob 34 15.34 green
 1002 Joe 56 18.90 yellow
 1003 Liz 47 17.68 red
 1004 Rob 60 20.77 yellow
 ;
run;

proc print data = mine;
run;

/*proc gplot data = mine;
 plot y*x1;
run;*/

/*The slash-asterisk combination
allows me to comment several lines
of code at a time.*/
