#나이브베이즈 분류기를 이용한 문서분류
import pickle
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import re
import urllib.request
from konlpy.tag import Okt
from tqdm import tqdm
from tensorflow.keras.preprocessing.text import Tokenizer
from tensorflow.keras.preprocessing.sequence import pad_sequences

train_data = pd.read_table('ratings_train.txt')
test_data = pd.read_table('ratings_test.txt')
'''
print('훈련용 리뷰 개수 :',len(train_data)) # 훈련용 리뷰 개수 출력

print(train_data[:5]) # 상위 5개 출력

print('테스트용 리뷰 개수 :',len(test_data))

print(test_data[:5]) # 상위 5개 출력
'''

# document 열과 label 열의 중복을 제외한 값의 개수
# label 열은 0 또는 1의 두 가지 값만을 가지므로 2가 출력
ununique = train_data['document'].nunique(), train_data['label'].nunique()
#print(ununique) #(146182, 2)

# document 열의 중복 제거
train_data.drop_duplicates(subset=['document'], inplace=True)
#print('총 샘플의 수 :',len(train_data))

#train_data['label'].value_counts().plot(kind = 'bar')

#print(train_data.groupby('label').size().reset_index(name = 'count'))

#null값이 존재하는지 확인 
#print(train_data.isnull().values.any())

#어떤 열에 존재하는지 확인.
#print(train_data.isnull().sum())

#리뷰가 적혀있는 document 열에서 Null 값을 가진 샘플이 총 1개가 존재 
#document 열에서 Null 값이 존재한다는 것을 조건으로 Null 값을 가진 샘플이 
#어느 인덱스의 위치에 존재하는지 출력
#print(train_data.loc[train_data.document.isnull()])

train_data = train_data.dropna(how = 'any') # Null 값이 존재하는 행 제거
#print(train_data.isnull().values.any()) # Null 값이 존재하는지 확인

#print(len(train_data)) #전체데이터 갯수 출력

# 한글과 공백을 제외하고 모두 제거
train_data['document'] = train_data['document'].apply(lambda x: re.sub("[^ㄱ-ㅎㅏ-ㅣ가-힣 ]", "", str(x)))
#print(train_data[:5])

train_data['document'] = train_data['document'].str.replace('^ +', "") # white space 데이터를 empty value로 변경
train_data['document'].replace('', np.nan, inplace=True)
#print(train_data.isnull().sum())

#print(train_data.loc[train_data.document.isnull()][:5])

train_data = train_data.dropna(how = 'any')
#print(len(train_data))

#테스트 데이터에도 적용
test_data.drop_duplicates(subset = ['document'], inplace=True) # document 열에서 중복인 내용이 있다면 중복 제거
test_data['document'] = test_data['document'].apply(lambda x: re.sub("[^ㄱ-ㅎㅏ-ㅣ가-힣 ]", "", str(x)))
test_data['document'] = test_data['document'].str.replace('^ +', "") # 공백은 empty 값으로 변경
test_data['document'].replace('', np.nan, inplace=True) # 공백은 Null 값으로 변경
test_data = test_data.dropna(how='any') # Null 값 제거
#print('전처리 후 테스트용 샘플의 개수 :',len(test_data))


# 토큰화 과정에서 불용어를 제거
stopwords = ['의','가','이','은','들','는','좀','잘','걍','과','도','를','으로','자','에','와','한','하다']

okt = Okt()

X_train = []
for sentence in tqdm(train_data['document']):
    tokenized_sentence = okt.morphs(sentence, stem=True) # 토큰화
    stopwords_removed_sentence = [word for word in tokenized_sentence if not word in stopwords] # 불용어 제거
    X_train.append(stopwords_removed_sentence)
    
print(X_train[:3])

X_test = []
for sentence in tqdm(test_data['document']):
    tokenized_sentence = okt.morphs(sentence, stem=True) # 토큰화
    stopwords_removed_sentence = [word for word in tokenized_sentence if not word in stopwords] # 불용어 제거
    X_test.append(stopwords_removed_sentence)
print(X_test[:3])



#토큰화
tokenizer = Tokenizer()
tokenizer.fit_on_texts(X_train)

print(tokenizer.word_index)

threshold = 3
total_cnt = len(tokenizer.word_index) # 단어의 수
rare_cnt = 0 # 등장 빈도수가 threshold보다 작은 단어의 개수를 카운트
total_freq = 0 # 훈련 데이터의 전체 단어 빈도수 총 합
rare_freq = 0 # 등장 빈도수가 threshold보다 작은 단어의 등장 빈도수의 총 합

# 단어와 빈도수의 쌍(pair)을 key와 value로 받는다.
for key, value in tokenizer.word_counts.items():
    total_freq = total_freq + value

    # 단어의 등장 빈도수가 threshold보다 작으면
    if(value < threshold):
        rare_cnt = rare_cnt + 1
        rare_freq = rare_freq + value

print('단어 집합(vocabulary)의 크기 :',total_cnt)
print('등장 빈도가 %s번 이하인 희귀 단어의 수: %s'%(threshold - 1, rare_cnt))
print("단어 집합에서 희귀 단어의 비율:", (rare_cnt / total_cnt)*100)
print("전체 등장 빈도에서 희귀 단어 등장 빈도 비율:", (rare_freq / total_freq)*100)

# 전체 단어 개수 중 빈도수 2이하인 단어는 제거.
# 0번 패딩 토큰을 고려하여 + 1
vocab_size = total_cnt - rare_cnt + 1
print('단어 집합의 크기 :',vocab_size)


tokenizer = Tokenizer(vocab_size) 
tokenizer.fit_on_texts(X_train)
X_train = tokenizer.texts_to_sequences(X_train)
X_test = tokenizer.texts_to_sequences(X_test)



y_train = np.array(train_data['label'])
y_test = np.array(test_data['label'])


drop_train = [index for index, sentence in enumerate(X_train) if len(sentence) < 1]

#print("X_train =",X_train)
#print("y_train =",y_train)

# 빈 샘플들을 제거

#X_train = np.delete(X_train, drop_train, axis=0)
#y_train = np.delete(y_train, drop_train, axis=0)



print(len(X_train))
print(len(y_train))



print('리뷰의 최대 길이 :',max(len(review) for review in X_train))
print('리뷰의 평균 길이 :',sum(map(len, X_train))/len(X_train))
plt.hist([len(review) for review in X_train], bins=50)
plt.xlabel('length of samples')
plt.ylabel('number of samples')
plt.show()



def below_threshold_len(max_len, nested_list):
  count = 0
  for sentence in nested_list:
    if(len(sentence) <= max_len):
        count = count + 1
        print('전체 샘플 중 길이가 %s 이하인 샘플의 비율: %s'%(max_len, (count / len(nested_list))*100))
  
max_len = 30
below_threshold_len(max_len, X_train)

X_train = pad_sequences(X_train, maxlen=max_len)
X_test = pad_sequences(X_test, maxlen=max_len)

from tensorflow.keras.layers import Embedding, Dense, LSTM
from tensorflow.keras.models import Sequential
from tensorflow.keras.models import load_model
from tensorflow.keras.callbacks import EarlyStopping, ModelCheckpoint

embedding_dim = 100
hidden_units = 128

model = Sequential()
model.add(Embedding(vocab_size, embedding_dim))
model.add(LSTM(hidden_units))
model.add(Dense(1, activation='sigmoid'))

es = EarlyStopping(monitor='val_loss', mode='min', verbose=1, patience=4)
mc = ModelCheckpoint('best_model.h5', monitor='val_acc', mode='max', verbose=1, save_best_only=True)

model.compile(optimizer='rmsprop', loss='binary_crossentropy', metrics=['acc'])
history = model.fit(X_train, y_train, epochs=15, callbacks=[es, mc], batch_size=64, validation_split=0.2)



loaded_model = load_model('best_model.h5')
print("\n 테스트 정확도: %.4f" % (loaded_model.evaluate(X_test, y_test)[1]))


with open('tokenizer.pickle', 'wb') as handle:
     pickle.dump(tokenizer, handle)


with open('tokenizer.pickle', 'rb') as handle:
    tokenizer = pickle.load(handle)