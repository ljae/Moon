---
layout: post
title:  "Invest in BTS"
date:   2021-09-03
excerpt: "BTS Theme Stock, Not just BIGHIT MUSIC"
tag:
- BTS
- ChorokBaem (052300)
- BTS Universe
- Wealth retirement
- Stock invest
comments: true
---

# "BTS가 드라마를 찍고 있데!" 



한류의 중심 BTS가 드라마를?
방구석 1열을 할 자세를 잡을때가 아니다...

이소식과 함께 나의 귀를 꽂히는 와이프의 목소리 

# "주식 사놓으라고 하던데..."

가슴이 두근거린다... 벌써 수익율을 재고 있는 나의 가벼움을 다시한번 느낀다

# "주식... 그거 돈 되나? 뭔데 종목이..?"

드디어 투자자의 길에 한발짝 다가선것이 아닌가?

# "초록뱀"

나의 빠른 손은 앱을 열고 검색에 들어간다.. 앗.. 이런!!
두근거리는 가슴을 부여잡고 관심없는 듯 한마디를 건넨다...

# "초록뱀 미디어 야 ? 아니면 컴퍼니야?"

나란 미생과 같은 존재는 이제 시장이란 큰 존재를 마주하게 되었다.

# "초록뱀 컴퍼니! 한달후에 팔면 된데~"

그렇다! 종목코드 052300 느낌이 좋다!


```python
import numpy as np # linear algebra
import pandas as pd # data processing, CSV file I/O (e.g. pd.read_csv)
from bs4 import BeautifulSoup
import urllib
from urllib import request
import re
import json
from datetime import datetime
```


```python
from random import shuffle
#Setup
client_id = "04LzL8RxAI189CkIrgjq" # 애플리케이션 등록시 발급 받은 값 입력
client_secret = "A7Sdk_0_zu" # 애플리케이션 등록시 발급 받은 값 입력

link = "https://openapi.naver.com/v1/datalab/search"
requested = request.Request(link)
requested.add_header("X-Naver-Client-Id",client_id)
requested.add_header("X-Naver-Client-Secret",client_secret)
requested.add_header("Content-Type","application/json")
```


```python
today = str(datetime.now().date()); today
body = "{\"startDate\":\"2020-01-01\",\"endDate\":\""+today+"\",\"timeUnit\":\"date\",\"keywordGroups\":[{\"groupName\":\"초록뱀\",\"keywords\":[\"초록뱀\",\"초록뱀 미디어\",\"초록뱀 컴퍼니\",\"W홀딩컴퍼니\"]},{\"groupName\":\"BTS\",\"keywords\":[\"BTS\",\"비티에스\",\"유스\",\"YOUTH\"]}]}";
response = urllib.request.urlopen(requested, data=body.encode("utf-8"))

rescode = response.getcode()

if(rescode==200):
    response_body = response.read()
    output_data = response_body.decode('utf-8')
else:
    print('Error code:'+ rescode)


result = json.loads(output_data)
```


```python
date = [a['period'] for a in result['results'][0]['data']]

chorok_ratio = [a['ratio'] for a in result['results'][0]['data']]
BTS_ratio = [a['ratio'] for a in result['results'][1]['data']]

df1 = pd.DataFrame({'date':date, 
              '초록뱀':chorok_ratio,
              'BTS':BTS_ratio})
#df1 = df1.set_index("date")

df1['date'] = pd.to_datetime(df1['date'], format='%Y-%m-%d', errors='raise')
colors = ['#BB0000', '#0000BB']

df1.plot(title = "Naver Trend", figsize = (20, 10), legend = False,x='date', color = colors)



df1.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>date</th>
      <th>초록뱀</th>
      <th>BTS</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>2020-01-01</td>
      <td>0.08387</td>
      <td>6.76173</td>
    </tr>
    <tr>
      <th>1</th>
      <td>2020-01-02</td>
      <td>0.33632</td>
      <td>2.75852</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2020-01-03</td>
      <td>0.30654</td>
      <td>1.93271</td>
    </tr>
    <tr>
      <th>3</th>
      <td>2020-01-04</td>
      <td>0.08141</td>
      <td>2.13680</td>
    </tr>
    <tr>
      <th>4</th>
      <td>2020-01-05</td>
      <td>0.08469</td>
      <td>3.12492</td>
    </tr>
  </tbody>
</table>
</div>




```python
import FinanceDataReader as fdr
df2 = fdr.DataReader('052300','2020-01-01',today)
df2 = df2[['Close','Volume']]
df2 = df2.reset_index()

df2['Date'] = pd.to_datetime(df2['Date'], format='%Y-%m-%d', errors='raise')


df2.head()
```


    ---------------------------------------------------------------------------

    AttributeError                            Traceback (most recent call last)

    <ipython-input-5-53dfd9ff5ac7> in <module>()
    ----> 1 import FinanceDataReader as fdr
          2 df2 = fdr.DataReader('052300','2020-01-01',today)
          3 df2 = df2[['Close','Volume']]
          4 df2 = df2.reset_index()
          5 


    ~/miniconda3/lib/python3.6/site-packages/FinanceDataReader/__init__.py in <module>()
    ----> 1 from .data import (DataReader)
          2 from .data import (StockListing)
          3 from .data import (EtfListing)
          4 
          5 __version__ = '0.9.10'


    ~/miniconda3/lib/python3.6/site-packages/FinanceDataReader/data.py in <module>()
    ----> 1 from FinanceDataReader.investing.data import (InvestingDailyReader)
          2 from FinanceDataReader.fred.data import (FredReader)
          3 from FinanceDataReader.krx.data import (KrxDelistingReader)
          4 from FinanceDataReader.naver.data import (NaverDailyReader)
          5 from FinanceDataReader.nasdaq.listing import (NasdaqStockListing)


    ~/miniconda3/lib/python3.6/site-packages/FinanceDataReader/investing/data.py in <module>()
          1 from io import StringIO
          2 import json
    ----> 3 import requests
          4 import pandas as pd
          5 from FinanceDataReader._utils import (_convert_letter_to_num, _validate_dates)


    ~/miniconda3/lib/python3.6/site-packages/requests/__init__.py in <module>()
         85 # Check imported dependencies for compatibility.
         86 try:
    ---> 87     check_compatibility(urllib3.__version__, chardet.__version__)
         88 except (AssertionError, ValueError):
         89     warnings.warn("urllib3 ({}) or chardet ({}) doesn't match a supported "


    AttributeError: module 'chardet' has no attribute '__version__'



```python
df = pd.merge(df1,df2,left_on='date',right_on='Date',how='outer')

df.head(20)
```


```python
df = df.loc[:, ['date','초록뱀','BTS','Close','Volume']]

df = df.fillna(method='ffill')

#df.plot(title = "Stock-Daily", figsize = (20, 10), legend = False)
df.head(20)
```