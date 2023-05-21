NB. =========================================================
NB.%misc_j602.ijs - Miscellaneous from J602
NB.-<script src="../js/toolbox_links.js"></script>
NB.- Script: ~addons/finance/finexec/toolbox/misc_602.ijs
NB.- Contributor: J602
NB.- Updated: 2023 03 16
NB.- Depend: nil
NB.- Definitions: loaded to locale base
NB.- Status: done
NB.- <a href="../misc_j602.ijs" target="_blank">Script source: misc_j602.ijs</a> 
NB.-<hr>
NB.- Miscellaneous utilities from J602.
NB.-<hr>


NB. =========================================================
NB.  boxcols       box columns of matrix
NB.  chop          chop array into boxed list
NB.  default       set default value
NB.  diff          differences
NB.  index         index
NB.  join          join boxed items
NB.  nounsizes     nouns and their sizes
NB.  nubcount      nub + count
NB.  pathname      split filename into path;name
NB.  prompt        prompt for input
NB.  scriptform    script representation of names
NB.  show          show names using linear representation
NB.  showevents    show events
NB.  subs          substitution
NB.  tolist        convert boxed list to LF delimited list


NB. =========================================================
NB.*diff v second differences
diff=: 2&(-~/\)


NB. =========================================================
NB.*join v join boxed items
join=: ,.&.>/


NB. =========================================================
NB.*nubcount v nub + count
nubcount=: ~. ;"_1 #/.~


NB. =========================================================
NB.*pathname v split filename into path;name
pathname=: 3 : '(b#y);(-.b=.+./\.y=PATHSEP_j_)#y'


NB. =========================================================
NB.*tolist v convert boxed list to LF delimited list
tolist=: }. @ ; @: (LF&, @ , @ ": each)


NB. =========================================================
NB.*boxcols v box columns of matrix
NB. y is a matrix
NB. x indicates partitions
NB.   - a single integer is size of each partition
NB.   - a boolean is beginning of each partition
NB. examples:
NB.    boxcols i.3 4
NB.
NB.    3 boxcols i.3 7
NB. +--------+--------+--+
NB. | 0  1  2| 3  4  5| 6|
NB. | 7  8  9|10 11 12|13|
NB. |14 15 16|17 18 19|20|
NB. +--------+--------+--+
NB.
NB.    1 0 1 0 0 0 1 boxcols i.3 7
NB. +-----+-----------+--+
NB. | 0  1| 2  3  4  5| 6|
NB. | 7  8| 9 10 11 12|13|
NB. |14 15|16 17 18 19|20|
NB. +-----+-----------+--+
boxcols=: 3 : 0
('';1) <;.1 y
:
if. 0 e. x e. 0 1 do.
  ('';({:$y) $ x {. 1) <;.1 y
else.
  ('';x) <;.1 y
end.
)


NB. =========================================================
NB.*chop v chop array into boxed list
NB. chop character vector or matrix into boxed list.
NB. x is optional delimiter, default LF if in text, else blank.
NB. If a matrix, the delimiter must be vertically aligned,
NB. otherwise use chop"1 to chop each row of the matrix.
NB. e.g.  chop ": 10 20 30
NB.       chop ": i. 5 4
chop=: 3 : 0
y chop~ (' ',LF) {~ LF e. ,y
:
if. 2>#$y
do.
  (<'') -.~ (y e.x) <;._2 y=. y,{.x
else.
  |: &.> y -. {: y=. (*./y e.x) <;._2 |: y=. y,"1 [ 2${.x
end.
)


NB. =========================================================
NB.*default v set default value
NB. name default value
NB. set global name to value if not already defined
default=: 4 : 0
nc=. 4!:0 <x
if. _1=nc do. ".x,'=: y'
elseif. _2=nc do. 'invalid name: ',":,x
end.
empty''
)


NB. =========================================================
NB.*index v index where result is _1 if not found, instead of #x
NB. example:
NB.    'abc' index 'ce'
NB.  2 _1
index=: #@[ (| - =) i.


NB. =========================================================
NB.*nounsizes v noun sizes
NB.
NB. returns global nouns and their 3!:1 sizes,
NB. in descending order of size
NB.
NB. argument is a list of locales, default all if empty.
NB.
NB. example:
NB.
NB.     3 {. nounsizes''
NB.  17824 rxpatterns_jregex_
NB.   8360 PUBLIC_j_
NB.   8296 PJFILES_jproject_
nounsizes=: 3 : 0
loc=. boxxopen y
if. 0=#loc do. loc=. 18!:1 [ 0 1 end.
loc=. '_'&, @ (,&'_') each loc
nms=. siz=. ''
getsiz=. # @ (3!:1) @ ". &>
for_lc. loc do.
  n=. ('nl',>lc)~ 0
  if. #n do.
    n=. n ,each lc
    nms=. nms, n
    siz=. siz, #@(3!:1)@".&> n
  end.
end.
(\:siz) { (":,.siz),.' ',.>nms
)


NB. =========================================================
NB.*prompt v prompt for input
NB.
NB. prompts for input, optionally with a default result
NB.
NB. form: [default] prompt prompt_text
NB.
NB. examples:
NB.    prompt 'start date: '
NB.    '2001 5 23' prompt 'start date: '
NB.
NB. Note: the default is not available in jconsole.
prompt=: 3 : 0
'' prompt y
:
if. IFCONSOLE do.
  y 1!:2 [ 4
  1!:1 ] 1
else.
  smprompt_jijs_ y;x
  inp=. 1!:1 ] 1
  len=. #y
  (len * y -: len {. inp) }. inp
end.
)


NB. =========================================================
NB.*scriptform v script representation of names
NB. representation using multi-line script form for most explicit
NB. definitions, otherwise linear representation.
NB. useful for writing object definitions to a script file.
scriptform=: 3 : 0
r=. ''
dat=. cutopen y
rep=. (4!:0);(5!:2);(5!:5)
dtb=. }.~ -@(i.&0)@(' '&=)@|.
edef=. 3&=@# *. e.&(0 1 2 3;"0<,':')@(2&{.)

while. #dat do.
  y=. {.dat
  dat=. }.dat
  'n b l'=. rep y

  tag=. ((>y),'=: ')&,@(,&CRLF)

  if. _2=n do. r=. r,tag 'invalid name' continue. end.
  if. _1=n do. r=. r,tag 'undefined' continue. end.
  if. edef b do.
    txt=. ;CRLF&,@dtb&.><"1 >{:b
    r=. r,tag (":n),' : 0',txt,CRLF,')'
    continue. end.
  r=. r,tag l
end.
r
)


NB. =========================================================
NB.*show v show names using a linear representation
NB. show names using a linear representation to screen width
NB. syntax:
NB.   show namelist  (e.g. show 'deb edit list')
NB.   show numbers   (from 0 1 2 3=nouns, adverbs etc)
NB.   show ''        (equivalent to show 0 1 2 3)
NB. useful for a quick summary of object definitions
show=: 3 : 0
y=. y,(0=#y)#0 1 2 3
if. (3!:0 y) e. 2 32 do. y=. cutopen y
else. y=. (4!:1 y) -. (,'y');,'y.' end.
wid=. {.wcsize ''
sub=. (1{a.)&(I. @(e.&(9 10 12 13{a.))@]})
j=. '((1<#$t)#(":$t),''$''),":,t'
j=. 'if. L. t=. ".y do. 5!:5 <y return. end.';j
j=. 'if. 0~:4!:0 <y do. 5!:5 <y return. end.';j
(wid&{. @ (,&'=: ',sub @ (3 : j))) &> y
)


NB. =========================================================
NB.*showevents v show events
NB.
NB. writes events to the session
NB.
NB. y=0 turn off
NB.    1 turn on display of sysevent
NB.    2 turn on display of wdq
showevents=: 3 : 0
select. {. y,1
case. 0 do.
  4!:55 <'wdhandler_debug_z_'
case. 1 do.
  wdhandler_debug_z_=: 3 : 'smoutput sysevent'
case. 2 do.
  wdhandler_debug_z_=: 3 : 'smoutput wdq'
end.
i.0 0
)


NB. =========================================================
NB.*subs c substitution
NB. form: new (old subs test) data
NB. examples:
NB.    10 (2 subs =) 1 3 2 1 5 2
NB. 1 3 10 1 5 10
NB.    10 (2 subs <:) 1 3 2 1 5 2
NB. 1 10 10 1 10 10
NB. (from David Alis)
subs=: 2 : 0
:
x (I. m v y) } y
)
