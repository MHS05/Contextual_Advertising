import pymysql
import DBmanager as db
import pickle
import re
from konlpy.tag import Okt
from tensorflow.keras.preprocessing.sequence import pad_sequences
from tensorflow.keras.models import load_model
from kss import split_sentences

def getNote(nno) :
    #데이터 베이스에 연결
    con = pymysql.connect(host="127.0.0.1", port=3306,
                          user="root", passwd="ezen",
                          db="memodb", charset="euckr")
    
    # 자바   : 문맥객체 statement -> sql 구문을 실행 -> resultset
    # 파이썬 : cursor 객채를 이용해서 sql 구문을 실행하고, 결과를 받아옴
    cursor = con.cursor()
    
    
    #데이터 읽어오기
    sql = f"select note from memo where no = {nno}"
    cursor.execute(sql)
    data = cursor.fetchall()
    text = ""
    for row in data :
        text = row
    
    text = text[0]
    
    print("=" * 60)
    
    cursor.close();
    con.close();
    return text


def insertSentance(Okt, text) :
    dbms = db.DBmanager() 

    if dbms.DBOpen("127.0.0.1", 3306, "memodb", "root", "ezen") == False :
        print("ERROR")
    else :
        print("OK")
    
    #가져온 뉴스내용을 문장으로 구분
    text = split_sentences(text)
    
    
    #임시로 text 길이만큼 감정 리스트를 만들어 놓음
    emotion = []
    for i in range (0,len(text)):
        emotion.append(i) 
        
    import pandas as pd
    #판다스로 문장, 감정을 열로 갖는 데이터프레임 생성
    df = pd.DataFrame({"text":text, "emotion":emotion})
    
    print(df)
    
    #감정데이터를 그룹핑
    group = df.groupby("emotion")["emotion"].unique()
    print(group)
    
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
    
    max_len = 8
    
    def sentiment_predict(new_sentence):
        new_sentence = re.sub(r'[^ㄱ-ㅎㅏ-ㅣ가-힣 ]','', new_sentence)
        
        print(new_sentence)
        
        new_sentence = Okt.morphs(new_sentence, stem=True) # 토큰화
        new_sentence = [word for word in new_sentence if not word in stopwords] # 불용어 제거
        encoded = tokenizer.texts_to_sequences([new_sentence]) # 정수 인코딩
        pad_new = pad_sequences(encoded, maxlen = max_len) # 패딩
        score = float(loaded_model.predict(pad_new)) # 예측
        if(score > 0.5):
          str = "{:.2f}% 확률로 긍정 리뷰입니다.\n".format(score * 100)
          print(str)
          return "{:.2f}%".format(score * 100), "긍정"
        else:
          str = "{:.2f}% 확률로 부정 리뷰입니다.\n".format((1 - score) * 100)
          print(str)
          return "{:.2f}%".format((1 - score) * 100), "부정"
    
    #학습모델불러오기
    with open('tokenizer.pickle', 'rb') as handle:
        tokenizer = pickle.load(handle)
    
    loaded_model = load_model('best_model.h5')
    
    
    result = []
    for i in range(0, len(test)):
        score,str = sentiment_predict(test[i][0])
        t = test[i][0]
        #print("문장 :",t)
        #print("점수 :", score)
        #print("긍부정 :", str)
        sentance = (t , str, score)
        #print(sentance)
        sql   = "insert into sentance (sentance, emotion, score) "
        sql  += "values ('%s','%s','%s') " %(t,str,score)
        dbms.RunSql(sql)
        result.append(sentance)
    dbms.DBClose()