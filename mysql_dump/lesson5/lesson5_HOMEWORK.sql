-- ------------------------HOMEWORK № 5

CREATE SCHEMA `shop1` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;


/* 1). Пусть в таблице users поля created_at и updated_at оказались незаполненными. 
 Заполните их текущими датой и временем. */

-- СОЗДАДИМ ТАБЛИЦУ USERS --
DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
    name VARCHAR(255) COMMENT 'NAME USERS',
    birthday_at DATE COMMENT 'DATE OF BIRTH',
    created_at DATETIME,
    updated_at DATETIME
    ) COMMENT = 'BUYERS';
    
    
-- ЗАПОЛНИМ ТАБЛИЦУ ЗНАЧЕНИЯМИ, УБЕДИМСЯ ЧТО CREATED AND UPDATED ADD ПОЛУЧИЛИ ЗАНЧЕНИЕ NULL

INSERT INTO users (name, birthday_at, created_at, updated_at)
VALUES
('NIKE', '1999-10-12', NULL, NULL),
('NIKOLA', '1998-10-12', NULL, NULL),
('KUSAKA', '1997-10-12', NULL, NULL),
('TESLA', '1996-10-12', NULL, NULL);


-- ПРИСВОИМ КАЛЕНДАРНЫМ ПОЛЯМ ТЕКУЩУЮ ДАТУ И ВРЕМЯ ПРИ ПОМОЩИ ФУНКЦИИ NOW()

UPDATE users SET created_at = NOW(), updated_at = NOW();
    
/*
2. Таблица users была неудачно спроектирована. 
Записи created_at и updated_at были заданы типом VARCHAR и 
в них долгое время помещались значения в формате 20.10.2017 8:10. 
Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения.
*/    

-- СОЗДАДИМ ТАБЛИЦУ USERS С ТЕКСТОВЫМИ ПОЛЯМИ--

DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
    name VARCHAR(255) COMMENT 'NAME USERS',
    birthday_at DATE COMMENT 'DATE OF BIRTH',
    created_at VARCHAR(255),
    updated_at VARCHAR(255),
    ) COMMENT = 'BUYERS';


-- ЗАПОЛНИМ ТАБЛИЦУ ЗНАЧЕНИЯМИ

INSERT INTO users (name, birthday_at, created_at, updated_at)
VALUES
('NIKE', '1999-10-12', '07.01.2016 10:35', '07.01.2016 10:15'),
('NIKOLA', '1998-10-12', '07.01.2016 10:35', '07.01.2016 10:15'),
('KUSAKA', '1997-10-12', '07.01.2016 10:35', '07.01.2016 10:15'),
('TESLA', '1996-10-12', '07.01.2016 10:35', '07.01.2016 10:15');

-- ПРЕОБРАЗУЕМ К КАЛЕНДАРНОМУ ЗНАЧЕНИЮ ИСПОЛЬЗУЯ ФУНКЦИЮ STR_TO_DATE

UPDATE users SET
created_at = STR_TO_DATE(created_at, '%d.%m.%Y %k:%I'),
updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %k:%I');

-- ВОСПОЛЬЗУЕМСЯ ALTER TABLE И ИЗМЕНИМ ТИП ДАННЫХ СТОЛБЦОВ

ALTER TABLE users CHANGE
updated_at created_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;


/*
4. В таблице складских запасов storehouses_products в поле value 
могут встречаться самые разные цифры: 0, если товар закончился и 
выше нуля, если на складе имеются запасы. 
Необходимо отсортировать записи таким образом, чтобы они выводились 
в порядке увеличения значения value. Однако нулевые запасы должны выводиться 
в конце, после всех записей.
*/

-- СОЗДАДИМ И ЗАПОЛНИМ ТАБЛИЦУ

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
  id SERIAL PRIMARY KEY,
  storehouse_id INT UNSIGNED,
  product_id INT UNSIGNED,
  value INT UNSIGNED COMMENT 'Запас товарной позиции на складе',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Запасы на складе';

INSERT INTO storehouses_products (storehouse_id, product_id, value)
VALUES
(1, 53, 0),
(1, 54, 500),
(1, 700, 800),
(1, 900, 1000),
(1, 53, 1);

-- ОТСОРТИРУЕМ СОДЕРЖИМОЕ ПО ЗНАЧЕНИЮ value И ПЕРЕМЕСТИМ ИХ В КОНЕЦ С ПОМОЩЬЮ IF

SELECT * FROM storehouses_products ORDER BY value;

SELECT id, value, IF(value > 0, 0, 1) AS sort FROM storehouses_products ORDER BY value;

/*
5. Из таблицы users необходимо извлечь пользователей, 
родившихся в августе и мае. 
Месяцы заданы в виде списка английских названий (may, august)
*/
-- ВОСПОЛЬЗУЕМСЯ КОМАНДОЙ DATE_FORMAT И ИЗВЛЕЧЕМ ПОЛЬЗОВАТЕЛЕЙ РОДИВШИХСЯ В МАЕ И АВГУСТЕ

SELECT name FROM users WHERE DATE_FORMAT(birthay_at, '%M') IN ('may', 'august');

/*
6. Из таблицы catalogs извлекаются записи при помощи запроса. 
SELECT * FROM catalogs WHERE id IN (5, 1, 2); 
Отсортируйте записи в порядке, заданном в списке IN.
*/

-- ИСПОЛЬЗУЕМ FIELD

SELECT * FROM catalog WHERE id IN (5, 1, 2) ORDER BY FIELD(id, 5, 1, 2);


-- ------------------------АГРЕГАЦИЯ ДАННЫХ

/*
1. Подсчитайте средний возраст пользователей в таблице users.
*/
SELECT TIMESTAMPDIFF(YEAR, birthday_at, NOW()) AS age FROM users;
SELECT AVG(TIMESTAMPDIFF(YEAR, birthday_at, NOW())) AS age FROM users;

/*
2. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
Следует учесть, что необходимы дни недели текущего года, а не года рождения.
*/
-- ПОЛУЧИМ МЕСЯЦЫ И ДНИ
SELECT DATE_FORMAT(DATE(CONCAT_WS('-', YEAR(NOW()), MONTH(birthday_at), DAY(birthday_at))), '%W') AS day, COUNT(*) AS total FROM users GROUP BY day ORDER BY total DESC;

