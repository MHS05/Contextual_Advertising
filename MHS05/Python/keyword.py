from konlpy.tag import Okt
import DBmanager as db
import matplotlib.pyplot as plt
from matplotlib import rc
import pandas as pd
from collections import Counter
from wordcloud import WordCloud
import numpy as np
from PIL import *
import pickle
import pymysql
from tensorflow.keras.preprocessing.sequence import pad_sequences
from tensorflow.keras.models import load_model
import re
from kss import split_sentences
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity
import time

#뉴스번호 받아서 내용뽑아내는 함수
def getNote(nno) :
    dbms = db.DBmanager() 
    
    if dbms.DBOpen("192.168.0.101", 3306, "mhs", "root", "ezen") == False :
        print("ERROR")
        return False
        
    sql = f"select * from news where nno = {nno}" 
    #print(sql)
    dbms.OpenQuery(sql)
    total = dbms.GetTotal()
    
    #print(total)
    
    text   = ""
    newsno = ""
    for i in range(total) :
        text   = dbms.GetValue(i, "note")
        newsno = dbms.GetValue(i, "no")
        
    #print("뉴스번호", newsno)
    #print(text)
    text = re.sub(r'[^ㄱ-ㅎㅏ-ㅣ가-힣. ]','', text)
    return text, newsno

#뉴스 내용의 감정 분석
def getEmotion(Okt,nno) :
    
    text,newsno = getNote(nno)
    stop_words = pd.read_csv('stopword.txt',header=None,
                             encoding='utf-8')

    stop_words = stop_words[0]
    stopwords = []
    for i in range(0,len(stop_words)):
        data = stop_words[i]
        stopwords.append(data)
    
    #print(stopwords)
    
    max_len = 30

    with open('tokenizer.pickle', 'rb') as handle:
        tokenizer = pickle.load(handle)

    loaded_model = load_model('best_model.h5')
    
    dbms = db.DBmanager() 
    if dbms.DBOpen("192.168.0.101", 3306, "mhs", "root", "ezen") == False :
        print("ERROR")
        
    def sentiment_predict(new_sentence):
        new_sentence = re.sub(r'[^ㄱ-ㅎㅏ-ㅣ가-힣 ]','', new_sentence)
        #print(new_sentence)
        new_sentence = Okt.morphs(new_sentence, stem=True) # 토큰화
        new_sentence = [word for word in new_sentence if not word in stopwords] # 불용어 제거
        encoded = tokenizer.texts_to_sequences([new_sentence]) # 정수 인코딩
        pad_new = pad_sequences(encoded, maxlen = max_len) # 패딩
        score = float(loaded_model.predict(pad_new)) # 예측
        if(score > 0.5):
            str = "{:.2f}% 확률로 긍정 뉴스입니다.\n".format(score * 100)
            print(str)
            sql   = "update news "
            sql  += "set emotion = '%s', score = '%s' where nno = %d " %("긍정","{:.2f}".format(score * 100),nno)
            dbms.RunSql(sql)
            dbms.DBClose()
            return text, nno,"{:.2f}".format(score * 100), "긍정"
        else:
            str = "{:.2f}% 확률로 부정 뉴스입니다.\n".format((1 - score) * 100)
            print(str)
            sql   = "update news "
            sql  += "set emotion = '%s', score = '%s' where nno = %d " %("부정","{:.2f}".format((1 - score) * 100),nno)
            dbms.RunSql(sql)
            dbms.DBClose()
            return text, nno, "{:.2f}".format((1 - score) * 100), "부정"
    return sentiment_predict(text)
    
#뉴스내용을 문장별로 분리 하고, 각 문장별 감정 분석 결과 DB저장
def insertSentance(Okt, nno, text) :
    
    dbms = db.DBmanager() 

    if dbms.DBOpen("192.168.0.101", 3306, "mhs", "root", "ezen") == False :
        print("ERROR")
        return False
    
    text = re.sub(r'[^ㄱ-ㅎㅏ-ㅣ가-힣.]','', text)
    text = re.sub(r'\s', '', text)
    text = split_sentences(text)
    #가져온 뉴스내용을 문장으로 구분
    
    
    #임시로 text 길이만큼 감정 리스트를 만들어 놓음
    emotion = []
    for i in range (0,len(text)):
        emotion.append(i) 
        
    import pandas as pd
    #판다스로 문장, 감정을 열로 갖는 데이터프레임 생성
    df = pd.DataFrame({"text":text, "emotion":emotion})
    
    #print(df)
    
    #감정데이터를 그룹핑
    group = df.groupby("emotion")["emotion"].unique()
    #print(group)
    
    test = []
    
    total_row = len(df)
    #total_row = 4
    
    #데이터프레임의 원소를 추출하여
    #((문장, 감정)) 형태를 갖는 튜플생성
    for i in range (0, total_row) :
        text = df.iloc[i]["text"]
        #print(text)
        emotion = df.iloc[i]["emotion"]
        #print(emotion)
        sentance = (text, emotion)
        #print(sentance)
        test.append(sentance)
        
    #print(test)
    #print("=" * 60)
    
    stop_words = pd.read_csv('stopword.txt',header=None,
                             encoding='utf-8')
    
    stop_words = stop_words[0]
    stopwords = []
    for i in range(0,len(stop_words)):
        data = stop_words[i]
        stopwords.append(data)
    
    #학습모델불러오기
    with open('tokenizer.pickle', 'rb') as handle:
        tokenizer = pickle.load(handle)
    
    loaded_model = load_model('best_model.h5')

    max_len = 30
    
    def sentiment_predict(new_sentence):
        new_sentence = re.sub(r'[^ㄱ-ㅎㅏ-ㅣ가-힣 ]','', new_sentence)
        new_sentence = new_sentence.strip()
        print(new_sentence)
        new_sentence = Okt.morphs(new_sentence, stem=True) # 토큰화
        new_sentence = [word for word in new_sentence if not word in stopwords] # 불용어 제거
        encoded = tokenizer.texts_to_sequences([new_sentence]) # 정수 인코딩
        pad_new = pad_sequences(encoded, maxlen = max_len) 
        score = float(loaded_model.predict(pad_new))
        if(score > 0.5):
          str = "{:.2f}% 확률로 긍정 뉴스입니다.\n".format(score * 100)
          print(str)
          return "{:.2f}".format(score * 100), "긍정"
        else:
          str = "{:.2f}% 확률로 부정 뉴스입니다.\n".format((1 - score) * 100)
          print(str)
          return "{:.2f}".format((1 - score) * 100), "부정"
      
    result = []
    for i in range(0, len(test)):
        score,emotion = sentiment_predict(test[i][0])
        sentance = test[i][0]
        sentance = re.sub(r'[^ㄱ-ㅎㅏ-ㅣ가-힣 ]','', sentance)
        sentance = sentance.strip()
        #print("문장 :",sentance)
        #print("점수 :", score)
        #print("긍부정 :", emotion)
        semotion = ( sentance , emotion, score)
        sql   = "insert into semotion (nno, sentance, emotion, score) "
        sql  += f"values ('%d','%s','%s','%s')" %(nno,sentance,emotion,score)
        dbms.RunSql(sql)
        #print(sql)
        result.append(semotion)
    dbms.DBClose()


#뉴스번호, 뉴스내용 받아서 키워드 뽑고 데이터베이스에 저장
def insertKeyword(Okt,nno,text) :
    
    dbms = db.DBmanager() 
    
    if dbms.DBOpen("192.168.0.101", 3306, "mhs", "root", "ezen") == False :
        print("ERROR")
        return False
        
    #형태소 분석 (명사)
    nouns = Okt.morphs(text, stem=True) # 토큰화
    nouns = Okt.nouns(text)
    
    stop_words = pd.read_csv('stopword.txt',header=None,
                             encoding='utf-8')
    
    stop_words = stop_words[0]
    stopwords = []
    for i in range(0,len(stop_words)):
        data = stop_words[i]
        stopwords.append(data)
        
    nouns = [word for word in nouns if not word in stopwords] # 불용어 제거
    
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
    print(nouns)
    
    df = pd.DataFrame(nouns)
    print(df)
    
    #행과 열을 뒤집는다.
    df = df.transpose()
    df.columns = [ "단어", "빈도수" ]
    #빈도수를 숫자로 변환
    df["빈도수"] = df["빈도수"].astype("int64")
    df = df.sort_values(by="단어", ascending=True)
    print(df)
    print(df.dtypes)
    
    rc('font', family='Malgun Gothic')
    plt.figure(figsize=(20,10))
    plt.plot(df["단어"], df["빈도수"], label="빈도수", marker="o")
    plt.legend()
    plt.title("단어별 빈도")
    plt.xticks(rotation=45)
    plt.grid(True)
    plt.show()
    
    
    #워드클라우드의 모양 설정. 이미지를 그대로 가져와 만들도록 하였음.
    cand_mask=np.array(Image.open('sun.png'))
    
    #워드 클라우드 표시용 딕셔너리로 변환
    wordlist = {}
    for i in range(0,df["단어"].count()):
        #print(df["단어"][i])
        #print(df["빈도수"][i])
        wordlist[df["단어"][i]] = df["빈도수"][i]
    #print(wordlist)
    
    wordcloud = WordCloud(font_path = 'HANYGO230.ttf', relative_scaling=0.5, background_color='white', mask=cand_mask,);
    wordcloud.generate_from_frequencies(wordlist)
    plt.figure(figsize=(20,10))
    plt.imshow(wordcloud)
    plt.axis("off")
    plt.show()
    
   
    keylist = list(wordlist.keys())
    valuelist = list(wordlist.values())
    for i in range(0,len(keylist)):
        if valuelist[i] > 2 :
            sql   = "insert into newskeyword (nno, nkey, nkeynum) "
            sql  += "values ('%s','%s','%s') " %(nno,keylist[i],valuelist[i])
            #print(sql)
            dbms.RunSql(sql)
            print("단어 :", keylist[i], valuelist[i],"회")
        else :
            dbms.DBClose()
            break
    
#뉴스,광고 리스트 간의 유사도 구해서 중복안된 데이터만 DB에 저장
def getSimilary(nno, adno) :
    dbms = db.DBmanager() 
    
    if dbms.DBOpen("192.168.0.101", 3306, "mhs", "root", "ezen") == False :
        print("ERROR")
        return False
        
    sql = f"select adkey from ad where adno = {adno}" 
    dbms.OpenQuery(sql)
    
    adkey = dbms.GetValue(0, "adkey")
    adlist = adkey.split(",")
    
    sql = f"select nkey,nkeynum from newskeyword where nno = {nno}" 
    dbms.OpenQuery(sql)
    total = dbms.GetTotal()
    if total > len(adlist) :
        total = len(adlist);
    
    nkeylist = ""
    nkey = ""
    for i in range(0,total) :
        key = dbms.GetValue(i, "nkey")
        nkeynum = dbms.GetValue(i, "nkeynum")
        nkeylist = nkeylist + key
        if i != total-1 :
            nkeylist = nkeylist + ","
        for j in range(0,int(nkeynum)):
            nkey = nkey + key
            nkey = nkey + ","
    
    dbms.DBClose()
     
    #데이터 베이스에 연결
    con = pymysql.connect(host="192.168.0.101", port=3306, 
                          user="root", passwd="ezen", 
                          db="mhs", charset="euckr")
    
    #문맥객체 statement -> SQL 구문을 실행 -> resultset
    #cursor 객체를 이용해서, sql 구문을 실행하고, 결과를 받아옴
    cursor = con.cursor()
    
    # TF-IDF 계산 및 코사인 유사도 측정 (# 문장을 콤마로 이어서 리스트에 추가)
    sentences = ["".join(nkey),adkey] 
    print(sentences)
    sentences2 = ["".join(nkeylist),adkey] 
    print(sentences2)
    
    tfidf_vectorizer = TfidfVectorizer()
    tfidf_matrix = tfidf_vectorizer.fit_transform(sentences)
    cos_similar = cosine_similarity(tfidf_matrix[0:1], tfidf_matrix[1:2])
    print("코사인 유사도 측정")
    sim = cos_similar[0][0]
    print(sim)
    sim = f'{sim : .2f}'
    
    count = getCount(nno, adno)
    
    if count == 0 :
        sql  = "insert into similarity (nkeylist, adkey, similary, adno, nno) values "
        sql += "('%s', '%s', '%s', '%d', '%d')" %(nkeylist, adkey, sim, adno, nno)
        cursor.execute(sql)
        con.commit()
        
    similary = getSimVal(nno)
    
    if (similary is None) and (float(sim) > 0.4) :
        print(f"{nno}번 뉴스의 광고는 {adno}번 광고 입니다")
        sql  = "update news set adno = '%d' where nno = '%d'" %(adno,nno)
        cursor.execute(sql)
        con.commit()
        
    elif(float(similary) > 0.4) and (float(sim) >= float(similary)) :
        print(f"{nno}번 뉴스의 광고는 {adno}번 광고 입니다")
        sql  = "update news set adno = '%d' where nno = '%d'" %(adno,nno)
        cursor.execute(sql)
        con.commit()
        
    cursor.close()
    con.close()
    return nkeylist, adkey, sim

#새로 등록돼서 긍부정,문장별 긍부정 예측 안된 뉴스번호 리스트 불러오기
def getNnoList() :
    dbms = db.DBmanager() 
    if dbms.DBOpen("192.168.0.101", 3306, "mhs", "root", "ezen") == False :
        print("ERROR")
        return False
    
    sql = "select nno from news where emotion = 'N'" 
    #print(sql)
    dbms.OpenQuery(sql)
    total = dbms.GetTotal()
    
    #print(total)
    
    nnolist   = []
    for i in range(total) :
        nno   = dbms.GetValue(i, "nno")
        nnolist.append(nno)
        
    dbms.DBClose()
    return nnolist

#긍정인 뉴스번호 리스트 가져오기
def getPosList() :
    dbms = db.DBmanager() 
    if dbms.DBOpen("192.168.0.101", 3306, "mhs", "root", "ezen") == False :
        print("ERROR")
        return False
    
    sql = "select nno from news where emotion = '긍정'" 
    #print(sql)
    dbms.OpenQuery(sql)
    total = dbms.GetTotal()
    
    #print(total)
    
    nnolist   = []
    for i in range(total) :
        nno   = dbms.GetValue(i, "nno")
        nnolist.append(nno)
        
    dbms.DBClose()
    return nnolist

#등록된 광고 번호 가져오기
def getAdList() :
    dbms = db.DBmanager() 
    if dbms.DBOpen("192.168.0.101", 3306, "mhs", "root", "ezen") == False :
        print("ERROR")
        return False
    
    sql = "select adno from ad" 
    #print(sql)
    dbms.OpenQuery(sql)
    total = dbms.GetTotal()
    
    #print(total)
    
    adlist   = []
    for i in range(total) :
        adno   = dbms.GetValue(i, "adno")
        adlist.append(adno)
        
    dbms.DBClose()
    return adlist

#뉴스가 가지고 있는 최고 유사도 가져오기
def getSimVal(nno) :
    dbms = db.DBmanager() 
    if dbms.DBOpen("192.168.0.101", 3306, "mhs", "root", "ezen") == False :
        print("ERROR")
        return False
    
    sql = f"select max(similary) as similary from similarity where nno = '{nno}'" 
    #print(sql)
    dbms.OpenQuery(sql)
    similary = dbms.GetValue(0, "similary")
        
    dbms.DBClose()
    return similary

#뉴스가 특정 광고와의 유사도 계산 했는지 여부 
def getCount(nno, adno) :
    dbms = db.DBmanager() 
    if dbms.DBOpen("192.168.0.101", 3306, "mhs", "root", "ezen") == False :
        print("ERROR")
        return False
    
    sql = f"select count(*) as count from similarity where nno = '{nno}' and adno = '{adno}'" 
    #print(sql)
    dbms.OpenQuery(sql)
    count = dbms.GetValue(0, "count")
        
    dbms.DBClose()
    return count



Okt = Okt()
while True :
    print("긍부정 여부 확인을 시작합니다")
    print("=" * 60)
    nnolist = getNnoList()
    if len(nnolist) != 0 :
        for i in nnolist :
            text, nno, score, emotion= getEmotion(Okt, i)
            print("=" * 60)
            insertSentance(Okt,nno,text)
            print("=" * 60)
            time.sleep(2)
            insertKeyword(Okt,nno,text)
            print("=" * 60)
            time.sleep(2)
    else :
        print("새로운 뉴스가 없습니다.")
        print("=" * 60)
    print("긍부정 여부, 문장별 긍부정 확인이 끝났습니다")
    print("=" * 60)
    
    PosList = getPosList()
    adlist = getAdList()
    print("뉴스,광고 키워드간의 유사도를 측정 합니다")
    print("=" * 60)
    if len(PosList) != 0 :
        for nno in PosList :
            for adno in adlist :
                if getCount(nno,adno) == 0 :
                    print(f"{nno}번 뉴스와 {adno}번 광고의 유사도를 확인합니다")
                    nkey,adkey,sim = getSimilary(nno, adno)
                    print("=" * 60)
    
    print("유사도 측정 및 광고 선정이 끝났습니다.")
    print("=" * 60)
    time.sleep(10)
