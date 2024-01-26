from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity
import re
from konlpy.tag import Okt
import pandas as pd
from konlpy.tag import Okt
import DBmanager as db
import matplotlib.pyplot as plt
from matplotlib import rc
import pandas as pd
from collections import Counter
from wordcloud import WordCloud
import numpy as np
from PIL import *
import pymysql

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

def getSimilary(nno, adno) :
    dbms = db.DBmanager() 
    
    if dbms.DBOpen("127.0.0.1", 3306, "memodb", "root", "ezen") == False :
        print("ERROR")
    else :
        print("OK")
        
    sql = f"select nkey from newskeyword where nno = {nno}" 
    dbms.OpenQuery(sql)
    total = dbms.GetTotal()
    
    
    list = ""
    for i in range(0,10) :
        key = dbms.GetValue(i, "nkey")
        list = list + key
        if i != 9 :
            list = list + ","

    print(list)
    
    sql = f"select adkey from adkeyword where adno = {adno}" 
    dbms.OpenQuery(sql)
    total = dbms.GetTotal()
    
    
    adlist = ""
    for i in range(0,total) :
        key = dbms.GetValue(i, "adkey")
        adlist = adlist + key
        if i != (total-1) :
            adlist = adlist + ","
    
    print(adlist)
    
    dbms.DBClose()
     
    #데이터 베이스에 연결
    con = pymysql.connect(host="192.168.0.101", port=3306, 
                          user="root", passwd="ezen", 
                          db="mhs", charset="euckr")
    
    #문맥객체 statement -> SQL 구문을 실행 -> resultset
    #cursor 객체를 이용해서, sql 구문을 실행하고, 결과를 받아옴
    cursor = con.cursor()
    
    # TF-IDF 계산 및 코사인 유사도 측정 (# 문장을 콤마로 이어서 리스트에 추가)
    sentences = ["".join(list),adlist] 
    print(sentences)
    tfidf_vectorizer = TfidfVectorizer()
    tfidf_matrix = tfidf_vectorizer.fit_transform(sentences)
    print(tfidf_matrix)
    print("=" * 60)
    print(tfidf_matrix[0:1])
    print("=" * 60)
    print(tfidf_matrix[1:2])
    print("=" * 60)
    cos_similar = cosine_similarity(tfidf_matrix[0:1], tfidf_matrix[1:2])
    print("코사인 유사도 측정")
    sim = cos_similar[0][0]
    print(sim)
    sim = f'{sim : .2f}'
    
    sql  = "insert into similarity (nkey, adkey, similary, adno, nno) values "
    sql += "('%s', '%s', '%s', '%d', '%d')" %(list, adlist, sim, adno, nno)
    #cursor.execute(sql)
    con.commit()
    
    cursor.close()
    con.close()
    
    return list, adlist, sim

#text, nno = getNote(1)
#Okt = Okt()
#insertKeyword(Okt, nno, text)
list,adlist,sim = getSimilary(1,1)
print(list)
print(adlist)
print(sim)


