# Программа для выгрузки данных через api и записи в базу данных MySQL

import requests
import mysql.connector

cnx = mysql.connector.connect(user='root', password='dvcg5Nv1',
                              host='localhost',
                              database='is_journal')
cursor = cnx.cursor()

issn = input('Введите issn журнала: ')
api = input('Введите свой ключ api: ')

url = 'https://api.elsevier.com/content/search/scopus?' \
      f'query=ISSN({issn})&' \
      f'apiKey={api}'

results = requests.get(url)
results = results.json()
publications = results['search-results']['entry']
print(publications)

publication_data = []
for item in publications:
    doi = item['prism:doi']
    citedby_sco = item['citedby-count']
    article_data ={
        doi: int(citedby_sco)
    }
    sql = """INSERT INTO scopus
    (doi, citedby_sco)
    VALUES ('%(doi)s', '%(citedby_sco)s');
    """
    cursor.execute(sql, article_data)
