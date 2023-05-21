NB. =========================================================
NB.%conversions.ijs - Various conversions
NB.-<script src="../js/toolbox_links.js"></script>
NB.- Script: ~addons/finance/finexec/toolbox/conversions.ijs
NB.- Contributor: William Szuch
NB.- Updated: 2023 04 21
NB.- Depend: nil
NB.- Definitions: loaded to locale base
NB.- Status: done
NB.- <a href="../conversions.ijs" target="_blank">Script source: conversions.ijs</a> 
NB.-<hr>
NB.- Definitions for conversions eg to a scalar.
NB.-<hr>


NB. =========================================================
NB.*toscalar m -
NB.- <b>Type:</b> tacit
NB.- Create a scalar from non scalar item with $ = 1.
NB.-syntax:
NB.+toscalar(Z)
NB.+Z = non scalar with $ = 1
NB.-example:
NB.+   toscalar (,12)
NB.+12 
NB.-
NB.+   toscalar (,'A')
NB.+A
NB.-
NB.+ T =: 4 5 $ '1 2 3 4'
NB.+   data(T)
NB.+1 2 3 41 2 3 41 2 3
NB. ---------------------------------------------------------
toscalar =: 0&{@:,



NB. =========================================================
NB.*isscalar m -
NB.- <b>Type:</b> tacit
NB.- Test if scalar.
NB.-    1 = is a scalar
NB.-    0 = scalar
NB.-syntax:
NB.+toscalar(Z)
NB.+Z = item to be tested:
NB.-example:
NB.+   isscalar (,12)
NB.+1
NB.- 
NB.+   isscalar (12)
NB.+0
NB.-
NB.+   isscalar (,'A')
NB.+1
NB. ---------------------------------------------------------
isscalar =: 1 = #@$