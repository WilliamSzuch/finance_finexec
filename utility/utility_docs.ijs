NB. =========================================================
NB. header for main page index.htm
IndexHdr=: 0 : 0
<h1>finexec: Category: Utility</h1>
Script: ~addons/finance/finexec/utility/utility_docs.ijs<br>
Utitliies for developing definitions or loading for a as part of project.<br>
<a class="HREF" href="../../finexec_category.html" target="_blank">Finexec: Category</a>
<hr>
)


NB. =========================================================
require 'docs/joxygen'


NB. =========================================================
NB. Build the docs. 
smoutput <'*** Start: utility_docs ***'


NB. =========================================================
NB. This builds the html files in the Target directory.


NB. source directory (used to find source files,
NB. but not used in the html docs)
Source=: jpath '~addons/finance/finexec/utility'


NB. target directory
Target=: jpath '~addons/finance/finexec/utility/docs'


NB. =========================================================
NB. Erase all files in the Target folder 
ferase each  1 dir Target


NB. source files under the source directory
NB. (may be more than one level down)
NB. =========================================================
Files =: cutopen 0 : 0
bisection.ijs
boxed_table.ijs
list.ijs
numeric.ijs
save_retrieve_data.ijs
select.ijs
text_to_numeric.ijs
)


NB. ensure the Target directory is created
mkdir_j_ Target

NB. copy the css file to the Target directory
(Target,'/joxygen.css') fcopynew '~addons/docs/joxygen/joxygen.css'

NB. make the docs
makedocs''

smoutput <'*** End: utility_docs ***'
