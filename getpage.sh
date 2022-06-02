#!/usr/bin/ksh
PS=52
for filename in $* ; do 
head -${PS} $filename >> combine
done
