---
layout: post
title:  "StarbucksHolic in Seoul"
date:   2021-09-14
excerpt: "Starbucks on every corner"
tag:
- Coffee
- Franchise
- Seoul Map
- Starbucks
- Idiya
- StarbucksHolic
comments: true
---

South Korea has more than 1,200 Starbucks locations, more than the United Kingdom,
resulting in the country one of the coffee giant's largest markets. 

Foreigners can visit Starbucks shortly after arriving in South Korea.    
He can discover the stores have a lot in common with locations in US.   

I also like the place with a fancy sign "STARBUCKS".     
In Korea, "STARBUCKS" means something more than a cup of coffee.   
It cost a lot to a person who couldn't pay for a culture or brand.     
When STARBUCKS launched in Korea, 
Someone who grab a cup of STARBUCKS coffee seems to be a stylish trend person.   

And STARBUCKS Hit Until now. 

But it's too much expecially in Seoul even though I am writing this post in Starbucks located in GangNam, Seoul.    

I got a list of street stores. 

[Street Store & Restaurant Info.]

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
      <th>Store name</th>
      <th>Country-in-class classification name</th>
      <th>Classification name</th>
      <th>Classification name-2</th>
      <th>City</th>
      <th>Town</th>
      <th>Administrative name</th>
      <th>Legal name</th>
      <th>Street name address</th>
      <th>Longitude</th>
      <th>Latitude</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>비지트</td>
      <td>음식</td>
      <td>한식</td>
      <td>한식/백반/한정식</td>
      <td>서울특별시</td>
      <td>서초구</td>
      <td>방배4동</td>
      <td>방배동</td>
      <td>서울특별시 서초구 동광로18길 82</td>
      <td>126.991394</td>
      <td>37.488375</td>
    </tr>
    <tr>
      <th>1</th>
      <td>쓰리에프</td>
      <td>음식</td>
      <td>한식</td>
      <td>한식/백반/한정식</td>
      <td>서울특별시</td>
      <td>동작구</td>
      <td>사당2동</td>
      <td>사당동</td>
      <td>서울특별시 동작구 동작대로27가길 12</td>
      <td>126.980952</td>
      <td>37.487105</td>
    </tr>
    <tr>
      <th>2</th>
      <td>채움</td>
      <td>음식</td>
      <td>한식</td>
      <td>한식/백반/한정식</td>
      <td>서울특별시</td>
      <td>종로구</td>
      <td>종로1.2.3.4가동</td>
      <td>수송동</td>
      <td>서울특별시 종로구 삼봉로 81</td>
      <td>126.981794</td>
      <td>37.572387</td>
    </tr>
    <tr>
      <th>3</th>
      <td>호구의주방</td>
      <td>소매</td>
      <td>가정/주방/인테리어</td>
      <td>주방가구판매</td>
      <td>서울특별시</td>
      <td>영등포구</td>
      <td>양평2동</td>
      <td>양평동4가</td>
      <td>서울특별시 영등포구 선유로 269</td>
      <td>126.897892</td>
      <td>37.536700</td>
    </tr>
    <tr>
      <th>4</th>
      <td>다향</td>
      <td>음식</td>
      <td>한식</td>
      <td>한식/백반/한정식</td>
      <td>서울특별시</td>
      <td>서초구</td>
      <td>서초3동</td>
      <td>서초동</td>
      <td>서울특별시 서초구 효령로 230</td>
      <td>127.009382</td>
      <td>37.483436</td>
    </tr>
  </tbody>
</table>
</div>

<details>
<summary>Folding Python Code (click!)</summary>
<div markdown="1">

```python
import pandas as pd
import numpy as np
import seaborn as sns
import googletrans
from googletrans import Translator
import matplotlib.pyplot as plt
from IPython.display import set_matplotlib_formats

translator = Translator()

plt.rc("font", family="AppleGothic")
plt.rc("axes", unicode_minus=False)

set_matplotlib_formats("retina")

#Data Source : https://www.data.go.kr/dataset/15012005/fileData.do
df = pd.read_csv("../../info_202106_.csv")
df.rename(columns=lambda x: translator.translate(x).text, inplace=True)

columns = ['Mutual name', 'Country-in-class classification name', 'Classification name', 'Summary', 
           'Attempt', 'Life', 'Administrative name', 'Legal name', 'Street name address', 
           'Hardness', 'Latitude']
df = df[columns].copy()
df = df.rename(columns = {'Mutual name' : 'Store name', 'Summary' : 'Classification name-2', 'Attempt':'City', 'Life': 'Town','Hardness':'Longitude'})
df.head()
```

</div>
</details>

![png](../assets/img/coffee_output_1.png)
![png](../assets/img/coffee_output_2.png)

