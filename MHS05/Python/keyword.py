from konlpy.tag import Okt
import DBmanager as db
import matplotlib.pyplot as plt
from matplotlib import rc
import pandas as pd
from collections import Counter
from wordcloud import WordCloud
import numpy as np
from PIL import *

#뉴스번호 받아서 내용뽑아내는 함수
def getNote(nno) :
    dbms = db.DBmanager() 
    
    if dbms.DBOpen("127.0.0.1", 3306, "memodb", "root", "ezen") == False :
        print("ERROR")
    else :
        print("OK")
        
    sql = f"select * from memo where no = {nno}" 
    print(sql)
    dbms.OpenQuery(sql)
    total = dbms.GetTotal()
    
    print(total)
    
    text   = ""
    newsno = ""
    for i in range(total) :
        text   = dbms.GetValue(i, "note")
        newsno = dbms.GetValue(i, "no")
        
    print("뉴스번호", newsno)
    print(text)
    dbms.DBClose()
    return text, newsno

#Okt,뉴스번호, 뉴스내용 받아서 키워드 뽑고 데이터베이스에 저장
def insertKeyword(Okt,nno,text) :
    
    dbms = db.DBmanager() 
    
    if dbms.DBOpen("127.0.0.1", 3306, "memodb", "root", "ezen") == False :
        print("ERROR")
    else :
        print("OK")
    
    #형태소 분석 (명사)
    nouns = Okt.nouns(text)
    #print(nouns)
    #print("=" * 150)
    
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
    
    df = pd.DataFrame(nouns)
    #print(df)
    
    #행과 열을 뒤집는다.
    df = df.transpose()
    df.columns = [ "단어", "빈도수" ]
    #빈도수를 숫자로 변환
    df["빈도수"] = df["빈도수"].astype("int64")
    df = df.sort_values(by="단어", ascending=True)
    #print(df)
    #print(df.dtypes)
    
    rc('font', family='Malgun Gothic')
    plt.figure(figsize=(20,10))
    plt.plot(df["단어"], df["빈도수"], label="빈도수", marker="o")
    plt.legend()
    plt.title("단어별 빈도")
    plt.xticks(rotation=45)
    plt.grid(True)
    plt.show()
    
    
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
    
    key = list(wordlist.keys())
    value = list(wordlist.values())
    for i in range(0,len(key)):
        if value[i] > 1 :
            sql   = "insert into newskeyword (nno, nkey, nkeynum) "
            sql  += "values ('%s','%s','%s') " %(nno,key[i],value[i])
            print(sql)
            dbms.RunSql(sql)
            #print("단어 :", key[i], value[i],"회")
        else :
            dbms.DBClose()
            break



text, nno = getNote(1)

Okt = Okt()

insertKeyword(Okt, nno, text)
