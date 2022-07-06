      identification division. 
	  program-id.  ShortestProgram.
	  environment division.
	  data division.
	working-storage section.
       01 x pic 9.
       01 y pic 9 value '2'.
       01 z pic 9 value 2.
      procedure division.
	DisplayPrompt.display"welcome to cobol compiler".
        move 15 to x.
        move 20 to y.
		add 10 to x.
		compute x=y+z.
		accept (7, 28) chr.
	    perform para until count=5.
   display "inside loop".
   stop run.
		display "you have entered ",chr.
	  display "x= " , x.
	  display "y= " , y.
	  display "z= " , z.
	  if x  equal to y then
      display 'IN LOOP 1 - if BLOCK'
      if x = z then
         display 'IN LOOP 2 - if BLOCK'
      else
         display 'IN LOOP 2 - else BLOCK'
      
	  end-if.
	  stop run.
