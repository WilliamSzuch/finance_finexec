NB.%phra13.ijs - J Phrases Section 13A. Inside Boxes
NB.-<script src="../js/jphrases_links.js"></script>
NB.-<a href="../phra13.ijs" target="_blank">Script source: phra13.ijs</a>
NB.-<hr>


a0=: each=: &.>                         NB. Apply  verb to each box
m1=: open=: -:> :: 1:                   NB. Test if open (not boxed)
v2=: fmt=: ":                           NB. Format
m3=: just=: 3 : '9!:3 (2) [ 9!:17 y.'   NB. Set function display to boxed form, and set justification within boxes to y
m4=: L. = 0:                            NB. Test if open
m5=: < -: {:@;~                         NB. Test if open
m6=: 32&>@(3!:0)                        NB. Test if open
m7=: <^:(L. = 0:)                       NB. Box if open  
