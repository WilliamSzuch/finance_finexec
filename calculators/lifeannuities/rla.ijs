NB. =========================================================
NB.%rla.ijs - Reversioary life annuity calculator
NB.-<hr>
NB.-<a href="http://www.finexec.com.au" target="_blank">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_lib.html" target="_blank">Library | </a>
NB.-<a class="HREF" href="index.htm" target="_blank">Calculators</a>
NB.-<hr>
NB.- Script: ~addons/finance/finexec/calculators/lifeannuities/rla.ijs
NB.- Contributor: William Szuch
NB.- Updated: 2022-05-20
NB.- Depend: ~addons/finance/finexec/qxtables/alt.ijs
NB.- Definitions: loaded to locale rla
NB.- Status: dev:
NB.- <a href="../lifeannuities/rla.ijs" target="_blank">Script source: rla.ijs</a>
NB.-<hr>
NB.- Reversionary life annuity  calculator
NB.-<pre>
NB.-Load and run:
NB.-load '~addons/finance/finexec/calculators/lifeannuities/rla.ijs'
NB.-Once loaded run: rla '' 
NB.-</pre>
NB.-<hr>
NB.- Equations:
NB.-<hr>


require '~addons/finance/finexec/qxtables/alt.ijs'
('base';'z')copath('rla')
coclass 'rla'


NB. =========================================================
NOTE_A=: 0 : 0
The value of the reversionary life annuity is based on the:
"Australian Life Tables for Males and Females.

???
NB.- Reversionary annuity - payable on the life of x 
NB.- then a percentage to the life y if life y survives life x.
NB.- Payments yearly in arresrs.


Annuity payments are annual $1 in arrears while both lives
are a live and discounted by the yearly effective intrest rate. 
NB. Use the number 0.04 for 4.0%.

To recalculate - enter new data and click the <Recalculate> button.
)


NB. =========================================================
NB. Utilities
round =: [ * [: <. 0.5 + %~
NB. ---------------------------------------------------------
NB. (Qx;Qy;E)axLS(P:Agex;Agey)
NB. ---------------------------------------------------------
axyR =: 4 : 0
ax =. ((+/)@:(([: ((*/)\) (1 - (] }. ([: (>@:(0&{)) [)))) * (([: % (1 + ([: (>@:(1&{)) [))) ^ (1 + ([: i. ([: # ([: ((*/)\) (1 - (] }. ([: (>@:(0&{)) [))))))))))"_ 0
'Qx Qy E' =. x
'P Agex Agey' =. y
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
Rx + P*(Ry - Rxy)
)


NB. =========================================================
NB. Initial default values
N_P    =: ". Pr =: '0.6'
N_Age1 =: ". Age1 =: '65'
N_Age2 =: ". Age2 =: '60'
N_Eff =: ". Eff =: '0.04'
Qx1 =: ALT_2004_06_F
Qx2 =: ALT_2004_06_M
Vx =: ": 0.01 round (Qx1;Qx2;N_Eff)axyR(N_P;N_Age1;N_Age2)


NB. =========================================================
NB. Setting up the form
RLA =:  0  : 0
pc rla closeok;
pn "Joint Life Annuity Calculator";
maxwh 50 20;cc About button;
line;

bin h;
minwh 230 20;cc Prop static;cn "Proportion payable to Life 2 on death of Life 1"; 
maxwh 25 20;cc Pr edit;
bin sz;


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
rla =: 3 : 0
wd RLA
wd 'set Pr text *', Pr
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
rla_About_button =: 3 : 0
wdinfo 'About';NOTE_A
)


NB. =========================================================
rla_Recalculate_button =: 3 : 0
N_Age1 =: ". A1 
N_Age2 =: ". A2
N_Eff  =: ". Ef
N_P    =: ". Pr
NB. ---------------------------------------------------------
Qx1 =: ". > 0{cut MT1
Qx2 =: ". > 0{cut MT2
NB. ---------------------------------------------------------
Vx =: ": 0.01 round (Qx1;Qx2;N_Eff)axyR(N_P;N_Age1;N_Age2)
wd 'set V text *',Vx
NB. ---------------------------------------------------------
wd 'pshow'
)


NB. =========================================================
rla_z_ =: rla_jra_
rla ''


