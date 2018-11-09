import os, sys
import tushare as a
import pandas as pd
from sqlalchemy import create_engine
import psycopg2;
from pathlib import Path
import datetime as datetime

stock_symbol=''

def sync_to_file(stock_symbol):
  filename="/var/tmp/history/" + stock_symbol
  myfile=Path(filename)
  b=a.get_k_data(stock_symbol,start)
  if b is None:
    if myfile.exists():
      os.remove(filename)
      print >> sys.stderr, stock_symbol," has no data"
      sys.exit(1)	
  outfile = open(filename,'wr')
  b.to_csv(outfile)
  outfile.close()

def sync_to_db():
  global conn,cur
  sql="select symbol,tdate from s_history_finalday"
  cur.execute(sql)
  for r in cur.fetchall():
    stock_symbol=str(r[0])
    start=str(r[1]) 
    print('Get '+stock_symbol+' start:'+start)
    if start == '1990-01-01':
      b=a.get_k_data(stock_symbol)
    else:
      b=a.get_k_data(stock_symbol,start)
    engine = create_engine('postgresql://wls:wholelifestocks@localhost:5432/fzdb')
    if b is None:
      print("No data for :"+stock_symbol)
    else:
      b.to_sql('tmp_s_history',engine,if_exists='replace')
      sql="INSERT INTO s_history SELECT '"+stock_symbol+"',to_date(date,'yyyy-mm-dd'),open,close,high,low,volume from tmp_s_history ON CONFLICT (symbol,tdate) DO nothing"
    cur.execute(sql)
    conn.commit()

hostname='localhost'; username='wls'; password='wholelifestocks'; database='fzdb'
conn=psycopg2.connect(host=hostname,user=username,password=password,dbname=database)
cur = conn.cursor()
sync_to_db()

exit(0)



