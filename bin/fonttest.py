#!/Library/Frameworks/Python.framework/Versions/2.7/bin/python
# -*- coding: utf-8 -*-

import matplotlib as mpl
import matplotlib.pyplot as plt
font_name = "Songti SC Light"
#font_name = "STKaiti"
#reload(sys)  # Reload does the trick!
#sys.setdefaultencoding('UTF8')

print u'测试'.encode('utf-8')
mpl.rcParams['font.sans-serif'] = ['Heiti SC']
mpl.rcParams['axes.unicode_minus']=False # in case minus sign is shown as box

plt.text(0.5, 0.5, s=u'测试')
plt.show()
