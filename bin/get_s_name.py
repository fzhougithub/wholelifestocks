import sys,csv
s_names="/var/tmp/history/s_names"
s_name_list=[]
symbol=sys.argv[1]
efile=open(s_names)
eReader=csv.reader(efile,delimiter=',')
for row in eReader:
  if row[0] <> "code" and row[0] == symbol:
    print row[1]
    break

efile.close()
exit(0)


