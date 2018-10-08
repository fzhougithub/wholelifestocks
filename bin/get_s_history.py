import os 
import sys
import tushare as a
import pandas as pd
from pathlib import Path
stock_symbol=sys.argv[1]
print(stock_symbol)
filename="/var/tmp/history/" + stock_symbol
myfile=Path(filename)
b=a.get_hist_data(stock_symbol)
if b is None:
	if myfile.exists():
		os.remove(filename)
	print >> sys.stderr, stock_symbol," has no data"
	sys.exit(1)	
outfile = open(filename,'wr')
b.to_csv(outfile)
outfile.close()
exit(0)



