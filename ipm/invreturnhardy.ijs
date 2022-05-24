NB. =========================================================
NB.%invreturnhardy.ijs - Investment return using Hardy's method
NB.-<hr>
NB.-<a href="http://www.finexec.com.au">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_lib.html">Library | </a>
NB.-<a class="HREF" href="index.htm">Investment Performamce</a>
NB.-<hr>
NB.- Script: ~addons/finance/finexec/ipm/inreturnhardy.ijs
NB.- Contributor: William Szuch
NB.- Updated: 2022-05-22
NB.- Depend:nil
NB.- Definitions: loaded to locale base 
NB.- Status: done:
NB.- <a href="../invreturnhardy.ijs" target="_blank">Script source: invreturnhardy.ijs</a>
NB.-<hr>
NB.- Definition to calculate the investment return for a time unit using Hardy's 
NB.- method 
NB.- Equations:
NB.- <img alt="NF" src="../eqs/invreturnhardy_ijs.gif"> 
NB.-<hr>


NB. =========================================================
NB.*invReturnHardy m - 
NB.- <b>Form:</b> explicit
NB.- Calculate the rate of investmnet return using Hardy's
NB.- approximation formula over one time unit.
NB.-syntax:
NB.+  invReturnHardy(Vb;Ve;I)
NB.+Vb = value of assets at beginning of time unit including accruals
NB.+Ve = value of assets at end of time unit including accurals
NB.+I  = investment income over the time unit including
NB.      capital gains and losses 
NB.-example:
NB.+   invReturnHardy(100;120;20)
NB.+0.2
NB.-
NB.+   invReturnHardy(100;120;10)
NB.+0.0952381
NB.-
NB.+   invReturnHardy(100;120;0)
NB.+0
NB.-
NB.+   invReturnHardy(100;120;30)
NB.+0.315789
NB-
NB.+  invReturnHardy(100;90;10)
NB.+0.111111
NB. ---------------------------------------------------------
invReturnHardy =: 3 : 0
'Vb Ve I' =. y
2*I % Vb + Ve - I
)


NB. =========================================================
NB.*invReturnHardy_T m Tacit form of invReturnHardy
NB. ---------------------------------------------------------
invReturnHardy_T =: 2 * ([: > 2 { ]) % ([: > 0 { ]) + ([: > 1 { ]) - [: > 2 { ]
NB. ---------------------------------------------------------
Note 'T invReturnHardy_T' 
invReturnHardy_T=. 13 : '2*(>2{y) % (>0{y)+(>1{y)-(>2{y)'
)