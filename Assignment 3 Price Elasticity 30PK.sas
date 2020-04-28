/****************************************************************** 
� Name:Nithin Das  
� Purpose:  Price Elasticity
� SAS Program: Assignment 3 Price Elasticity 30PK.sas  
� Date:  04/13/2020
� Description:
� Program Dependencies:  
� Data Dependencies:   
 ******************************************************************/
/* setting path */
libname sasdata "/folders/myfolders/sasuser.v94/SAS_data";
run;
/* Get input data */
proc copy in=sasdata out=work;
  select Beer_sales;
run;
/* filtering data till week 52 */
data BEER_SALES_b;
  set BEER_SALES;
  if week<=52;
  
 run;

proc sort data=BEER_SALES_b; by Price_30PK;run;
proc sgplot data=BEER_SALES_b ;
   series x=Price_30PK   y=CASES_30PK;
run;
 title "reg Estimates for linear model of   ";

/* Linear Model  */
proc reg data=BEER_SALES_b  ;
   model CASES_30PK=Price_30PK;
run;
quit;


/* Log Model */

proc reg data=BEER_SALES_b  ;
  
   model CASES_30PK_ln=Price_30PK_ln;
run;
quit;

proc sgplot data=BEER_SALES_b ;
   series x=Price_30PK_ln   y=CASES_30PK_ln;
run;