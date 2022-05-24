NB. =========================================================
NB.%gi_tools.ijs - Tools for general insurance tasks.
NB.-<hr>
NB.-<a href="http://www.finexec.com.au">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_lib.html">Library | </a>
NB.-<a class="HREF" href="index.htm">Actuariak Non-Life</a>
NB.-<hr>
NB.- Script: ~addons/finance/finexec/actuarialmonlife/gi_tools.ijs
NB.- Contributor: William Szuch
NB.- Updated: 2022-05-22
NB.- Depend: nil
NB.- Definitions: loaded to locale base
NB.- Status: dev:
NB.- <a href="../gi_tools.ijs" target="_blank">Script source: gi_tools.ijs</a>
NB.-<hr>
NB.- Definitions for solving general insurance problems.
NB.-<hr>
NB.- Equations:
NB.- To Do
NB.-<hr>


NB. =========================================================
NB. For examples
require '~addons/finance/finexec/actuarialnonlife/matrix_tools.ijs'

NB. =========================================================
NB.*avg_dev m -
NB.- <b>Form:</b> tacit
NB.- <b>Depend:</b> nil
NB.- Calculate average development for table with incident by development periods.
NB.- Applicable for square table. 
NB.-syntax:
NB.+avg_dev(D)
NB.+D = square table with data by incident/development period.
NB.-example:
NB.+  avg_dev(top_triL 4)
NB.+1 1 1 1
NB.-
NB.+  avg_dev(top_triL 8)
NB.+1 1 1 1 1 1 1 1
NB. ---------------------------------------------------------
avg_dev =: +/ % [: (|.) 1 + [: (i.) 0 { $
NB. ---------------------------------------------------------
Note 'T avg_dev'
avg_dev =. 13 : '(+/ y)%(|. 1 + i. 0{$y)'
)


NB. =========================================================
NB.*cumm_sum_rows m - 
NB.- <b>Form:</b> tacit
NB.- <b>Depend:</b> nil
NB.- Cummulative sum along rows.
NB.-syntax:
NB.+cumm_sum(M)
NB.+M = matrix
NB.-example:
NB.+   cumm_sum_rows(i. 4 5)
NB.+0  1  3  6 10
NB.+ 5 11 18 26 35
NB.+10 21 33 46 60
NB.+15 31 48 66 85
NB.-
NB.+   cumm_sum_rows(top_triR  4)
NB.+1 2 3 4
NB.+0 1 2 3
NB.+0 0 1 2
NB.+0 0 0 1
NB. ---------------------------------------------------------
cumm_sum_rows =: +/\ "1


NB. =============
NB.*cumm_sum_columns m - 
NB.- <b>Form:</b> tacit
NB.- <b>Depend:</b> nil
NB.- Cummulative sum down columns.
NB.-syntax:
NB.+cumm_sum_columns(M)
NB.+M = matrix
NB.-example:
NB.+   cumm_sum_columns(i. 4 5)
NB.+ 0  1  2  3  4
NB.+ 5  7  9 11 13
NB.+15 18 21 24 27
NB.+30 34 38 42 46
NB.-
NB.+   cumm_sum_columns(top_triR  4)
NB.+1 2 3 4
NB.+0 1 2 3
NB.+0 0 1 2
NB.+0 0 0 1
NB. ---------------------------------------------------------
cumm_sum_columns =: +/\ 



NB. =========================================================
NB. Inflation of claim paymants
NB. =========================================================


NB. ================================================
NB.*inf_fac m - 
NB.- <b>Form:</b> tacit
NB.- <b>Depend:</b> nil
NB.- Create a vector of inflation factors to inflate payments
NB.- to the end of last period.
NB.- Payments assumed to be made in the middle of period.
NB.- Payments in last period are inflated by half a period.
NB.-syntax: 
NB.+inf_fac(I)
NB.+I = inflation rates per period eg. 0.05 = 5.0%
NB.+    most recent period is last inflation rate 
NB. ---------------------------------------------------------
NB.-example:
NB.+  inf_fac(0.05 0.06 0.07 0.06 0.09 0.05)
NB.+1.40996 1.34282 1.26681 1.18393 1.11692 1.0247
NB.-
NB.+  inf_fac(0.05)
NB.+1.0247
NB. ---------------------------------------------------------
inf_fac =: [: */\. (1 + ]) ^ [: (}.) 0.5 ,~ 1 #~ #
NB. ---------------------------------------------------------
Note 'T inf_fac'
inf_fac =.  13 '*/\.(1+y)^}.((#y)#1),0.5'
)


NB. =========================================================
NB.*inf_pmts d - 
NB.- <b>Form:</b> tacit
NB.- <b>Depend:</b> nil
NB.- Inflate payments to the end of the last period.
NB.-syntax:
NB.+(P)inf_pmts(I)
NB.+p = actual payments: incident by payment period 
NB.+I = inflation rates for periods
NB.+    most recent period is last inflation rate 
NB.-example:
NB.+  (7#1)inf_pmts(7#0.05)
NB.+1.37319 1.3078 1.24552 1.18621 1.12973 1.07593 1.0247
NB.-
NB.+  (top_triR 4 )inf_pmts(4 # 0.05)
NB.+1.18621 1.12973 1.07593 1.0247
NB.+      0 1.12973 1.07593 1.0247
NB.+      0       0 1.07593 1.0247
NB.+      0       0       0 1.0247
NB. ---------------------------------------------------------
inf_pmts =: [ *"1 [: ([: */\. (1 + ]) ^ [: (}.) 0.5 ,~ 1 #~ #) ]
NB. ---------------------------------------------------------
Note 'T inf_pmts'
inf_pmts =. (13 : 'x*"1 inf_fac y') f.
)



