NB. =========================================================
NB. header for main page index.htm
IndexHdr=: 0 : 0
<h1>Finexec: Category: Qx Tables (Mortality tables)</h1>
<hr>
<a class="HREF" href="../../finexec_addon.html" target="_blank">Addon</a>
<a class="HREF" href="../../finexec_category.html" target="_blank">Category</a>
<hr>
Script: ~addons/finance/finexec/qxtables/qxtables_docs.ijs<br>
Updated: 28/7/2020<br>
Definitions for loading, modifying and plotting Qx tables.<br>
Qx tables (mortality tables) can be loaded for a project.<br>
<hr>
<pre>
Some conventions with respect to the Qx tables.
Qx table is the name of table that is a list of the 
probability of dying within a year for ages from 0 ... Z 
Ages are integer.
Qx tables are taken from the published material and not modified or extended
For the list of names of all the Qx tables: Qx_ALL.
For the list of the names of all Australian Life Tables Qx tables: Qx_ALT.

Tables in Excel format:
~addons/finance/finexec/qxtables/excel/qxtables.xlsx
</pre>
<hr>
)


require 'docs/joxygen'


NB. =========================================================
NB. Build the docs. 
smoutput <'Start: qxtables_docs'


NB. =========================================================
NB. This builds html docs in the Target directory.


NB. source directory (used to find source files,
NB. but not used in the html docs)
Source=: jpath '~addons/finance/finexec/qxtables'


NB. target directory
Target=: jpath '~addons/finance/finexec/qxtables/docs'


NB. =========================================================
NB. Erase all files in the Target folder 
ferase each  1 dir Target


NB. source files under the source directory
NB. (may be more than one level down)
Files=: cutopen 0 : 0
al.ijs
alt.ijs
ann.ijs
elt.ijs
qxtools.ijs
)


NB. ensure the Target directory is created
mkdir_j_ Target

NB. copy the css file to the Target directory
(Target,'/joxygen.css') fcopynew '~addons/docs/joxygen/joxygen.css'

NB. make the docs
makedocs''

smoutput <'End: qxtables_docs'
