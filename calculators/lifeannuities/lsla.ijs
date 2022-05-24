NB. =========================================================
NB.%lsla.ijs - Last survivor life annuity calculator
NB.-<hr>
NB.-<a href="http://www.finexec.com.au" target="_blank">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_lib.html" target="_blank">Library | </a>
NB.-<a class="HREF" href="index.htm" target="_blank">Calculators</a>
NB.-<hr>
NB.- Script: ~addons/finance/finexec/calculators/lifeannuities/lsla.ijs
NB.- Contributor: William Szuch
NB.- Updated: 2022-05-20
NB.- Depend: ~addons/finance/finexec/qxtables/alt.ijs
NB.- Definitions: loaded to locale jla
NB.- Status: dev:
NB.- <a href="../lifeannuities/lsla.ijs" target="_blank">Script source: lsla.ijs</a>
NB.-<hr>
NB.- Last survivor life annuity  calculator
NB.-<pre>
NB.-Load and run:
NB.-load '~addons/finance/finexec/calculators/lifeannuities/lsla.ijs'
NB.-Once loaded run: lsla ''
NB.-</pre>
NB.-<hr>
NB.- Equations:
NB.-<hr>


require '~addons/finance/finexec/qxtables/alt.ijs'
('base';'z')copath('lsla')
coclass 'lsla'


NB. =========================================================
NOTE_A=: 0 : 0
The value of the last survivor life annuity is based on the:
"Australian Life Tables for Males and Females.

Annuity payments are annual $1 in arrears while att least one 
of the lives is a live and discounted by the yearly effective intrest rate. 
NB. Use the number 0.04 for 4.0%.

To recalculate - enter new data and click the <Recalculate> button.
)


NB. =========================================================
NB. Utilities
round =: [ * [: <. 0.5 + %~
NB. ---------------------------------------------------------
NB.(Qx;Qy;E)axLS(Agex;Agey)
NB. ---------------------------------------------------------
axyLS =: 4 : 0
ax =. ((+/)@:(([: ((*/)\) (1 - (] }. ([: (>@:(0&{)) [)))) * (([: % (1 + ([: (>@:(1&{)) [))) ^ (1 + ([: i. ([: # ([: ((*/)\) (1 - (] }. ([: (>@:(0&{)) [))))))))))"_ 0
'Qx Qy E' =. x
'Agex Agey' =. y
extend =. [ {. ] , (# {:)
Qxx =. Agex }. Qx
Qyy =. Agey }. Qy
T =. (#Qxx)>.(#Qyy)
Qxxx =. T extend Qxx
Qyyy =. T extend Qyy
Qxy =: Qxxx + Qyyy - (Qxxx*Qyyy)
Pxyn =. */\(1-Qxy)
D =. % (1+E)^1+i. (T)
Rxy =. +/ Pxyn * D
Rx =. (Qx;E)ax(Agex) 
Ry =. (Qy;E)ax(Agey) 
Rx + Ry - Rxy
)


NB. =========================================================
NB. Initial default values
N_Age1 =: ". Age1 =: '65'
N_Age2 =: ". Age2 =: '60'
N_Eff =: ". Eff =: '0.04'
Qx1 =: ALT_2004_06_F
Qx2 =: ALT_2004_06_M
Vx =: ": 0.01 round (Qx1;Qx2;N_Eff)axyLS(N_Age1;N_Age2)


NB. =========================================================
NB. Setting up the form
JLA =:  0  : 0
pc jla closeok;
pn "Last Survivor Life Annuity Calculator";
maxwh 50 20;cc About button;
line;

bin h;
minwh 140 20;cc Ages static;cn "Enter Integer Ages (0 to 99)";
minwh 30 20;cc Life1 static;cn "Life 1"; 
maxwh 20 20;cc A1 edit;set A1 intvalidator 0 99;
minwh 30 20;cc Life2 static;cn "Life 2"; 
maxwh 20 20;cc A2 edit;set A1 intvalidator 0 99;
bin sz;

bin h;
minwh 180 20;cc YER static;cn "Enter Yearly Effective Interest Rate";
maxwh 30 20;cc Ef edit;
bin sz;

cc SelT static;cn "Select Mortality Table";
minwh 350 20;cc MT1 combobox;
minwh 350 20;cc MT2 combobox;
line;

cc Recalculate button; 
set Recalculate stylesheet background-color:#bbbbbb; 
line;

bin h;
minwh 140 20;cc VAL static;cn "Value of Joint Life Annuity ";
maxwh 100 20;cc V static;
set V stylesheet background-color:white;
bin sz;

pas 6 6;
pcenter;pshow;
)


NB. =========================================================
NB. Initializing the form
jla =: 3 : 0
wd JLA
NB. ---------------------------------------------------------
wd 'set A1 text *', Age1
wd 'set A2 text *', Age2

wd 'set Ef text *', Eff
wd 'set MT1 items *',Qx_ALT
wd 'set MT1 select 22'

wd 'set MT2 items *',Qx_ALT
wd 'set MT2 select 23'

NB. ---------------------------------------------------------
wd 'set V text *',Vx
NB. ---------------------------------------------------------
wd 'pshow'
)


NB. =========================================================
jla_About_button =: 3 : 0
wdinfo 'About';NOTE_A
)


NB. =========================================================
jla_Recalculate_button =: 3 : 0
N_Age1 =: ". A1 
N_Age2 =: ". A2
N_Eff  =: ". Ef
NB. ---------------------------------------------------------
Qx1 =: ". > 0{cut MT1
Qx2 =: ". > 0{cut MT2
NB. ---------------------------------------------------------
Vx =: ": 0.01 round (Qx1;Qx2;N_Eff)axyLS(N_Age1;N_Age2)
wd 'set V text *',Vx
NB. ---------------------------------------------------------
wd 'pshow'
)


NB. =========================================================
jla_z_ =: jla_jla_
jla ''


