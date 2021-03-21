NB. =========================================================
NB.%chain_ladder_INBR_claims.ijs - Chain ladder calculation of IBNR claims
NB.-<hr>
NB.-<a href="http://www.finexec.com.au" target="_blank">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_doc.html" target="_blank">Documentation | </a>
NB.-<a class="HREF" href="../../finexec_cat.html" target="_blank">Category | </a>
NB.-<a class="HREF" href="index.htm" target="_blank">Actuarial Non-Life</a>
NB.-<hr>
NB.- Script: ~addons/finance/finexec/actuarialnonlife/chain_ladder_IBNR_claims.ijs
NB.- Contributor: William Szuch
NB.- Updated: 1/3/2021
NB.- Depend: ~addons/finance/finexec/actuarialnonlife/matrix_tools.ijs
NB.-        '~addons/finance/finexec/actuarialnonlife/gi_tools.ijs'
NB.           plot.ijs
NB.- Definitions: loaded to locale base
NB.- Status: dev:
NB.- <a href="../chain_ladder_IBNR_claims.ijs" target="_blank">Script source: chain_ladder_IBNR_claims.ijs</a>
NB.-<hr>
NB.- IBNR: Incurred But Not Reported claims
NB.- Chain ladder calculations of IBNR claim numbers.
NB.- The development of claim numbers from claims reported data.
NB.- Definitions:
NB.- Incident/Accident periods = period in which incident/accident occurred
NB.- Use Incident period 
NB.- Report period = period that the incident was reported
NB.- Development period = Incident period - report period.
NB.- Example Data
NB.- Tables T1 and T2
NB.- 
NB.-Notes:
NB.-<hr>


require '~addons/finance/finexec/actuarialnonlife/matrix_tools.ijs'
require '~addons/finance/finexec/actuarialnonlife/gi_tools.ijs'
load 'csv'
require 'plot'


NB. =========================================================
NB. From data ../finexec/toolbox/text_to_numeric
data_table =: [: > [: ".&.> (10{a.) cut ]  


NB. =========================================================
NB. Chain ladder IBNR claims calculation
NB. =========================================================


NB. =========================================================
NB.*T1 n Example Data Incident by report period
T1 =: data_table 0 : 0
1876  361   32   12   12   10    2   11
   0 1985  342   29   23   15    5    8
   0    0 1910  360   37   16   13    8
   0    0    0 1720  364   28   17    8
   0    0    0    0 1606  296   31   12
   0    0    0    0    0 2113  391   37
   0    0    0    0    0    0 2308  450
   0    0    0    0    0    0    0 2514
)


NB. ===========================================================
NB.*chl_dev_ratios m -
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> 
NB.- Part 1: calculation of development ratios and
NB.- review the results
NB.-syntax:
NB.+chl_dev_ratios(T) 
NB.+T = table of claim numbers to be developed using chain ladder method.
NB.+    incident by report period
NB.+    For simple case of a square matrix (eg. claim mumbers) 
NB.+    with only one number in last column. (for later development).
NB.+    Completes development to last development period.
NB.-example:
NB.+ Shows details of the calculation for the average development ratios.
NB.+  chl_dev_ratios (T1)
NB.+ Review the results before doing projection.
NB. ---------------------------------------------------------
chl_dev_ratios =: 3 : 0
'R C' =: $ y
S0 =: y
S1 =: cumm_sum_rows y          NB. Sums by development period.
S2 =: rotate1 S1
S3 =: (_1 }."1 S2)
S4 =: 1}."1 S2
S5 =: _1}. S4 % S3     NB. drop bottom row = 0
Avg_R =: avg_dev S5
S6 =: ,.('S0';S0),('S1';S1),('S2';S2),('S3';S3),('S4';S4),('S5';S5),('Avg_R';Avg_R)
)


Assumed_R =: 1.1900 1.015 1.0070 1.0050 1.0030 1.0020 1.0050  
Assumed_R1 =: Assumed_R,1.003
Assumed_R2 =: Assumed_R,1.03,1.01
NB. plot Avg_R,:Assumed_R


NB. =========================================================
NB.*chl_proj d -
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> ?
NB.- Projection of future claims numbers (IBNR).
NB.- This follows after running chl_dev_ratios.
NB.- Set the assumed development rations from avrtage ratios.
NB.-syntax:
NB.+(Assumed_R)chl_proj(T)
NB.+Assumed_R = assumed development rations for the projection
NB.+T = table of claim numbers to be developed.
NB.-example:
NB.+ (Assumed_R)chl_proj(T1)
NB.+ (Assumed_R1)chl_proj(T1)
NB.+ (Assumed_R2)chl_proj(T1)
NB. ---------------------------------------------------------
chl_proj =: 4 : 0
Z =: # x
'R C' =: $ y
P0 =: cumm_sum_rows y
P1 =: _1 {"1 P0
R0 =: >R $ <x
R1 =: |. */\"1 rotate1 |. R0 * bottom_triR(R,Z)
R2 =: P1 * R1 
R3 =: (Z+1){."1  rotate1 P0,.R2
,.('Assumed_R';x),('R1';R1),('Projection';R3)
)


