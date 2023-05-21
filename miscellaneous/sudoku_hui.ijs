NB. =========================================================
NB.%sudoku_hui.ijs - Roger Hui's sudoku solver
NB.-<script src="../js/miscellaneous_links.js"></script>
NB.- Contributor: Roger Hui
NB.- Updated: 2022 7 14
NB.- Depend: nil
NB.- Definitions: loaded to locale base
NB.- Status: dev - entering a new puzzle
NB.- <a href="../sudoku_hui.ijs" target="_blank">Script source: sudoku_hui.ijs</a>
NB.-<hr>
NB.- The sudoku solver taken from J Software Wiki as provided by Roger Hui.
NB.- Roger Hui's sudoku solver
NB.- View the source script to see how Roger solved the problem using J.
NB.- <a href="../sudoku.htm" target="_blank">Roger's notes from Wiki</a>
NB.- <b>Create and solve a  new puzzle</b>  
NB.- In a Jqt session open script sudoku_hui.ijs
NB.- Edit the noun NEW_PZ
NB.- Execute to create NEW_PZ
NB.- Check the puzzle: see NEW_PZ
NB.- Solve the puzzle: sudokuz NEW_PZ
NB.- <b>Note</b>
NB.- Develop GUI front end
NB.- Develop JHS
NB.-<hr>


NB. =========================================================
data =: [: ". rplc&(LF;' ') 


NB. =========================================================
NB.*NEW_PZ n - 
NB.- Create a new puzzle 
NB.- Edit the noun NEW_PZ 
NB.- Excute to create NEW_PZ
NB.- see NEW_PZ
NB.- sudokuz NEW_PZ
NB. ---------------------------------------------------------
NEW_PZ =: data (0 : 0)
0 9 1  6 0 0  0 7 0
0 0 0  0 0 0  9 0 0
7 0 0  9 0 0  2 0 0

0 7 9  5 8 0  6 0 1
0 0 6  0 0 4  8 0 0
0 5 0  0 0 0  0 0 0 

0 0 2  0 0 1  0 0 5
4 0 0  0 3 0  0 0 2
0 0 0  0 6 0  0 0 0
)


NB. =========================================================
j      =: (]/. i.@#) ,{;~3#i.3
r      =: 9#i.9 9
c      =: 81$|:i.9 9
b      =: (,j{9#i.9) { j
I      =: ~."1 r,.c,.b
R      =: j,(,|:)i.9 9
regions=: R {"_ 1 ]
free   =: 0&= > (1+i.9) e."1 I&{
ok     =: (27 9$1) -:"2 (0&= +. ~:"1)@regions
ac     =: +/ .*&(1+i.9) * 1 = +/"1


NB. =========================================================
ar =: 3 : 0
 m=. 1=+/"2 R{y
 j=. I. +./"1 m
 k=. 1 i."1~ j{m
 i=. ,(k{"_1 |:"2 (j{R){y) #"1 j{R
 (1+k) i}81$0
)


NB. =========================================================
assign =: (+ (ac >. ar)@free)^:_"1


NB. =========================================================
guessa =: 3 : 0
 if. -. 0 e. y do. ,:y return. end.
 b=. free y
 i=. (i.<./) (+/"1 b){10,}.i.10
 y +"1 (1+I.i{b)*/i=i.81
)


NB. =========================================================
guess  =: ; @: (<@guessa"1)


NB. =========================================================
see1   =: (;~9$1 0 0)&(<;.1) @ ({&'.123456789') @ (9 9&$) @ ,
see    =: <@see1"1`see1@.(1:=#@$)
diff   =: * 0&=@}:@(0&,)


NB. =========================================================
NB.*sudoku m -
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> guess,ok,assign
NB.- Solves puzzle as table of solutions (N,81)
NB.- N = number of solutions
NB.-syntax:
NB.+  sudoku(PZ)
NB.+PZ = sudoku puzzle
NB.-example:
NB.+  sudoku PZ_1 
NB.+2 8 3 6 7 1 9 4 5 9 7 6 5 4 8 2 ...
NB.+  sudoku PZ_2 
NB.+1 8 3 6 7 2 9 4 5 4 7 6 5 9 8 2 ...
NB.+2 8 3 6 7 1 9 4 5 4 7 6 5 9 8 2 ...
NB.+2 8 3 6 7 1 9 4 5 4 7 6 5 9 8 2 ...
NB.+2 8 3 6 7 1 9 4 5 4 7 6 5 9 8 2 ...
NB.+2 8 3 6 7 1 9 4 5 4 7 6 5 9 8 2 ...
NB.+2 8 3 6 7 1 9 4 5 9 7 6 5 4 8 2 ...
NB.-
NB.+ Show tables run:
NB.+  see PZ_1, sudoku PZ_1
NB.+┌─────────────┬─────────────┐
NB.+│┌───┬───┬───┐│┌───┬───┬───┐│
NB.+││2..│67.│...│││283│671│945││
NB.+││..6│...│2.1│││976│548│231││
NB.+││4..│...│8..│││415│392│876││
NB.+│├───┼───┼───┤│├───┼───┼───┤│
NB.+││5..│..9│3..│││567│419│382││
NB.+││.3.│...│.5.│││834│267│159││
NB.+││..2│8..│..7│││192│835│467││
NB.+│├───┼───┼───┤│├───┼───┼───┤│
NB.+││..1│...│..4│││321│786│594││
NB.+││7.8│...│6..│││758│924│613││
NB.+││...│.53│..8│││649│153│728││
NB.+│└───┴───┴───┘│└───┴───┴───┘│
NB.+└─────────────┴─────────────┘
NB.+  see PZ_2, sudoku PZ_2
NB.+  see PZ_3, sudoku PZ_3
NB. ---------------------------------------------------------
sudoku =: guess @: (ok # ]) @: assign ^:_ @ ,


NB. =========================================================
NB.*sudokuz m Sudoku solver
NB. sudokuz PZ_1
NB. ---------------------------------------------------------
sudokuz =: see @:([,sudoku)


NB. =========================================================
NB.*sudoku_c m -
NB.- <b>Form:</b> explicit
NB.- <b>Depend:</b> sudoku
NB.- Counts the number of solutions
NB.-syntax:
NB.+sudoku_c(PZ) 
NB.+PZ = sudoku puzzle
NB.-example:
NB.+  sudoku_c PZ_1 
NB.+1
NB.+  sudoku_c PZ_2 
NB.+6
NB.+  sudoku_c PZ_3 
NB.+106
NB. ---------------------------------------------------------
sudoku_c =: 0&{ @:$ @: sudoku


NB. =========================================================
NB. Example Puzzles:
NB. =========================================================

NB. =========================================================
NB.*PZ_1 n - 
NB.- Puzzle 1: 1 solution
NB.+  sudokuz PZ_1  
NB. ---------------------------------------------------------
PZ_1 =: , 0&".;._2 (0 : 0)
2 0 0  6 7 0  0 0 0
0 0 6  0 0 0  2 0 1
4 0 0  0 0 0  8 0 0
5 0 0  0 0 9  3 0 0
0 3 0  0 0 0  0 5 0
0 0 2  8 0 0  0 0 7
0 0 1  0 0 0  0 0 4
7 0 8  0 0 0  6 0 0
0 0 0  0 5 3  0 0 8
)


NB. =========================================================
NB.*PZ_1A n - 
NB.- Same as PZ_1 with different data format
NB.+ sudokuz PZ_1A  
NB. ---------------------------------------------------------
PZ_1A =: data (0 : 0)
2 0 0  6 7 0  0 0 0
0 0 6  0 0 0  2 0 1
4 0 0  0 0 0  8 0 0

5 0 0  0 0 9  3 0 0
0 3 0  0 0 0  0 5 0
0 0 2  8 0 0  0 0 7

0 0 1  0 0 0  0 0 4
7 0 8  0 0 0  6 0 0
0 0 0  0 5 3  0 0 8
)


NB. =========================================================
NB.*PZ_2 n - 
NB.- Puzzle 2: 6 Solutions
NB.+ sudokuz PZ_2  
NB. ---------------------------------------------------------
PZ_2 =: , 0&".;._2 (0 : 0)
0 0 0  6 7 0  0 0 0
0 0 6  0 0 0  2 0 1
0 0 0  0 0 0  8 0 0
5 0 0  0 0 9  3 0 0
0 3 0  0 0 0  0 5 0
0 0 2  8 0 0  0 0 7
0 0 1  0 0 0  0 0 4
7 0 8  0 0 0  6 0 0
0 0 0  0 5 3  0 0 8
)

NB. =========================================================
NB.*PZ_3 n -
NB.- Puzzle 3: 106 Solutions
NB.+ sudokuz PZ_3  
NB. ---------------------------------------------------------
PZ_3 =: , 0&".;._2 (0 : 0)
0 0 0  0 7 0  0 0 0
0 0 6  0 0 0  2 0 1
4 0 0  0 0 0  8 0 0
5 0 0  0 0 9  3 0 0
0 3 0  0 0 0  0 5 0
0 0 2  8 0 0  0 0 7
0 0 1  0 0 0  0 0 4
7 0 8  0 0 0  6 0 0
0 0 0  0 5 3  0 0 8
)

NB. =========================================================
NB.*PZ_4 n -
NB.- Puzzle 4: Blank Puzzle: To many Solutions - HANGS
NB.+ sudoku PZ_$
NB. ---------------------------------------------------------
PZ_4 =: , 0&".;._2 (0 : 0)
0 0 0  0 0 0  0 0 0
0 0 0  0 0 0  0 0 0
0 0 0  0 0 0  0 0 0
0 0 0  0 0 0  0 0 0
0 0 0  0 0 0  0 0 0
0 0 0  8 0 0  0 0 0
0 0 0  0 0 0  0 0 0
0 0 0  0 0 0  0 0 0
0 0 0  0 0 0  0 0 0
)


NB. =========================================================
NB.*PZ_5 n -
NB.- Puzzle 5: 0 Solutions: Bad puzzle: First Row doubling of 2
NB.+ sudokuz PZ_5  
NB. ---------------------------------------------------------
PZ_5 =: , 0&".;._2 (0 : 0)
2 0 0  6 7 0  0 0 2
0 0 6  0 0 0  2 0 1
4 0 0  0 0 0  8 0 0
5 0 0  0 0 9  3 0 0
0 3 0  0 0 0  0 5 0
0 0 2  8 0 0  0 0 7
0 0 1  0 0 0  0 0 4
7 0 8  0 0 0  6 0 0
0 0 0  0 5 3  0 0 8
)


NB. =========================================================
NB.*PZ_6 n - 
NB.- Puzzle 1: 1 solution 
NB.+  sudokuz PZ_6  
NB. ---------------------------------------------------------
PZ_6 =: data (0 : 0)
3 7 0  0 0 4  0 5 6
6 0 0  0 9 0  3 4 0
9 0 4  0 0 3  0 7 1

7 0 5  0 0 0  0 3 0
0 0 0  0 0 0  0 0 0
0 4 0  0 0 0  6 0 5

4 9 0  5 0 0  8 0 7
0 3 6  0 1 0  0 0 2
5 1 0  9 0 0  0 6 3
)


NB. =========================================================
NB.*PZ_7 n - 
NB.- Puzzle 1: 1 solution 
NB.+  sudokuz PZ_7  
NB. ---------------------------------------------------------
PZ_7 =: data (0 : 0)
7 4 0  1 0 0  0 0 0
0 0 2  8 9 3  0 0 0
0 0 0  5 0 0  0 0 6

0 0 8  0 4 0  0 3 0
0 3 5  7 8 0  6 0 4
0 9 0  0 0 0  8 0 0 

8 0 0  0 5 0  0 0 7
0 0 0  0 0 0  4 0 0
0 0 0  6 0 0  0 0 3
)


NB. =========================================================
NB.*BLK n -
NB. - Blank puzzle
BLK =: (0 : 0)
0 0 0  0 0 0  0 0 0
0 0 0  0 0 0  0 0 0
0 0 0  0 0 0  0 0 0

0 0 0  0 0 0  0 0 0
0 0 0  0 0 0  0 0 0
0 0 0  8 0 0  0 0 0

0 0 0  0 0 0  0 0 0
0 0 0  0 0 0  0 0 0
0 0 0  0 0 0  0 0 0
)




