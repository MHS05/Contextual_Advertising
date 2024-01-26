from konlpy.tag import Komoran
import numpy as np
from numpy import dot
from numpy.linalg import norm 

'''
코사인 유사도 개념
    두 벡터 간 코사인 각도를 이용해 유사도를 측정하는 방법으로, 벡터의 크기가 중요하지 않을 때 거리를 측정하기 위해 사용합니다.

    예를 들어, 단어의 출현 빈도를 통해 유사도 계산을 한다면 동일한 단어가 많이 포함되어 있을수록 벡터의 크기가 커집니다.

코사인 유사도 특징
    1~1 사이 값을 가진다.
    동일 방향: 1
    직각: 0
    반대 방향: -1
=> 즉, 두 벡터의 방향이 같아질수록 유사하다 볼 수 있습니다.
'''
#코사인 유사도 계산
def cos_sim(vec1,vec2):
	return dot(vec1, vec2) / (norm(vec1)*norm(vec2))
'''
코사인 유사도를 계산하는 함수로, 넘파이에서 제공하는 벡터 내적을 계산하는 함수와 노름을 계산하는 함수를 이용합니다.

코사인 유사도에서는 주로 L2 노름(유클리드 노름)을 주로 사용한다.
'''

#TDM 만들기
def make_term_doc_mat(sentence_bow, word_dics):
    freq_mat = {}

    for word in word_dics:
        freq_mat[word] = 0

    for word in word_dics:
        if word in sentence_bow:
            freq_mat[word] += 1
    
    return freq_mat
#비교 문장에서 추출한 단어 사전을 기준으로 문장에 해당 단어들이 얼마나 포함되어 있는지 나타내는 단어 문서 행렬(TDM)을 만들어줍니다.

#단어 벡터 만들기 
def make_vector(tdm):
    vec = []
    for key in tdm: 
        vec.append(tdm[key])
    return vec
#단어 문서 행렬에서 표현된 토큰들의 출현 빈도 데이터를 벡터로 만들어주는 함수입니다.

#단어 정의 
sentence1 = '아침, 도움, 달걀, 국민, 결식, 다이어트'
sentence2 = '아침, 달걀, 계란'

#형태소 분석기를 이용해 단어 묶음 리스트 생성
komoran = Komoran()
bow1 = komoran.nouns(sentence1)
bow2 = komoran.nouns(sentence2)
#Komoran 형태소 분석기를 통해 각 문장에서 명사를 리스트 형태로 추출합니다.

#단어 묶음 리스트를 하나로 합침
bow = bow1 + bow2

#단어 묶음에서 중복을 제거해 단어 사전 구축
word_dics = []
for token in bow: 
    if token not in word_dics:
        word_dics.append(token)
#문장별로 추출된 단어 리스트를 하나의 리스트로 합친 후 중복된 단어를 제거해 새로운 단어 사전 리스트를 구축합니다.
        
#문장별 단어 문서 행렬 계산
freq_list1 = make_term_doc_mat(bow1, word_dics)
freq_list2 = make_term_doc_mat(bow2, word_dics)
print(freq_list1)
print(freq_list2)

#문장 벡터 생성
doc1 = np.array(make_vector(freq_list1))
doc2 = np.array(make_vector(freq_list2))

#코사인 유사도 계산
r1 = cos_sim(doc1, doc2)
print(r1)
