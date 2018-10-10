#!/bin/bash

if [ $# -lt 2 ];then
	echo $0 "<stock_symbol> <step>"
	echo example: $0 300393 1
	exit 1
fi

symbol=$1
step=$2
datadir=/var/tmp/history
xofile=/var/tmp/history/${symbol}pf.csv
chartfile=/var/tmp/history/${symbol}_chart.py

if [ $(find /var/tmp/history -mtime -1|grep $symbol|wc -l) -eq 0  ];then
	python get_s_history.py $symbol 
	echo Download Data
fi

python pf_k_history.py $symbol $step 
#python pf_k_history.py $symbol $step > $xofile
#python pf_s_history.py $symbol $step > $xofile

#python pf_meta.py $symbol

#cat $chartfile

#python $chartfile
