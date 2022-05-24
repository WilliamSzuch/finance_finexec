NB.%phrb13.ijs - J Phrases Section 13B. Character
NB.-<hr>
NB.-<a href="http://www.finexec.com.au">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_lib.html">Library | </a>
NB.-<a class="HREF" href="index.htm">J Phrases</a>
NB.-<hr>
NB.- <a href="../phrb13.ijs" target="_blank">Script source: phrb13.ijs</a>
NB.-<hr>


m0=: >:@(=&'''')#]                 NB. Double quotes in y (for execute)
m1=: \:' '&~:                      NB. Move all blanks to end of list
m2=: /:' '&=                       NB. Move all blanks to end of list
m3=: \:' '&=                       NB. Move all blanks to beginning of list
m4=: /:' '&~:                      NB. Move all blanks to beginning of list
m5=: [: -. 1: #.~ 1: , ' '"_ = ]   NB. Negative of count of trailing blanks in y
m6=: (m5 |. ])"1                   NB. Justify y right
m7=: ' '&=                         NB. Locate blanks in y
d8=: [:+/[<:/~([:m7])#[:i.[:#]     NB. Word index in y from character index x
m9=: -@<.@-:@(+/)@(*./\.)@(' '&=)  NB. Rotation for centering left justified text
m10=: m9"1 |."_1 ]                 NB. Center left justified text
m11=: ] |.~ -@(+/)@(*./\.)@(' '&=) NB. Justify right
m12=: ] |.~   (+/)@(*./\ )@(' '&=) NB. Justify left
m13=: +/\@}:@(-//.@('()'"_ =/ ]))  NB. Depth of parentheses in y
d14=: <.@-:@([ - #@]) |. -@[ {. ]  NB. Center y in field x wide
