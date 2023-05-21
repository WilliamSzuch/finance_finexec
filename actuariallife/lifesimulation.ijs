NB. =========================================================
NB.%lifesimulation.ijs - Simulation of life and payments (Stochastic)
NB.-<script src="../js/actuariallife_links.js"></script>
NB.- Script: ~addons/finance/finexec/actuariallife/lifesimulation.ijs
NB.- Contributor: William Szuch
NB.- Updated: 2022 6 25
NB.- Depend: ~addons/finance/finexec/qxtables/qxtools.ijs'
NB.- Definitions: loaded to locale base
NB.- Status: todo equations
NB.- <a href="../lifesimulation.ijs" target="_blank">Script source: lifesimulation.ijs</a>
NB.-<hr>
NB.- Definitions to stochastically calculate distributions for:
NB.-  1) duration of life
NB.-  2) payments 
NB.-<hr>
NB.- Note:
NB.- (1) Dealing with Ages outside the range of the mortality table.
NB.- (2) Dealing with qx>1 if Qx table is scaled up.
NB.- use of ext5 
NB.-<hr>
NB.- Equations:
NB.- Not done 
NB.- <img alt="NF" src="../eqs/stochastic_ijs.gif"></a>
NB.-<hr>


require '~addons/finance/finexec/qxtables/qxtools.ijs'
require '~addons/finance/finexec/actuariallife/lifetable.ijs'
require '~addons/finance/finexec/toolbox/plots.ijs'


NB. =========================================================
Note 'Utilities'
freqcount=. (\: {:"1)@(~. ,. #/.~)
rand01=: ?@$ 0:    NB. generate y random numbers in interval (0,1)
)


NB. =========================================================
NB.*yrs_lifec d -
NB. Comlpete years of life
NB. ALT_2018_20_M yrs_lifec 55
NB. ALT_2018_20_M yrs_lifec 0
NB. ---------------------------------------------------------
yrs_lifec =: 4 : 0
rand01=. ?@$ 0:
Qx =. y}. x
RND =. rand01 # QX
S1 =. (*/\-. QX > RND)
S1 # S1
)


NB. =========================================================
NB.*yrs_life d -
NB. Years of life
NB. ALT_2018_20_M yrs_life 55
NB. ALT_2018_20_M yrs_life 0
NB. ---------------------------------------------------------
yrs_life =: 4 : 0
rand01=. ?@$ 0:
Qx =. y}. x
RND =. rand01 # QX
S1 =. (*/\-. QX > RND)
(S1 # S1),0.5
)


NB. =========================================================
NB.*dist_yrs_life d -
NB.- ALT_2018_20_M dist_yrs_life 55
NB.- ALT_2018_20_M dist_yrs_life 0
NB.- (ALT_2018_20_M   qxextend 5) dist_yrs_life 55
NB. ---------------------------------------------------------
dist_yrs_life =: 4 : 0
freqcount=. (\: {:"1)@(~. ,. #/.~)
S =. 100000 # <y
Y =. >+/ each x&yrs_life each S
F =. |: sort freqcount Y
plotm (0{F);(1{F)
plotm (0{F);(+/\1{F)
)


NB. =========================================================
NB.*yrs_death d -
NB.- Year of death
NB.- ALT_2018_20_M yr_death 55
NB.- ALT_2018_20_M yr_death 0
NB. ---------------------------------------------------------
yrs_death =: 4 : 0
rand01=. ?@$ 0:
Qx =. y}. x
RND =. rand01 # QX
S1 =.  (*/\-. QX > RND)
(-.S1 # S1),1
)


NB. =========================================================
NB.*yr_of_death d -
NB.- Year of death
NB.- ALT_2018_20_M yr_of_death 55
NB.- ALT_2018_20_M yr_of_death 0
NB. ---------------------------------------------------------
yr_of_death =: 4 : 0
rand01=. ?@$ 0:
Qx =. y}. x
RND =. rand01 # QX
S1 =.  (*/\-. QX > RND)
(+/S1 # S1)
)



NB. =========================================================
NB.*dist_yr_of_death d -
NB.- Distribution of year of death
NB.- ALT_2018_20_M dist_yr_of_death 55
NB.- ALT_2018_20_M dist yr_death 0
NB. ---------------------------------------------------------
dist_yr_of_death =: 4 : 0
freqcount=. (\: {:"1)@(~. ,. #/.~)
S =. 100000 # <y
Y =. >+/ each x&yr_of_death each S
F =. |: sort freqcount Y
plotm (0{F);(1{F)
plotm (0{F);(+/\1{F)
)





NB. =========================================================
NB.*yrs_life_death d -
NB.- ALT_2018_20_M yrs_life_death 55
NB.- ALT_2018_20_M yrs_life_death 55
NB. ---------------------------------------------------------
yrs_life_death =: 4 : 0
rand01=. ?@$ 0:
Qx =. y}. x
RND =. rand01 # QX
S1 =. (*/\-. QX > RND)
S2 =. S1#S1
(S2,0),:(-.S2,0)
)


 