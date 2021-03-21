NB. =========================================================
NB.%showtable.ijs - show table data using QTableWidget
NB.-<hr>
NB.-<a href="http://www.finexec.com.au" target="_blank">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_doc.html" target="_blank">Documentation | </a>
NB.-<a class="HREF" href="../../finexec_cat.html" target="_blank">Category | </a>
NB.-<a class="HREF" href="index.htm" target="_blank">Toolbox</a>
NB.-<hr>
NB.- Script: ~addons/finance/finexec/toolbox/showtable.ijs
NB.- Contributor: William Szuch
NB.- Updated: 28/2/2021
NB.- Depend: dev:
NB.- Definitions: loaded to locale base
NB.- Status: dev:
NB.- <a href="../showtable.ijs" target="_blank">Script source: showtable.ijs</a> 
NB.-<hr>
NB.- Definition to show tables of data:
NB.-    numeric - undoxed and boxed
NB.-    text - unboxed and boxed
NB.-    numeric/text - boxed 
NB.- Using QTableWidget.
NB.- Modify to use for transfer of data from J to Excel.
NB.- See: edittable
NB.-<hr>


NB. =========================================================
Note 'Utilities'
toLF=: [:;(LF,~":)each
inverse =: ^:_1
towords=: ;: ^:_1
SOH =: 1{a.
toSOH =: [:;(SOH,~":)each
)


NB. =========================================================
NB.*showtable m -
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> nil
NB.-syntax:
NB.+ntable(D)
NB.+D = data table: unboxed or boxed to be shown
NB.-example: 
NB.+  showtable i. 10 10
NB.+  showtable <"0 ? 10 10 $ 10000
NB.+  showtable 1 1 $ 1000
NB.-
NB.+  showtable ? 1000 1000 $10000
NB.+  Slower than  ngrid for large data tables.
NB.-
NB.+  showtable <"0 [12 12 $'A'
NB.+  showtable  12 12 $<'A'
NB.+  showtable (<"0 i. 12 12)[showtable (12 12 $ <'AB')
NB.-
NB.+  A =: i. 4 4
NB.+  B =: 3 3 $ <'ASD' 
NB.+  showtable A[showtable B
NB. ---------------------------------------------------------
showtable=: 3 : 0
towords=: ;: ^:_1
'Rws Cls'=: $ y
Txt =: towords,8!:0 y
wd 'pc ShowTable'
wd 'cc  S table ',": Rws,Cls
wd 'set S type 0'
wd 'set S data *' ,Txt
wd 'pmove 100 10 500 200'
wd 'pshow'
)


NB. =========================================================
ShowTable_close=: 3 : 0
wd 'pclose'
)

