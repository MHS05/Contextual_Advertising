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

#뉴스번호 받아서 내용뽑아내는 함수
def getNote(nno) :
    dbms = db.DBmanager() 
    
    if dbms.DBOpen("192.168.0.101", 3306, "mhs", "root", "ezen") == False :
        print("ERROR")
        return False
    else :
        print("OK")
        
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
    text = re.sub(r'[^ㄱ-ㅎㅏ-ㅣ가-힣 ]','', text)
    dbms.DBClose()
    return text, newsno

#뉴스 내용의 감정 분석
def getEmotion(Okt,nno) :
    '''
    #데이터 베이스에 연결
    con = pymysql.connect(host="127.0.0.1", port=3306,
                          user="root", passwd="ezen",
                          db="mhs", charset="euckr")
    
    # 자바   : 문맥객체 statement -> sql 구문을 실행 -> resultset
    # 파이썬 : cursor 객채를 이용해서 sql 구문을 실행하고, 결과를 받아옴
    cursor = con.cursor()
    
    #데이터 읽어오기
    sql = f"select note from news where nno = {nno}"
    cursor.execute(sql)
    data = cursor.fetchall()
    text = ""
    for row in data :
        text = row
    
    text = text[0]
    
    print("=" * 60)
    
    cursor.close();
    con.close();
    '''
    
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
        
    def sentiment_predict(new_sentence):
        new_sentence = re.sub(r'[^ㄱ-ㅎㅏ-ㅣ가-힣 ]','', new_sentence)
        
        print(new_sentence)
        new_sentence = Okt.morphs(new_sentence, stem=True) # 토큰화
        new_sentence = [word for word in new_sentence if not word in stopwords] # 불용어 제거
        encoded = tokenizer.texts_to_sequences([new_sentence]) # 정수 인코딩
        pad_new = pad_sequences(encoded, maxlen = max_len) # 패딩
        score = float(loaded_model.predict(pad_new)) # 예측
        if(score > 0.5):
            str = "{:.2f}% 확률로 긍정 뉴스입니다.\n".format(score * 100)
            print(str)
            return text, nno,"{:.2f}%".format(score * 100), "긍정"
        else:
            str = "{:.2f}% 확률로 부정 뉴스입니다.\n".format((1 - score) * 100)
            print(str)
            return text, nno, "{:.2f}%".format((1 - score) * 100), "부정"
    return sentiment_predict(text)
    
#뉴스내용을 문장별로 분리 하고, 각 문장별 감정 분석 결과 DB저장
def insertSentance(Okt, nno, text) :
    
    dbms = db.DBmanager() 

    if dbms.DBOpen("192.168.0.101", 3306, "mhs", "root", "ezen") == False :
        print("ERROR")
        return False
    else :
        print("OK")
    
    text = re.sub(r'[^ㄱ-ㅎㅏ-ㅣ가-힣 ]','', text)
    #가져온 뉴스내용을 문장으로 구분
    text = split_sentences(text)
    
    
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
        print(sentance)
        test.append(sentance)
    
    print("=" * 60)
    
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
        
        print(new_sentence)
        
        new_sentence = Okt.morphs(new_sentence, stem=True) # 토큰화
        new_sentence = [word for word in new_sentence if not word in stopwords] # 불용어 제거
        encoded = tokenizer.texts_to_sequences([new_sentence]) # 정수 인코딩
        pad_new = pad_sequences(encoded, maxlen = max_len) 
        score = float(loaded_model.predict(pad_new)) 
        if(score > 0.5):
          str = "{:.2f}% 확률로 긍정 뉴스입니다.\n".format(score * 100)
          print(str)
          return "{:.2f}%".format(score * 100), "긍정"
        else:
          str = "{:.2f}% 확률로 부정 뉴스입니다.\n".format((1 - score) * 100)
          print(str)
          return "{:.2f}%".format((1 - score) * 100), "부정"
      
    result = []
    for i in range(0, len(test)):
        score,emotion = sentiment_predict(test[i][0])
        sentance = test[i][0]
        #print("문장 :",sentance)
        #print("점수 :", score)
        #print("긍부정 :", emotion)
        semotion = ( sentance , emotion, score)
        print(sentance)
        sql   = "insert into semotion (nno, sentance, emotion, score) "
        sql  += f"values ('%d','%s','%s','%s')" %(nno,sentance,emotion,score)
        dbms.RunSql(sql)
        #print(sql)
        result.append(semotion)
    dbms.DBClose()


#Okt,뉴스번호, 뉴스내용 받아서 키워드 뽑고 데이터베이스에 저장
def insertKeyword(Okt,nno,text) :
    
    dbms = db.DBmanager() 
    
    if dbms.DBOpen("192.168.0.101", 3306, "mhs", "root", "ezen") == False :
        print("ERROR")
        return False
    else :
        print("OK")
        
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
    #print(wordlist)
    
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
            #print(sql)
            dbms.RunSql(sql)
            #print("단어 :", key[i], value[i],"회")
        else :
            dbms.DBClose()
            break

def getSimilary(nno, adno) :
    dbms = db.DBmanager() 
    
    if dbms.DBOpen("192.168.0.101", 3306, "mhs", "root", "ezen") == False :
        print("ERROR")
        return False
    else :
        print("OK")
        
    
    sql = f"select adkey from ad where adno = {adno}" 
    dbms.OpenQuery(sql)
    total = dbms.GetTotal()
    
    adkey = dbms.GetValue(0, "adkey")
    adlist = adkey.split(",")
    
    sql = f"select nkey from newskeyword where nno = {nno}" 
    dbms.OpenQuery(sql)
    
    '''
    for i in range(0,total) :
        key = dbms.GetValue(i, "adkey")
        adlist = adlist + key
        if i != (total-1) :
            adlist = adlist + ","
    '''
       
    nkey = ""
    for i in range(0,10) :
        key = dbms.GetValue(i, "nkey")
        nkey = nkey + key
        if i != 9 :
            nkey = nkey + ","

    #print(nkey)
    #print(adkey)
    
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
    
    tfidf_vectorizer = TfidfVectorizer()
    tfidf_matrix = tfidf_vectorizer.fit_transform(sentences)
    cos_similar = cosine_similarity(tfidf_matrix[0:1], tfidf_matrix[1:2])
    print("코사인 유사도 측정")
    sim = cos_similar[0][0]
    print(sim)
    sim = f'{sim : .2f}'
    
    sql  = "insert into similarity (nkeylist, adkey, similary, adno, nno) values "
    sql += "('%s', '%s', '%s', '%d', '%d')" %(nkey, adkey, sim, adno, nno)
    cursor.execute(sql)
    con.commit()
    
      
    if float(sim) > 0.4 :
        sql  = "update news set adno = '%d' where nno = '%d'" %(adno,nno)
    cursor.execute(sql)
    con.commit()
    cursor.close()
    con.close()
    
    return nkey, adkey, sim

Okt = Okt()

nno = 5
adno = 3
#뉴스 내용 긍부정 파악하기
text, nno, score, emotion= getEmotion(Okt, nno)
dbms = db.DBmanager() 
if dbms.DBOpen("192.168.0.101", 3306, "mhs", "root", "ezen") == False :
    print("ERROR")
else :
    print("OK")
    
sql   = "update news "
sql  += "set emotion = '%s' where nno = %d " %(emotion,nno)
dbms.RunSql(sql)
dbms.DBClose()
#문장별 긍부정도 파악해서 DB에 저장
insertSentance(Okt, nno, text)
#뉴스 내용 키워드 추출해서 DB에 저장
insertKeyword(Okt,nno,text)
#DB에있는 광고,뉴스 키워드 가져와서 유사도 검증 후 유사도 DB에 넣기
nkey, adkey,sim = getSimilary(nno, adno)

