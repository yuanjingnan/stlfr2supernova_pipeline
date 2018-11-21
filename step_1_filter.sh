#!/bin/bash

#SCRIPT_PATH=`dirname $0`

source ./profile
echo "check files ..."
date
if [[ ! -f $SPLIT.1.fq.gz || ! -f $SPLIT.1.fq.gz ]] ; then 
    echo "error : file $SPLIT.1.fq.gz or $SPLIT.2.fq.gz is not exsist !!! exit ..."
    exit 1;
fi
cp $SCRIPT_PATH/data/lane.lst ./

echo "run SOAP_filter ... maybe long time ... "
date
tag=`date +_%m_%d_%H_%M_%S`
$SOAP_FILTER -t $THREADS -y -F CTGTCTCTTATACACATCTTAGGAAGACAAGCACTGACGACATGATCACCAAGGATCGCCATAGTCCATGCTAAAGGACGTCAGGAAGGGCGATCTCAGG -R TCTGCTGAGTCGAGAACGTCTCTGTGAGCCAAGGAGTTGCTCTGGCGACGGCCACGAAGCTAACAGCCAATCTGCGTAACAGCCAAACCTGAGATCGCCC -p -M 2 -f -1 -Q 10 lane.lst stat.txt >SOAPfilter_"$tag".log 2>SOAPfilter_"$tag".err || exit 1
echo "step 1 done ..."
date
