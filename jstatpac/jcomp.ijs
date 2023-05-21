NB. =========================================================
NB.%jcomp.ijs - J Companion for Statistical Calculations 
NB.-<script src="../js/jsp_links.js"></script>
NB.- Script: ~addons/finance/finexec/jsp/jcomp.ijs
NB.- Updated: 2022 6 26
NB.- Depend: nil
NB.- Definitions: loaded to locale base
NB.- Status: done
NB.- <a href="../jcomp.ijs" target="_blank">Script source: jcomp.ijs</a>
NB.-<hr>
NB.-<a class="HREF" href="../jsp.pdf" target="_blank">J Companion for Statistical Calculations </a><br>
NB.- J Companion for Statistical Calculations 
NB.- Keith Smillie
NB.- Department of Computing Science
NB.- University of Alberta
NB.- Edmonton, Alberta T6G 2H1
NB.- January 1999
NB.-<hr>


NB. Files
load 'plot'
load 'strings misc format'

NB. Utilities
NB. General utilities
ap=: {.@]+1&{@]*i.@{:@]      NB. Arithmetic progression
by=: ' '&;@,.@[,.]           NB. By (format)
dp=: ($@[ * $@]) $ [: , 0 2 1 3&|: @ (*/) NB. Direct product    
diff=: 2: (-~/\) ]           NB. First differences
EACH=: &>                    NB. Open each
each=: &.>                   NB. Boxed each
EACHRIGHT=: 1 : 0            NB. Open right each
[ x"1 >@]
)
EACHLEFT=: 1 : 0             NB. Open left each
] x"1 >@[
)
ei=: i.@>:                   NB. Extended integers
id=: =@i.            	     NB. Identity matrix
io=: [:<:[:+/[</]            NB. Index of for intervals
iones=: +/{.\:               NB. Indices of all 1s 
midpts=: [:-:2:+/\]          NB. Mid points
mnum=: [: */ -.@[ # $@]      NB. Marginal numbers
mp=: +/ . *                  NB. Matrix product
msum=: 4 : '+/^:(+/-.x)(/:x)|:y' NB. Marginal sums
over=: ({.,.@;}.)@":@,       NB. Over (format)
pos=: >:@i.                  NB. Positive integers
rand=: (?%])@($&1e9)         NB. Random integers in (0,1)
sort=: /:~                   NB. Sort up
subtab=: <@[ { ]             NB. Sub table
table=: 1 : '[by]over x/'   NB. Table adverb

NB. Input/Output utilities
hfu=: '_-'&charsub
ufh=: '-_'&charsub
Jfmt=: (".&>)@chop@toJ
CLIPwrite=: wdclipwrite@hfu@clipfmt
CLIPread=: Jfmt@ufh@wdclipread

NB. Integration utilities
W=: +:(#.|.@])"0 1|:@(0:,%.@(^/~@i)%>:@i=. i.@>:@+:)
ew=: +/@(-@(<:@(#@])*i.@[)|."0 1]{.~>:@([*<:@(#@])))
EW=: ([ ew W@]) f.
ai=: 2 : '+/@(x&space * x&[ * y@(x&grid))"0'
grid=: space *i.@#@[
space=: ] % <:@#@[
I=: (4 EW 5) ai 

NB. Windows utilities
WDtable=: 3 : 0    NB. Display table 
:          
;(<"1 (x ": y)), each LF
)

NB. Arithmetic mean
w=: 2.3 5 3.5 6
am=: +/ % #

NB. Harmonic and geometric mean
gm=: # %: */
hm=: % @ am @: %
means=: am,gm,hm
gm1=: */ %:~ #

NB. Frequencies I - Range
D=: 4 5 1 4 3 6 5 4 6 4 6 1
fr=: +/"1 @ (=/)
frtab=: [,.fr

NB. Frequencies II - Nub
nubfr=: +/"1 @ =
nubtab=: ~. ,. nubfr
fr1=: [: +/ =/~
bnubtab=: ~. ;"0 +/"1 @ =

NB. Frequencies III - Continuous
b=: 5.2 8.6 3.4 8.1 9.2 5.3 4.1 8.2 9.9 4.8
FR=: [: +/"1 {@[ =/ ]

NB. Frequencies IV - Multidimensional
d2=: 0 1;1 1;1 2;0 1;0 0;1 2;0 0;1 0;0 1
cfr=: i.@(<:@$@[) fr io
cfrtab=: midpts@[,.cfr

NB. Barcharts
GST=: 0.07&*
bars=: #&'*' EACH @ fr
barchart=: (": EACH @ [) ,. [: ' '&,. bars
vbarchart=: [: |. [: |:  [: '^'&,.bars

NB. Stem-and-leaf diagrams
u=: 22 14 32 30 19 16 28 21 25 31
stem=: 10&* @ <. @ %&10
leaf=: 10&|
SLtab=: ~.@stem ;"0 stem </. leaf
stemfrtab=: ~.@stem ,. stem #/. leaf
fr2=: #/.~

NB. Median and quartiles
midindices=: (<.,>.)@-:@<:@#
Q2=: median=:[: am midindices { sort
Q1=: [: Q2 ] #~ Q2 > ]
Q3=: [: Q2 ] #~ Q2 < ]
five=: (<./,Q1,Q2,Q3,>./)

NB. Mode
imax=: (] e. >./) # i.@#
mode=: imax@nubfr { ~.

NB. An example
NB. X=: 3 {"1 T12
NB. E=: 2 {"1 T12
NB. T=: (E > 0) # X

NB. Another example
tosecs=: 24 60 60 &#.
tt=: #: @ i. @ (2&^)
ptt=: ([ e.~ +/"1 @ tt@]) # tt@]

NB. Variance
dev=: - am
ssp=: +/ @ (*&dev)~
var=: ssp % <:@#
sd=: %: @ var
ss=: +/ @: *: @ dev
dev1=: ] - +/ % #
ss1=: [: +/ [: *: ] - +/ % #
var1=: (# - 1:) %~ [: +/ [: *: ] - +/ % #
sd1=: : %: (# - 1:) %~ [: +/ [: *: ] - +/ % #

NB. Summary statistics
summary=: 3 : 0
r=.  'Sample size      ',5.0 ": #y
r=. r,: 'Minimum           ', 8.3 ": <./y
r=. r, 'Maximum           ',8.3": >./y
r=. r, 'Arithmetic mean   ',8.3": am y
r=. r, 'Variance          ',8.3": var y
r=. r, 'Standard deviation',8.3": sd y
r=. r, 'First quartile    ',8.3": Q1 y
r=. r, 'Median            ',8.3": Q2 y
r=. r, 'Third quartile    ',8.3": Q3 y
r=. r, 'Geometric mean    ',8.3": gm y
)

f1=: 3 : 0  
% y
)

f2=: 3 : 0
:
x % y
)

f3=: 3 : 0
% y
:
x % y
)

frtable=: 3 : 0
nubtab y
:
x frtab y
)

NB. Covariance and correlation 
d=: 1 4 2 2 1 3;0 6 4 3 1 5;10 17 13 14 12 15
cov=: ssp % <:@#@]
cor=: cov % (*&sd)
covtab=: cov EACH /~ 
cortab=: cor EACH /~

NB. Linear regression
x1=: 12 18 24 30 36 42 48
y1=: 5.27 5.68 6.25 7.21 8.02 8.71 8.42
SR=: 3 : 0
:
'b0 b1'=. b=. y%.X=.1,"0 x
yest=. b0+b1*x
SRtable=: x ,. y ,. yest
sst=. +/*:y-am y
sse=. +/*:y- X +/ . * b
mse=. sse%<:<:$y
seb=. %:mse%+/*:x-am x
rsq=. 1-sse%sst
r=. 'Slope       ',10.5": b1
r=. r,: ' S.E.       ',10.5": seb
r=. r,'Intercept   ',10.5": b0
r=. r,'S.E. of est.',10.5": %:mse
r=. r,'Corr. sq.   ',10.5": rsq  
)

NB. Analysis of variance I - Sums of squares 
D2=: >4 7 5 6;9 4 3 8;2 5 7 3
D2a=: 0 0 4;0 1 7;0 2 5;0 3 6;1 0 9;1 1 4;1 2 3;1 3 8
D2a=: D2a, 2 0 2;2 1 5;2 2 7;2 3 3
msgn=: [: _1&^ ~:/
T=: msgn@[ * mnum %~ [: +/ [: , [: *: msum
AOVa=: 3 : 0
(0 $~ >: >./ }: EACH y) AOVa y
:
({:EACH y)(}:each y)}x
)  

NB. Analysis of variance II - Orthogonal contrasts
D2b=: 33.6 31.1 33 28.4 31.4;37.1 34.5 29.5 29.9 28.3
D2b=: D2b, 34.1 30.5 29.2 31.6 28.9;34.6 32.7 30.7 32.3 28.6
D2b=: >D2b, 35.4 30.7 30.7 28.1 29.6;36.1 30.3 27.9 26.9 33.4
OP=: (,:_1 1);(_1 0 1;1 _2 1);<_3 _1 1 3;1 _1 _1 1;_1 3 _3 1
OP=: OP,<_2 _1 0 1 2;2 _1 _2 _1 2;_1 2 0 _2 1;1 _4 6 _4 1
OP=: OP,<_5 _3 _1 1 3 5;5 _1 _4 _4 _1 5;_5 7 4 _4 _7 5;1 _3 2 2 _3 1;_1 5 _10 10 _5 1
OP=: > each OP

NB. Analysis of variance III - Unequal numbers
wsqs=: ([: *:+/) % #   
aov1=: 3 : 0            
D=. y
SStr=. (+/ wsqs EACH D) - CT=. wsqs ;D
SStot=. (+/ *: ;D) - CT
SSerr=. SStot - SStr
SS1=. SStr,SSerr,SStot
DFerr=. (DFtot=. <:#;D) - DFtr=. <:#D
DF1=. DFtr,DFerr,DFtot
MS1=. (SStr,SSerr) % DFtr,DFerr
SS1,.DF1,.MS1,0
)
D2c=: 84 60 40 47 34
D2c=: D2c;67 92 95 40 98 60 59 108 86; 46 93 100

NB. Probability
bc=: ei ! ]
pascal=: !~/~@ei
PR=: [: -. -.@[ ^ ]

NB. Three problems
coinc=: [: -/ [: % [: ! ei
bd=: [: -. ([: */ [: 365&- i.) % 365&^ 
cc=: * +/ @: % @ pos
bd1=: [: -. [: */ [: -. [: 365&(%~) i.

NB. J constants
isSQ=: 0: = 1: | %:
isTF=: [: isSQ [: # [: ": !
TF=: isTF EACH # ]

NB. Discrete probability distributions
binomial=: 3 : 0
:
'n p'=. x
x=. y
(x!n) * (p^x) * (-.p)^n-x
)
hg=: 3 : 0
:
'm n k'=. x
x=. y
(x!m) * ((k-x)!n) % k!m+n
)
poisson=: ^@-@[ * ^ % !@]
geometric=: [ * -.@[ ^ <:@]

NB. Continuous probability distributions
circ=: [: %: 1: - *:
Gamma=: !@<:
odds=: 1: + 2: * i.                      
ndistn=: 3 : 0
Const=. %:0.5p_1
Const * ^--:*:y
)
tdistn=: 3 : 0
:
n=. x
Const=. (Gamma -:>:n) % (Gamma -:n) * %:n*1p1
Const * (>:(*:y)%n) ^ --:>:n
)

csdistn=: 3 : 0
:
n=. x
Const=. % (2^-:n) * Gamma -:n
Const * (y ^ -:<:<:n) * ^ --:y
)
 
fdistn=: 3 : 0
:
'm n'=. x
Const=. (Gamma -:m+n) % (Gamma -:m) * Gamma -:n
Const * (m^-:m) * (n^-:n) * (y^-:<:<:m) * (n+m*y)^--:m+n
)

NB. Simulation I - Discrete variables
Die=: >: @ ? @ $&6
Dice=: -@[ <\ Die @ *
SumDice=:  +/EACH @ Dice
Coins=: [: {&'HT' [: ? ] $ 2:
Heads=: [: +/ [: ? , $ 2:
CoinTest=: ([: +/\ Heads) % [: +/\ $~
NB. (ei 12) fr +/ EACH (e.&4 5 6 each) 12 Dice 4096
Craps=: 3 : 0
CRAPS=: ,p=. 2 SumDice 1
if. -. p e. 7 11 2 3 12 do.
   whilst. -. (({:CRAPS) e. 7,p) do.
      CRAPS=: CRAPS, 2 SumDice 1
   end.
end.
if. 1 = $CRAPS do.
   r=. p e. 7 11
else.
   r=. p = {:CRAPS
end.
)
CrapsProb=: 3 : 0
n=. s=. 0
while. n < y do.
   s=. s + Craps ''
   n=. >:n
end.
s % y 
)  
Ruin=: 3 : 0
:
q=. -. p=. x
'd D'=. y
C=. d + D
(((q%p)^C) - (q%p)^d) % _1 + (q%p)^C 
)

NB. Simulation II - Continuous variables
rand=: (? % ]) @ ($&1e9)
stdnmlrand=: 3 : 0
r=. i. 0 2
while. y > {.$r 
   do. whilst. S >: 1
      do. V=: <:+:rand 2		 
          S=: +/ *: V
   end. 
r=. r, V * %: -+:(^.%])S
end.
)
nmlrand=: 3 : 0
0 1&nmlrand y
:
y{., ({.x) + ({:x) * stdnmlrand >.-:y
)
exprand=: [ * [: -@^. [: rand ]
coords=: [: rand ],2:
incircle=: [: +/ 1: >: [: +/"1 [: *: coords
PI=: 4: * incircle % ]

NB. Simulation III - Central limit theorem
stdize=: (] - 3.5&*@[) % [: %: 2.91667&*@[

NB. One more example
Lotto=: 6 43 6&hg 
PayOut=: 0 0 0 10 75 2500 1000000
LottoNums=: [: >: 6: ? $&49
LottoSim=: [ {~ [: +/"1 [: e.&1 2 3 4 5 6 LottoNums@]

NB. Chi-square distribution
obs=: 120 48 36 13
exp=: 122.062 40.6875 40.6875 13.5625
chisq0=: [: +/ ([: *: -) % ]
chisq=: [: +/@, ([: *: -) % ]
ExpFrTab=: (+/"1 */ +/) % +/@, 
Tab34=: >18 29 70 115;17 28 30  41;11 10 11  20	
T22=: (>2 5;3 3);(>1 6;4 2);>0 7;5 1
chisq22=: ([: }: (+/"1) , +/) hg {.@,

NB. Nonparametric statistics - Preliminaries
v=: 4.5 2 6.1 3.7
v1=: 2 3.7 2 4.5 6.1 2 4.5
uranks=: >: @ /:^:2
nranks=: (= mp uranks) % [: +/"1 =
ranks=:  [: , |:@= # nranks
invranks=: [: ranks -
comb=: |.@ptt # i.@]
ott=: (/: +/"1) @ tt
outshuffle=: ] /: [: /: #@] $ 0:, 1:
inshuffle=: ] /: [: /: #@] $ 1:, 0:

NB. Nonparametric statistics - Three examples
rcor=: ranks@[ cor ranks@]

NB. Nonparametric statistics - Runs
noteq=: 2: (~:/\) ]
nruns=: [: >: +/ @ noteq
lruns=: [: diff [: iones 1: , noteq , 1:
lrunstab=: nubtab @ sort @ lruns
CoinRuns=: 3 : 0
:
max=. i. 0
while. y > $max do.
   max=. max, >./lruns, Coins x
end.
(ei >./ max) frtab max
)

NB. Markov chains
urn=: 3 : 0
'n s t'=. y
r=. +/A=. n$1
while. t >: #r do.
   r=. r, +/A=. A ~: 2|(i. n) fr ?s#n
end.
r=. r % n
)

NB. Moving averages
AM=: ([: +/ *) % +/@[

NB. A final example
OnePlay=: (([:>[:1&{[) i. [:<] { EACH [:>[:0&{[) { [:>[:2&{[
SM1=: [ OnePlay EACHRIGHT [: <"1 [: ? (],3:) $ 20"1
SM2=: 3 : 0
:
X=. x
'Capital NumPlays NumReps'=. 3{.y,1
R=. i. 0
while. NumReps > $R do.
   Total=. Capital
   Num=. 0
   while. (Num < NumPlays) *. (Total > 0) do.
      Total=. Total + <: X OnePlay ?3$20
      Num=. >:Num
   end.
   R=. R,<Num,Total
end.
)

NB. Appendix 4. Multiple linear regression
REG=: 3 : 0
b=. (y=. ;@{: y)%.X=.(1&,"1)@|:@(>@}:) y
sst=. +/*:(y-am y)
ssr=. sst-sse=. +/*:(y- X +/ . * b)
F=. (msr=. ssr%k)%mse=. sse%_1+(n=. $y)-k=. <:#y
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

NB. Appendix 4. Analysis of variance
expand=: [ #^:_1"1 ]
AllTerms=: [: |."1 [: }. ott@#@$
SubTerms=: [: |. ] expand [: tt +/
SS1=: [: | [: +/ SubTerms@[ T"1 _ ]
SS=: [ SS1"1 _ ]
DF=: [: */"1[: |@<: [ #"2 $@]
Factors=: [: 'ABCDEF'&({.~) #@$
AllLabels=: AllTerms # Factors
AOV=: 3 : 0
(AllLabels y) AOV y
:
Terms=. (Factors Data=. y)e."1 >Labels=. ;:,x
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

NB. Appendix 5. Windows programming
NB. *** Rolling 1, 2 or 3 dice with 4 or 6 faces ***
WinEx8=: 0 : 0
pc winex8;
xywh 68 96 34 12;cc ok button;cn "OK";
xywh 68 116 34 12;cc cancel button;cn "Cancel";
xywh 10 9 40 38;cc frame0 groupbox;cn " Faces ";
xywh 20 15 20 14;cc rb0 radiobutton;cn "  4";
xywh 20 30 20 14;cc rb1 radiobutton group;cn "  6";
xywh 10 54 40 53;cc frame1 groupbox;cn " Dice ";
xywh 20 60 20 14;cc rb2 radiobutton;cn "  1";
xywh 20 75 20 14;cc rb3 radiobutton group;cn "  2";
xywh 20 90 20 14;cc rb4 radiobutton group;cn "  3";
xywh 15 120 25 10;cc rolls edit;
xywh 10 135 40 15;cc rollsname static;cn "Rolls (1 to 200)";
xywh 60 10 50 75;cc frtable listbox ws_border ws_vscroll;
pas 6 6;pcenter;
rem form end;
)

winex8_run=: 3 : 0
wd WinEx8
wd 'set rolls *','  0 '
wd 'setfont rolls "MS Sans Serif" 11 bold;'
wd 'setfont frtable "MS Sans Serif" 11 bold;'
NB. DICEtab=:i. 0 2
wd 'pshow;'
)

winex8_ok_button=: 3 : 0
R=: ". rolls
R=. R * R e. pos 200
NB. wd 'set frtable *',''
if. R > 0 do.
   F=. ('1' = rb0,rb1) # 4 6
   D=. ('1' = rb2,rb3,rb4) #  1 2 3
   Range=. (D-1) }. pos F*D
   Sums =. +/ EACH >: each ? each R$<D$F
   DICEtab=: Range frtab Sums
   wd 'set frtable *',6.0 WDtable DICEtab   
end.
)

winex8_cancel_button=: 3 : 0
wd 'pclose;'
)


NB. Data
NB *** An example ***
T12=: 01 0842 4 49 02 1035 2 18 02 1529 1 123 02 1735 1 3
T12=: T12, 03 0 0 0 04 1109 6 87 04 1907 4 21 04 2033 4 7
T12=: T12, 04 2051 4 24 5 0835 4 11 05 0922 4 19 06 0900 5 243
T12=: T12, 07 1525 3 38 08 0947 1 11 08 1010 1 18 09 1432 2 32
T12=: T12, 09 1527 1 101 9 1712 1 6 9 1809 6 32 09 1931 4 27
T12=: T12, 09 2122 1 41 10 0805 4 3 11 1331 4 25 11 1447 4 19
T12=: T12, 11 1702 6 242 12 0 0 0 13 1022 1 122 13 1403 4 15
T12=: T12, 13 1422 4 7 13 1433 4 6 13 1445 4 2 13 1451 4 18
T12=: T12, 13 1516 4 42 14 1759 2 24 15 0803 4 7 15 0817 4 9
T12=: T12, 15 0831 4 14 15 0847 4 10 15 0905 4 30 15 0942 4 23
T12=: T12, 15 1009 4 141 15 1240 4 7 15 1249 4 102 15 1947 1 83
T12=: T12, 16 1429 3 29 17 0 0 0 18 0 0 0 19 1033 2 11
T12=: T12, 19 1102 2 15 19 1221 2 7 19 1234 2 6 19 1247 2 8
T12=: T12, 19 1342 2 121 19 1829 3 4 20 1328 6 23 20 1700 3 42
T12=: T12, 20 1748 3 18 21 0904 6 31 21 1227 2 25 21 1513 4 42
T12=: T12, 21 1907 4 6 22 0800 5 339 22 1926 2 19 22 2240 3 27
T12=: T12, 23 0931 6 12 23 0952 6 11 23 1005 6 3 23 1017 6 5
T12=: T12, 23 1024  6 9 23 1038 6 3 23 1402 1 22 23 1823 1 17
T12=: T12, 24 0 0 0 25 2129 3 20 26 1340 6 5 26 1545 6 3
T12=: T12, 26 1550 6 18 27 0955 1 142 27 1235 1 51 27 1707 2 18
T12=: T12, 27 1729 2 41 27 1944 4 9 28 1137 3 9 28 1430 6 27
T12=: T12, 28 1504 6 14 29 0913 3 33 29 0952 1 128 29 1244 1 34
T12=: T12, 29 1359 6 18 29 1505 1 232 29 1901 1 179 29 2206 1 143
T12=: 95 4 $ T12, 30 0801 1 181 30 1212 4 6 31 2105 6 14
NB. *** Another example ***
T1=: 8 51 30;9 11 38; 9 15 45; 9 33 52; 9 38 20
T1=: T1, 9 50 0; 9 54 10; 10 5 5; 10 9 6; 10 27 41
T1=: T1, 10 31 55; 10 41 5; 10 45 1; 10 56 47; 11 0 10
T1=: T1, 11 11 58; 11 16 53;  11 29 52
T2=: 18 5 45; 18 29 50; 18 34 30; 18 57 14; 19 2 20
T2=: T2, 19 13 45; 19 17 55; 19 31 57; 19 35 54
T2=: T2, 19 45 36; 19 49 47; 19 58 45; 20 2 35
T2=: T2, 20 10 26; 20 14 17; 20 30 36
NB *** Poisson distribution ***
h=: 0 2 2 1 0 0 1 1 0 3 0 2 1 0 0 1 0 1 0 1
h=: h, 0 0 0 2 0 3 0 2 0 0 0 1 1 1 0 2 0 3 1 0
h=: h, 0 0 0 2 0 2 0 0 1 1 0 0 2 1 1 0 0 2 0 0
h=: h, 0 0 0 1 1 1 2 0 2 0 0 0 1 0 1 2 1 0 0 0
h=: h, 0 1 0 1 1 1 1 0 0 0 0 1 0 0 0 0 1 1 0 0
h=: h, 0 0 0 0 2 1 0 0 1 0 0 1 0 1 1 1 1 1 1 0
h=: h, 0 0 1 0 2 0 0 1 2 0 1 1 3 1 1 1 0 3 0 0
h=: h, 1 0 1 0 0 0 1 0 1 1 0 0 2 0 0 2 1 0 2 0
h=: h, 1 0 0 0 1 0 0 1 0 0 0 0 1 0 0 0 1 1 0 1
h=: h, 0 0 0 0 0 2 1 1 1 0 2 1 1 0 1 2 0 1 0 0
h=: h, 0 0 1 1 0 1 0 2 0 2 0 0 0 0 2 1 3 0 1 1
h=: h, 0 0 0 0 2 4 0 1 3 0 1 1 1 1 2 1 3 1 3 1
h=: h, 1 1 2 1 1 3 0 4 0 1 0 3 2 1 0 2 1 1 0 0
h=: h, 0 1 0 0 0 0 0 1 0 1 1 0 0 0 2 2 0 0 0 0
NB. *** Simulation IV - Sampling
Hours=: 36 36 32 35 41 32 41 30 22 32 27 35 35 10 29 41 45 45 30 39
Hours=: Hours, 45 33 23 28 27 43 44 31 34 33 36 28 31 39 29
Hours=: Hours, 42 43 31 28 39 33 18 25 36 45 45 24 37 52 26
Hours=: Hours, 23 23 38 37 38 42 40 42 40 40 42 40 34 37 34
Hours=: Hours, 36 40 33 40 20 10 23 15 28 28 32 28 37 37 44
Hours=: Hours, 25 36 26 40 40 39 39 41 33 39 40 38 39 16 39
Hours=: Hours, 38 41 41 28 27
NB. *** Nonparametric statistics ***
French=: 83 27 42 51 53 44 47 55 61 33
German=: 74 22 49 54 48 47 55 61 59 29
ht=: 7.9 6.5 17.8 4.2 13.2
hc=: 5.6 0.4 6.7 1.2 2.9
s1=: 42 51 31 61 44 55 48
s2=: 38 53 36 52 33 49 36
NB. *** Markov chains
LB=: 1 0 0 0 0 0;0.2 0 0.3 0 0.5 0
LB=: LB,0 0 0 0.3 0.6 0.1;0 0 0 0 0.7 0.3
LB=: >LB, 0 0.3 0.6 0.1 0 0; 0 0 0 0 0 1
U=: <0 10 0 0 0 0 0 0 0 0 0
U=: U, <1 0 9 0 0 0 0 0 0 0 0
U=: U, <0 2 0 8 0 0 0 0 0 0 0
U=: U, <0 0 3 0 7 0 0 0 0 0 0
U=: U, <0 0 0 4 0 6 0 0 0 0 0
U=: U, <0 0 0 0 5 0 5 0 0 0 0
U=: U, <0 0 0 0 0 6 0 4 0 0 0
U=: U, <0 0 0 0 0 0 7 0 3 0 0
U=: U, <0 0 0 0 0 0 0 8 0 2 0
U=: U, <0 0 0 0 0 0 0 0 9 0 1
U=: 10%~>U, <0 0 0 0 0 0 0 0 0 10 0  
NB. *** Moving averages ***
HS=: 29 28 27 25 31 29 29 30 33 32
HS=: HS; 24 20 19 13 12 10 13 10 11 12
NB. *** A final example ***
Dial1=: 'cccccccooolllpppppbr'
Dial2=: 'cccccccoooooopbbbrrr'
Dial3=: 'ooooooollllpppppbbbr'
Dials=: Dial1;Dial2;Dial3
WinComb=: ;:'rrr bbb bbr ppp ppr ooo oor ccl ccb cco ccp ccr'
WinAmt=: 62 18 18 14 14 10 10 5 5 3 3 3 0
X=: Dials;WinComb;WinAmt
DIAL1=: 'CCCCCCCOOOLLLPPPPPBR'
DIAL2=: 'CCCCCCCOOOOOOPBBBRRR'
DIAL3=: 'OOOOOOOLLLLPPPPPBBBR'
DIALS=: DIAL1;DIAL2;DIAL3
WINCOMB=: ;:'RRR BBB BBR PPP PPR OOO OOR CCL CCB CCO CCP CCR'
NB. *** Appendix 4. Analysis of variance
D3=: 25 7 21 4 10 16 5 21 4 25 7 6
D3=: D3, 3 6 16 18 20 18 19 17 16 2 15 6
D3=: D3, 13 23 8 25 19 19 20 14 23 9 10 18
D3=: D3, 27 26 19 24 13 9 19 13 20 18 16 12
D3=: 2 4 6 $ D3

NB.   ***** End of script file *****










