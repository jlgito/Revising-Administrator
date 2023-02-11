#!/bin/bash
a=23
b=4
if (( "$a" < "$b" )) ; then
	echo "$a > $b"
else
	echo "aïe : $a < $b ???" 
fi
