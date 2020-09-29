-- homework 11
-- Работаем с ранее созданной базой shop

/*
Практическое задание по теме “Оптимизация запросов”
Создайте таблицу logs типа Archive. 
Пусть при каждом создании записи в таблицах users, catalogs и products в таблицу 
logs помещается время и дата создания записи, название таблицы, 
идентификатор первичного ключа и содержимое поля name.
*/

-- Создадим таблицу
CREATE TABLE logs (
	tablename VARCHAR(255) COMMENT 'Название таблицы',
    external_id INT COMMENT 'Первичный ключ таблицы tablename',
    name VARCHAR(255) COMMENT 'Поле таблицы',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
) COMMENT = 'Журнал интернет-магазина' ENGINE=Archive;

-- Напишем триггер 
DELIMITER // 
CREATE TRIGGER log_after_insert_to_users AFTER INSERT ON users
FOR EACH ROW BEGIN
	INSERT INTO logs (tablename, external_id, name) VALUES ('users', NEW.id, NEW.name);
END//

-- Добавим записи в таблицу catalogs 
INSERT INTO catalogs (name) VALUES
	('Оперативная память'),
    ('Жесткие диски'),
    ('Блоки питания') //
    
-- Вставим данные в таблицу products
INSERT INTO products
	(name, description, price, catalog_id)
VALUES
	('ASUS PRIME Z370-P', 'HDMI, SATA3, PCI Express 3.0, USB 3.1', 9360.00, 2) //

-- Теперь попробуем что-нибудь удалить, как мы видим, таблица не поддреживает удаление.
-- Задание выполнено

/*
Практическое задание по теме “NoSQL”
В базе данных Redis подберите коллекцию для подсчета посещений с определенных IP-адресов.
При помощи базы данных Redis решите задачу поиска имени пользователя по электронному адресу и наоборот, поиск электронного адреса пользователя по его имени.
Организуйте хранение категорий и товарных позиций учебной базы данных shop в СУБД MongoDB.
*/
-- Используем хэши, воспользуемся HINCRBY: 
-- HINCRBY adresses '127.0.0.1' 1 КОМАНДА УВЕЛИЧИВАЕТ СЧЕТЧИК АДРЕСА НА ЕДИНИЦУ
-- ЕСЛИ МЫ НЕ ХОТИМ ИЗВЛЕКАТЬ ВСЕ ЗНАЧЕНИЯ КОЛЛЕКЦИИ МФ МОЖЕМ ВОСПОЛЬЗОВАТЬСЯ КОМАНДОЙ HGET:
-- HGET adresses '127.0.0.1'

-- ДЛЯ РЕШЕНИЯ ВТОРОГО ЗАДАНИЯ ДОБАВИМ ПОЛЬЗОВАТЕЛЕЙ И СОПОСТАВИМ С НИМИ ЭЛЕКТРОННЫЕ АДРЕСА
-- HSET emails 'igor' 'igorsimdyanov@gmail.COM'
-- HSET emails 'Elena' 'elena@gmail.COM'
-- HSET emails 'santa' 'santa@gmail.COM'
-- ЕСЛИ НАМ ПОТРЕБУЕТСЯ ЭЛЕКТРОННЫЙ АДРЕС ПОЛЬЗОВАТЕЛЯ МЫ МОЖЕМ ВОСПОЛЬЗОВАТЬСЯ КОМАНДОЙ HGET
-- ДЛЯ РЕШЕНИЯ ОБРАТНОЙ ЗАДАЧИ НАМ ПОТРЕБУЕТСЯ ЕЩЕ ОДИН ХЭШ ЮЗЕРС В НЕМ КЛЮЧЕМ БУДЕТ ВЫСТУПАТЬ
-- ЭЛЕКТРОННЫЙ АДРЕС ПОЛЬЗОВАТЕЛЯ, А КЛЮЧЕМ ЕГО ИМЯ
-- HSET users 'igorsimdyanov@gmail.COM' 'igor'
-- HSET users 'elena@gmail.COM' 'Elena'
-- HSET users 'santa@gmail.COM' 'santa'
-- Для извлечения пользователя по эл.адресу мы так же можем воспользоваться командой hget
-- HGET users 'igorsimdyanov@gmail.COM'
-- ЗАДАНИЕ ВЫПОЛНЕНО
-- Организуем хранение категорий и товарных позиций учебной базы данных shop в СУБД MongoDB
-- СОЗДАДИМ КОЛЛЕКЦИИ КАТЕГОРИЙ И ТОВАРНЫХ ПОЗИЦИЙ:
-- db.createCollection('catalogs')
-- db.createCollection('products')
-- ДАЛЕЕ ОРГАНИЗУЕМ ХРАНЕНИЕ КАТЕГОРИЙ ИНТЕРНЕТ МАГАЗИНА
-- db.catalogs.insert({name: 'Процессоры'})
-- db.catalogs.insert({name: 'Мат.платы'})
-- db.catalogs.insert({name: 'Видеокарты'})
-- ТЕПЕРЬ ВСТАВИМ НЕСКОЛЬКО ТОВАРНЫХ ПОЗИЦИЙ
-- УКАЖЕМ ИМЯ, ОПИСАНИЕ, ЦЕНУ И ВНЕШНИЙ КЛЮЧ catalog_id
	/*db.products.insert(
		{
			name: 'intel Core i3',
			description: 'Процессор для настольных ламп',
			price: 7890.00,
			catalog_id: new ObjectId("yg57yge95gy9e85yg9e85yg89e5")
		}
	);*/
 -- Вставим еще один процессор и материнскую плату, в коллекции products три предмета
 -- ДЛЯ ИЗВЛЕЧЕНИЯ ТОЛЬКО ПРОЦЕССОРОВ НЕОБХОДИМО УКАЗАТЬ В МЕТОДЕ FIND УКАЗАТЬ 
 -- СЕЛЕКТОР С ФИЛЬТРАЦИЕЙ ПО catalog_id
 
 


