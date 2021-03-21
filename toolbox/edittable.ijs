NB. =========================================================
NB.%edittable.ijs - Edit a table of data using QTableWidget
NB.-<hr>
NB.-<a href="http://www.finexec.com.au" target="_blank">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_doc.html" target="_blank">Documentation | </a>
NB.-<a class="HREF" href="../../finexec_cat.html" target="_blank">Category | </a>
NB.-<a class="HREF" href="index.htm" target="_blank">Toolbox</a>
NB.-<hr>
NB.- Script: ~addons/finance/finexec/toolbox/edittable.ijs
NB.- Contributor: William Szuch
NB.- Updated: 27/2/2021
NB.- Depend: nil
NB.- Definitions: loaded to locale base
NB.- Status: done
NB.- <a href="../ntable.ijs" target="_blank">Script source: edittable.ijs</a> 
NB.-<hr>
NB.- Definitions to create, edit and show table data:
NB.-    numeric - undoxed and boxed
NB.-    text - boxed
NB.-    numeric/text - boxed 
NB.- Using QTableWidget.
NB.- Edit one cell at a time.
NB.-note:
NB.- Modify to:
NB.- allow copy/paste from table
NB.- use for transfer of data from J to Excel.
NB.- See: showtable
NB.-<hr>


NB. =========================================================
Note 'Utilities'
toLF=: [:;(LF,~":)each
inverse =: ^:_1
towords=: ;: ^:_1
SOH =: 1{a.
toSOH =: [:;(SOH,~":)each
tz =: [`".@.([: # ".)
)


NB. =========================================================
NB.*edittable v -
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> nil
NB.-syntax:
NB.+edittable(D)
NB.+D = data table: unboxed or boxed table
NB.+    numeric - undoxed and boxed
NB.+    text - boxed
NB.+    numeric/text - boxed 
NB.+    saved as NEWTABLE on exit
NB.+    NEWTABLE is boxed with numeric and text data 
NB.-example: 
NB.+ Sample data tables
NB.+ A =: i. 10 10
NB.+ A1 =: <"0 i. 10 10
NB.+ B =: 10 10 $ <'Text' 
NB.+ C =: A1,.B
NB.- 
NB.+  edittable i. 6 6        NB. Numeric data table
NB.+  >NEWTABLE               NB. Numeric data table 
NB.-
NB.+  edittable 5 6 $ <'Text' NB. Text data table
NB.+  NEWTABLE
NB.-
NB.+  edittable A
NB.+  edittable A1
NB.+  edittable B
NB.+  edittable C
NB.-
NB.+ Create a table
NB.+ edittable 1 10 $ 0    NB. Edir to create a new table
NB. ---------------------------------------------------------
edittable=: 3 : 0
towords =. ;: ^:_1
'Rws Cls'=: $ y
Txt =. towords,8!:0 y
wd 'pc EditTable'
wd 'cc  S table ',": Rws,Cls
wd 'set S type 0'
wd 'set S data *' ,Txt
wd 'set S protect 0'
wd 'pmove 100 10 500 200'
wd 'pshow'
)


NB. =========================================================
EditTable_close=: 3 : 0
tz =. [`".@.([: # ".)
NEWTABLE =: tz each (Rws,Cls) $ (< ;._2 )wd 'get S table'
wd 'pclose'
)





