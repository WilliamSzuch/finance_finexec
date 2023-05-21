NB. =========================================================
NB.labhr
NB. =========================================================
NB.labchapter:Lab Info
NB. =========================================================

0 : 0

Title: Introduction to Finexec Labs
Author:'William Szuch'
Updated: 2023 03 21
Finexec labs use J Labs and related tools.   
For Finexec labs:
  load 'finance/finexec'
  load 'labs/labs'
  lab '~addons/finance/finexec/introduction_lab.ijs'
ctrl+j  advances the lab
)

NB. Show the lab chapters in a window
lab':'

NB.labhr
NB. =========================================================
NB.labchapter:Overview
NB. =========================================================
0 : 0

Labs are executed in a J session and you 
can experiment with the definitions. The labs are an 
excellent way of learning how to use the definitions from 
Finexec to solve problems and an introduction to the 
J programming language.

A lab is run in a Jqt session.
A lab may have several windows open eg:
  a) the lab script
  b) script documentation
  c) source script
Close any windows not required.
)

NB.labhr
0 : 0
Next we open the the lab script so it can be viewed 
and stepped through.
Put the script in another window so you can read the
script as it is stepped through. Or just close the window.
Useful to show the scripts line numbers (Edit|View). 
)

NB.labhr
NB. Show this lab script
showscript '~addons/finance/finexec/introduction_lab.ijs'

NB.labhr
0 : 0

Show the list of Finexec labs and run a lab
   finexec_labs ''
or run a specific lab
  lab '~addons/finance/finexec/basicfinance/labs/simple_interest_lab.ijs'

You can view a Finexec script:
  showscript '~addons/finance/finexec/basicfinance/simple.ijs'

You can view a Finexec script documentation:
  finexec_html 'basicfinance/docs/simple.htm' 
)

NB.labhr
NB. =========================================================
NB.labchapter:Getting around a Lab
NB. =========================================================
0 : 0

To get the most benefit from a lab you need to be able 
to move to different Chapters and lines.
There are several ways of getting around a lab using 
the lab verb.

1) lab':'      show the lab chapters in a window

2) ctrl+j      advances the lab
 
3) lab 0       run next step

4) lab ''      shows the Help|Studio|labs window in Jqt

5) lab':Chapter' run line starting at a given chapter 
   lab':Overview'  

6) lab -1     rerun last step


7) lab -n     rerun last n steps

8) lab n      run line n

9) lab m n    run lines m through to n (max length of script)
)

NB.labhr
NB.Lab End