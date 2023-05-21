NB. =========================================================
NB.%sla.ijs - Single life annuity calculator
NB.-<hr>
NB.-<a href="http://www.finexec.com.au" target="_blank">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_lib.html" target="_blank">Library | </a>
NB.-<a class="HREF" href="index.htm" target="_blank">Calculators</a>
NB.-<hr>
NB.- Script: ~addons/finance/finexec/calculators/lifeannuities/sla.ijs
NB.- Contributor: William Szuch
NB.- Updated: 2022 8 4
NB.- Depend: ~addons/finance/finexec/qxtables/alt.ijs
NB.- Definitions: loaded to locale singlelifeannuity
NB.- Status: dev
NB.- <a href="../lifeannuities/sla.ijs" target="_blank">Script source: singlelifeannuity.ijs</a>
NB.-<hr>
NB.- Single life annuity  calculator
NB.-<pre>
NB.-Load and run:
NB.-load '~addons/finance/finexec/calculators/lifeannuities/sla.ijs'
NB.-Once loaded run: sla '' 
NB.-</pre>
NB.-<hr>
NB.- Equations:
NB.-<hr>


require '~addons/finance/finexec/qxtables/alt.ijs'
('base';'z')copath('sla')
coclass 'sla'


NB. =========================================================
NOTE_A=: 0 : 0
The value of the single life annuity is based on the:
"Australian Life Tables for Males and Females.

Annuity payments are annual $1 in arrears for life and
discounted by the yearly effective intrest rate. 
NB. Use the number 0.04 for 4.0%.

To recalculate - enter new data and click the <Recalculate> button.
)


NB. =========================================================
NB. Utilities
round =: [ * [: <. 0.5 + %~
NB. ---------------------------------------------------------
NB. (Qx;E)ax(Age)
ax =: ((+/)@:(([: ((*/)\) (1 - (] }. ([: (>@:(0&{)) [)))) * (([: % (1 + ([: (>@:(1&{)) [))) ^ (1 + ([: i. ([: # ([: ((*/)\) (1 - (] }. ([: (>@:(0&{)) [))))))))))"_ 0


NB. =========================================================
NB. Initial default values
N_Age =: ". Age =: '65'
N_Eff =: ". Eff =: '0.04'
Qx =: ALT_2004_06_F
Vx =: ": 0.01 round (Qx;N_Eff)ax(N_Age)


NB. =========================================================
NB. Setting up the form
SLA =:  0  : 0
pc sla closeok;
pn "Single Life Annuity Calculator";
maxwh 50 20;cc About button;
line;

bin h;
minwh 140 20;cc S0 static;cn "Enter Integer Age (0 to 99)";
maxwh 20 20;cc E0 edit;set E0 intvalidator 0 99;
bin sz;

bin h;
minwh 180 20;cc S0 static;cn "Enter Yearly Effective Interest Rate";
maxwh 30 20;cc E0a edit;
bin sz;

cc S1 static;cn "Select Mortality Table";
minwh 350 20;cc C0 combobox;
line;

cc Recalculate button; 
set Recalculate stylesheet background-color:#bbbbbb; 
line;

bin h;
minwh 140 20;cc S2 static;cn "Value of Single Life Annuity ";
maxwh 100 20;cc S3 static;
set S3 stylesheet background-color:white;
bin sz;

pcenter;pshow;
)


NB. =========================================================
NB. Initializing the form
sla =: 3 : 0
wd  SLA
NB. ---------------------------------------------------------
wd 'set E0 text *', Age
wd 'set E0a text *', Eff
wd 'set C0 items *',Qx_ALT
wd 'set C0 select 22'
NB. ---------------------------------------------------------
wd 'set S3 text *',Vx
NB. ---------------------------------------------------------
wd 'pshow'
)


NB. =========================================================
sla_About_button =: 3 : 0
wdinfo 'About';NOTE_A
)


NB. =========================================================
sla_Recalculate_button =: 3 : 0
N_Age =: ". E0
N_Eff =: ". E0a
NB. ---------------------------------------------------------
Qx  =: ". > 0{cut C0
Vx =: ": 0.01 round (Qx;N_Eff)ax(N_Age)
wd 'set S3 text *',Vx
NB. ---------------------------------------------------------
wd 'pshow'
)


NB. =========================================================
sla_z_ =: sla_sla_

sla ''


