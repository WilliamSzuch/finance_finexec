NB. =========================================================
NB.%invreturnhardy.ijs - Investment return using Hardy's method
NB.- Script: ~addons/finance/finexec/ipm/inreturnhardy.ijs
NB.- Contributor: William Szuch
NB.- Updated: 1/2/2020
NB.- Depend:nil
NB.- Definitions: loaded to locale base 
NB.-<hr>
NB.- <a class="HREF" href="index.htm" target="_blank">Category: Basic Finance</a>
NB.- <a class="HREF" href="../../finexec_category.html" target="_blank">Finexec: Category</a>
NB.-<hr>
NB.- Definition to Calculate the investment return for a time unit using Hardy's 
NB.- method 
NB.- <a href="../eqs/invreturnhardy_ijs_eqs.html" target="_blank">Script equations: invreturnhardy.ijs</a> 
NB.- <a href="../invreturnhardy.ijs" target="_blank">Script source: invreturnhardy.ijs</a>  
NB.-<hr>


NB. =========================================================
NB.*invReturnHardy m - 
NB.- <b>Form:</b> explicit
NB.- Calculate the rate of investmnet return using Hardy's
NB.- approximation formula over one time unit.
NB.- <a href="../eqs/invreturnhardy_eq.html" target="_blank">Equation: invReturnHardy(Vb;Ve;I)</a>
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