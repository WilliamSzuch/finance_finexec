NB. =========================================================
NB.%text_to_numeric.ijs - Text data to numeric data
NB.-<hr>
NB.-<a href="http://www.finexec.com.au">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_lib.html">Library | </a>
NB.-<a class="HREF" href="index.htm">Toolbox</a>
NB.-<hr>
NB.- Script: ~addons/finance/finexec/toolbox/test_to_numeric.ijs
NB.- Contributor: William Szuch
NB.- Updated: 2022-05-22
NB.- Depend: nil
NB.- Definitions: loaded to locale base
NB.- Status: done:
NB.- <a href="../text_to_numeric.ijs" target="_blank">Script source: text_to_numeric.ijs</a> 
NB.-<hr>
NB.- Definitions to convert text data to numeric data.
NB.-<hr>


NB. =========================================================
NB.*data m -
NB.- <b>Type:</b> tacit
NB.- Create numeric data from a text noun.
NB.- Negative numbers to be in the format using underscore: _10 _12.1
NB.-syntax:
NB.+data(T)
NB.+T = numeric text data as a list or array
NB.-example:
NB.+   data('12 12.1 0.1') 
NB.+12 12.1 0.1
NB.-
NB.+   data('12 12.1 0.1 _10.1') 
NB.+12 12.1 0.1 _10.1
NB.-
NB.+ T =: 4 5 $ '1 2 3 4'
NB.+   data(T)
NB.+1 2 3 41 2 3 41 2 3
NB. ---------------------------------------------------------
data =: ([: ". rplc&(LF;' '))


NB. =========================================================
NB.*datas m -
NB.- <b>Type:</b> tacit
NB.- Create numeric data from a text noun.
NB.- Negative numbers can be in the format -12.0 -10.123 and underscore: _10 _12.1.
NB.-syntax:
NB.+data1(T)
NB.+T = numeric text data as a list or array
NB.-example:
NB.+   datas('12 12.1 -0.1') 
NB.+12 12.1 0.1 
NB.-
NB.+   datas('12 12.1 -0.1 -23.234 _10.1 ') 
NB.+12 12.1 0.1 _10.1
NB. ---------------------------------------------------------
datas =: ([: > [:  ". each ([: cut rplc&(LF;' ')))



NB. =========================================================
NB.*data_table m -
NB.- <b>Type:</b> tacit
NB.- Create numeric data from a text noun .
NB.- Negative numbers can be in the format -12.0 -10.123 and underscore: _10 _12.1.
NB.-syntax:
NB.+data1_table(T)
NB.+T = numeric text data created by  0 : 0
NB.-example:
NB.+ data_table DATA_TABLE
NB.+  $ DATA_TABLE
NB.+  320
NB.+  $ data_table DATA_TABLE 
NB.+ 8 8
NB. ---------------------------------------------------------
data_table =: [: > [: ".&.> (10{a.) cut ]
NB. ---------------------------------------------------------
Note 'T data_table'
data_table =. 13 : '> ". each LF cut y'
)


NB. =========================================================
DATA_TABLE =: 0 : 0
1876  361   32   12   12   10    2   11
   0 1985  342   29   23   15    5    8
   0    0 1910  360   37   16   13    8
   0    0    0 1720  364   28   17    8
   0    0    0    0 1606  296   31   12
   0    0    0    0    0 2113  391   37
   0    0    0    0    0    0 2308  450
   0    0    0    0    0    0    0 2514
)



