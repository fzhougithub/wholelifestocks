#!/bin/bash

symbol=$1
step=$2
xofile=/var/tmp/history/${symbol}pf.csv
chartfile=/var/tmp/history/${symbol}_chart.py

python get_s_history.py $symbol 
python pf_k_history.py $symbol $step > $xofile
#python pf_s_history.py $symbol $step > $xofile

python pf_meta.py $symbol

cat $chartfile

python $chartfile
