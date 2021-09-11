---
layout: post
title:  "Population in Korea"
date:   2021-08-26
excerpt: "Korean Population : More Deaths Than Births"
tag:
- machine learning
- Korean Population
- python
- data visulaization
comments: true
---

Let's look at the population in Korea.   

South Korea's population reached more than 50 million in 2016   
and it's about **51 million** this year, 2021.   

But **living alone and childless** is becoming a way of life for a younger generation in Korea these days.
South Korea reports population drop, with **more deaths than births for the first time last year**.    

Like other developed countries such as Japan,    
Korea is well known for being a fast-aging country in the world.    
This graph shows that South Korea's demographic history.   
The population of Korea has increased till now except when the Korean war broke out in the 1950s.   

[Population in Korea by the year]
<details>
<summary>Folding Python Code (click!)</summary>
<div markdown="1">

```python
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from IPython.display import set_matplotlib_formats
url = "https://en.wikipedia.org/wiki/Demographics_of_South_Korea"
df = pd.read_html(url)
df = df[8]
df.rename(columns = {"Unnamed: 0": "year"}, inplace = True)
set_matplotlib_formats("retina")
plt.figure(figsize=(15,4))
p = sns.barplot(data=df, x="year",y="Average population",palette="Blues")
plt.xticks(range(0,len(df["year"]),5))
p.set_ylabel("Population in Korea by the year")
```

</div>
</details>
    
![png](../assets/img/output_2_1.png)
    
I have two children. And I had 

[Live Births & Deaths in Korea]
<details>
<summary>Folding Python Code (click!)</summary>
<div markdown="1">

```python
plt.figure(figsize=(15,4))
p = sns.lineplot(data = df,x="year",y="Live births", color="skyblue")
p = sns.lineplot(data = df,x="year",y="Deaths", color="orange")
plt.xticks(range(0,len(df["year"]),5))
plt.legend(labels = ['Live Briths','Deaths'],loc = 'upper right')
p.set_ylabel("Births & Deaths")
```


</div>
</details>









    
![png](../assets/img/output_4_1.png)
