import numpy
import csv,os 
import sys
import tushare as a
import pandas as pd
from pathlib import Path
stock_symbol=sys.argv[1]
print(stock_symbol)
filename="/var/tmp/history/" + stock_symbol
#myfile=Path(filename)
#histbars=numpy.loadtxt(open(filename,"rb"),delimiter=",",skiprows=0)

efile=open(filename)
eReader=csv.reader(efile)

for row in eReader:
  if (eReader.line_num <= 100 and eReader.line_num != 1):
    print('Row: '+str(eReader.line_num)+str(row[2]))
    print(float(row[1]))
  else:
    if row[1] is None:
	break
    continue
efile.close()

exit(0)



