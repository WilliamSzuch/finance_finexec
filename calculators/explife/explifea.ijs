NB. =========================================================
NB.%explifea.ijs - Single and Joint Expectation of life calculator
NB.-<hr>
NB.-<a href="http://www.finexec.com.au" target="_blank">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_doc.html" target="_blank">Documentation | </a>
NB.-<a class="HREF" href="../../finexec_cat.html" target="_blank">Category | </a>
NB.-<a class="HREF" href="index.htm" target="_blank">Calculators</a>
NB.-<hr>
NB.- Script: ~addons/finance/finexec/calculators/explife/explifea.ijs
NB.- Contributor: William Szuch
NB.- Updated: 9/6/2021
NB.- Depend: ~addons/finance/finexec/qxtables/alt.ijs
NB.- Definitions: loaded to locale explife
NB.- Status: dev:
NB.- <a href="../explife/explifea.ijs" target="_blank">Script source: explifea.ijs</a>
NB.-<hr>
NB.- Single and Joint Expectation of life calculator
NB.-<pre>
NB.-load '~addons/finance/finexec/calculators/explife/explifea.ijs'
NB.-Once loaded run: explifea '' 
NB.-</pre>
NB.-<hr>
NB.- Equations:
NB.-<hr>


require '~addons/finance/finexec/qxtables/alt.ijs'
('base';'z')copath('explifea')
coclass 'explifea'


NB. =========================================================
NOTE_A=: 0 : 0
Expectation of Life calculations are based on the:
"Australian Life Tables for Males and Females.

The "Expectation of Life" for a single life is the average 
number of years that a life is expected to survive from the date of calculation.

The "Joint Expectaion of Life" is the average number of years that
the two lives are expected to survive together from the date of calculation.

The "Last Survivor Expectation of Life" is the average number
of years of at last of the two lives being alive from the date of calculation.
explife ''

To recalculate - enter new data and press the <Recalculate> button.
)


NB. =========================================================
NB. Utilities
round =: [ * [: <. 0.5 + %~

NB. ---------------------------------------------------------
NB. (Qx)ex(Age)
ex =: (0.5 + +/@:(*/\@:(1 - ] }. [: ([ , 5 # {:) [)))"_ 0

NB. ---------------------------------------------------------
NB. From  lifetable_multiplelives.ijs
jexp =: 4 : 0
Qx1 =. >0{x
Qx2 =. >1{x
A1 =.  >0{y
A2 =.  >1{y
NB. ---------------------------------------------------------
Q1 =. 1-A1}.Qx1
Q2 =. 1-A2}.Qx2
NB. ---------------------------------------------------------
T =. (#Q1)>.(#Q2)
extendr =. ([ {. (] , (# {:))) NB. extend right argument
Q1z =. T extendr Q1
Q2z =. T extendr Q2
NB. ---------------------------------------------------------
+/ */\Q1z*Q2z
)

NB. ---------------------------------------------------------
NB. From  lifetable_multiplelives.ijs
lsexp =:  4 : 0
exz =. (0.5 + +/@:(*/\@:(1 - ] }. [)))"_ 0 NB. From lifetables.ijs
Qx1 =. >0{x
Qx2 =. >1{x
A1 =.  >0{y
A2 =.  >1{y
NB. ---------------------------------------------------------
Q1 =. 1-A1}.Qx1
Q2 =. 1-A2}.Qx2
NB. ---------------------------------------------------------
T =. (#Q1)>.(#Q2)
extendr =. ([ {. (] , (# {:))) NB. extend right argument
Q1z =. T extendr Q1
Q2z =. T extendr Q2
((Qx1)exz(A1)) + ((Qx2)exz(A2)) - (Qx1;Qx2)jexp(A1;A2)
)



NB. =========================================================
NB. Initial default values
N_Age1 =: ". Age1 =: '70'
N_Age2 =: ". Age2 =: '68'

Exp1 =: ": 0.1 round ALT_2004_06_M ex N_Age1
Exp2 =: ": 0.1 round ALT_2004_06_F ex N_Age2

Jexp =: ": 0.1 round (ALT_2004_06_M;ALT_2004_06_F)jexp(N_Age1;N_Age2)
Lexp =: ": 0.1 round (ALT_2004_06_M;ALT_2004_06_F)lsexp(N_Age1;N_Age2)



NB. =========================================================
NB. Setting up the form
EXPLIFEA =:  0 : 0
pc explifea closeok;
pn "Expectation of Life Calculator";
maxwh 50 20;cc About button;
line;

cc S0 static;cn Enter Integer Ages (0 to 99);

bin h;
cc S1 static;cn "Life 1";
maxwh 20 20;cc E0 edit;set E0 intvalidator 0 99;
cc S1a static;cn "Life 2";
maxwh 20 20;cc E1 edit;set E1 intvalidator 0 99;
bin sz;

cc S2 static;cn "Select Mortality Table";
bin h;
cc S2a static;cn "Life 1";
minwh 350 20;cc C0 combobox;
bin sz;

bin h;
cc S3 static;cn "Life 2";
minwh 350 20;cc C1 combobox;
bin sz;

cc Recalculate button; 
line;

bin h;
minwh 95 20;cc S4 static;cn "Expectation of Life: "; 
cc S4a static;cn "Life 1";
cc S5 static;set S5 stylesheet background-color:white;
cc S6 static;cn "Life 2";
cc S7 static;set S7 stylesheet background-color:white;
bin sz;


line;
bin h;
minwh 120 20;cc S8 static;cn "Joint Expectation of Life";
cc S9 static;set S9 stylesheet background-color:white;
bin sz;

bin h;
minwh 165 20;cc S10 static;cn "Last Survivor Expectation of Life";
cc S11 static;set S11 stylesheet background-color:white;
bin sz;

pas 6 6;
pcenter;pshow;
)


NB. =========================================================
NB. Initializing the form
explifea =: 3 : 0
wd  EXPLIFEA
wd 'set E0 text *', Age1
wd 'set E1 text *', Age2
NB. ---------------------------------------------------------
wd 'set C0 items *',Qx_ALT
wd 'set C0 select 23'
wd 'set C1 items *',Qx_ALT
wd 'set C1 select 22'
NB. ---------------------------------------------------------
wd 'set S5 text *',Exp1
wd 'set S7 text *',Exp2
NB. ---------------------------------------------------------
wd 'set S9 text *',Jexp
wd 'set S11 text *',Lexp
NB. ---------------------------------------------------------
wd 'pshow'
)


NB. =========================================================
explifea_About_button =: 3 : 0
wdinfo 'About';NOTE_A
)


NB. =========================================================
explifea_Recalculate_button =: 3 : 0
wd 'set E0 text *',E0
wd 'set E1 text *',E1
N_Age1 =: ". E0 
N_Age2 =: ". E1 
NB. ---------------------------------------------------------
Q1 =: ". > 0{cut C0
Q2 =: ". > 0{cut C1
Exp1 =: ": 0.1 round Q1 ex N_Age1
Exp2 =: ": 0.1 round Q2 ex N_Age2
wd 'set S5 text *',Exp1
wd 'set S7 text *',Exp2
NB. ---------------------------------------------------------
Jexp =: ": 0.1 round (Q1;Q2)jexp(N_Age1;N_Age2)
Lexp =: ": 0.1 round (Q1;Q2)lsexp(N_Age1;N_Age2)
wd 'set S9 text *',Jexp
wd 'set S11 text *',Lexp
wd 'pshow'
)


NB. =========================================================
explifea_z_ =: explifea_explifea_
explifea ''


