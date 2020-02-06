NB. =========================================================
NB.%boxed_table.ijs - Build a boxed table of data 
NB.- Script: ~addons/finance/finexec/utility/boxed_table.ijs
NB.- Contributor: William Szuch
NB.- Updated: 6/2/2020
NB.- Depend: nil
NB.- Definitions: loaded to locale base
NB.-<hr>
NB.- <a class="HREF" href="index.htm" target="_blank">Category: Utility</a>
NB.- <a class="HREF" href="../../finexec_category.html" target="_blank">Finexec: Category</a>
NB.-<hr>
NB.- Build a boxed table of data of numbers or characters that can be  
NB.- used as input to a definition.
NB.- <a href="../boxed_table.ijs" target="_blank">Script source: boxed_table.ijs</a> 
NB.-<hr>


NB. =========================================================
NB.*boxedtable m -
NB.- <b>Form:</b> tacit
NB.- Build a boxed table from lists of pairs of numbers or chatacters.
NB.-syntax:
NB.+boxedtable(L1;L2)
NB.+L1 = list of numbers or characters
NB.+L2 = list of numbers or characters
NB.+L1 and L2 to be of the same different type: numbers and or characters
NB.-example:
NB.+   boxedtable(1 2;3 4 5)
NB.+┌─────┬─────┬─────┐
NB.+│┌─┬─┐│┌─┬─┐│┌─┬─┐│
NB.+││1│3│││1│4│││1│5││
NB.+│└─┴─┘│└─┴─┘│└─┴─┘│
NB.+├─────┼─────┼─────┤
NB.+│┌─┬─┐│┌─┬─┐│┌─┬─┐│
NB.+││2│3│││2│4│││2│5││
NB.+│└─┴─┘│└─┴─┘│└─┴─┘│
NB.+└─────┴─────┴─────┘
NB.- 
NB.+   boxedtable('ab';'cde')
NB.+┌─────┬─────┬─────┐
NB.+│┌─┬─┐│┌─┬─┐│┌─┬─┐│
NB.+││a│c│││a│d│││a│e││
NB.+│└─┴─┘│└─┴─┘│└─┴─┘│
NB.+├─────┼─────┼─────┤
NB.+│┌─┬─┐│┌─┬─┐│┌─┬─┐│
NB.+││b│c│││b│d│││b│e││
NB.+│└─┴─┘│└─┴─┘│└─┴─┘│
NB.+└─────┴─────┴─────┘
NB.-
NB.+   boxedtable( 'ab';4 5 6)
NB.+┌─────┬─────┬─────┐
NB.+│┌─┬─┐│┌─┬─┐│┌─┬─┐│
NB.+││a│4│││a│5│││a│6││
NB.+│└─┴─┘│└─┴─┘│└─┴─┘│
NB.+├─────┼─────┼─────┤
NB.+│┌─┬─┐│┌─┬─┐│┌─┬─┐│
NB.+││b│4│││b│5│││b│6││
NB.+│└─┴─┘│└─┴─┘│└─┴─┘│
NB.+└─────┴─────┴─────┘
NB. ---------------------------------------------------------
boxedtable =: <"1@:(>@:(0&{) ;"0/ >@:(1&{))
NB. ---------------------------------------------------------
Note 'T boxedtable'
selb1 =. >@:(0&{)   NB. select 1st boxed item
selb2 =. >@:(1&{)   NB. select 2nd boxed item
boxedtable =. (<"1 @: (selb1 ;"0/  selb2)) f. 
)


