NB. =========================================================
NB.%jsp.ijs - J Statisical Package
NB.-<hr>
NB.-<a href="http://www.finexec.com.au" target="_blank">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_doc.html" target="_blank">Documentation | </a>
NB.-<a class="HREF" href="../../finexec_cat.html" target="_blank">Category | </a>
NB.-<a class="HREF" href="index.htm" target="_blank">J Statistical Package</a>
NB.-<hr>
NB.- Script: ~addons/finance/finexec/jsp/jsp.ijs
NB.- Depend: nil
NB.- Definitions: loaded to locale base
NB.- Status: done:
NB.- <a href="../jsp.ijs" target="_blank">Script source: jsp.ijs</a>
NB.-<hr>
NB.-<a class="HREF" href="../jsp.pdf" target="_blank">J Statistical Package</a><br>
NB.- J Statistical Package
NB.- Keith Smillie
NB.- Department of Computing Science
NB.- University of Alberta
NB.- Edmonton, Alberta T6G 2E8
NB.- March 2003
NB.-<hr>

NB. Utilities
ap=: {.@]+1&{@]*i.@{:@]    NB. Arithmetic progression
each=: &.>                 NB. Boxed each
EACH=: &>                  NB. Open each
ei=: [: i. >:              NB. Extended integers
imax=: (] e. >./) # i.@#   NB. Index of maximum
io=: [:<:[:+/</            NB. Interval of
midpts=: [:-:2:+/\]        NB. Midpoints
mp=: +/ . *                NB. Matrix product 
odd=: 1: + 2: * i.         NB. Odd integers
ott=: [: (/: +/"1) tt      NB. Ordered truth table
pos=: [: >: i.             NB. Positive integers
sort=: /:~                 NB. Sort
tt=: [: #: [: i. 2: ^ ]    NB. Truth table

NB. Integration utilities
W=: +:(#.|.@])"0 1|:@(0:,%.@(^/~@i)%>:@i=. i.@>:@+:)
ew=: +/@(-@(<:@(#@])*i.@[)|."0 1]{.~>:@([*<:@(#@])))
EW=: ([ ew W@]) f.
ai=: 2 : '+/@(x.&space * x.&[ * y.@(x.&grid))"0'
grid=: space *i.@#@[
space=: ] % <:@#@[
I=: (4 EW 5) ai 

NB. Discrete frequencies
fr=: +/"1 @ (=/)
fr1=: [: +/"1 =/
frtab=: [,.fr
nubfr0=: +/"1 @ =
nubfr=: #/.~
nubfrtab=:  ~. ,. nubfr

NB. Grouped frequencies
grfr=: i.@(<:@$@[) fr io
grfrtab=: midpts@[,.grfr

NB. Barcharts
bars=: #&'*' EACH 
barchart=: ([: ": [: ,. [) ,"1 [: ' '&,. [: bars ]

NB. Stem-and-leaf diagrams
stem=: 10&* @ <. @ %&10
leaf=: 10&|
SLdiag=: ~.@stem ;"0 stem </. leaf
SLfrtab=: ~.@stem ,. stem #/. leaf

NB. Means
am=: +/ % #
gm=: # %: */
hm=: [: % [: am %

NB. Other averages
midindices=: (<.,>.)@-:@<:@#
median=:[: am midindices { sort
mode=: imax@nubfr { ~.

NB. Variability
dev=: - am
ss=: [: +/ [: *: dev
var=: ss % <:@#
sd=: %: @ var
Q2=: median
Q1=: [: Q2 ] #~ Q2 > ]
Q3=: [: Q2 ] #~ Q2 < ]

NB. Summaries
five=: <./,Q1,Q2,Q3,>./
summary=: 3 : 0
r=.  'Sample size      ',5.0 ": #y.
r=. r,: 'Minimum           ',8.3":<./y.
r=. r, 'Maximum           ',8.3": >./y.
r=. r, 'Arithmetic mean   ',8.3": am y.
r=. r, 'Variance          ',8.3": var y.
r=. r, 'Standard deviation',8.3": sd y.
r=. r, 'First quartile    ',8.3": Q1 y.
r=. r, 'Median            ',8.3": Q2 y.
r=. r, 'Third quartile    ',8.3": Q3 y.
r=. r, 'Geometric mean    ',8.3": gm y.
r=. r, 'Harmonic mean     ',8.3": hm y.
)

NB. Correlation and regression
sp=: [: +/ *&dev
cov=: sp % [: <: #@]
cor=: cov % *&sd
SR=: 3 : 0
:
'b0 b1'=. b=. y.%.X=.1,"0 x.
yest=. b0+b1*x.
SRtable=: x. ,. y. ,. yest
sst=. +/*:y.-am y.
sse=. +/*:y.- X +/ . * b
mse=. sse%<:<:$y.
seb=. %:mse%+/*:x.-am x.
rsq=. 1-sse%sst
r=. 'Slope       ',10.5": b1
r=. r,: 'S.E.        ',10.5": seb
r=. r,'Intercept   ',10.5": b0
r=. r,'S.E. of est.',10.5": %:mse
r=. r,'Corr. sq.   ',10.5": rsq  
)

NB. Analysis of variance
wsqs=: ([: *:+/) % #   
aov1=: 3 : 0            
D=. y.
DFerr=. (DFtot=. <:#;D) - DFtr=. <:#D
SStr=. (+/ wsqs EACH D) - CT=. wsqs ;D
SStot=. (+/ *: ;D) - CT
SSerr=. SStot - SStr
'MStr MSerr'=. (SStr,SSerr) % DFtr,DFerr
F=. MStr%MSerr
r1=. 'Treatments', 5.0 12.5 12.5 8.1":DFtr,SStr,MStr,F
r2=. 'Error     ', (5.0 12.5 12.5":DFerr,SSerr,MSerr),8$' '
r3=. 'Total     ', (5.0 12.5":DFtot,SStot),20$' '
r1,r2,:r3
)

NB. Probability distributions
gamma=: !@<:
bc1=: ([: i. >:) ! ]
bc=: ei ! ]
binomial=: 3 : 0
:
'n p'=. x.
x=. y.
(x!n) * (p^x) * (-.p)^n-x
)
hg=: 3 : 0
:
'm n k'=. x.
x=. y.
(x!m) * ((k-x)!n) % k!m+n
)
poisson=: ^@-@[ * ^ % !@]
geometric=: [ * -.@[ ^ <:@]

NDISTN=: 3 : 0
ndistn I y.
)
ndistn=: 3 : 0
Const=. %:0.5p_1
Const * ^--:*:y.
)

TDISTN=: 3 : 0
:
x.&tdistn I y.
)
tdistn=: 3 : 0
:
n=. x.
Const=. (gamma -:>:n) % (gamma -:n) * %:n*1p1
Const * (>:(*:y.)%n) ^ --:>:n
)

CSDISTN=: 3 : 0
:
x.&csdistn I y.
)
csdistn=: 3 : 0
:
n=. x.
Const=. % (2^-:n) * gamma -:n
Const * (y. ^ -:<:<:n) * ^ --:y.
)

FDISTN=: 3 : 0
:
'm n' =. x.
if. m=1 do.
   2 * n&tdistn I %:y.
   else.
   x.&fdistn I y.
end.
)
fdistn=: 3 : 0
:
'm n'=. x.
Const=. (gamma -:m+n) % (gamma -:m) * gamma -:n
Const * (m^-:m) * (n^-:n) * (y.^-:<:<:m) * (n+m*y.)^--:m+n
)

NB. Random variables
rand=: (? % ]) @ ($&1e9)
stdnrand=: 3 : 0
r=. i. 0 
while. y. > #r do. 
   whilst. S >: 1 do. 
      V=: <:+:rand 2		 
      S=: +/ *: V
   end. 
r=. r, V * %: -+:(^.%])S
end.
y.{.r
)
nrand=: 3 : 0
0 1&nrand y.
:
y.{., ({.x.) + ({:x.) * stdnrand y.
)
exprand=: [ * [: -@^. [: rand ]

NB. Chi-square
chisq=: [: +/ [: , ([: *: -) % [
expfr=: (+/"1 */ +/) % [: +/ ,
chisq22=: ([: }: (+/"1) , +/) hg [: {. ,

NB. Nonparametric methods
uranks=: >: @ /:^:2
ranks=: (=/~ mp uranks) % [: +/ =/~
invranks=: [: ranks -
rcor=: cor&ranks
uneq=: 2: (~:/\) ]
runs=: [: >: [: +/ uneq

NB. Additional correlation and regression
covtab=: cov EACH /~
cortab=: cor EACH /~
REG=: 3 : 0
b=. (y=: ;@{: y.)%.X=:(1&,"1)@|:@(>@}:) y.
sst=. +/*:(y-am y)
ssr=. sst-sse=: +/*:(y- X +/ . * b)
F=. (msr=: ssr%k)%mse=: sse%_1+(n=: $y)-k=: <:#y.
rsq=. ssr%sst
seb=. %:(0{mse)*(<1 0)|:%.(|:X)+/ . * X
r=. 49{.'             Var.    Coeff.      S.E.         t'
r=. r, 15.0 12.5 12.5 10.2 ": (i. >:k),. b,. seb,. b%seb
r=. r, ''
r=. r, '  Source     D.F.    S.S.        M.S.         F'
r=. r, 'Regression', 5.0 12.5 12.5 10.2 ": k, ssr,msr,F
r=. r, 'Error     ', 5.0 12.5 12.5": (n-k+1), sse, mse
r=. r, 'Total     ', 5.0 12.5 ": (n-1), sst
r=. r, ''
r=. r, 'S.E. of estimate    ', 10.5":%:mse
r=. r, 'Corr. coeff. squared', 10.5": rsq
)

NB. Additional analysis of variance
expand=: [ #^:_1"1 ]
AllTerms=: [: |."1 [: }. ott@#@$
mnum=: [: */ -.@[ # $@] 
msgn=: [: _1&^ ~:/
msum=: 4 : '+/^:(+/-.x.)(/:x.)|:y.'
wss=: msgn@[ * mnum %~ [: +/ [: , [: *: msum
SubTerms=: [: |. ] expand [: tt +/
SS1=: [: | [: +/ SubTerms@[ wss"1 _ ]
SS=: [ SS1"1 _ ]
DF=: [: */"1[: |@<: [ #"2 $@]
Factors=: [: 'ABCDEF'&({.~) #@$
AllLabels=: AllTerms # Factors
ANOVA=: 3 : 0
(AllLabels y.) ANOVA y.
:
Terms=. (Factors Data=. y.)e."1 >Labels=. ;:,x.
AOVtable=: Terms (DF,. SS) Data
Total=. (<:*/$Data), (+/*:,Data) - (*:+/,Data)%*/$Data
Error=. Total - +/AOVtable
if. {.Error > 0 do.
   AOVtable=: AOVtable,Error
   Labels=. Labels,<'Error  '
end.
AOVtable=: (AOVtable,. %~/"1 AOVtable), Total,0
r=. ((5 12.5 12.5)":}:AOVtable), (5 12.5":}:{:AOVtable),12$' '
(>Labels,<'Total'),.r
)
