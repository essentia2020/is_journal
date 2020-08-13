CREATE DATABASE is_journal
DEFAULT CHARSET utf8mb4;

-- Метаданные статьи
CREATE TABLE articles 
(
	title TEXT NOT NULL,
    pubyear YEAR NOT NULL,
    volume TINYINT(4) UNSIGNED,
    issue TINYINT(1) UNSIGNED,
    start_page TINYINT(4) UNSIGNED,
    end_page TINYINT(4) UNSIGNED,
    doi VARCHAR(255) NOT NULL PRIMARY KEY,
    title_ru TEXT, -- Название на русском языке
    citedby_sco SMALLINT UNSIGNED DEFAULT 0,
    citedby_wos SMALLINT UNSIGNED DEFAULT 0
);

-- Авторов выносим в отдельную таблицу, т.к. их может быть несколько в статье
CREATE TABLE researchers
(
	res_id TINYINT(20) UNSIGNED NOT NULL
    AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    middle_name VARCHAR(30),
    author_email VARCHAR(255) NOT NULL UNIQUE,
    scopus_id VARCHAR(20),
    orchid VARCHAR(20),
    researcher_id VARCHAR(20),
    web_page VARCHAR(255),
    h_index_sco TINYINT(3),
    h_index_wos TINYINT(3),
        -- Данные на русском
    first_name_ru VARCHAR(30) NOT NULL,
    last_name_ru VARCHAR(30) NOT NULL,
    middle_name_ru VARCHAR(30),
    -- Сведения об участии в рецензировании и/или редколлегии
    reviewer BOOL,
    editorial BOOL
);

-- Создаем промежуточную таблицу для связи статей и авторов
CREATE TABLE articles_researchers
(
	doi VARCHAR(255) NOT NULL,
    res_id TINYINT(20) UNSIGNED NOT NULL,
    FOREIGN KEY (doi) REFERENCES articles (doi)
    ON UPDATE CASCADE,
    FOREIGN KEY (res_id) REFERENCES researchers (res_id)
	ON UPDATE CASCADE
);

-- Создаем таблицу аффилиаций (их у автора может быть несколько)
CREATE TABLE affiliations
(
	aff_id TINYINT(20) UNSIGNED NOT NULL
    AUTO_INCREMENT PRIMARY KEY,
    aff_name TEXT NOT NULL,
    aff_address TEXT NOT NULL,
    aff_city VARCHAR(255) NOT NULL,
    aff_country VARCHAR(255) NOT NULL,
    aff_zip VARCHAR(20) NOT NULL,
    -- Данные на русском
    aff_name_ru TEXT NOT NULL,
    aff_address_ru TEXT NOT NULL,
    aff_city_ru VARCHAR(255) NOT NULL,
    aff_country_ru VARCHAR(255) NOT NULL,
    aff_region VARCHAR(255) -- Только для российских авторов
);

-- Создаем промежуточную таблицу для связи авторов и аффилиаций
CREATE TABLE researchers_affiliations
(
	res_id TINYINT(20) UNSIGNED NOT NULL,
    aff_id TINYINT(20) UNSIGNED NOT NULL,
    FOREIGN KEY (res_id) REFERENCES researchers (res_id)
	ON UPDATE CASCADE,
    FOREIGN KEY (aff_id) REFERENCES affiliations (aff_id)
    ON UPDATE CASCADE
);

-- Создаем таблицу исследовательских интересов (предметные области по классификатору OECD)
CREATE TABLE interests
(
	int_id TINYINT(20) UNSIGNED NOT NULL
    AUTO_INCREMENT PRIMARY KEY,
    interest_en VARCHAR(255),
    interest_ru VARCHAR(255)
);

-- Создаем промежуточную таблицу для связывания авторов и интересов
CREATE TABLE researchers_interests
(
	res_id TINYINT(20) UNSIGNED NOT NULL,
    int_id TINYINT(20) UNSIGNED NOT NULL,
    FOREIGN KEY (res_id) REFERENCES researchers (res_id)
	ON UPDATE CASCADE,
    FOREIGN KEY (int_id) REFERENCES interests (int_id)
    ON UPDATE CASCADE
);

-- Создаем таблицу исследовательских интересов
CREATE TABLE keywords
(
	key_id TINYINT(20) UNSIGNED NOT NULL
    AUTO_INCREMENT PRIMARY KEY,
    key_en VARCHAR(255),
    key_ru VARCHAR(255)
);

-- Создаем промежуточную таблицу для связывания авторов и ключевых слов
CREATE TABLE researchers_keywords
(
	res_id TINYINT(20) UNSIGNED NOT NULL,
    key_id TINYINT(20) UNSIGNED NOT NULL,
    FOREIGN KEY (res_id) REFERENCES researchers (res_id)
	ON UPDATE CASCADE,
    FOREIGN KEY (key_id) REFERENCES keywords (key_id)
    ON UPDATE CASCADE
);

-- Создаем промежуточную таблицу для связывания статей и ключевых слов
CREATE TABLE articles_keywords
(
	doi VARCHAR(255) NOT NULL,
    key_id TINYINT(20) UNSIGNED NOT NULL,
    FOREIGN KEY (doi) REFERENCES articles (doi)
    ON UPDATE CASCADE,
    FOREIGN KEY (key_id) REFERENCES keywords (key_id)
    ON UPDATE CASCADE
);

-- Добавляем таблицу рецензирования
CREATE TABLE reviews
(
	doi VARCHAR(255) NOT NULL,
    res_id TINYINT(20) UNSIGNED NOT NULL,
    FOREIGN KEY (doi) REFERENCES articles (doi)
    ON UPDATE CASCADE,
    FOREIGN KEY (res_id) REFERENCES researchers (res_id)
	ON UPDATE CASCADE
);
    


    
	

    


    




    
    

    
    
    
    
    

