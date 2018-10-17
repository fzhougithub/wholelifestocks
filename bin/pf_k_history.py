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
trend=0
v=h=l=o=c=totalV=pH=pL=tpL=tpH=0
bar_x_high=[]
bar_x_bot=[]
bar_o_high=[]
bar_o_bot=[]
bar_x_total=[]
bar_o_total=[]
rx=[]
ro=[]
days=[]

def bar_append(bar_type):
   global pH,pL,totalV,rx,ro,bar_x_high,bar_x_bot,bar_o_high,bar_o_bot 
   if bar_type == 'x':
     if len(rx) == len(bar_x_high):
       rx.append(rx[-1]+2)
     bar_x_high.append(pH-pL)
     bar_x_bot.append(pL)
     bar_x_total.append(totalV)
   elif bar_type == 'o':
     if len(ro) == len(bar_o_high):
       ro.append(ro[-1]+2)
     bar_o_high.append(pH-pL)
     bar_o_bot.append(pL)
     bar_o_total.append(totalV)

def bar_remove(bar_type):
   global pH,pL,totalV,rx,ro,bar_x_high,bar_x_bot,bar_o_high,bar_o_bot
   if bar_type == 'x':
     p=len(bar_x_bot)-1
     del bar_x_bot[p]
     del bar_x_high[p]
     del bar_x_total[p]
     del rx[p]
   elif bar_type == 'o':
     p=len(bar_o_bot)-1
     del bar_o_bot[p]
     del bar_o_high[p]
     del bar_o_total[p]
     del ro[p]

def mod_up(x,unit):
  n=0
  if x>unit:
	rmod=math.modf(x/unit)
	if rmod[0]>unit/2:
	  n=rmod[1]+1
	else:
	  n=rmod[1]
	return n*unit

def mod_down(x,unit):
  n=0
  if x>unit:
        rmod=math.modf(x/unit)
        if rmod[0]>unit/2:
          n=rmod[1]+1
	else:
	  n=rmod[1]
        return n*unit
  else:
        return x
	
def bar_error_check():
  global trend,pH,pL,totalV,l,h,tpH,tpL,v,step,bar_x_high,bar_o_high,bar_x_bot,bar_o_bot,bar_x_total,bar_o_total,rx,ro
  if rx[-1]>ro[-1] and len(bar_x_bot)>0 and len(bar_o_bot)>0:
     if bar_x_bot[-1]-bar_o_bot[-1]-step <>0:
       print('Error1: rx='+str(rx[-1])+' ro='+str(ro[-1]))
  elif rx[-1]<ro[-1] and len(bar_x_bot)>0 and len(bar_o_bot)>0:
     if bar_x_bot[-1]+bar_x_high[-1]-step <> bar_o_bot[-1]+bar_o_high[-1]:
       print('Error2: rx='+str(rx[-1])+' ro='+str(ro[-1])+' rx_high='+str(bar_x_bot[-1]+bar_x_high[-1])+' ro_high='+str(bar_o_bot[-1]+bar_o_high[-1]))

def trend_keep():
  global trend,pH,h,pL,l,totalV,tpH,tpL,step,v
  if trend == 1: 
    if pH < mod_up(h,step):
       pH=mod_up(h,step)
    tpH=pH-step*4
    if pL == 0:
      pL = mod_down(l,step)
  elif trend == -1:
    if pL>mod_down(l,step):
       pL=mod_down(l,step)
    tpL=pL+step*4
    if pH == 0:
      pH = mod_up(h,step)
  totalV=totalV+v
#  print("trend_keep:"+str(trend)+"|"+str(totalV)+"|"+str(pH)+'|'+str(pL)+'|'+str(pH)+'|'+str(pL))
  print('trend_keep:h('+str(h)+')l('+str(l)+')pH('+str(pH)+')tpH('+str(tpH)+')tpL('+str(tpL)+')pL('+str(pL)+')totalV('+str(totalV)+')trend('+str(trend)+')')


def trend_turn():
  global trend,pH,pL,totalV,l,h,tpH,tpL,v,step,bar_x_high,bar_o_high,bar_x_bot,bar_o_bot,bar_x_total,bar_o_total,rx,ro
  #print('trent:'+str(trend))
  if (trend == 1):
    trend=-1
    if mod_up(h,step)>pH:
       pH=mod_up(h,step)
    bar_append('x')
    print("UpStop:bar_x_added:pL="+str(bar_x_bot[-1])+",pH="+str(bar_x_bot[-1]+bar_x_high[-1])+",rx="+str(rx[-1]))
    bar_error_check()
#    print("X: pH="+str(pH)+",pL="+str(pL)+",v="+str(totalV)) 
    pH=pH-step
    tpH=pH-step*4
    if tpH-step > mod_down(l,step):
      pL=mod_down(l,step)
    else:
        pL=tpH-step
    tpL=pL+step*4
    totalV=v
  elif (trend == -1):
    trend=1
    #print('changed from -1 to 1:'+str(trend))
     #print("O,"+str(pH-pL)+","+str(pL)+","+str(totalV))
    bar_append('o')
    print("DownStop:bar_o_added:pH="+str(bar_o_bot[-1]+bar_o_high[-1])+",pL="+str(bar_o_bot[-1])+",ro="+str(ro[-1]))
    bar_error_check()
    pL=pL+step
    tpL=pL+step*4
    if tpL+step < mod_up(h,step):
      pH=mod_up(h,step)
    else:
      pH=tpL+step
    tpH=pH-step*4
    totalV=v
  print('NewTrend('+str(trend)+') after set rx='+str(rx[-1])+'|ro='+str(ro[-1])+':h('+str(h)+')l('+str(l)+')pH('+str(pH)+')tpH('+str(tpH)+')tpL('+str(tpL)+')pL('+str(pL)+')totalV('+str(totalV))

def trend_unknown():
  global trend,pH,pL,totalV,c,l,h,tpH,tpL,v,step,bar_x_high,bar_o_high,bar_x_bot,bar_o_bot,bar_x_total,bar_o_total,rx,ro
  if pH == pL and pH == 0:
    pH=mod_up(h,step)
    tpH=pH-4*step
    pL=mod_down(l,step)
    tpL=pL+4*step
  elif mod_down(l,step)<pL:
    pL=mod_down(l,step)
    tpL=pL+4*step
  elif mod_up(h,step)>pH:
    pH=mod_up(h,step)
    tpH=pH-4*step
    totalV=totalV+v
  if pH-pL > 5*step:
    if l>tpH and c > tpH:
      trend=1
      rx.append(1)
      ro.append(2)
      trend_status='k'
    elif h<tpL and c < tpL:
      trend=-1
      rx.append(2)
      ro.append(1)
      trend_status='k'
  totalV=totalV+v
  print('trend_unknown:h('+str(h)+')l('+str(l)+')pH('+str(pH)+')pL('+str(pL)+')totalV('+str(totalV)+')trend('+str(trend)+')')

def trend_rollback():
  global trend,trend_status,pH,pL,totalV,l,h,tpH,tpL,v,step,bar_x_high,bar_o_high,bar_x_bot,bar_o_bot,bar_x_total,bar_o_total,rx,ro
  if trend == 1:
    trend = -1
    trend_status='k'
    pH=bar_o_bot[-1]+bar_o_high[-1]
    tpH=pH-4*step
    pL=bar_o_bot[-1]
    tpL=pL+4*step
    totalV=totalV+bar_o_total[-1]
    bar_remove('o')
    print("bar_o_removed trend -1 pH="+str(pH)+",pL="+str(pL)+",rx"+str(rx[-1])+"|ro="+str(ro[-1])+'x_bot='+str(bar_x_bot[-1])+'x_high='+str(bar_x_high[-1]))
    bar_error_check()
    trend_keep()
  elif trend == -1:
    trend = 1
    trend_status='k'
    pH=bar_x_bot[-1]+bar_x_high[-1]
    tpH=pH-4*step
    pL=bar_x_bot[-1]
    tpL=pL+4*step
    totalV=totalV+bar_x_total[-1]
    bar_remove('x')
    print("bar_x_removed trend 1 pL="+str(pL)+",pH="+str(pH)+",rx="+str(rx[-1])+'|ro='+str(ro[-1])+',o_bot'+str(bar_o_bot[-1])+',o_high='+str(bar_o_high[-1]))
    bar_error_check()
    trend_keep()
#  print('trend_rollback:h('+str(h)+')l('+str(l)+')pH('+str(pH)+')tpH('+str(tpH)+')tpL('+str(tpL)+')pL('+str(pL)+')totalV('+str(totalV)+')trend('+str(trend)+')rx='+str(rx[-1])+'|ro='+str(ro[-1]))


def check_result():
  global trend,trend_status,pH,pL,totalV,l,h,tpH,tpL,v,step,bar_x_high,bar_o_high,bar_x_bot,bar_o_bot,bar_x_total,bar_o_total,rx,ro
  for i in range(len(rx)):
     print('rx='+str(rx[i])+',pL='+str(bar_x_bot[i])+',pH='+str(bar_x_bot[i]+bar_x_high[i]))


def final_bar():
  global trend,trend_status,pH,pL,totalV,l,h,tpH,tpL,v,step,bar_x_high,bar_o_high,bar_x_bot,bar_o_bot,bar_x_total,bar_o_total,rx,ro
  if trend_status == 'k':
    if trend == 1:
      bar_append('x')
    elif trend == -1:
      bar_append('o')
     
  
#print(stock_symbol)
filename="/var/tmp/history/" + stock_symbol
#myfile=Path(filename)
#histbars=numpy.loadtxt(open(filename,"rb"),delimiter=",",skiprows=0)

efile=open(filename)
eReader=csv.reader(efile,delimiter=',')

trend_status='k'
startH=startL=0

for row in eReader:
  print('eReader:'+str(eReader.line_num))
  if len(bar_x_high)>0:
    print('x0:'+str(bar_x_high[0]+bar_x_bot[0])+','+str(bar_x_bot[0]))
  if (row[1] != 'date'):
    days.append(row[1])
    h=float(row[4])
    c=float(row[3])
    l=float(row[5])
    v=float(row[6])
    print('eReader:'+str(eReader.line_num)+'|'+str(h)+'|'+str(l)+'|'+str(c)+'|'+str(v))
    if (trend == 0 or pH-pL<4*step ):
        trend_unknown()
        trend_status='u'
    if ((c >= tpH and trend == 1) or ( c <= tpL and trend == -1)):
	trend_keep()
	trend_status='k'
    elif ((c <tpH and trend == 1) or ( c > tpL and trend == -1)):
        if trend_status =='k':
	  trend_turn()
          trend_status='t' 
        elif trend_status =='t' and len(rx) > 3 and len(ro) > 3:
	  trend_rollback()
	  trend_status='k'

efile.close()

final_bar()

barWidth=1

check_result()

#plt.bar(rx,bar_x_high,bottom=bar_x_bot,color='green',width=barWidth)
#plt.bar(ro,bar_o_high,bottom=bar_o_bot,color='blue',width=barWidth)
#plt.show()

#exit(0)

dfx = pd.DataFrame({'x':rx,'x_bot':bar_x_bot,'x_high':bar_x_high,'x_v':bar_x_total})
dfo = pd.DataFrame({'o':ro,'o_bot':bar_o_bot,'o_high':bar_o_high,'o_v':bar_o_total})

#print('rx'+str(len(ro)))
#print(ro)
#print(bar_o_high)
#print(bar_o_bot)

#print(len(rx))
#print(rx)
#print(bar_x_high)
#print(bar_x_bot)

plt.figure(figsize=(12,8))
gs=gridspec.GridSpec(2,1,height_ratios=[5,1])
fig,axes = plt.subplots(nrows=2,ncols=1,sharex=True,sharey=False)

axes[0]=plt.subplot(gs[0])
axes[1]=plt.subplot(gs[1])
axes[0].grid(True)
axes[1].grid(True)

if rx[0] == 2:
  axes[0].bar( 'x','x_high',bottom='x_bot',data=dfx,color='green',width=barWidth)
  axes[0].bar( 'o','o_high',bottom='o_bot',data=dfo,color='red',width=barWidth)
  axes[1].bar( 'x','x_v',data=dfx,color='black',width=barWidth)
  axes[1].bar( 'o','o_v',data=dfo,color='red',width=barWidth)
elif rx[0] == 1:
  axes[0].bar( 'o','o_high',bottom='o_bot',data=dfo,color='red',width=barWidth)
  axes[0].bar( 'x','x_high',bottom='x_bot',data=dfx,color='green',width=barWidth)
  axes[1].bar( 'o','o_v',data=dfo,color='red',width=barWidth)
  axes[1].bar( 'x','x_v',data=dfx,color='black',width=barWidth)

axes[0].title.set_text('Point & Figure Chart '+ stock_symbol+'  ('+days[0]+'~'+days[-1]+') step='+str(step))
axes[1].title.set_text('Volume')

print rx[0],bar_x_bot[0],bar_x_high[0]
plt.show()



