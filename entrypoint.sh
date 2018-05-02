#!/bin/bash
: '
/*
 * @File: entrypoint.sh
 * @Author: Arunkumar Sadasivan
 * @Date: 02/01/2018
 * @Description: This script is used to pass arguments provided by the docker run command to invoke 
                 the python script (audit.py) via command line arguments
 * @Usage: 1. docker run -e "URI=10.223.227.77:8443" -e "PRODUCT=DMA" -e "VERSION=10.0" -e "REPORTTYPE=json" -it --rm -v $(pwd)/report:/report guidelines_automation
           2. docker run -e "URI=10.223.227.77:8443" -e "PRODUCT=DMA" -e "VERSION=10.0" -e "REPORTTYPE=html" -it --rm -v $(pwd)/report:/report guidelines_automation
           3. docker run -e "URI=10.223.227.77:8443" -e "PRODUCT=DMA" -e "VERSION=10.0" -e "MULTIPLEREPORT=true" -it --rm -v $(pwd)/report:/report guidelines_automation
 */
'

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

: '
if [ ! -z $URI ]; then # Not null
   if [ $firsttime = true ]; then
      arguments="$URI"
      firsttime=false  
   else
	  arguments="$arguments $URI" 
   fi	  	  
    	  
fi
'

exec /home/testssl.sh/testssl.sh $FILEOUTPUT $TESTS $URI
exit 0

