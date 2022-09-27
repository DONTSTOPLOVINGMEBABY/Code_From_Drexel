#!/bin/bash



# Just Rips File directly to directory
# First argument is the file to be copied 
# Second Argument is the directory to send file


if [ $1 == "fill" ] 
	then
	\cp $1 "/Volumes/Access/fill"
	fi 


if [ $1 == "dump" ] 
	then
	\cp $1 "/Volumes/Access/dump"
	fi


if [ $1 == "sp500" ] 
	then
	\cp $1 "/Volumes/Access/sp500"
	fi 



echo "Successful" 

