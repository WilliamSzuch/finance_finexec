NB. =========================================================
NB.%blackscholes.ijs - Black-Scholes option pricing models
NB.- Script: ~addons/finexec/finexec/options/blackscholes.ijs
NB.- Contributor: William Szuch
NB.- Updated: 30/1/2020
NB.- Depend: ~addon/stats/distribs/distribs.ijs
NB.- Definitions: loaded to locale: base 
NB.-<hr>
NB.- <a class="HREF" href="index.htm" target="_blank">Category: Options</a>
NB.- <a class="HREF" href="../../finexec_category.html" target="_blank">Finexec: Category</a>
NB.-<hr>
NB.- Black-Scholes option pricing models.
NB.- Equations to be added.
NB.- <a href="../eqs/blackscholes_ijs_eqs.html" target="_blank">Script equations: blackscholes.ijs To Do</a>
NB.- <a href="../blackscholes.ijs" target="_blank">Script source: blacksholes.ijs</a>
NB.-<hr>


require '~addons/stats/distribs/distribs.ijs'


NB. =========================================================
NB.*bsNonDividend m -
NB.- Black-Scholes option pricing model for a non-dividend paying asset.
NB.- European option
NB.- Result is the Call and Put premiums.
NB.- <a href="../eqs/bsNonDividend_eq.html" target="_blank">Equation: bsNonDividendr(St;Sp;T;V:F) To Do</a>
NB.-syntax:
NB.+bsNonDividend(St;Sp;T;V:F) 
NB.+St = strike price (ie: exercise price)
NB.+Sp = spot price
NB.+T  = time to expiry of the option as a proportion of a year(365 days)
NB.+V  = annualised volatility
NB.+F  = yearly force of interest rate (ie: continously compounding)         
NB.-example:
NB.+   bsNonDividend(1.004;1.0;0.25;0.0298;0.0598505)
NB.+0.0129008 0.00199015
NB.-
NB.+   bsNonDividend(40;42;0.5;0.2;0.10)
NB.+4.75942 0.808599
NB. ---------------------------------------------------------
bsNonDividend =: 3 : 0
'St Sp T V F' =: y
E =. ^ F*T 
E1 =. ^ -F*T 
E2 =. ^.(Sp*E)%St
E3 =. (T* *:V)%2
E4 =. V* %:T
D1 =. (E2 + E3)%E4
D2 =. (E2 - E3)%E4
CallPremium =.  (Sp*pnorm(D1))   - (St*pnorm(D2))*E1
PutPremium  =.  (-Sp*pnorm(-D1)) + (St*pnorm(-D2))*E1
CallPremium,PutPremium
)


NB. =========================================================
NB.*bsGKCurrencyOption m -
NB.- Black-Scholes/Garman-Kohlhagen currency option pricing model.
NB.- Result is the Call and Put premiums.
NB.- <a href="../equations/bsGKCurrencyOption_eq.html" target="_blank">Equation: bsGKCurrencyOption(Sp;Sr;Fp;T;V;F) Yo Do</a>
NB.-syntax:
NB.+bsGKCurrencyOption(Sp;Sr;Fp;T;V;F)
NB.+St = strike price (ie: exercise price)
NB.+Sp = spot rate
NB.+Fp = forward outright price
NB.+T  = time to expiry of the option as a proportion of a year(365 days)
NB.+V  = annualised volatility
NB.+F  = yearly force of interest rate (ie: continously compounding)  
NB.-example:
NB.+   bsGKCurrencyOption(1.19;1.20;1.21;(91%365);0.09;0.0654)
NB.+   0.0324408 0.0127642
NB. ---------------------------------------------------------
bsGKCurrencyOption =: 3 : 0
'St Sp Fp T V F' =: y
E  =. ^.Fp%St
E1 =. (T* *:V)%2
E2 =. V*%:T
E3 =. ^ -F*T 
D1 =. (E + E1)%E2
D2 =. (E - E1)%E2
CallPremium =.  ((Fp*pnorm(D1))-(St*pnorm(D2)))*E3
PutPremium  =. ((-Fp*pnorm(-D1))+(St*pnorm(-D2)))*E3
CallPremium,PutPremium
)