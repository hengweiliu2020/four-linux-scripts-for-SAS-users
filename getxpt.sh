#!/usr/bin/ksh
for file in $*
do
BYTE27=$(head -c 27 $file)
BYTE25=$(head -c 25 $file)
BYTE14=$(head -c 14 $file)
BYTE11=$(head -c 11 $file)

if [[ $(echo $BYTE27) == "HEADER RECORD*******LIBRARY" ]]
then
echo " $file: the file is generated with XPORT engine."
elif [[ $(echo $BYTE25) == 'HEADER RECORD*******LIBV8' ]]
then
echo " $file: the file is generated with LOC2XPT.SAS."
elif [[ $(echo $BYTE14) == '**COMPRESSED**' ]]
then
echo " $file: the file is generated with PROC CPORT \
without the NOCOMPRESS option."
elif [[ $(echo $BYTE11) == 'LIB CONTROL' ]]
then
echo " $file: the file is generated with PROC CPORT \
with the NOCOMPRESS option."
else
echo " $file: I cannot decide how the file is generated."
fi
done

