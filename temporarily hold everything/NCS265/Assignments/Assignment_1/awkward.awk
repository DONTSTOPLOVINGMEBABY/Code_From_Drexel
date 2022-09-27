#!/usr/bin/awk -f

echo $1 | awk '{split($0,s,".") ; print s[2]}'
