NB. =========================================================
NB.%jcalc.ijs - J and Some Elementary Statistical Calculations 
NB.-<script src="../js/jsp_links.js"></script>
NB.- Script: ~addons/finance/finexec/jsp/jcalc.ijs
NB.- Updated: 2022 6 26
NB.- Depend: nil
NB.- Definitions: loaded to locale base
NB.- Status: done
NB.- <a href="../jcalc.ijs" target="_blank">Script source: jcalc.ijs</a>
NB.-<hr>
NB.-<a class="HREF" href="../calc.pdf" target="_blank">J and Some Elementary Statistical Calculations</a> 
NB.- J and Some Elementary Statistical Calculations
NB.- Keith Smillie
NB.- Department of Computing Science
NB.- University of Alberta
NB.- Edmonton, Alberta T6G 2E8
NB.- May 2001
NB.-<hr>


load 'plot'

NB. Utilities
ap=: {.@]+1&{@]*i.@{:@]
each=: &.>  
EACH=: &>
imax=: (] e. >./) # i.@#
io=: [:<:[:+/</
midpts=: [:-:2:+/\]
mp=: +/ . *                  
pos=: [: >: i.
sort=: /:~

NB. Integration utilities
W=: +:(#.|.@])"0 1|:@(0:,%.@(^/~@i)%>:@i=. i.@>:@+:)
ew=: +/@(-@(<:@(#@])*i.@[)|."0 1]{.~>:@([*<:@(#@])))
EW=: ([ ew W@]) f.
ai=: 2 : '+/@(x&space * x&[ * y@(x&grid))"0'
grid=: space *i.@#@[
space=: ] % <:@#@[
I=: (4 EW 5) ai 

NB. Introduction
w=: 2.3 5 3.5 6
am=: +/ % #
Qty=: 2 1 2 2 1 0.635
Price=: 1.19 1.19 0.59 0.59 3.89 3.95
Total=: [: +/ *
Total1=: +/ @: *

NB. Frequency tables
SampleSize=: 4 8 6 4 3 4 6 4 5 4 3 5 12 3 4 4 7 11 5 4
SentenceLength=: 11 31 45 31 12 31 39 16 21 31 36 28 31 39 31 22 33
fr=: +/"1 @ (=/)
frtab=: [,.fr
nubfr=: +/"1 @ =
nubfrtab=: ~. ,. nubfr
fr1=: [: +/"1 =/
cfr=: i.@(<:@$@[) fr io
cfrtab=: midpts@[,.cfr
D=: 5 6 4 2 6 5 5 4 1 4 5 2

NB. Frequency diagrams
bars=: #&'*' EACH @ fr
barchart=: (": EACH @ [) ,. [: ' '&,. bars
stem=: 10&* @ <. @ %&10
leaf=: 10&|
SLdiag=: ~.@stem ;"0 stem </. leaf

NB. Averages
Income=: 126 195 149 122 189 164 228 177 165 150
Income=: Income, 169 127 176 147 148 159 128 122 150 193
Income=: Income, 207 164 168 110 155 127 152 174 190 219
Income=: Income, 125 193 141 127 155 133 150 162 168 128 
Income=: Income, 125 137 146 120 154 176 166 117 154 137
gm=: # %: */
hm=: [: % [: am %
hm1=: % @ am @: %
midindices=: (<.,>.)@-:@<:@#
median=:[: am midindices { sort
mode=: imax@nubfr { ~.
u=: 22 14 32 30 19 16 28 21 25 31

NB. Variability
dev=: - am
ss=: [: +/ [: *: dev
ss1=: +/ @: *: @ dev
var=: ss % <:@#
sd=: %: @ var
Q2=: median
Q1=: [: Q2 ] #~ Q2 > ]
Q3=: [: Q2 ] #~ Q2 < ]
IQrange=: Q3 - Q1
five=: <./,Q1,Q2,Q3,>./

NB. Summary table
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
summary1=: 3 : 0
r=.  'Sample size      ',5.0 ": #y
r=. r,: 'Minimum           ', 8.3 ": <./y
r=. r, 'Maximum           ',8.3": >./y
NB. ...
r=. r, 'Geometric mean    ',8.3": gm y
)
f1=: 3 : 0  
% y
)
f2=: 3 : 0
:
x % y
)
f3a=: 3 : 0
% y
:
x % y
)
f3b=: 3 : 0
1 f3b y
:
x % y
)
frtable=: 3 : 0
nubfrtab y
:
x frtab y
)

NB. Probability distributions
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

gamma=: !@<:
ndistn=: 3 : 0
Const=. %:0.5p_1
Const * ^--:*:y
)
tdistn=: 3 : 0
:
n=. x
Const=. (gamma -:>:n) % (gamma -:n) * %:n*1p1
Const * (>:(*:y)%n) ^ --:>:n
)
csdistn=: 3 : 0
:
n=. x
Const=. % (2^-:n) * gamma -:n
Const * (y ^ -:<:<:n) * ^ --:y
)
fdistn=: 3 : 0
:
'm n'=. x
Const=. (gamma -:m+n) % (gamma -:m) * gamma -:n
Const * (m^-:m) * (n^-:n) * (y^-:<:<:m) * (n+m*y)^--:m+n
)

NB. Random variables
proll=: [: >: [: ? $
pdeal=: [: >: ?
rand=: (? % ]) @ ($&1e9)
stdnrand=: 3 : 0
r=. i. 0 2
while. y > {.$r 
   do. whilst. S >: 1
      do. V=: <:+:rand 2		 
          S=: +/ *: V
   end. 
r=. r, V * %: -+:(^.%])S
end.
)
nrand=: 3 : 0
0 1&nrand y
:
y{., ({.x) + ({:x) * stdnrand >.-:y
)
exprand=: [ * [: -@^. [: rand ]
Dice=: [: <"1 proll&6
coords=: [: rand ],2:
incircle=: [: +/ 1: >: [: +/"1 [: *: coords
PIest=: 4: * incircle % ]
cc=: * [: +/ [: % pos
ccsize=: 3 : 0
:
m=. x
n=. y
r=. i. 0
while. m > #r do.
   CCsample=: i. 0
   while. n > # ~. CCsample do.
      CCsample=: CCsample, 1 proll n
   end.
   r=. r, #CCsample
end.
)

NB. Sampling
H=: [: >: [: _1 24 49 69 84 94 99&io ?@$&100
   
NB. Correlation and regression
Water=: 12 18 24 30 36 42 48
Yield=: 5.27 5.68 6.25 7.21 8.02 8.71 8.42
sp=: [: +/ *&dev~
cov=: sp % [: <: #@]
cor=: cov % sd@[ * sd@]
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
var1=: sp~ % <:@#

NB. Chi-square 
chisq0=: [: +/@, ([: *: -) % [
expfr=: (+/"1 */ +/) % +/@,
chisq=: 3 : 0
(expfr y) chisq y
:
x chisq0 y
)
obs=: 120 48 36 13
exp=: 122.062 40.6875 40.6875 13.5625
Tab34=: >18 29 70 115;17 28 30  41;11 10 11  20	
T22=: (>2 5;3 3);(>1 6;4 2);>0 7;5 1
chisq22=: ([: }: (+/"1) , +/) hg {.@,
h0=: 0 2 2 1 0 0 1 1 0 3 0 2 1 0 0 1 0 1 0 1 0 0 0 2 0 3 0 2 0 0
h1=: 0 1 1 1 0 2 0 3 1 0 0 0 0 2 0 2 0 0 1 1 0 0 2 1 1 0 0 2 0 0
h2=: 0 0 0 1 1 1 2 0 2 0 0 0 1 0 1 2 1 0 0 0 0 1 0 1 1 1 1 0 0 0
h3=: 0 1 0 0 0 0 1 1 0 0 0 0 0 0 2 1 0 0 1 0 0 1 0 1 1 1 1 1 1 0
h4=: 0 0 1 0 2 0 0 1 2 0 1 1 3 1 1 1 0 3 0 0 1 0 1 0 0 0 1 0 1 1 
h5=: 0 0 2 0 0 2 1 0 2 0 1 0 0 0 1 0 0 1 0 0 0 0 1 0 0 0 1 1 0 1
h6=: 0 0 0 0 0 2 1 1 1 0 2 1 1 0 1 2 0 1 0 0 0 0 1 1 0 1 0 2 0 2
h7=: 0 0 0 0 2 1 3 0 1 1 0 0 0 0 2 4 0 1 3 0 1 1 1 1 2 1 3 1 3 1
h8=: 1 1 2 1 1 3 0 4 0 1 0 3 2 1 0 2 1 1 0 0 0 1 0 0 0 0 0 1 0 1
h9=: 1 0 0 0 2 2 0 0 0 0
h=: h0, h1, h2, h3, h4, h5, h6, h7, h8, h9

NB. Nonparametric methods
v=: 4.5 2 6.1 3.7
v1=: 4.5 2 4.5 6.1 2 2 3.7
French=: 83 27 42 51 53 44 47 55 61 32
German=: 74 22 49 54 48 47 55 61 59 29
MoreMarks=: 83 27 83 51 53 27 47 55 27 32
Age=: 20 42 18 21 22 35 19 18 26 20 21 32 22 20 24
uranks=: >: @ /:^:2
nranks=: (= mp uranks) % [: +/"1 =
ranks=:  [: , |:@= # nranks
invranks=: [: ranks -
rcor=: ranks@[ cor ranks@]
noteq=: 2: (~:/\) ]
runs=: [: >: +/ @ noteq

NB. Analysis of variance
T122=: 310 353 366 299 367
T122=: T122, 284 293 335 264 314
T122=: T122, 307 306 339 311 377
T122=: 4 5 $ T122, 267 308 312 266 342
aov=: 3 : 0
't r'=. $y
MEANS=: am"1 y
SStr=. t * ss am y
SSreps=. r * ss am"1 y
SStotal=. ss ,y
SSerror=. SStotal - SSreps + SStr
DFtr=. <:r
DFreps=. <:t
DFerror=. DFtr*DFreps
DFtotal=. <:t*r
MSreps=. SSreps%DFreps
MStr=: SStr%DFtr
MSerror=. SSerror%DFerror
Ftr=. MStr%MSerror
Freps=: MSreps%MSerror
r=. 1 43 $ 'Treatments',4.0 12.4 10.4 7.2":DFtr,SStr,MStr,Ftr
r=. r, 43{.'Blocks    ',4.0 12.4 10.4 7.2":DFreps,SSreps,MSreps,Freps
r=. r, 43{.'Error     ',4.0 12.4 10.4":DFerror,SSerror,MSerror
r=. r, 43{.'Total     ',4.0 12.4":DFtotal,SStotal
)

NB. Coin Tossing
Toss=: 3 : 0
N=: y
TossNum=: >: i. N
Heads=: +/\?N$2
Ratio=: Heads % TossNum
empty Diff=: |TossNum - 2*Heads
)

NB. Windows form 
WDtable=: 3 : 0               
:          
;(<"1 (x ": y)), each LF
)

FREQTAB=: 0 : 0
pc freqtab;
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

freqtab_run=: 3 : 0
wd FREQTAB
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

freqtab_ok_button=: 3 : 0
data1=: ". data
('f w n')=: ". first,' ',width,' ',number
('s0 s1 s2 s3')=: (#,<./,am,>./) data1
wd 'set samplesize *',7.0&":s0
wd 'set minimum *',7.0&":s1
wd 'set avg *',7.2&":s2
wd 'set maximum *',7.0&":s3
table=: ((f--:w) + w*i.>:n) cfrtab data1
wd 'set freqtable *',6.1 6.0 WDtable table
)

freqtab_reset_button=: 3 : 0
Reset ''
)

freqtab_close=: 3 : 0
wd'pclose'
)

freqtab_cancel_button=: 3 : 0
freqtab_close''
)
