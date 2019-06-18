```python
import datetime
import time

def getdays(N:int):
    '''
    get the N days after the date 
    
    '''
    startday = '20190520'
    tempStartTime = time.mktime(time.strptime(startday,'%Y%m%d'))
    tempEndTime = tempStartTime + N * 24*60*60
    endDay = time.strftime('%Y%m%d',time.localtime(tempEndTime))
    return endDay
    
    
```

### 获取N天后的日期

