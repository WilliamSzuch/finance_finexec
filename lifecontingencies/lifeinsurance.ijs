NB. =========================================================
NB.%lifeinsurance.ijs - Life issurance definitions
NB.-<hr>
NB.-<a class="HREF" href="../../finexec_addon.html" target="_blank">Addon</a>
NB.-<a class="HREF" href="../../finexec_category.html" target="_blank">Category</a>
NB.-<a class="HREF" href="index.htm" target="_blank">Life Contingencies</a>
NB.-<hr>
NB.- Script: ~addons/finance/finexec/lifecontingencies/lifeinsurance.ijs
NB.- Contributor: William Szuch
NB.- Updated: 31/7/2020
NB.- Depend: ~addons/finance/fp/qxtables/qxtables/qxtools.ijs'
NB.- Definitions: loaded to locale base
NB.- Status: todo: equations
NB.- <a href="../lifeinsurance.ijs" target="_blank">Script scource: lifeinsurance.ijs</a>
NB.-<hr>
NB.- Definitions to calculate life issurance factors for
NB.- single and multiple lives.
NB.- Qx tables loaded to the locale base
NB.- See: Qx_ALL for a list of names.
NB.- See: Qx_ALT for a list of Australian Life Tables.
NB.- All mortality tables start at age = 0.
NB.- <img alt="NF" src="../eqs/lifeinsurance_ijs_eqs.gif">
NB.-<hr>
NB.- (1) Extending Qx tables by 5 years. 
NB.- (2) Multiple lives
NB.- (3) Variable interest rates
NB.-<hr>


require '~addons/finance/finexec/qxtables/qxtools.ijs'


NB. =========================================================
Note 'Utilities'
arg0 =. >@:(0&{)               NB. 1st item in a boxed list
arg1 =. >@:(1&{)               NB. 2nd item in a boxed list
arg2 =. >@:(2&{)               NB. 3rd item in a boxed list
extendl =. (] {. ([ , (# {:))) NB. extend left argument
extendr =. ([ {. (] , (# {:))) NB. extend right argument
boxedtable =. <"1@:(>@:(0&{) ;"0/ >@:(1&{))
)


NB. =========================================================
NB.*asx d - 
NB.- <b>Form:</b> tacit
NB.- Calculate the value of a whole of life issurance for
NB.- a sum insured of one payable at the end of the  year death.
NB.- syntax:
NB.+(Qx;E)asx(Age)
NB.+Qx = name of Qx table starting at age = 0
NB.+E = yearly effective interest rate
NB.+Age = integer ages
NB.-example:
NB.+   (AL_49_52_M_ULT;0.05)asx(20) 
NB.+0.0966624
NB.-
NB.+   (AL_49_52_M_ULT;0.05)asx(20 40 60 80)
NB.+0.0966624 0.222605 0.472562 0.756022
NB. ---------------------------------------------------------
asx =: ((+/)@:(((] }. ([: (>@:(0&{)) [)) * ([: }: ([: ((*/)\) (1 , (1 - (] }. ([: (>@:(0&{)) [))))))) * (([: % (1 + ([: (>@:(1&{)) [))) ^ (1 + ([: i. ([: # ((] }. ([: (>@:(0&{)) [)) * ([: }: ([: ((*/)\) (1 , (1 - (] }. ([: (>@:(0&{)) [)))))))))))))"_ 0
NB. ---------------------------------------------------------
Note 'T asx'
arg0 =. >@:(0&{)               NB. 1st item in a boxed list
arg1 =. >@:(1&{)               NB. 2nd item in a boxed list
d0 =. [: }: ( [: */\  (1,(1 - ( ] }. ([: arg0 [)))))
d1 =. ( ] }. ([: arg0 [)) * d0
d2 =. ([: % (1+([: arg1 [ ))) ^  (1 + ([: i. ([: # d1)))
d3 =. (+/ @: (d1 * d2)) NB. one age
asx =. (d3"_ 0) f.
)


NB. =========================================================
NB.*asx_M m -
NB.- <b>Form:</b> tacit
NB.- Monadic form of asx.
NB.- Calculate the value of a whole of life issurance for
NB.- a sum insured of one payable at the end of the  year death.
NB.-syntax:
NB.+asx_M(Qx;Age;E) 
NB.+Qx = name of Qx table starting at age = 0
NB.+Age = integer ages
NB.+E = yearly effective interest rate
NB.-example:
NB.+   asx_M(AL_AM92_ULT;17;0.04)
NB.+0.10127
NB.-
NB.+    asx_M(AL_AM92_ULT;17 50 60 65;0.04)
NB.+0.10127 0.329072 0.456402 0.527864
NB. ---------------------------------------------------------
asx_M =: ((>@:(0&{)) ; (>@:(2&{))) (((+/)@:(((] }. ([: (>@:(0&{)) [)) * ([: }: ([: ((*/)\) (1 , (1 - (] }. ([: (>@:(0&{)) [))))))) * (([: % (1 + ([: (>@:(1&{)) [))) ^ (1 + ([: i. ([: # ((] }. ([: (>@:(0&{)) [)) * ([: }: ([: ((*/)\) (1 , (1 - (] }. ([: (>@:(0&{)) [)))))))))))))"_ 0) (>@:(1&{))
NB. =========================================================
Note 'T asx_M'
arg0 =. >@:(0&{)               NB. 1st item in a boxed list
arg1 =. >@:(1&{)               NB. 2nd item in a boxed list
arg2 =. >@:(2&{)               NB. 3rd item in a boxed list
asx =. ((+/)@:(((] }. ([: (>@:(0&{)) [)) * ([: }: ([: ((*/)\) (1 , (1 - (] }. ([: (>@:(0&{)) [))))))) * (([: % (1 + ([: (>@:(1&{)) [))) ^ (1 + ([: i. ([: # ((] }. ([: (>@:(0&{)) [)) * ([: }: ([: ((*/)\) (1 , (1 - (] }. ([: (>@:(0&{)) [)))))))))))))"_ 0
asx_M =. ((arg0;arg2) asx arg1) f. 
)


NB. =========================================================
NB.*asxn1 d - 
NB.- <b>Form:</b> tacit
NB.- Calculate the value of a term life issurance for
NB.- a sum insured of one payable at the end of the  year death.
NB.- (one life)
NB.- syntax:
NB.+(Qx;E)asx(Age;N)
NB.+Qx = name of Qx table starting at age = 0
NB.+E = yearly effective interest rate
NB.+Age = integer ages
NB.+N = term of insurance - integer years
NB.-example:
NB.+   (AL_49_52_M_ULT;0.05)asxn1(40;20) 
NB.+0.0671175
NB.-
NB.+   (AL_49_52_M_ULT;0.05)asxn1(20;40)
NB.+0.0394944
NB. ---------------------------------------------------------
asxn1 =: +/@:((([: % 1 + [: >@:(1&{) [) ^ 1 + [: i. [: >@:(1&{) ]) * }:@:(*/\@:(1 , 1 - ([: >@:(1&{) ]) {. ([: >@:(0&{) ]) }. [: >@:(0&{) [)) * ([: >@:(1&{) ]) {. ([: >@:(0&{) ]) }. [: >@:(0&{) [)
NB. ---------------------------------------------------------
Note 'T asxn1'
arg0 =. >@:(0&{)              
arg1 =. >@:(1&{)               
Age =. ([: arg0 ])
N =. ([: arg1 ])
Qx =.  ( Age }. ([: arg0 [))
Qxn =. ([: arg1 ]) {. Qx
Pxn  =. }: @:( */\  @: (1 , (1 - Qxn)))
E =. ([: % (1+([: arg1 [ )))
DISC =. ([: % (1+([: arg1 [ ))) ^  (1 + ([: i. N))
asxn1 =. (+/ @: (DISC * Pxn * Qxn)) f. 
)


NB. =========================================================
NB.*asxn d -
NB.- <b>Form:</b> explicit
NB.- Same as asxn1 but allow multiple lives and terms. 
NB.- Calculate the value of a term life issurance for
NB.- a sum insured of one payable at the end of the  year death.
NB.- syntax:
NB.+(Qx;E)asxn(Age;N)
NB.+Qx = name of Qx table starting at age = 0
NB.+E = yearly effective interest rate
NB.+Age = integer ages
NB.+N = term of insurance - integer years
NB.-example:
NB.+   (AL_49_52_M_ULT;0.05)asxn(20;40) 
NB.+0.0394944
NB.-
NB.+   (AL_AM92_ULT;0.05)asxn(20 40;20)
NB.+0.00762835 0.0304109
NB.-
NB.+   (AL_AM92_ULT;0.05)asxn(20;20 30 40)
NB.+0.00762835 0.0116736 0.0189453
NB.-
NB.+   (AL_AM92_ULT;0.05)asxn(20 40;20 30 40)
NB.+0.00762835 0.0116736 0.0189453
NB.+ 0.0304109 0.0654055   0.11467
NB. ---------------------------------------------------------
asxn =: 4 : 0
'Qx E' =. x
'AGES N' =: y
'Qx E' =. x
asxn1 =. +/@:((([: % 1 + [: >@:(1&{) [) ^ 1 + [: i. [: >@:(1&{) ]) * }:@:(*/\@:(1 , 1 - ([: >@:(1&{) ]) {. ([: >@:(0&{) ]) }. [: >@:(0&{) [)) * ([: >@:(1&{) ]) {. ([: >@:(0&{) ]) }. [: >@:(0&{) [)
Qx_axn1 =. (Qx;E)&asxn1
boxedtable =. <"1@:(>@:(0&{) ;"0/ >@:(1&{))
> Qx_axn1 each boxedtable(AGES;N)
)

