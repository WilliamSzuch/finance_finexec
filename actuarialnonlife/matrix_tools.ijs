NB. =========================================================
NB.%matrix_tools.ijs - Definitions for matrix manipulation
NB.-<hr>
NB.-<a href="http://www.finexec.com.au">Finexec | </a>
NB.-<a class="HREF" href="../../finexec_lib.html">Library | </a>
NB.-<a class="HREF" href="index.htm">Actuarial Non-Life</a>
NB.-<hr>
NB.-<hr>
NB.- Script: ~addons/finance/finexec/actuarialmethods/matrix_tools.ijs
NB.- Contributor: William Szuch
NB.- Updated: 2022-05-22
NB.- Depend: nil
NB.- Definitions: loaded to locale base
NB.- Status: dev:
NB.- <a href="../matrix_tools.ijs" target="_blank">Script source: matrix_tools.ijs</a>
NB.-<hr>
NB.- Tools for manipulations of matrices.
NB.- Rotation of matrices.
NB.- Transposing of matrices.
NB.- For example development tables: incident/accident and report periods.
NB.- Special matrices.
NB.-<hr>


NB. =========================================================
NB. Utilities
NB.*mat_det m Determinant of matrix y
mat_det=: -/ .*

NB.*mat_mult m Matrix multiplication of x and y
mat_mult=: +/ .*

NB.*mat_inv m Inverse of matrix y
mat_inv =: %.

NB.*mat_id m Create an identy matrix
mat_id =: =/~ @ i.


NB. =========================================================
NB. Rotation of matrices
NB. =========================================================


NB. =========================================================
NB.*rotate1 m -
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> nil
NB.- Rotate a matrix along its rows from right to left.
NB.- For example: report period to development period.
NB.-syntax:
NB.+rorate1(M)
NB.+M = matrix to be rotated 
NB.-example:
NB.+  rotate1(4 4 $ i. 4)
NB.+0 1 2 3
NB.+1 2 3 0
NB.+2 3 0 1
NB.+3 0 1 2
NB.-
NB.+  rotate1(3 4 $ i. 4)
NB.+0 1 2 3
NB.+1 2 3 0
NB.+2 3 0 1
NB.-
NB.+rotate1(4 3 $ i. 3)
NB.+0 1 2
NB.+1 2 0
NB.+2 0 1
NB.+0 1 2
NB. ---------------------------------------------------------
rotate1 =: 3 : '([ |. {&y)"0 i. 0{$y'


NB. =========================================================
NB.*rotate2 m -
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> nil
NB.- Rotate a matrix along its rows from left to right.
NB.- For example: development period to report period.
NB.-syntax:
NB.+rorate2(M)
NB.+M = matrix to be rotated 
NB.-example:
NB.+  rotate2(4 4 $ i. 4)
NB.+0 1 2 3
NB.+3 0 1 2
NB.+2 3 0 1
NB.+1 2 3 0
NB.-
NB.+  rotate2(3 4 $ i. 4)
NB.+0 1 2 3
NB.+3 0 1 2
NB.+2 3 0 1
NB.-
NB.+  rotate2(4 3 $ i. 3)
NB.+0 1 2
NB.+2 0 1
NB.+1 2 0
NB.+0 1 2
NB. ---------------------------------------------------------
rotate2 =: 3 : '(- |. {&y)"0 i. 0{$y'



NB. =========================================================
NB.*rotate3 m -
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> rotate1
NB.- Rotate a matrix along its rows along the reserve diagonal.
NB.-syntax:
NB.+rorate3(M)
NB.+M = matrix to be rotated 
NB.-example:
NB.+  rotate3(4 4 $ i. 4)
NB.+3 0 1 2
NB.+2 3 0 1
NB.+1 2 3 0
NB.+0 1 2 3
NB.-
NB.+  rotate3(3 4 $ i. 4)
NB.+2 3 0 1
NB.+1 2 3 0
NB.+0 1 2 3
NB.-
NB.+  rotate3(4 3 $ i. 3)
NB.+0 1 2
NB.+2 0 1
NB.+1 2 0
NB.+0 1 2
NB. ---------------------------------------------------------
rotate3 =: 3 : '|. rotate1 |. y'


NB. =========================================================
NB.*rotate4 m -
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> rotate2
NB.- Rotate a matrix along its rows along the diagonal.
NB.-syntax:
NB.+rorate3(M)
NB.+M = matrix to be rotated 
NB.-example:
NB.+  rotate3(4 4 $ i. 4)
NB.+3 0 1 2
NB.+2 3 0 1
NB.+1 2 3 0
NB.+0 1 2 3
NB.-
NB.+  rotate3(3 4 $ i. 4)
NB.+2 3 0 1
NB.+1 2 3 0
NB.+0 1 2 3
NB.-
NB.+  rotate3(4 3 $ i. 3)
NB.+0 1 2
NB.+2 0 1
NB.+1 2 0
NB.+0 1 2
NB. ---------------------------------------------------------
rotate4 =: 3 : '|. rotate2 |. y'


NB. =========================================================
NB. Special matrices with 0s and 1s
NB. =========================================================


NB. ==============================================================
NB.*top_triR m - 
NB.- <b>Form:</b> tacit
NB.- <b>Depend:</b> nil
NB.- Create a matrix with 1s to the RHS.
NB.- Top row is all 1s.
NB.- Columns are 0 and 1s
NB.-syntax:
NB.+top_triR(R,[C])
NB.+R = rows of a square matrix
NB.+[C] = optional number of columns for a rectangular matrix
NB.-example:
NB.+  top_triR 4
NB.+1 1 1 1 
NB.+0 1 1 1 
NB.+0 0 1 1 
NB.+0 0 0 1 
NB.-
NB.+  top_triR(4 6)
NB.+1 1 1 1 1 1
NB.+0 1 1 1 1 1
NB.+0 0 1 1 1 1
NB.+0 0 0 1 1 1
NB.-
NB.+  top_triR(6 4)
NB.+1 1 1 1
NB.+0 1 1 1
NB.+0 0 1 1
NB.+0 0 0 1
NB.+0 0 0 0
NB.+0 0 0 0
NB. ---------------------------------------------------------
top_triR =: ([: (i.) 0 { ]) <:/ [: (i.) 1 { 1 1 # ]
NB. ---------------------------------------------------------
Note 'T top_triR'
top_triR = . 13 : '(i. 0{y) <:/ (i. 1{ 1 1#y)'
)



NB. ==============================================================
NB.*top_triL m - 
NB.- <b>Form:</b> tacit
NB.- <b>Depend:</b> nil
NB.- Create a matrix with 1s to the LHS.
NB.- Top row is all 1s.
NB.- Columns are 0 and 1s
NB.-syntax:
NB.+top_triL(R,[C])
NB.+R = rows dimension of square matrix
NB.+[C] = optional number of columns for a rectangular matrix
NB.-example:
NB.+  top_triL 4
NB.+1 1 1 1
NB.+1 1 1 0
NB.+1 1 0 0
NB.+1 0 0 0
NB.-
NB.+  top_triL(4 6)
NB.+1 1 1 1 1 1
NB.+1 1 1 1 1 0
NB.+1 1 1 1 0 0
NB.+1 1 1 0 0 0
NB.-
NB.+  top_triL(6 4)
NB.+1 1 1 1
NB.+1 1 1 0
NB.+1 1 0 0
NB.+1 0 0 0
NB.+0 0 0 0
NB.+0 0 0 0
NB. ---------------------------------------------------------
top_triL =: ([: (i.) 0 { ]) <:/ [: |. [: (i.) 1 { 1 1 # ]
NB. ---------------------------------------------------------
Note 'T top_trL'
top_triL =. 13 : '(i. 0{y) <:/ (|. i. 1{ 1 1#y)'
)


NB. ==============================================================
NB.*left_tri m - 
NB.- <b>Form:</b> tacit
NB.- <b>Depend:</b> nil
NB.- Create a matrix with 1s to the LHS.
NB.- Left column is all 1s.
NB.- Rows are 0 and 1s
NB.-syntax:
NB.+left_tri(R,[C])
NB.+R = rows dimension of square matrix
NB.+[C] = optional number of columns for a rectangular matrix
NB.-example:
NB.+  left_tri 4
NB.+1 0 0 0
NB.+1 1 0 0
NB.+1 1 1 0
NB.+1 1 1 1
NB.-
NB.+  left_tri(4 6)
NB.+1 0 0 0 0 0
NB.+1 1 0 0 0 0
NB.+1 1 1 0 0 0
NB.+1 1 1 1 0 0
NB.+
NB.+  left_tri(6 4)
NB.+1 0 0 0
NB.+1 1 0 0
NB.+1 1 1 0
NB.+1 1 1 1
NB.+1 1 1 1
NB.+1 1 1 1
NB. ---------------------------------------------------------
left_tri =: ([: (i.) 0 { ]) >:/ [: (i.) 1 { 1 1 # ]
NB. ---------------------------------------------------------
Note 'T left_tri'
left_tri =: 13 : '(i. 0{y) >:/ (i. 1{1 1#y)'
)


NB. ==============================================================
NB.*right_tri m - 
NB.- <b>Form:</b> tacit
NB.- <b>Depend:</b> nil
NB.- Create a matrix with 1s to the RHS.
NB.- Right column is all 1s.
NB.- Rows are 0 and 1s
NB.-syntax:
NB.+right_tri(R,[C})
NB.+R = rows dimension of square matrix
NB.+[C] = optional number of columns for a rectangular matrix
NB.-example:
NB.+  right_tri 4
NB.+0 0 0 1
NB.+0 0 1 1
NB.+0 1 1 1
NB.+1 1 1 1
NB.-
NB.+  right_tri(4 6)
NB.+0 0 0 0 0 1
NB.+0 0 0 0 1 1
NB.+0 0 0 1 1 1
NB.+0 0 1 1 1 1
NB.=
NB.+  right_tri(6 4)
NB.+0 0 0 1
NB.+0 0 1 1
NB.+0 1 1 1
NB.+1 1 1 1
NB.+1 1 1 1
NB.+1 1 1 1
NB. ---------------------------------------------------------
right_tri =: ([: (i.) 0 { ]) >:/ [: |. [: (i.) 1 { 1 1 # ]
NB. ---------------------------------------------------------
Note 'T right_tri'
right_tri =. 13 : '(i. 0{y) >:/ (|. i. 1{ 1 1#y)'
)


NB. =========================================================
NB.*bottom_triR m - 
NB.- <b>Form:</b> tacit
NB.- <b>Depend:</b> nil
NB.- Create a matrix with 1s to the RHS.
NB.- Bottom row is all 1s.
NB.- Columns are 0 and 1s
NB.-syntax:
NB.+uppertriR(R,[C})
NB.+R = rows dimension of square matrix
NB.+[C] = optional number of columns for a rectangular matrix
NB.-example:
NB.+  bottom_triR 4
NB.+0 0 0 1
NB.+0 0 1 1
NB.+0 1 1 1
NB.+1 1 1 1
NB.-
NB.+  bottom_triR(4 6)
NB.+0 0 0 1 1 1
NB.+0 0 1 1 1 1
NB.+0 1 1 1 1 1
NB.+1 1 1 1 1 1
NB.=
NB.+  bottom_triR(6 4)
NB.+0 0 0 0
NB.+0 0 0 0
NB.+0 0 0 1
NB.+0 0 1 1
NB.+0 1 1 1
NB.+1 1 1 1
NB. ---------------------------------------------------------
bottom_triR =: [: |. ([: (i.) 0 {  ]) <:/ [: (i.) 1 {  1 1 # ]
NB. ---------------------------------------------------------
Note 'T botom_triR'
bottom_triR =. 13 : '|. (i. 0{y) <:/ (i. 1{ 1 1#y)'
)



NB. =========================================================
NB.*bottom_triL m - 
NB.- <b>Form:</b> tacit
NB.- <b>Depend:</b> nil
NB.- Create a matrix with 1s to the RHS.
NB.- Bottom row is all 1s.
NB.- Columns are 0 and 1s
NB.-syntax:
NB.+bottom_triL(R,[C})
NB.+R = rows dimension of square matrix
NB.+[C] = optional number of columns for a rectangular matrix
NB.-example:
NB.+  bottom_triL 4
NB.+0 0 0 1
NB.+0 0 1 1
NB.+0 1 1 1
NB.+1 1 1 1
NB.-
NB.+  bottom_triL(4 6)
NB.+0 0 0 1 1 1
NB.+0 0 1 1 1 1
NB.+0 1 1 1 1 1
NB.+1 1 1 1 1 1
NB.=
NB.+  bottom_triL(6 4)
NB.+0 0 0 0
NB.+0 0 0 0
NB.+0 0 0 1
NB.+0 0 1 1
NB.+0 1 1 1
NB.+1 1 1 1
NB. ---------------------------------------------------------
bottom_triL =: [: |. ([: (i.) 0 {  ]) <:/ [: (i.) 1 {  1 1 # ]
NB. ---------------------------------------------------------
Note 'T botom_triR'
bottom_triL =. 13 : '|. (i. 0{y) <:/ (i. 1{ 1 1#y)'
)


