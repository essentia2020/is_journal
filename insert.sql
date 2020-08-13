INSERT INTO articles (title, pubyear, volume, issue, start_page, end_page, doi, title_ru)
VALUES ('Transfer learning and domain adaptation based on modeling of socio-economic systems', 2020, 14, 2, 7, 20,
		'10.17323/2587-814X.2020.2.7.20',
        'Трансфертное обучение и доменная адаптация на основе моделирования социально-экономических систем');
INSERT INTO articles (title, pubyear, volume, issue, start_page, end_page, doi, title_ru)
VALUES ('Modeling and optimization of plans for railway freight transport performed by a transport operator', 2020,	14,	2, 21, 35,
		'10.17323/2587-814X.2020.2.21.35',
        'Моделирование и оптимизация планов грузовых железнодорожных перевозок, выполняемых транспортным оператором');

INSERT INTO researchers (first_name, last_name, author_email, first_name_ru, last_name_ru, reviewer, editorial)
VALUES ('Fedor', 'Belousov', 'sky_tt@list.ru','Федор', 'Белоусов', 0, 0),
		('Ivan', 'Nevolin', 'i.nevolin@cemi.rssi.ru', 'Иван', 'Неволин', 0, 0),
		('Nerses', 'Khachatryan', 'nerses@cemi.rssi.ru', 'Нерсес', 'Хачатрян', 0, 0);
INSERT INTO researchers (first_name, last_name, middle_name, author_email, first_name_ru, last_name_ru, reviewer, editorial)
VALUES ('Oleg', 'Kazakov', 'D.', 'kod8383@mail.ru', 'Олег', 'Казаков', 0, 0),
		('Olga', 'Mikheenko', 'V.', 'miheenkoov@mail.ru', 'Ольга', 'Михеенко', 0, 0),
		('Ivan', 'Ivanov', 'I.', 'ivanov@gmail.com', 'Иван', 'Иванов', 1, 0),
		('Petr', 'Petrov', 'P.', 'petrov@mail.ru', 'Петр', 'Петров', 1, 1);

INSERT INTO articles_researchers VALUES 
	('10.17323/2587-814X.2020.2.21.35', 1),
    ('10.17323/2587-814X.2020.2.21.35', 2),
    ('10.17323/2587-814X.2020.2.21.35', 3),
    ('10.17323/2587-814X.2020.2.7.20', 4),
    ('10.17323/2587-814X.2020.2.7.20', 5);
    
INSERT INTO affiliations (aff_name, aff_address, aff_city, aff_country, aff_zip, aff_name_ru, aff_address_ru, aff_city_ru, 
aff_country_ru, aff_region)
VALUES 
	('Central Economics and Mathematics Institute, Russian Academy of Sciences', '47, Nakhimovsky Prospect', 'Moscow', 'Russia', '117418',
    'Центральный экономико-математический институт Российской академии наук', 'Нахимовский проспект, д. 47', 'Москва', 'Россия', 'г. Москва'),
    ('Bryansk State Technological University of Engineering', '3, Stanke Dimitrov Avenue', 'Bryansk', 'Russia', '241037', 
    'Брянский государственный инженерно-технологический университет', 'пр. Станке Димитрова, д. 3', 'Брянск', 'Россия', 'Брянская обл.');
    
INSERT INTO researchers_affiliations VALUES
	(1, 1),
    (2, 1),
    (3, 1),
    (4, 2),
    (5, 2);
    
INSERT INTO interests (interest_en, interest_ru) VALUES
	('economics', 'экономическая теория'),
    ('business', 'бизнес');
    
INSERT INTO researchers_interests VALUES
	(6, 1),
    (7, 2);
    
INSERT INTO keywords (key_en, key_ru)
VALUES 
	('operations research', 'исследование операций'),
    ('socio-economic development of regions', 'социально-экономическое развитие регионов');
    
INSERT INTO researchers_keywords VALUES
	(6, 2),
    (7, 1);
    
INSERT INTO articles_keywords VALUES
	('10.17323/2587-814X.2020.2.7.20', 2),
    ('10.17323/2587-814X.2020.2.21.35', 1);
    
INSERT INTO reviews VALUES
	('10.17323/2587-814X.2020.2.7.20', 6),
    ('10.17323/2587-814X.2020.2.21.35', 7);
    
    