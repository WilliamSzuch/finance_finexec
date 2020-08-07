NB. =========================================================
NB.%color.ijs - Show colors in rgb/hexadecimal and number formats
NB.-<hr>
NB.-<a class="HREF" href="../../finexec_addon.html" target="_blank">Addon</a>
NB.-<a class="HREF" href="../../finexec_category.html" target="_blank">Category</a>
NB.-<a class="HREF" href="index.htm" target="_blank">Toolbox</a>
NB.-<hr>
NB.- Script: ~addons/finance/toolbox/color.ijs
NB.- Contrinutor: William Szuch
NB.- Updated: 31/7/2020
NB.- Depend: ~addons/graphics/viewmat/viewmat.ijs
NB.- Definitions: loaded to locale base
NB.- Status: done:
NB.- <a href="../color.ijs" target="_blank">Script source: color.ijs</a>
NB.-<hr>
NB.- Show the color for rgb/hexadecimal and number formats.  
NB.-   rgb triplet eg: 100 50 150
NB.-   hexadecimal number as text eg: 'aaaaaa'
NB.-   number < 256^3
NB.- Convert between number/hexadecimal and RGB 
NB.- Useful for selecting colors for web pages.
NB.- <a href="../colortables/colorx256.html" target="_blank">View: color table 256</a>
NB.- <a href="../colortables/colortab.html" target="_blank">View: color table</a>
NB.- See folder: ~addons/graphics/color
NB.-<hr>


require 'viewmat'


NB. =========================================================
NB.*numbertorgb m -
NB.- <b>Form:</b> tacit
NB.- Convert number to rgb color triplet.
NB.-syntax:
NB.+numbertorgb(N)  
NB.+N = number in the range (0,-1+256^3)
NB.-example:
NB.+  numbertorgb(6579300)
NB.+100 100 100
NB.-
NB.+  numbertorgb(0)
NB.+0 0 0 
NB.-
NB.+  numbertorgb(_1+256^3)
NB.+255 255 255
NB. ---------------------------------------------------------
numbertorgb =: 256 256 256 &#:


NB. =========================================================
NB.*rgbtonumber m -
NB.- <b>Form:</b> tacit
NB.- Convert rgb color triplet to a number.
NB.-syntax:
NB.+rgbtonumber(N)
NB.+N = rgb triplet in the range (0 0 0)...(255 255 255)
NB.-example:
NB.+  rgbtonumber(100 100 100)
NB.+6579300
NB.-
NB.+  rgbtonumber(0 0 0)
NB.+0
NB. ---------------------------------------------------------
rgbtonumber =: 256 256 256 &#.


NB. =========================================================
NB.*hextonumber m -
NB.- <b>Form:</b> tacit
NB.- Convert a hexadecimal number to a number
NB.-syntax:
NB.+ hextonumber(H)
NB.+H = hexadecimal number as text ie: 'asd'
NB.-example:
NB.+   hextonumber('aaaaaa') 
NB.+11184810
NB.-
NB.+   hextonumber('000000') 
NB.+0
NB.-
NB.+   hextonumber('asd') 
NB.+2829
NB. ---------------------------------------------------------
hextonumber=: 16 #. '0123456789abcdef' i. ]  


NB. =========================================================
NB.*hextorgb m -
NB.- <b>Form:</b> tacit
NB.- Convert a hexadecimal number to rgb color triplet.
NB.-syntax:
NB.+hextorgb(H)
NB.+H = hexadecimal number as text
NB.-example:
NB.+   hextorgb('aaaaaa')
NB.+170 170 170
NB.-
NB.+   hextorgb('000000')
NB.+0 0 0
NB. ---------------------------------------------------------
hextorgb =: 256 256 256&#:@:(16 #. '0123456789abcdef' i. ])
NB. ---------------------------------------------------------
Note 'T hextorgb'
hextonnumber=. 16 #. '0123456789abcdef' i. ]  
hextorgb =.  numbertorgb @: hextonumber f.
)


NB. =========================================================
NB.*numbertohex m -
NB.- <b>Form:</b> tacit
NB.- Convert a number to hexadecimal text number.
NB.-syntax:
NB.+numbertohex(N)
NB.+N = integer <= 256^3
NB.-example:
NB.+   numbertohex(100)
NB.+000064
NB.-
NB.+   numbertohex(0)
NB.+000000
NB.-
NB.+  numbertohex(_1+ 256^3)
NB.+ffffff
NB. ---------------------------------------------------------
numbertohex =:  {&'0123456789abcdef' @: (16 16 16 16 16 16  #: ])


NB. =========================================================
NB.*rgbcolor m -
NB.- <b>Form:</b> explicit
NB.- Show rgb color triplet.
NB.-syntax:
NB.+rgbcolor(R,G,B)
NB.+R = red : integer 0 to 255
NB.+G = green : integer 0 to 255
NB.+B = blue : integer 0 to 255
NB.-example:
NB.+   rgbcolor(100 100 100)
NB.-
NB.+   rgbcolor(255 0 0)   
NB. ---------------------------------------------------------
rgbcolor =: 3 : 0
viewrgb 100 250 $ rgbtonumber y 
)


NB. =========================================================
NB.*hexcolor m -
NB.- <b>Form:</b> explicit
NB.- Show hexadecimal color 
NB.-syntax:
NB.+hexcolor(H)
NB.+H = hexadecimal number as text
NB.-example:
NB.+   hexcolor('aaaaaa')
NB.-
NB.+   hexcolor('000000')
NB. ---------------------------------------------------------
hexcolor =: 3 : 0
viewrgb 100 250 $ rgbtonumber hextorgb y 
)


NB. =========================================================
NB.*numbercolor m -
NB.- <b>Form:</b> explicit
NB.- Show number color 
NB.-syntax:
NB.+numbercolor(N)
NB.+N = integer number < _1+256^3
NB.-example:
NB.+   numbercolor(0)
NB.-
NB.+   numbercolor(2000000)
NB. ---------------------------------------------------------
numbercolor =: 3 : 0
viewrgb 100 250 $ y 
)



