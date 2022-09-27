#!/bin/bash

for file in * ; do
 	if [ -f $file ] ; then
	lines=$(cat $file | wc -l) 
	words=$(cat $file | wc -w) 
	echo "$file $lines $words"
	fi
done

