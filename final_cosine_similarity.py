from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity
import re
from konlpy.tag import Okt
import pandas as pd

# 텍스트 파일 읽기
with open("./test.txt", 'rt', encoding='utf-8') as f:
    lines = f.readlines()

# 특수문자 및 불용어 제거
cleaned_lines = []
for line in lines:
    cleaned_line = re.sub("[^ ㄱ-ㅣ가-힣]+", "", line)  # 특수문자 제거
    if cleaned_line.strip():  # 불용어가 아닌 경우에만 추가
        cleaned_lines.append(cleaned_line)

# 명사 추출
okt = Okt()
result = [okt.nouns(line) for line in cleaned_lines]
final_result = [r for sublist in result for r in sublist]

for i in final_result:
    i
# 그냥 하나의 문자열로 합쳐버리기
str = ','.join(final_result)
print(str)
print("=" * 50)

# 텍스트에서 많이 나온 단어
text = pd.Series(final_result).value_counts().head(10)
print("top 10")
index = text.index
nkey = ','.join(index)
print(nkey)




test = '아침,도움,달걀,등,지방'
for i in test:
    test.split(',')
    
# TF-IDF 계산 및 코사인 유사도 측정 (# 문장을 콤마로 이어서 리스트에 추가)
sentences = ["".join(nkey),
             test] 
print(sentences)
tfidf_vectorizer = TfidfVectorizer()
tfidf_matrix = tfidf_vectorizer.fit_transform(sentences)
cos_similar = cosine_similarity(tfidf_matrix[0:1], tfidf_matrix[1:2])
print("코사인 유사도 측정")
sim = cos_similar[0][0]
print(sim)
sim = f'{sim : .2f}'

#데이터 베이스 연결
#mysql
#설치 = pip install pymysql
import pymysql

#데이터 베이스에 연결
con = pymysql.connect(host="192.168.0.101", port=3306, 
                      user="root", passwd="ezen", 
                      db="mhs", charset="euckr")

#문맥객체 statement -> SQL 구문을 실행 -> resultset
#cursor 객체를 이용해서, sql 구문을 실행하고, 결과를 받아옴
cursor = con.cursor()
'''
sql  = "insert into news (category, title, note, writer, wdate, image, phyimage, emotion, adno) values "
sql += "('%s', '%s', '%s', '%s', '%s', '%s',')" %(nkey, test, sim, 1, 1)
cursor.execute(sql)
con.commit()
'''
'''
sql  = "insert into newskeyword (nno, nkey, nkeynum) values "
sql += "(%s', '%s', '%s', '%d', '%d')" %(nkey, test, sim, 1, 1)
cursor.execute(sql)
con.commit()
'''
'''
sql  = "insert into similarity (nkey, adkey, similary, adno, nno) values "
sql += "('%s', '%s', '%s', '%d', '%d')" %(nkey, test, sim, 1, 1)
cursor.execute(sql)
con.commit()
'''
'''
sql  = "insert into test (nkey) values "
sql += "('%s')" %(nkey)
cursor.execute(sql)
con.commit()
'''
'''
sql = "select * from similarity "
cursor.execute(sql)

#fetchone()은 현재 커서 위치에서 데이터 하나만 받아옵니다.
data = cursor.fetchone()
print(data)
data = cursor.fetchone()
print(data)
data = cursor.fetchone()
print(data)
data = cursor.fetchone()
print(data)
data = cursor.fetchone()
print(data)
data = cursor.fetchone()
print(data)
data = cursor.fetchone()
print(data)
data = cursor.fetchone()
print(data)
data = cursor.fetchone()
print(data)
data = cursor.fetchone()
print(data)
data = cursor.fetchone()
print(data)
'''
'''
for i in final_result:
    sql  = "insert into newskeyword (newskeyword) values "
    sql += "('%s')" %(i)
    cursor.execute(sql)
    con.commit()
'''
'''
for i in test2 :
    sql  = "insert into adkeyword (adkeyword) values "
    sql += "('%s')" %(i)
    cursor.execute(sql)
    con.commit()
'''
'''
sql  = "insert into similary (similary) values "
sql += "('%s')" %(sim)
cursor.execute(sql)
con.commit()
'''
'''
cursor.close()
con.close()
'''