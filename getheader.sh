#!/usr/bin/ksh
for file in $*
do
tfile=$(mktemp)
sed "s/^PROGRAM:/PROGRAM:        $file/" header_file.txt > $tfile
cat $tfile $file > ../newfolder/$file
done
