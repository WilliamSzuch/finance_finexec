NB. =========================================================
NB.%jtsp.ijs - J Tutorial and Statistical Package
NB.-<hr>
NB.-<a href="http://www.finexec.com.au">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_lib.html">Library | </a>
NB.-<a class="HREF" href="index.htm">J Statistical Package</a>
NB.-<hr>
NB.- Script: ~addons/finance/finexec/jsp/jtsp.ijs
NB.- Updated: 2022-05-22
NB.- Depend: nil
NB.- Definitions: loaded to locale base
NB.- Status: done:
NB.- <a href="../jtsp.ijs" target="_blank">Script source: jtsp.ijs</a>
NB.-<hr>
NB.-<a class="HREF" href="../jtsp.pdf" target="_blank">J Tutorial & Statistical Package</a><br>
NB.- J Tutorial and Statistical Package
NB.- Keith Smillie
NB.- Department of Computing Science
NB.- University of Alberta
NB.- Edmonton, Alberta T6G 2E8
NB.- March 2003
NB.-<hr>

load 'plot'

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

NB. A simple example
Prices=: 0.59 5.99 0.59 0.59 3.49 3.49 4.39
PriceList=: 0.59 5.99 3.49 4.39
Qty=: 3 1 2 1
sum=: +/
wsum=: +/ @: *
minmax=: <./ , >./
wsum1=: [: +/ *
Sum=: 3 : 0
1 Sum y.
:
+/x. *  y.
)

NB. Discrete frequencies
D=: 5 6 4 2 6 5 5 4 1 4 5 2
fr=: +/"1 @ (=/)
fr1=: [: +/"1 =/
frtab=: [,.fr
nubfr0=: +/"1 @ =
nubfr=: #/.~
nubfrtab=:  ~. ,. nubfr

NB. Grouped frequencies
SentenceLength=: 11 31 45 31 12 31 39 16 21 31 36 28 31 39 31 22 33
grfr=: i.@(<:@$@[) fr io
grfrtab=: midpts@[,.grfr

NB. Barcharts
DD=: 1 5 3 4 2 1 5 5 6 3 4 5
bars=: #&'*' EACH 
barchart=: ([: ": [: ,. [) ,"1 [: ' '&,. [: bars ]

NB. Stem-and-leaf diagrams
stem=: 10&* @ <. @ %&10
leaf=: 10&|
SLdiag=: ~.@stem ;"0 stem </. leaf
SLfrtab=: ~.@stem ,. stem #/. leaf

NB. Means
w=: 62.3 58.5 44.6 50.3
W=:  3 4 $ 62.3 58.5 44.6 50.3 63.4 50.4 45 46.7 64.5 46.1 62.6 50.3
Income=: 126 195 149 122 189 164 228 177 165 150
Income=: Income, 169 127 176 147 148 159 128 122 150 193
Income=: Income, 207 164 168 110 155 127 152 174 190 219
Income=: Income, 125 193 141 127 155 133 150 162 168 128 
Income=: Income, 125 137 146 120 154 176 166 117 154 137
am=: +/ % #
am1=: # %~ +/
gm=: # %: */
gm1=: */ %:~ #
hm=: [: % [: am %
hm1=: % @ am @: %
into=: %~
allmeans=: am,gm,hm
amrows=: am"1
amcols=: am

NB. Other averages
u=: 22 14 32 30 19 16 28 21 25 31 
midindices=: (<.,>.)@-:@<:@#
median=:[: am midindices { sort
mode=: imax@nubfr { ~.

NB. Variability
dev=: - am
ss=: [: +/ [: *: dev
var=: ss % <:@#
sd=: %: @ var
dev1=: - +/ % #
ss1=: [: +/ [: *: [ - +/ % #
var1=: ([: <: #) %~ [: +/ [: *: ] - +/ % #
sd1=: [: %: ([: <: #) %~ [: +/ [: *: ] - +/ % #
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
f1=: 3 : 0  
% y.
)
f2=: 3 : 0
:
x. % y.
)
f3a=: 3 : 0
% y.
:
x. % y.
)
f3b=: 3 : 0
1 f3b y.
:
x. % y.
)

NB. Correlation and regression
Water=: 12 18 24 30 36 42 48
Yield=: 5.27 5.68 6.25 7.21 8.02 8.71 8.42
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
X=: 3 4 $ 75.4 65.6 54 52.7 70.3 67.3 57.6 58.5 68.8 65.3 45.6 51
Vboth=: W,: X
D1=: 84 60 40 47 34
D1=: D1;67 92 95 40 98 60 59 108 86; 46 93 100
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
Die=: [: >: [: ? [ $ 6:
TwoDice=: [: <"1 [: Die ],2:
rand=: (? % ]) @ ($&1e9)
coords=: [: rand ],2:
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
incircle=: [: +/ 1: >: [: +/"1 [: *: coords
PI=: 4: * incircle % ]

NB. Chi-square
obs1=: 120 48 36 13
exp1=: 122.062 40.6875 40.6875 13.5625
obs2=: 23 21 24 18 23 19 24 19 15 14
Tab34=: >18 29 70 115;17 28 30  41;11 10 11  20	
T22=: (>2 5;3 3);(>1 6;4 2);>0 7;5 1 
chisq0=: [: +/ ([: *: -) % [
chisq=: [: +/ [: , ([: *: -) % [
expfr=: (+/"1 */ +/) % [: +/ ,
chisq22=: ([: }: (+/"1) , +/) hg [: {. ,

NB. Nonparametric methods
v=: 4.5 2 6.1 3.7
v1=: 4.5 2 4.5 6.1 2 2 3.7
French=: 83 27 42 51 53 44 47 55 61 32
German=: 74 22 49 54 48 47 55 61 59 29
HeadsTails=: 'HHTHHHHTHHHTHHH'
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

NB. Common mean
cm=: [: {. (am,gm)^:_

NB. Coupon collector's problem
cc=: * [: +/ [: % pos
ccsize=: 3 : 0
:
m=. x.
n=. y.
r=. i. 0
while. m > #r do.
   CCsample=: i. 0
   while. n > # ~. CCsample do.
      CCsample=: CCsample, >:?n
   end.
   r=. r, #CCsample
end.
)

NB. German Army Corps example
H0=: 0 2 2 1 0 0 1 1 0 3 0 2 1 0 0 1 0 1 0 1 0 0 0 2 0 3 0 2 0 0
H1=: 0 1 1 1 0 2 0 3 1 0 0 0 0 2 0 2 0 0 1 1 0 0 2 1 1 0 0 2 0 0
H2=: 0 0 0 1 1 1 2 0 2 0 0 0 1 0 1 2 1 0 0 0 0 1 0 1 1 1 1 0 0 0
H3=: 0 1 0 0 0 0 1 1 0 0 0 0 0 0 2 1 0 0 1 0 0 1 0 1 1 1 1 1 1 0
H4=: 0 0 1 0 2 0 0 1 2 0 1 1 3 1 1 1 0 3 0 0 1 0 1 0 0 0 1 0 1 1 
H5=: 0 0 2 0 0 2 1 0 2 0 1 0 0 0 1 0 0 1 0 0 0 0 1 0 0 0 1 1 0 1
H6=: 0 0 0 0 0 2 1 1 1 0 2 1 1 0 1 2 0 1 0 0 0 0 1 1 0 1 0 2 0 2
H7=: 0 0 0 0 2 1 3 0 1 1 0 0 0 0 2 4 0 1 3 0 1 1 1 1 2 1 3 1 3 1
H8=: 1 1 2 1 1 3 0 4 0 1 0 3 2 1 0 2 1 1 0 0 0 1 0 0 0 0 0 1 0 1
H9=: 1 0 0 0 2 2 0 0 0 0
H=: H1, H2, H3, H4, H5, H6, H7, H8, H9

NB. Central limit theorem
Hdistn=: [: >: [: _1 24 49 69 84 94 99&io ?@$&100

NB. Throwing dice
PolyDice=:  [: <"1 [: |: [: >: [: ? ] $ [
Dice=: 3 : 0
:
Faces=. x.
'Dice Throws'=. y.
R=: +/ EACH Faces PolyDice Dice, Throws
Range=: Dice }. i. >: Faces * Dice
Nub=: sort ~. R
RangeFreq=: Range fr R
empty NubFreq=: Nub fr R
)

NB. A few more numbers
Times=: 9 0 8; 9 2 19; 9 5 0; 9 13 27; 9 16 32; 9 26 41; 9 29 25; 9 30 0
pi0=: 4: * [: -/ [: % [: odd ]
pi=: [: ": [: <.@o. 10x"_^]
PiList=: [: pi [: <: [: *: ]
PiTriangle=: ([: #~ odd) ,/. PiList
PiTree=: ([: - [: i. -@]) |."0 1 PiTriangle

NB.   ***** Additional data *****
d=: 1 4 2 2 1 3;0 6 4 3 1 5; 10 17 13 14 12 15
D2=: >4 7 5 6;9 4 3 8;2 5 7 3
D2a=: 0 0 4;0 1 7;0 2 5;0 3 6;1 0 9;1 1 4;1 2 3;1 3 8
D2a=: D2a, 2 0 2;2 1 5;2 2 7;2 3 3


NB. ***** Windows examples *****

NB.  Frequency table 

WDtable=: 3 : 0               
:          
;(<"1 (x. ": y.)), each LF
)

am=: +/ % #
ap=: {.@]+1&{@]*i.@{:@]
fr=: +/"1 @ (=/)
grfr=: i.@(<:@$@[) fr io
grfrtab=: midpts@[,.grfr
io=: [:<:[:+/</
midpts=: [:-:2:+/\]

FRX=: 0 : 0
pc frx;
xywh 10 10 75 20;cc data editm ws_hscroll;
xywh 50 35 60 10;cc cname static;cn "Data";
xywh 9 45 75 65;cc frame1 groupbox;cn "Input";
xywh 15 55 30 10;cc first edit;
xywh 50 55 30 10;cc cname static;cn "First";
xywh 15 72 30 10;cc width edit;
xywh 50 72 30 10;cc cname static;cn "Width";
xywh 15 90 30 10;cc number edit;
xywh 50 90 30 10;cc cname static;cn "Number";
xywh 9 115 75 81;cc frame2 groupbox;cn "Summary";
xywh 15 125 30 10;cc samplesize edit;
xywh 50 125 30 10;cc cname static;cn "Size";
xywh 15 142 30 10;cc minimum edit;
xywh 50 142 30 10;cc cname static;cn "Minimum";
xywh 15 159 30 10;cc avg edit;
xywh 50 159 30 10;cc cname static;cn "Mean";
xywh 15 176 30 10;cc maximum edit;
xywh 50 176 30 10;cc cname static;cn "Maximum";
xywh 100 10 34 34;cc jicon button bs_ownerdraw;cn "system\examples\data\jr.ico";
xywh 100 50 34 12;cc ok button;cn "OK";
xywh 100 68 34 12;cc reset button;cn "Reset";
xywh 100 86 34 12;cc cancel button;cn "Cancel";
xywh 100 105 50 75;cc freqtable editm ws_border ws_vscroll;
pas 6 6;pcenter;
rem form end;
)

Reset=: 3 : 0
wd 'set data *', '     '
wd 'set first *', '   0  '
wd 'set width *', '   0  '
wd 'set number *', '   0  '
wd 'set samplesize *', '     '
wd 'set minimum *', '     '
wd 'set avg *', '     '
wd 'set maximum *', '     '
wd 'set freqtable *', '     '
)

frx_run=: 3 : 0
wd FRX
wd 'setfont data "MS Sans Serif" 11 bold;'
wd 'setfont first "MS Sans Serif" 11 bold;'
wd 'setfont width "MS Sans Serif" 11 bold;'
wd 'setfont number "MS Sans Serif" 11 bold;'
wd 'setfont samplesize "MS Sans Serif" 11 bold;'
wd 'setfont minimum "MS Sans Serif" 11 bold;'
wd 'setfont avg "MS Sans Serif" 11 bold;'
wd 'setfont maximum "MS Sans Serif" 11 bold;'
wd 'setfont freqtable "MS Sans Serif" 11 bold;'
wd 'pshow;'
)

frx_ok_button=: 3 : 0
data1=: ". data
('f w n')=: ". first,' ',width,' ',number
('s0 s1 s2 s3')=: (#,<./,am,>./) data1
wd 'set samplesize *',7.0&":s0
wd 'set minimum *',7.0&":s1
wd 'set avg *',7.2&":s2
wd 'set maximum *',7.0&":s3
table=: (ap f,w,n) grfrtab data1
wd 'set freqtable *',6.1 6.0 WDtable table
)

frx_reset_button=: 3 : 0
Reset ''
)

frx_close=: 3 : 0
wd'pclose'
)

frx_cancel_button=: 3 : 0
frx_close''
)


NB. Coupon collector's example

each=: &.>
am=: +/ % #
pos=: >: @ i.

fr=: +/"1 @ (=/)
frtab=: [,.fr
nubfr=: #/.~
nubfrtab=:  ~. ,. nubfr

cc=: * +/ @: % @: pos
rnd=: <.@(0.5&+)
sort=: /:~

ccsim=: 3 : 0
n=. y.
r=. i. 0
while. n > # ~. r do.
   r=. r, ?n
end.
>:r
)

ccs=: (#@ccsim)"0 @ #

WDtable=: 3 : 0    NB. Display table 
:          
;(<"1 (x. ": y.)), each LF
)

CCX=: 0 : 0
pc ccx;
xywh 5 8 75 52;cc input groupbox;cn " Input ";
xywh 10 20 20 10;cc coupons edit;
xywh 35 20 30 10;cc cname static;cn "Coupons";
xywh 10 40 20 10;cc reps edit;
xywh 35 40 40 10;cc rname static;cn "Repetitions";
xywh 5 70 75 90;cc output groupbox;cn " Output ";
xywh 10 82 30 10;cc exp edit;
xywh 45 82 25 10;cc expname static;cn "Exp. mean";
xywh 10 102 30 10;cc obs edit;
xywh 45 102 30 10;cc obsname static;cn "Obs. mean";
xywh 10 122 30 10;cc min edit;
xywh 45 122 25 10;cc minname static;cn "Minumum";
xywh 10 142 30 10;cc max edit;
xywh 45 142 25 10;cc maxname static;cn "Maximum";
xywh 102 10 50 75;cc frtable editm ws_border ws_vscroll;
xywh 90 90 75 28;cc frame groupbox;cn "Frequencies";
xywh 100 98 30 14;cc rb0 radiobutton;cn "Range";
xywh 133 98 30 14;cc rb1 radiobutton group;cn "Nub";
xywh 110 125 34 14;cc ok button;cn "OK";
xywh 110 145 34 14;cc cancel button;cn "Cancel";
pas 6 6;pcenter;
rem form end;
)

ccx_run=: 3 : 0
wd CCX
wd 'set coupons *', '   0 '
wd 'set reps *', '   0 '
wd 'setfont frtable "MS Sans Serif" 14 bold;'
wd 'pshow;'
)

ccx_ok_button=: 3 : 0
Simulation rb1= '1'
)

Simulation=: 3 : 0
('N R')=. ". coupons,' ', reps
wd 'set exp *',''
wd 'set obs *',''
wd 'set min *',''
wd 'set max *',''
wd 'set exp *', 6.1&":cc N
wd 'set frtable *',''
if. R > 0 do.
   S=. R ccs N
   wd 'set obs *',6.1&":am S
   wd 'set min *',6.0&":<./S
   wd 'set max *',6.0&":>./S
   if. y. do.
                CCtable=: nubfrtab sort S
          else.
                range=: 0, pos >./S
                CCtable=: range frtab S
   end.
   wd 'set frtable *',6.0 WDtable CCtable
end.
)

ccx_cancel_button=: 3 : 0
wd 'pclose;'
)


NB.  Dice example 

load 'plot'

WDtable=: 3 : 0   
:          
;(<"1 (x. ": y.)), each LF
)

WDplot=: 3 : 0
:
a=. conew 'jzplot'          
PForm__a=. 'myplot'           
PFormhwnd__a=. wd 'qhwndp'    
PId__a=. x.
'bar' plot__a y. 
)

EACH=: &>
fr=: +/"1 @ (=/)
PolyDice=:  [: <"1[: |: [: >: [: ? ] $ [
sort=: /:~

Dice=: 3 : 0
:
Faces=. x.
'Dice Throws'=. y.
R=: +/ EACH Faces PolyDice Dice, Throws
Range=: Dice }. i. >: Faces * Dice
Nub=: sort ~. R
RangeFreq=: Range fr R
empty NubFreq=: Nub fr R
)

DICEX=: 0 : 0
pc dicex;
xywh 15 10 45 90;cc frame1 groupbox;cn "Faces ";
xywh 25 20 30 14;cc rb00 radiobutton;cn "   4";
xywh 25 35 30 14;cc rb01 radiobutton group;cn "   6";
xywh 25 50 30 14;cc rb02 radiobutton group;cn "   8";
xywh 25 65 30 14;cc rb03 radiobutton group;cn "  12";
xywh 25 80 30 14;cc rb04 radiobutton group;cn "  20";
xywh 15 110 45 55;cc frame2 groupbox;cn " Dice ";
xywh 25 120 30 14;cc rb10 radiobutton;cn " 1";
xywh 25 135 30 14;cc rb11 radiobutton group;cn " 2";
xywh 25 150 30 14;cc rb12 radiobutton group;cn " 3";
xywh 76 10 45 70;cc frame3 groupbox;cn " Rolls ";
xywh 85 20 35 14;cc rb20 radiobutton;cn "  10";
xywh 85 35 35 14;cc rb21 radiobutton group;cn "  50";
xywh 85 50 35 14;cc rb22 radiobutton group;cn " 100";
xywh 85 65 35 14;cc rb23 radiobutton group;cn " 200";
xywh 80 85 34 14;cc roll button;cn "Roll";
xywh 76 105 45 60;cc frame4 groupbox;cn " Display ";
xywh 85 115 35 14;cc rb30 radiobutton;cn "Nub";
xywh 85 130 35 14;cc rb31 radiobutton group;cn "Range";
xywh 90 145 14 14;cc ok button;cn "OK";
xywh 80 175 34 14;cc cancel button;cn "Cancel";
xywh 130 13 50 80;cc frtable editm ws_border ws_vscroll;
xywh 130 110 50 50;cc g1 isigraph;
pas 6 6;pcenter;
rem form end;
)

dicex_run=: 3 : 0
wd DICEX
wd 'setfont frtable "MS Sans Serif" 12 bold;'
wd 'pshow;'
Switch=: 0
)

dicex_roll_button=: 3 : 0
f=. ('1' = rb00,rb01,rb02,rb03,rb04) # 4 6 8 12 20
n=. ('1' = rb10,rb11,rb12) # 1 2 3
t=. ('1' = rb20,rb21,rb22,rb23) # 10 50 100 200
f Dice n,t
if. rb30 = '1' do.
   wd 'set frtable *', 6.0 WDtable Nub,.NubFreq
   'g1' WDplot NubFreq
   else.
   wd 'set frtable *', 6.0 WDtable Range,.RangeFreq
   'g1' WDplot RangeFreq
end.
Switch=: 1
)

dicex_ok_button=: 3 : 0
if. Switch do.
   if. rb30 = '1' do.
      wd 'set frtable *', 6.0 WDtable Nub,.NubFreq
      'g1' WDplot NubFreq
      else.
      wd 'set frtable *', 6.0 WDtable Range,.RangeFreq
      'g1' WDplot RangeFreq
   end.
end.
)

dicex_cancel_button=: 3 : 0
wd 'pclose;'
)


