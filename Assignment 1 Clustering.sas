/****************************************************************** 
� Name:Nithin Das
� Purpose:  Segmentation
� SAS Program: Assignment 1 Clustering.sas  
� Date: 03/23/2020
� Description:
� Program Dependencies:  
� Data Dependencies:   
 ******************************************************************/

libname sasdata "/folders/myfolders/sasuser.v94/SAS_data";
run;

proc copy in=sasdata out=work;
  select income_byzip_pct;
run; 

data VA other_states;
  set income_byzip_pct;
  if STATEFIPS=51 then output VA;
  else output other_states;
run;
proc cluster data = VA outtree=VA_tree method=SINGLE ;         
var Returns_pct1 Returns_pct2 Returns_pct3 Returns_pct4
                                         Returns_pct5 Returns_pct6; 
id zipcode ;
run;
proc tree data =VA_tree  noprint  ncl=10 out=out_hclust10;
   copy  zipcode;
run;


proc fastclus data =VA   
      maxclusters =10   out=VA_clusters ; 
 var  Returns_pct1 Returns_pct2 Returns_pct3 Returns_pct4
                                         Returns_pct5 Returns_pct6;
id  zipcode    ;
run;
