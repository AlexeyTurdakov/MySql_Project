-- Дз 9

/*
Практическое задание по теме “Транзакции, переменные, представления”

1. В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. 
Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. 
Используйте транзакции.
*/
-- Воспользуемся ранее созданной базой shop, создадим базу sample и используем транзакцию для копирования данных

START TRANSACTION;
INSERT INTO sample.users SELECT * FROM shop.users WHERE ID = 1;
DELETE FROM shop.users WHERE id = 1 LIMIT 1;

/*
2. Создайте представление, которое выводит название name товарной позиции из таблицы 
products и соответствующее название каталога name из таблицы catalogs.
*/
-- Снала создадим запрос решающий эту задачу без представления 
-- и затем создадим представление

SELECT 
	p.name,
    c.name
FROM
	products AS p
JOIN
	catalogs AS c
ON
	p.catalogs_id = c.id;
	
CREATE OR REPLACE VIEW products_catalogs AS
SELECT 
	p.name AS product,
    c.name AS catalog
FROM 
	products AS p
JOIN
	catalogs AS c
ON
	p.catalog_id = c.id;


/*3. Пусть имеется таблица с календарным полем created_at. 
В ней размещены разряженые календарные записи за август 2018 года 
'2018-08-01', '2016-08-04', '2018-08-16' и 2018-08-17. 
Составьте запрос, который выводит полный список дат за август, 
выставляя в соседнем поле значение 1, если дата присутствует в исходном таблице и 0, 
если она отсутствует.
*/

-- Создадим таблицу

CREATE TABLE IF NOT EXISTS posts (
	id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    created_at DATE NOT NULL
);

INSERT INTO posts VALUES
	(NULL, 'первая запись', '2020-08-01'),
    (NULL, 'вторая запись', '2020-08-04'),
    (NULL, 'третья запись', '2020-08-16'),
    (NULL, 'четвертая запись', '2020-08-16'),
    (NULL, 'пятая запись', '2020-08-17'),
    (NULL, 'шестая запись', '2020-08-14'),
    (NULL, 'седьмая запись', '2020-08-11'),
    (NULL, 'восьмая запись', '2020-08-17'),
    (NULL, 'вдевятая запись', '2020-08-05'),
    (NULL, 'десятая запись', '2020-08-03');
    
-- Создадим временную таблицу донор 

CREATE TEMPORARY TABLE last_days (
	day INT
);

INSERT INTO last_days VALUES
(0), (1), (2), (3), (4), (5), (6), (7), (8), (9), (10),
(11), (12), (13), (14), (15), (16), (17), (18), (19), (20), (21),
(22), (23), (24), (25), (26), (27), (28), (29), (30);

-- Сформируем календарь за август 
SELECT 
	DATE(DATE('2020-08-31') - INTERVAL l.day DAY) AS day
FROM
	last_days AS l
ORDER BY    
day;
    
-- Сформируем результирующий запрос
SELECT 
	DATE(DATE('2020-08-31') - INTERVAL l.day DAY) AS day,
NOT ISNULL(p.name) AS order_exist
FROM
	last_days AS l
LEFT JOIN
	posts AS p
ON 
	DATE(DATE('2020-08-31') - INTERVAL l.day DAY) = p.created_at
ORDER BY
	day;

/*
4. Пусть имеется любая таблица с календарным полем created_at. 
Создайте запрос, который удаляет устаревшие записи из таблицы, 
оставляя только 5 самых свежих записей.
*/
START TRANSACTION;
SELECT COUNT(*) FROM posts; -- ПОСЧИТАЕМ КОЛ-ВО ЗАПИСЕЙ
DELETE FROM posts ORDER BY created_at LIMIT 5;
COMMIT;


-- Практическое задание по теме “Хранимые процедуры и функции, триггеры"

/*Создайте хранимую функцию hello(), которая будет возвращать приветствие, 
в зависимости от текущего времени суток. С 6:00 до 12:00 функция должна возвращать фразу 
"Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".*/


DELIMITER //
CREATE FUNCTION get_hour () 
RETURNS INT NOT DETERMINISTIC 
BEGIN
	RETURN HOUR(NOW());
END//


CREATE FUNCTION hello ()
RETURNS TINYTEXT NOT DETERMINISTIC
BEGIN
	DECLARE hour INT;
    SET hour = HOUR(NOW());
    CASE 
		WHEN hour BETWEEN 0 AND 5 THEN
			RETURN 'GOOD NIGHT';
		WHEN hour BETWEEN 6 AND 11 THEN
			RETURN 'GOOD MORNING';
		WHEN hour BETWEEN 12 AND 17 THEN
			RETURN 'GOOD DAY';
		WHEN hour BETWEEN 18 AND 23 THEN 
			RETURN 'GOOD NIGHT';
		END CASE;
END//


/*
В таблице products есть два текстовых поля: name с названием товара и description с его описанием.
 Допустимо присутствие обоих полей или одно из них. Ситуация, 
 когда оба поля принимают неопределенное значение NULL неприемлема. 
 Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены. 
 При попытке присвоить полям NULL-значение необходимо отменить операцию.
*/
CREATE TRIGGER validate_name_description_insert BEFORE INSERT ON products
FOR EACH ROW BEGIN
	IF NEW.name IS NULL AND NEW.description IS NULL THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Both name and description are NULL';
	END IF;
END//

CREATE TRIGGER validate_name_description_insert BEFORE UPDATE ON products
FOR EACH ROW BEGIN
	IF NEW.name IS NULL AND NEW.description IS NULL THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Both name and description are NULL';
	END IF;
END//

