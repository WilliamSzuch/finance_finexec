NB. =========================================================
NB.%numeric.ijs - Numeric utilities
NB.- Script: ~addons/finance/finexec/utility/numeric.ijs
NB.- Contributor: William Szuch
NB.- Updated: 4/2/2020
NB.- Depend: nil
NB.- Definitions: loaded to locale base
NB.-<hr>
NB.- <a class="HREF" href="index.htm" target="_blank">Category: Utility</a>
NB.- <a class="HREF" href="../../finexec_category.html" target="_blank">Finexec: Category</a>
NB.-<hr>
NB.- Numeric utilities.
NB.- <a href="../numeric.ijs" target="_blank">Script source: numeric.ijs</a> 
NB.-<hr>


NB. =========================================================
NB.*round d -
NB.- <b>Type:</b> tacit
NB.- Round Y to nearest X 
NB.-syntax:
NB.+(X)round(Y)
NB.+Y = number to be rounded
NB.+X = number nearest to be rounded
NB.-example:
NB.+ (0.01)round(12.123) 
NB.+12.12
NB.-
NB.-  (1)round(12.123 _12.123 10.1)
NB.+12 _12 10
NB.-
NB.+ (10)round(12.123 _12.123 10.1 15.1)
NB.+10 _10 10 20
NB. ---------------------------------------------------------
round=: [ * [: <. 0.5 + %~


NB. =========================================================
NB.*ip m -
NB.- <b>Type:</b> tacit
NB.- Get the integer part of a positive number.
NB.-syntax:
NB.+ip(N)
NB.+N = positive number
NB.-example:
NB.+   ip(12.12)
NB.+12
NB.-
NB.+   ip(12)
NB.+12
NB.-
NB.+  ip(0 1.1 123.5)
NB.+0 1 123
NB. ---------------------------------------------------------
ip =: [:<.]


NB. =========================================================
NB.*dp m -
NB.- <b>Type:</b> tacit
NB.- Get the decimal part of a positive number.
NB.-syntax:
NB.+ip(N)
NB.+N = positive number
NB.-example:
NB.+   dp(12.12)
NB.+0.12
NB.-
NB.+   dp(12)
NB.+0
NB.-
NB.+  dp(0 1.1 123.5)
NB.+0 0.1 0.5
NB. ---------------------------------------------------------
dp =: ] -[:<.]




NB. =========================================================
NB.*ip1 m -
NB.- <b>Type:</b> tacit
NB.- Get the integer part of a positive number plus 1.
NB.-syntax:
NB.+ip1(N)
NB.+N = positive number
NB.-example:
NB.+   ip1(12.12)
NB.+13
NB.-
NB.+   ip1(12)
NB.+13
NB. ---------------------------------------------------------
ip1 =: 1+<.


NB. =========================================================
NB.*ip_1 m -
NB.- <b>Type:</b> tacit
NB.- Get the integer part of a positive number less 1.
NB.-syntax:
NB.+ip_1(N)
NB.+N = positive number
NB.-example:
NB.+   ip_1(12.12)
NB.+11
NB.-
NB.+   ip_1(12)
NB.+11
NB. ---------------------------------------------------------
ip_1 =: _1+<.


NB. =========================================================
NB.*ipneg1 m -
NB.- <b>Type:</b> tacit
NB.- Get the integer part of a negative number plus 1.
NB.-syntax:
NB.+ipneg1(N)
NB.+N = negative number
NB.-example:
NB.+   ipneg1(_12.12)
NB.+_11
NB.-
NB.+   ipneg1(_12)
NB.+_11
NB. ---------------------------------------------------------
ipneg1 =: 1+>.


NB. =========================================================
NB.*ipneg_1 m -
NB.- <b>Type:</b> tacit
NB.- Get the integer part of a negative number less 1.
NB.-syntax:
NB.+ipneg_1(N)
NB.+N = negative number
NB.-example:
NB.+   ipneg_1(_12.12)
NB.+_13
NB.-
NB.+   ipneg_1(_12)
NB.+_13
NB. ---------------------------------------------------------
ipneg_1 =: _1+>.


NB. =========================================================
NB.*onesd m -
NB.- <b>Type:</b> tacit
NB.- Create a list of the number of ones in the integer part 
NB.- of a positive and catenate the decimal part.
NB.-syntax:
NB.+onesd(N)
NB.+N = number
NB.-example:
NB.+   onesd(12.12)
NB.+1 1 1 1 1 1 1 1 1 1 1 1 0.12
NB.-
NB.+   onesd(12)
NB.+1 1 1 1 1 1 1 1 1 1 1 1 0
NB. ---------------------------------------------------------
onesd =: #&1@:<. , ] - <.


NB. =========================================================
NB.*log1y m -
NB.- <b>Type:</b> tacit
NB.-Calculate the log of (1+N) to the base e.
NB.-syntax:
NB.+log1y(N)
NB.+N = number 
NB.-example:
NB.+   log1y(12.1)
NB.+2.57261
NB.-
NB.+   log1y(_0.999)
NB.+_6.90776
NB.-
NB.+   log1y(1 0 _0.9999)
NB.+0.693147 0 _9.21034
NB.-
NB.+   log1y(_10)
NB.+2.19722j3.14159
NB. ---------------------------------------------------------
log1y =: ^.@ ([:>:[) 



NB. =========================================================
NB.*signchange m -
NB.- <b>Type:</b> tacit
NB.- Show if there is a change of sign in between two numbers.
NB.- result = 1 if change of sign.
NB.- result = _1 if no change of sign.
NB.- result = 0 if either number = 0.
NB.-syntax:
NB.+signchange(A,B) or
NB.+signchange(A;B) Boxed
NB.+A = number
NB.+B = number
NB.-example:
NB.+   signchange(12,13) 
NB.+_1
NB.-
NB.+   signchange(12;_12) 
NB.+1
NB.-
NB.+   signchange(12,12) 
NB.+_1
NB.-
NB.+   signchange(0,12) 
NB.+0
NB. ---------------------------------------------------------
signchange =: [: - ([: */ ([: * >))


NB. =========================================================
NB.*fdiff m -
NB.- <b>Type:</b> tacit
NB.- Calculate the forward difference in a list of numbers.
NB.-syntax:
NB.+fdiff(L)
NB.+L = list of numbers
NB.-example:
NB.+  fdiff(i. 12)
NB.+1 1 1 1 1 1 1 1 1 1 1
NB.-
NB.+  fdiff(0 2 1 3 12.1)
NB.+2 _1 2 9.1
NB. ---------------------------------------------------------
fdiff =: (2 -~/\ ])


NB. =========================================================
NB.*bdiff m -
NB.- <b>Type:</b> tacit
NB.-Calculate the backward difference in a list of numbers.
NB.-syntax:
NB.+bdiff(L)
NB.+L = list of numbers
NB.-example:
NB.+  bdiff(i. 12)
NB.+_1 _1 _1 _1 _1 _1 _1 _1 _1 _1 _1
NB.-
NB.+  bdiff(0 2 1 3 12.1)
NB.+_2 1 _2 _9.1
NB. ---------------------------------------------------------
bdiff =: (2 -/\ ])



