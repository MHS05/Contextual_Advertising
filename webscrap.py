#웹 문서를 수집하기
import requests
from bs4 import BeautifulSoup

url        = "https://kormedi.com/1655481/%ea%b5%ad%ea%b0%80%ed%91%9c%ec%a4%80%ec%8b%9d%ed%92%88%ec%84%b1%eb%b6%84%ed%91%9c%eb%a5%bc-%eb%b3%b4%eb%a9%b4-%eb%8b%ac%ea%b1%80-%ed%94%84%eb%9d%bc%ec%9d%b4%ec%99%80-%ec%82%b6%ec%9d%80-%eb%8b%ac/"
agent_head = { "user-agent" : "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36" }

response = requests.get(url,headers=agent_head)
html     = response.text
#print(html)
#print("=" * 30)

soap = BeautifulSoup(html, "lxml")

#기사 제목 추출
title = soap.find("h1").getText()
#print(title)
#print("=" * 30)

#기사 내용 추출
note = soap.find("article", class_="post-1655481").select("p" )
text = ""
for item in note :
    text += item.getText()
#print(text)
#print("=" * 30)

#기사에 대해서 형태소 분석한다.
from konlpy.tag import Okt

#형태소 분석을 시작한다.
Okt = Okt()

#형태소 분석 (명사)
nouns = Okt.nouns(text)
#print(nouns)
#print("=" * 150)

#명사의 출현빈도수를 계산한다.
from collections import Counter

#명사 빈도 계산
count = Counter(nouns)
nouns = count.most_common(80)
#print(nouns)
#print("=" * 150)

#튜플을 DataFrame으로 변환하기 위한 리스트로 변환
words = []
count = []
for item in nouns :
    words.append(item[0])
    count.append(item[1])
    
nouns = [ words, count ]
#print(nouns)

import pandas as pd
df = pd.DataFrame(nouns)
#print(df)

#행과 열을 뒤집는다.
df = df.transpose()
df.columns = [ "단어", "빈도수" ]
#빈도수를 숫자로 변환
df["빈도수"] = df["빈도수"].astype("int64")
df = df.sort_values(by="단어", ascending=True)
print(df)
print(df.dtypes)

#빈도수 그래프를 그린다.
import matplotlib.pyplot as plt
from matplotlib import rc

rc('font', family='Malgun Gothic')
plt.figure(figsize=(20,10))
plt.plot(df["단어"], df["빈도수"], label="빈도수", marker="o")
plt.legend()
plt.title("단어별 빈도")
plt.xticks(rotation=45)
plt.grid(True)
plt.show()

#워드 클라우드 표시
from wordcloud import WordCloud
import numpy as np
from PIL import *

#워드클라우드의 모양 설정. 원모양의 이미지를 그대로 가져와 만들도록 하였음.
cand_mask=np.array(Image.open('sun.png'))

#워드 클라우드 표시용 딕셔너리로 변환
wordlist = {}
for i in range(0,df["단어"].count()):
    #print(df["단어"][i])
    #print(df["빈도수"][i])
    wordlist[df["단어"][i]] = df["빈도수"][i]
print(wordlist)

wordcloud = WordCloud(font_path = 'HANYGO230.ttf', relative_scaling=0.5, background_color='white', mask=cand_mask,);
wordcloud.generate_from_frequencies(wordlist)
plt.figure(figsize=(20,10))
plt.imshow(wordcloud)
plt.axis("off")
plt.show()