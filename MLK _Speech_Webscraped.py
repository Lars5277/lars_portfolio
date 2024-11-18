from bs4 import BeautifulSoup
import requests
url = 'http://www.analytictech.com/mb021/mlk.htm'

page = requests.get(url)

soup = BeautifulSoup(page.text, 'html')

print(soup)

mlk_speech = soup.find_all('p')

type(mlk_speech)

speech_combined = [p.text for p in mlk_speech]

print(speech_combined)

type(speech_combined)

' '.join(speech_combined)

string_speech_clean = string_speech.replace('\r\n', ' ')

string_speech_clean.replace('\', '')

import re

speech_no_punt = re.sub(r'[^\w\s]','', string_speech_clean)

print(speech_no_punt)

speech_no_punt.lower()

speech_lower = speech_no_punt.lower()

speech_broke_out = re.split(r'\s+', speech_lower)

import pandas as pd

df = pd.DataFrame(speech_broke_out).value_counts()
df

df.to_csv(r'C:\Users\larso\OneDrive\Desktop\AB Python\MLKJ_Speech.csv', header = ['Counts'], index_label = 'Word')






























