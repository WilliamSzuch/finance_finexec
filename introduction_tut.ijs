0 : 0
NB. =========================================================
TITLE: Finexec: Introduction to Tutorials
)
0 : 0
NB. ---------------------------------------------------------
Tutorial Sections
)
spx':'
NB.spxsection:Overview
0 : 0
NB. ---------------------------------------------------------
The tutorials are executed in a J session and you 
can experiment with the definitions. The tutorials are an excellent 
way of learning how to use the definitions from the 
Finexec addon to solve problems and introduction to the 
J programming language.
A J session can be a Qt IDE or JHS window.
)
NB.spxsection:View this script'
0 : 0
NB. ---------------------------------------------------------
Next we open the this script so it can be viewed as the
tutorial is stepped through.
Put the script in another window so you can read the
script as it is stepped through. Or just close the window.
)
showscript '~addons/finance/finexec/introduction_tut.ijs'
NB.spxsection:Starting a Tutorial
0 : 0
NB. ---------------------------------------------------------
Show a list of tutorials and run a tutorial
   finexec_tutorials ''
or run a specific tutorial
   spx_jsp_ '~addons/finance/finexc/basicfinance/tutes/simple_interest_tut.ijs'

You can view a script by executing the line.
  showscript '~addons/finance/finexec/basicfinance/simple.ijs'
)
NB.spxsection:Getting around a Tutorial
0 : 0
NB. ---------------------------------------------------------
To get the most benefit from a tutorial you need to be able 
to move to different lines and sections.
There are several ways of getting around a tutorial.

1) Single line advance
Qt: ctrl+j
JHS: ctrl+. or click > in the menu 

The definition spx is used to move around a tutorial.

2) Advance to a new line
   spx ''

run line 1 to show the title of the tutorial (usually in line 1)
  spx 1

3) Execute several lines
  spx 1 16

4) Show current line number in the tutorial  
  spx 0
  
5) Show the tutorial sections
  spx':'
  
6) Jump to a section
spx':Overview'

7) End a tutorial
To end a tutorial use:
  spx':End'
This goes to the end of the script.
You can go back to a line or section:
   spx 1
   spx':Starting a Tutorial'
)
NB.spxsection:End