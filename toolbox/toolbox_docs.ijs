NB. =========================================================
NB. header for main page index.htm
IndexHdr=: 0 : 0
<h1>finexec: Category: Toolbox</h1>
<hr>
<a class="HREF" href="../../finexec_addon.html" target="_blank">Addon</a>
<a class="HREF" href="../../finexec_category.html" target="_blank">Category</a>
<hr>
Script: ~addons/finance/finexec/toolbox/toolbox_docs.ijs<br>
Updated: 5/8/2020<br>
Toolbox of definitions for developing new projects and definitions.<br>
<hr>
)


NB. =========================================================
require 'docs/joxygen'


NB. =========================================================
NB. Build the docs. 
smoutput <'*** Start: toolbox_docs ***'


NB. =========================================================
NB. This builds the html files in the Target directory.


NB. source directory (used to find source files,
NB. but not used in the html docs)
Source=: jpath '~addons/finance/finexec/toolbox'


NB. target directory
Target=: jpath '~addons/finance/finexec/toolbox/docs'


NB. =========================================================
NB. Erase all files in the Target folder 
ferase each  1 dir Target


NB. source files under the source directory
NB. (may be more than one level down)
NB. =========================================================
Files =: cutopen 0 : 0
bisection.ijs
boxed_table.ijs
color.ijs
lists.ijs
numeric.ijs
plots.ijs
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

smoutput <'*** End: toolbox_docs ***'
