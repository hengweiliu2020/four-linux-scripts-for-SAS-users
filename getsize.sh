#!/usr/bin/bash
for file in $*
do
SIZE=$(ls -l $file | awk '{print $5}')
SIZE_GB=$( awk -v BYTE_TO_GB=1073741824 -v SIZE="$SIZE" \
'BEGIN {print (SIZE/BYTE_TO_GB)}' )

if [[ $SIZE_GB > 5 ]]
then
echo "$file: the size is greater than 5 GB: \
size = $SIZE_GB GB."
else
echo "$file: the size is not greater than 5 GB: \
size = $SIZE_GB GB."
fi
done
