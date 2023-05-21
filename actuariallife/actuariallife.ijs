NB. =========================================================
NB.%actuariallife.ijs - Loads scripts from category: Actuarial Life
NB.-<script src="../js/actuariallife_links.js"></script>
NB.- Script: ~addons/finance/finexec/actuariallife/actuariallife.ijs
NB.- Updated: 2023 03 17
NB.- <a href="../actuariallife.ijs" target="_blank">Script source: actuariallife.ijs</a>
NB.-<hr>


NB. =========================================================
AL =. '~addons/finance/finexec/actuariallife/'
load AL,'lifeannuities.ijs'          
load AL,'lifeinsurance.ijs'          
load AL,'lifetable.ijs'              
load AL,'lifetable_multiplelives.ijs'
smoutput <'Actuarial Life scripts loaded'


