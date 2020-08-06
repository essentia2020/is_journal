# Программа для выгрузки данных через api и записи в базу данных MySQL

import requests
import pymysql
from pymysql.cursors import DictCursor

connection = pymysql.connect(
    host='localhost',
    user='root',
    password= input('Введите пароль: '),
    db='is_journal',
    charset='utf8mb4',
    cursorclass=DictCursor
)

issn = input('Введите issn журнала: ')
api = input('Введите свой ключ api: ')

url = 'https://api.elsevier.com/content/search/scopus?' \
      f'query=ISSN({issn})&' \
      f'apiKey={api}'

results = requests.get(url)
results = results.json()
publications = results['search-results']['entry']
print(publications)

cursor = connection.cursor()
for item in publications:
    doi = item['prism:doi']
    citedby = int(item['citedby-count'])
    sql = ("INSERT INTO scopus "
           "(doi, citedby_sco) "
           "VALUES (%s, %i)")
    cursor.execute(sql, (doi, citedby))
    connection.commit()

connection.close()
