NB. =========================================================
NB.%select.ijs - Selecting data form a list
NB.-<script src="../js/toolbox_links.js"></script>
NB.- Script: ~addons/finexec/finexec/toolbox/select.ijs
NB.- Contributor: William Szuch
NB.- Updated: 2022 6 26
NB.- Depend: nil
NB.- Definitions: loaded to locale base
NB.- Status: done
NB.- <a href="../select.ijs" target="_blank">Script source: select.ijs</a> 
NB.-<hr>
NB.- Definitions for selecting data from a list. 
NB.-<hr>


NB. =========================================================
NB.*sel d -
NB.- <b>Form:</b> tacit
NB.-Select one or more items from a list.
NB.-syntax:
NB.+(I)sel(L)
NB.+I = index numbers for items to be selected from the list: index numbers start at 0
NB.+L = list of items
NB.-example:
NB.+   (0)sel(1;2;3;4)
NB.+┌─┐
NB.+│1│
NB.+└─┘
NB.-
NB.+   (0 2 1)sel(1 2 3 4 5)
NB.+1 3 2 
NB.- 
NB.+   (3)sel(1;2;3;'asd';'fgh')
NB.+┌───┐
NB.+│asd│
NB.+└───┘
NB.-
NB.+   (0 1 2)sel(1;2;3;'asd';'fghijk')
NB.+┌─┬─┬─┐
NB.+│1│2│3│
NB.+└─┴─┴─┘
NB.-
NB.+   (3 4)sel(1;2;3;'asd';'fghijk')
NB.+┌───┬──────┐
NB.+│asd│fghijk│
NB.+└───┴──────┘
NB. ---------------------------------------------------------
sel =: {


NB. =========================================================
NB.*selb d -
NB.- <b>Form:</b> tacit
NB.- Select one or more items from a list of items and unbox. 
NB.-syntax:
NB.+(I)selb(L)
NB.+I = index numbers of items to be selected: index numbers start at 0
NB.+L = list of items
NB.-example:
NB.+   (0)selb(1;2;3;4)
NB.+1
NB.-
NB.+   (3)selb(1;2;3;'asd';'fgh')
NB.+asd
NB.-
NB.+   (0 1 2)selb(1;2;3;'asd';'fghijk')
NB.+1 2 3
NB.-
NB.+   (3 4)selb(1;2;3;'asd';'fghijk')
NB.+asd   
NB.+fghijk
NB. ---------------------------------------------------------
selb =:  > @: {


NB. =========================================================
NB.*selb1 m -
NB.- <b>Form:</b> tacit
NB.- Select the 1st item from a list of items and unbox.
NB.-syntax: 
NB.+selb1(L)
NB.+L = list of items
NB.-example:
NB.+   selb1(1;2;3;4;5)
NB.+1
NB.- 
NB.+   selb1('asd';2;3;4;5)
NB.+asd
NB. ---------------------------------------------------------
selb1 =: >@:(0&{)


NB. =========================================================
NB.*selb2 m -
NB.- <b>Form:</b> tacit
NB.- select the 2nd item from a list of items and unbox.
NB.-syntax: 
NB.+selb2(L)
NB.+L = list of items
NB.-example:
NB.+   selb2(1;2;3;4;5)
NB.+2
NB.- 
NB.+   selb2('asd';'dfg';3;4;5)
NB.+dfg
NB. ---------------------------------------------------------
selb2 =: >@:(1&{)


NB. =========================================================
NB.*selb3 m -
NB.- Select the 3rd item from a list of items and unbox.
NB.-syntax: 
NB.+selb3(L)
NB.+L = list of items
NB.-example:
NB.+   selb3(1;2;3;4;5)
NB.+3
NB.- 
NB.+   selb3('asd';'dfg';'hjk';4;5)
NB.+hjk
NB. ---------------------------------------------------------
selb3 =: >@:(2&{)


NB. =========================================================
NB.*selb4 m -
NB.- <b>Form:</b> tacit
NB.- Select the 4th item from a list of items and unbox.
NB.-syntax: 
NB.+selb4(L)
NB.+L = list of items
NB.-example:
NB.+   selb4(1;2;3;4;5)
NB.+4
NB.- 
NB.+   selb4('asd';'dfg';'hjk';'qqq';5)
NB.+qqq
NB. ---------------------------------------------------------
selb4 =: >@:(3&{)


NB. =========================================================
NB.*selb5 m -
NB.- <b>Form:</b> tacit
NB.- Select the 5th item from a list of items and unbox.
NB.-syntax: 
NB.+selb5(L)
NB.+L = list of items
NB.-example:
NB.+   selb5(1;2;3;4;5)
NB.+4
NB.- 
NB.+   selb5('asd';'dfg';'hjk';'qqq';'www')
NB.+www
NB. ---------------------------------------------------------
selb5 =: >@:(4&{)


NB. =========================================================
NB.*selx0 d -
NB.- <b>Form:</b> tacit
NB.- Select all left items from left and right lists of items.
NB.-syntax:
NB.+(L)selx0(R)
NB.+L = left list of items
NB.+R = right list of items
NB.-example:
NB.+   (1 2 3 4 5)selx0(6 7 8 9 10)
NB.+1 2 3 4 5
NB.-
NB.+   (1 2 3 4;5)selx0(6 7 8 9 10)
NB.+┌───────┬─┐
NB.+│1 2 3 4│5│
NB.+└───────┴─┘
NB. ---------------------------------------------------------
selx0 =: [



NB. =========================================================
NB.*selx1 d -
NB.- <b>Form:</b> tacit
NB.- Select 1st left item from left and right lists of items.
NB.-syntax:
NB.+(L)selx1(R)
NB.+L = left list of items
NB.+R = right list of items
NB.-example:
NB.+   (1 2 3 4 5)selx1(6 7 8 9 10)
NB.+1
NB.-
NB.+   (1 2 3 4;5)selx1(6 7 8 9 10)
NB.+┌───────┬
NB.+│1 2 3 4│
NB.+└───────┴
NB. ---------------------------------------------------------
selx1 =: 0&{@:[


NB. =========================================================
NB.*selx2 d -
NB.- <b>Form:</b> tacit
NB.- Select 2nd left item from left and right lists of items.
NB.-syntax:
NB.+(L)selx2(R)
NB.+L = left list of items
NB.+R = right list of items
NB.-example:
NB.+   (1 2 3 4 5)selx2(6 7 8 9 10)
NB.+2
NB.-
NB.+   (1 2 3 4;5;6;7;8)selx2(6 7 8 9 10)
NB.+┌─┐
NB.+│5│
NB.+└─┘
NB. ---------------------------------------------------------
selx2 =: 1&{@:[


NB. =========================================================
NB.*selx3 d -
NB.- <b>Form:</b> tacit
NB.- Select 3rd left item from left and right lists of items.
NB.-syntax:
NB.+(L)selx3(R)
NB.+L = left list of items
NB.+R = right list of items
NB.-example:
NB.+   (1 2 3 4 5)selx3(6 7 8 9 10)
NB.+3
NB.-
NB.+   (1 2 3 4;5;6;7;8)selx3(6 7 8 9 10)
NB.+┌─┐
NB.+│6│
NB.+└─┘
NB. ---------------------------------------------------------
selx3 =: 2&{@:[


NB. =========================================================
NB.*selx4 d -
NB.- <b>Form:</b> tacit
NB.- Select 4th left item from left and right lists of items.
NB.-syntax:
NB.+(L)selx4(R)
NB.+L = left list of items
NB.+R = right list of items
NB.-example:
NB.+   (1 2 3 4 5)selx4(6 7 8 9 10)
NB.+4
NB.-
NB.+   (1 2 3 4;5;6;7;8)selx4(6 7 8 9 10)
NB.+┌─┐
NB.+│7│
NB.+└─┘
NB. ---------------------------------------------------------
selx4 =: 3&{@:[


NB. =========================================================
NB.*selx5 d -
NB.- <b>Form:</b> tacit
NB.- Select 5th left item from left and right lists of items.
NB.-syntax:
NB.+(L)selx5(R)
NB.+L = left list of items
NB.+R = right list of items
NB.-example:
NB.+   (1 2 3 4 5)selx5(6 7 8 9 10)
NB.+5
NB.-
NB.+   (1 2 3 4;5;6;7;8)selx5(6 7 8 9 10)
NB.+┌─┐
NB.+│8│
NB.+└─┘
NB. ---------------------------------------------------------
selx5 =: 4&{@:[


NB. =========================================================
NB.*sely0 v -
NB.- <b>Form:</b> tacit
NB.- Select all right items.
NB.-syntax:
NB.+([L])sely0(R)
NB.+L = optional left list of items
NB.+R = right list of items
NB.-example:
NB.+   (1 2 3 4 5)sely0(6 7 8 9 10)
NB.+6 7 8 9 10
NB.-
NB.+   sely0(6 7 8 9 10)
NB.+6 7 8 9 10
NB. ---------------------------------------------------------
sely0 =: ]


NB. =========================================================
NB.*sely1 v -
NB.- <b>Form:</b> tacit
NB.- Select 1st right item.
NB.-syntax:
NB.+([L])sely1(R)
NB.+L = optional left list of items
NB.+R = right list of items
NB.-example:
NB.+   (1 2 3 4 5)sely1(6 7 8 9 10)
NB.+6 
NB.-
NB.+   sely1(6 7 8 9 10)
NB.+6
NB. ---------------------------------------------------------
sely1 =: 0&{@:]


NB. =========================================================
NB.*sely2 v -
NB.- <b>Form:</b> tacit
NB.- Select 2nd right item.
NB.-syntax:
NB.+([L])sely2(R)
NB.+L = optional left list of items
NB.+R = right list of items
NB.-example:
NB.+   (1 2 3 4 5)sely2(6 7 8 9 10)
NB.+7 
NB.-
NB.+   sely2(6 7 8 9 10)
NB.+7
NB. ---------------------------------------------------------
sely2 =: 1&{@:]


NB. =========================================================
NB.*sely3 v -
NB.- <b>Form:</b> tacit
NB.- Select 3rd right item.
NB.-syntax:
NB.+([L])sely3(R)
NB.+L = optional left list of items
NB.+R = right list of items
NB.-example:
NB.+   (1 2 3 4 5)sely3(6 7 8 9 10)
NB.+8 
NB.-
NB.+   sely3(6 7 8 9 10)
NB.+8
NB. ---------------------------------------------------------
sely3 =: 2&{@:]


NB. =========================================================
NB.*sely4 v -
NB.- <b>Form:</b> tacit
NB.- Select 4th right item.
NB.-syntax:
NB.+([L])sely4(R)
NB.+L = optional left list of items
NB.+R = right list of items
NB.-example:
NB.+   (1 2 3 4 5)sely4(6 7 8 9 10)
NB.+9 
NB.-
NB.+   sely4(6 7 8 9 10)
NB.+9
NB. ---------------------------------------------------------
sely4 =: 3&{@:]


NB. =========================================================
NB.*sely5 v -
NB.- <b>Form:</b> tacit
NB.- Select 5th right item.
NB.-syntax:
NB.+([L])sely5(R)
NB.+L = optional left list of items
NB.+R = right list of items
NB.-example:
NB.+   (1 2 3 4 5)sely5(6 7 8 9 10)
NB.+10 
NB.-
NB.+   sely5(6 7 8 9 10)
NB.+10
NB. ---------------------------------------------------------
sely5 =: 4&{@:]


