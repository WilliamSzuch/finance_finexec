NB.%phra12.ijs - J Phrases Section 12A. Finance
NB.-<script src="../js/jphrases_links.js"></script>
NB.-<a href="../phra12.ijs" target="_blank">Script source: phra12.ijs</a>
NB.-<hr>


d0=: %@>:@(] % 100"_) #. |.@[       NB. Present value flows x at y%
d1=: >:@(] % 100"_) #. [            NB. Future value of flows x at interest rate y
d2=: ([: >: [ % 100"_) ^/ ]         NB. Amount of 1 at x% for y periods
d3=: 13 : '|: y.%-.(>:y.) ^/ -x.'   NB. Annuity coefficient: periods x at rate y
d4=: [ d3 [: m5 ]                   NB. Annuity coefficient: periods x at  y %
m5=: 0.01&*                         NB. Rate from percent
m6=: 100&*                          NB. Percent from rate
d7=: <: @ ((^%)~ >:)                NB. Modal rate from annual rate
d8=: stretch=: [ $ ] , ($ ,: @ {:)  NB. Stretch y to length x
d9=: */\ @ (1&,) @ (stretch >:)     NB. Accumulate at y for period x
m10=: (% {.) @ (|.@(+/\)@i.@>:)     NB. Outstanding balances on rule of 78
m11=: }.%}:                         NB. Rate of change from amounts
m12=: 2&((%~)/\)                    NB. Rate of change from amounts
d13=:4 :'r*+/\y.%r=:*/\1,x.$~<:#y.' NB. Accumulate deposits y at x
d14=: [+2: -/\ [: >./\ 0:,[: +/\ -  NB. Work done; x=capacity, y=demand
