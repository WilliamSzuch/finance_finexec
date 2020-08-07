NB. =========================================================
NB.%text_to_numeric.ijs - Text data to numeric data
NB.-<hr>
NB.-<a class="HREF" href="../../finexec_addon.html" target="_blank">Addon</a>
NB.-<a class="HREF" href="../../finexec_category.html" target="_blank">Category</a>
NB.-<a class="HREF" href="index.htm" target="_blank">Toolbox</a>
NB.-<hr>
NB.- Script: ~addons/finance/finexec/toolbox/test_to_numeric.ijs
NB.- Contributor: William Szuch
NB.- Updated: 31/7/2020
NB.- Depend: nil
NB.- Definitions: loaded to locale base
NB.- Status: done:
NB.- <a href="../text_to_numeric.ijs" target="_blank">Script source: text_to_numeric</a> 
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

