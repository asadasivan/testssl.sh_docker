#!/bin/bash

arguments=""
firsttime=true

if [ ! -z "$FILEOUTPUT" ]; then # Not null
   if [ $firsttime = true ]; then
      arguments="$FILEOUTPUT"
      firsttime=false  
   else
	  arguments="$arguments $FILEOUTPUT" 
   fi	  	  
    	  
fi

if [ ! -z $TESTS ]; then # Not null
   if [ $firsttime = true ]; then
      arguments="$TESTS"
      firsttime=false  
   else
	  arguments="$arguments $TESTS" 
   fi	  	  
    	  
fi

exec /home/testssl.sh/testssl.sh $FILEOUTPUT $TESTS $URI
exit 0

