NB. =========================================================
NB.%blackscholes.ijs - Black-Scholes option pricing models
NB.-<hr>
NB.-<a href="http://www.finexec.com.au" target="_blank">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_doc.html" target="_blank">Documentation | </a>
NB.-<a class="HREF" href="../../finexec_cat.html" target="_blank">Category | </a>
NB.-<a class="HREF" href="index.htm" target="_blank">Derivatives</a>
NB.-<hr>
NB.- Script: ~addons/finexec/finexec/options/blackscholes.ijs
NB.- Contributor: William Szuch
NB.- Updated: 6/8/2020
NB.- Depend: ~addon/stats/distribs/distribs.ijs
NB.- Definitions: loaded to locale: base 
NB.- Status: done:
NB.- <a href="../blackscholes.ijs" target="_blank">Script source: blackscholes.ijs</a>
NB.-<hr>
NB.- Black-Scholes option pricing models.
NB.- <img alt="NF" src="../eqs/blackscholes_ijs_eqs.gif">
NB.-<hr>


require '~addons/stats/distribs/distribs.ijs'


NB. =========================================================
NB.*bsNonDividend m -
NB.- Black-Scholes option pricing model for a non-dividend paying asset.
NB.- European option
NB.- Result is the Call and Put premiums.
NB.-syntax:
NB.+bsNonDividend(St;Sp;T;V:F) 
NB.+St = Strike price (ie: exercise price)
NB.+Sp = Spot price
NB.+T  = Time to expiry of the option as a proportion of a year(365 days)
NB.+V  = Annualised volatility
NB.+F  = Yearly force of interest rate (ie: continously compounding)         
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
NB.-syntax:
NB.+bsGKCurrencyOption(Sp;Sr;Fp;T;V;F)
NB.+St = Strike price (ie: exercise price)
NB.+Sp = Spot rate
NB.+Fp = Forward outright price
NB.+T  = Time to expiry of the option as a proportion of a year(365 days)
NB.+V  = Annualised volatility
NB.+F  = Yearly force of interest rate (ie: continously compounding)  
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