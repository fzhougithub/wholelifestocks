import math
import numpy as np
import numpy,csv,os,sys 
import tushare as a
import pandas as pd
import matplotlib.pyplot as plt
import matplotlib.gridspec as gridspec
from matplotlib import rc
from pathlib import Path
stock_symbol=sys.argv[1]
step=float(sys.argv[2])
trend=1
v=h=l=o=c=totalV=pH=pL=tpL=tpH=0
bar_x_high=[]
bar_x_bot=[]
bar_o_high=[]
bar_o_bot=[]
bar_x_total=[]
bar_o_total=[]
rx=[1]
ro=[2]
days=[]

def mod_up(x,unit):
  n=0
  if x>unit:
	rmod=math.modf(x/unit)
	if rmod[0]>0 and rmod[0]>unit/2:
	  n=rmod[1]+1
	else:
	  n=rmod[1]
	return n*unit
  else:
	return x

def mod_down(x,unit):
  n=0
  if x>unit:
        rmod=math.modf(x/unit)
        if rmod[0]>0 and rmod[0]>unit/2:
          n=rmod[1]-1
	else:
	  n=rmod[1]
        return n*unit
  else:
        return x
	
def trend_keep():
  global trend,pH,h,pL,l,totalV,tpH,tpL,step,v
  if trend == 1: 
    if pH < h:
       pH=mod_up(h,step)
    tpH=pH-step*3
    if pL == 0:
      pL = mod_down(l,step)
  if trend == -1:
    if pL>l:
       pL=mod_down(l,step)
    tpL=pL+step*3
    if pH == 0:
      pH = mod_up(h,step)
  totalV=totalV+v
#  print("trend_keep:"+str(trend)+"|"+str(totalV)+"|"+str(pH)+'|'+str(pL)+'|'+str(pH)+'|'+str(pL))


def trend_turn():
  global trend,pH,pL,totalV,l,h,tpH,tpL,v,step,bar_x_high,bar_o_high,bar_x_bot,bar_o_bot,bar_x_total,bar_o_total,rx,ro
  if trend == 1:
    trend=-1
     #print("X,"+str(pH-pL)+","+str(pL)+","+str(totalV))
    bar_x_high.append(pH-pL)
    bar_x_bot.append(pL)
    bar_x_total.append(totalV)
    rx.append(rx[-1]+2)
#    print("X: pH="+str(pH)+",pL="+str(pL)+",v="+str(totalV)) 
    pH=pH-step
    if pH-step*4 < mod_down(l,step):
      pL=mod_down(l,step)
    else:
      pL=pH-step*4
    tpL=pL+step*3
    totalV=v
  if trend == -1:
    trend=1
     #print("O,"+str(pH-pL)+","+str(pL)+","+str(totalV))
    bar_o_high.append(pH-pL)
    bar_o_bot.append(pL)
    bar_o_total.append(totalV)
    ro.append(ro[-1]+2)
#    print("O: pH="+str(pH)+",pL="+str(pL)+",v="+str(totalV))
    pL=pL+step
    if pL+step*4 > mod_up(h,step):
      pH=mod_up(h,step)
    else:
      pH=pL+step*4
    tpH=pH-step*3
    totalV=v

#print(stock_symbol)
filename="/var/tmp/history/" + stock_symbol
#myfile=Path(filename)
#histbars=numpy.loadtxt(open(filename,"rb"),delimiter=",",skiprows=0)

efile=open(filename)
eReader=csv.reader(efile,delimiter=',')

trend_status='k'

for row in eReader:
  if (row[1] != 'date'):
    days.append(row[1])
    h=float(row[4])
    c=float(row[3])
    l=float(row[5])
    v=float(row[6])
    if ((l >= tpH and trend == 1) or ( h <= tpL and trend == -1)):
	trend_keep()
	trend_status='k'
    elif ((mod_down(l,step) < tpH and mod_down(c,step) <tpH and trend == 1) or (mod_up(h,step) > tpL and mod_up(c,step) > tpL and trend == -1)):
        trend_turn()
	trend_status='t'

if trend_status == 'k':
   trend_turn()

efile.close()

barWidth=1
rx.remove(rx[-1])
ro.remove(ro[-1])
if len(rx)<len(bar_x_total):
  bar_x_total.remove(bar_x_total[-1])
if len(ro)<len(bar_o_total):
  bar_o_total.remove(bar_o_total[-1])

#plt.bar(rx,bar_x_high,bottom=bar_x_bot,color='green',width=barWidth)
#plt.bar(ro,bar_o_high,bottom=bar_o_bot,color='blue',width=barWidth)
#plt.show()

#exit(0)

dfx = pd.DataFrame({'x':rx,'x_bot':bar_x_bot,'x_high':bar_x_high,'x_v':bar_x_total})
dfo = pd.DataFrame({'o':ro,'o_bot':bar_o_bot,'o_high':bar_o_high,'o_v':bar_o_total})

plt.figure(figsize=(12,8))
gs=gridspec.GridSpec(2,1,height_ratios=[5,1])
fig,axes = plt.subplots(nrows=2,ncols=1,sharex=True,sharey=False)

axes[0]=plt.subplot(gs[0])
axes[1]=plt.subplot(gs[1])
axes[0].grid(True)
axes[1].grid(True)
axes[0].bar( 'x','x_high',bottom='x_bot',data=dfx,color='green',width=barWidth)
axes[0].bar( 'o','o_high',bottom='o_bot',data=dfo,color='red',width=barWidth)
axes[1].bar( 'x','x_v',data=dfx,color='black',width=barWidth)
axes[1].bar( 'o','o_v',data=dfo,color='red',width=barWidth)
axes[0].title.set_text('Point & Figure Chart '+ stock_symbol+'  ('+days[0]+'~'+days[-1]+')')
axes[1].title.set_text('Volume')

plt.show()



