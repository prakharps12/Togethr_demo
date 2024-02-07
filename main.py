import pandas as pd
import requests
from bs4 import BeautifulSoup

pdt_name = []
price = []
features = []
for k in range(2,10):
    url = "https://www.flipkart.com/search?q=laptops+under+80k&sid=6bo%2Cb5g&as=on&as-show=on&otracker=AS_QueryStore_OrganicAutoSuggest_1_16_na_na_na&otracker1=AS_QueryStore_OrganicAutoSuggest_1_16_na_na_na&as-pos=1&as-type=HISTORY&suggestionId=laptops+under+80k%7CLaptops&requestId=f36d76bd-74d1-4d71-83eb-dc1ee3090117&as-backfill=on&page="+str(k)
    r = requests.get(url, "r")
    soup = BeautifulSoup(r.text, 'lxml')
    box = soup.find("div", class_="_1YokD2 _3Mn1Gg")
    # print(box)

    name = box.find_all("div", class_="_4rR01T")

    for i in name:
        data = i.text
        pdt_name.append(data[:50])
    # print(pdt_name)
    # print(len())

    name = box.find_all("div", class_="_30jeq3 _1_WHN1")
    for i in name:
        data = i.text
        price.append(data[0:])
        # print(len(price))

    divs = box.find_all("div", class_="_1AtVbE col-12-12")
    for i in divs:
        ul = i.find_all("li", class_="rgWa7D")
        data = []
        for j in ul:
            val = j.text
            data.append(val)
        features.append(data)
    features.pop()
    features.pop()
    # print(len(features))
length = len(price)
desc=[]
for a in features:
    clean = ', '.join(a)
    desc.append(clean.replace(',', '.'))

dataframe = pd.DataFrame({"Produnct_name": pdt_name[:length], "Price": price[:length], "Description": desc[:length]})
# print(dataframe)
dataframe.to_csv("laptops4.csv")
# print(len(pdt_name),len(features),len(price))