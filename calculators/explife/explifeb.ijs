NB. =========================================================
NB.%explifeb.ijs - Expectation of life calculator
NB.-<hr>
NB.-<a href="http://www.finexec.com.au" target="_blank">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_lib.html" target="_blank">Library | </a>
NB.-<a class="HREF" href="index.htm" target="_blank">Calculators</a>
NB.-<hr>
NB.- Script: ~addons/finance/finexec/calculators/explifeb.ijs
NB.- Contributor: William Szuch
NB.- Updated: 2022-05-20
NB.- Depend: ~addons/finance/finexec/qxtables/alt.ijs
NB.- Definitions: loaded to locale explife
NB.- Status: dev:
NB.- <a href="../explife/explifeb.ijs" target="_blank">Script source: explifeb.ijs</a>
NB.-<hr>
NB.- Expectation of life calculator
NB.-<pre>
NB.-Load and run:
NB.-load '~addons/finance/finexec/calculators/explife/explifeb.ijs'
NB.-Once loaded run: explifeb '' 
NB.-</pre>
NB.-<hr>
NB.- Equations:
NB.-<hr>


require '~addons/finance/finexec/qxtables/qxtools.ijs'
require '~addons/finance/finexec/actuariallife/lifetable.ijs'
('base';'z')copath('explifeb')
coclass 'explifeb'


NB. =========================================================
NOTE_A=: 0 : 0
Expectation of Life calculations are based on the:
"Australian Life Tables for Males and Females.

The "Expectation of Life" for a single life is the average 
number of years that a life is expected to survive from the date of calculation.

To recalculate - enter new data and click the <Recalculate> button.
)


NB. =========================================================
NB. Utilities
round =: [ * [: <. 0.5 + %~
NB. ---------------------------------------------------------
NB. (Qx)ex(Age)
ex =: (0.5 + +/@:(*/\@:(1 - ] }. [: ([ , 5 # {:) [)))"_ 0


NB. =========================================================
NB. Initial default values
N_Age =: ". Age =: '65'
Qx =: ALT_2004_06_F
Exp =: ": 0.1 round Qx ex N_Age

N_A1 =: ". A1 =: '10'
N_A2 =: ". A2 =: '65' 

NB. =========================================================
NB. Setting up the form
EXPLIFEB =:  0  : 0
pc explifeb closeok;
pn "Expectation of Life Calculator";
maxwh 50 20;cc About button;
line;

bin h;
minwh 140 20;cc S0 static;cn "Enter Integer Age (0 to 99)";
maxwh 20 20;cc E0 edit;set E0 intvalidator 0 99;
bin sz;

cc S1 static;cn "Select Mortality Table";
minwh 350 20;cc C0 combobox;
line;

cc Recalculate button; 
set Recalculate stylesheet background-color:#bbbbbb; 
line;

bin h;
cc S2 static;cn "Expectation of Life ";
maxwh 25 20;cc S3 static;
set S3 stylesheet background-color:white;
bin sz;
line;

bin h;
minwh 165 20; cc S4 static;cn "Plot Mortality Table: Age Range "; 
maxwh 20 20;cc E1 edit;
cc S5 static;cn " to ";
maxwh 20 20;cc E2 edit;
bin sz;
cc MortalityTable button;cn "Plot Mortality Table";
line;

cc PDF button;cn "Plot Probability Density Function (PDF) of Expectation of Life";
cc CDF button;cn "Plot Cummulative Density Function (CDF) of Expectation of Life";


pas 6 6;
pcenter;pshow;
)


NB. =========================================================
NB. Initializing the form
explifeb =: 3 : 0
wd  EXPLIFEB
NB. ---------------------------------------------------------
wd 'set E0 text *', Age
wd 'set C0 items *',Qx_ALT
wd 'set C0 select 22'
NB. ---------------------------------------------------------
wd 'set S3 text *',Exp
NB. ---------------------------------------------------------
wd 'set E1 text *',A1
wd 'set E2 text *',A2
wd 'pshow'
)


NB. =========================================================
explifeb_About_button =: 3 : 0
wdinfo 'About';NOTE_A
)


NB. =========================================================
explifeb_Recalculate_button =: 3 : 0
wd 'set E0 text *',E0
N_Age =: ". E0
NB. ---------------------------------------------------------
Qx  =: ". > 0{cut C0
Exp =: ": 0.1 round Qx ex N_Age
wd 'set S3 text *',Exp
NB. ---------------------------------------------------------
wd 'pshow'
)


NB. =========================================================
explifeb_MortalityTable_button =: 3 : 0
N_A1 =: ". E1
N_A2 =: ". E2
(0{ cut C0)plotzQx(N_A1,N_A2) 
)


NB. =========================================================
explifeb_PDF_button =: 3 : 0
N_Age =: ". E0
(". >0{ cut C0)plotdistDurLife(N_Age)
)


NB. =========================================================
explifeb_CDF_button =: 3 : 0
N_Age =: ". E0
(". >0{ cut C0)plotdistDurLife(N_Age;1)
)


NB. =========================================================
explifeb_z_ =: explifeb_explifeb_
explifeb ''


