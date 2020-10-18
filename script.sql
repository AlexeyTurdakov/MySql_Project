/*
Информационные потребности пользователей выражаются в следующем: 
пользователям базой данных необходимо находить нужную им информацию в БД, 
просматривать ее, выводить на печать. 
Для этих целей использую отчеты и запросы. 
Запросов может быть создано довольно много, 
поэтому реализованы лишь самые необходимые. К ним относятся:
*/

USE tmd_shop;

-- Запрос на получение товарного чека

SELECT 
	product.id_product_article, 
	product.product_name, 
	order_product.count as quantity, 
	product.product_price * order_product.count as total_price, 
	order_product.number_order
FROM product INNER JOIN order_product 
	ON product.id_product_article = order_product.id_product
GROUP BY 
	product.id_product_article, 
	product.product_name, 
	order_product.id_product
HAVING order_product.id_product = '4017953472867';


-- Запрос на получение гарантийного талона

SELECT 
	order_product.number_order,
	product.id_product_article,
    product.product_name,
    order_product.count as quantity,
    product.product_guarantee_months
FROM product INNER JOIN order_product 
	ON product.id_product_article = order_product.id_product
GROUP BY 
	product.id_product_article, 
    product.product_name, 
    product.product_guarantee_months, 
    order_product.id_product
HAVING order_product.id_product = '4017953472867';

-- Запрос на получение информации о самой покупаемой продукции

SELECT 
	product.product_name, 
    order_product.count as quantity
FROM product INNER JOIN order_product 
	ON product.id_product_article = order_product.id_product
GROUP BY product.product_name
ORDER BY order_product.count DESC;

-- Запрос на получение информации о самой рейтинговой продукции

SELECT 
	product.product_name, 
    Avg(product_evaluation.evaluation)
FROM product INNER JOIN product_evaluation 
	ON product.id_product_article = product_evaluation.id_product
GROUP BY product.product_name
ORDER BY Avg(product_evaluation.evaluation) DESC;

-- Запрос на получение сводки доходности магазина по различным категориям продукции

SELECT DISTINCT 
	product.product_category, 
    product.product_price, 
    order_product.count, 
    product.product_price * order_product.count as total
FROM product INNER JOIN (`order` INNER JOIN order_product ON `order`.id_order = order_product.number_order) 
	ON product.id_product_article = order_product.id_product
GROUP BY product.product_category, `order`.status_order
HAVING `order`.status_order="1"; /*статус заказа 0 и 1. 1 - заказ выполнен, 0 - нет*/

-- Запрос на вывод новинок

SELECT 
	product.product_name, 
    Avg(product_evaluation.evaluation) AS average_rating, 
    product.product_price
FROM product LEFT JOIN product_evaluation 
	ON product.id_product_article = product_evaluation.id_product
GROUP BY 
	product.product_name, 
    product.product_price, 
    product.id_product_article
ORDER BY product.id_product_article DESC limit 5;

-- Запрос на историю заказов

SELECT 
	`order`.id_order, 
    `order`.date_order, 
    `order`.cost_order, 
    `order`.login
FROM product INNER JOIN (`order` INNER JOIN order_product ON `order`.id_order = order_product.number_order) 
	ON product.id_product_article = order_product.id_product
GROUP BY 
	`order`.id_order, 
    `order`.date_order, 
    `order`.cost_order, 
    `order`.login
HAVING `order`.login="5";

-- Запрос на историю покупок

SELECT 
	`order`.login, 
    product.product_name, 
    product.product_price, 
    order_product.number_order
FROM product INNER JOIN (`order` INNER JOIN order_product ON `order`.id_order = order_product.number_order) 
	ON product.id_product_article = order_product.id_product
GROUP BY 
	`order`.login, 
    product.product_name, 
    product.product_price, 
    order_product.id_product
HAVING `order`.login="5" AND order_product.number_order="5";


/*
Представления, Хранимые процедуры и триггеры.

Представлений может быть создано довольно много, 
поэтому реализованы лишь самые необходимые. К ним относятся:
*/ 


-- Вывод основной информации о поставщиках интернет-магазина

DROP VIEW IF EXISTS supplier_info;
CREATE VIEW supplier_info (id, name, email, fax, phone, price_list, product_category)
AS SELECT 
	supplier.id,
	supplier.supplier_name,
    supplier.Email,
    supplier.Fax,
    supplier.phone,
    supplier.price_list,
    supplier_category.product_category
FROM supplier INNER JOIN supplier_category
	ON supplier.id = supplier_category.id;
    
-- Вывод основной информации о покупателе

DROP VIEW IF EXISTS buyer_info;
CREATE VIEW buyer_info (id, login, `password`, email, `name`, address, phone, credit_card_number, owners_name, `code`, expiration_date)
AS SELECT 
	buyer.id,
    buyer.login,
    buyer.`password`,
    buyer.email,
    buyer.`name`,
    buyer.address,
    buyer_phone.phone,
    credit_card.credit_card_number,
    credit_card.owners_name,
    credit_card.`code`,
    credit_card.expiration_date
FROM buyer INNER JOIN (buyer_phone INNER JOIN credit_card ON buyer_phone.id = credit_card.id) 
	ON buyer.id = buyer_phone.id;
    
-- Вывод основной информации о доставке. Что, кто, куда, сколько.

DROP VIEW IF EXISTS delivery_info;
CREATE VIEW delivery_info (
	id_order, 
    date_order, 
    status_order, 
    cost_order, 
    point_of_delivery_name, 
    total_weight, 
    total_volume, 
    delivery_date, 
    cost_of_delivery, 
    delivery_status, 
    type_of_delivery, 
    employee_personnel_number, 
    `name`, 
    email, 
    position, 
    phone)
AS SELECT 
	`order`.id_order,
    `order`.date_order,
    `order`.status_order,
    `order`.cost_order,
    `order`.point_of_delivery_name,
    delivery.total_weight,
    delivery.total_volume,
    delivery.delivery_date,
    delivery.cost_of_delivery,
    delivery.delivery_status,
    delivery.type_of_delivery,
    store_employe.personnel_number,
    store_employe.`name`,
    store_employe.email,
    store_employe.position,
    store_employe.phone
FROM `order` INNER JOIN (delivery INNER JOIN store_employe ON delivery.Personnel_Number = store_employe.Personnel_Number)
	ON `order`.Personnel_Number = delivery.Personnel_Number;


/* Хранимые процедуры и триггеры */

-- Процедура копирования таблиц

DROP TABLE IF EXISTS new_supplier;
CREATE TABLE new_supplier (
  `id` INT,
  `supplier_name` VARCHAR(45),
  `Email` VARCHAR(100),
  `Fax` VARCHAR(45),
  `Phone` VARCHAR(45),
  `Price_list` MEDIUMTEXT
);

DELIMITER //
DROP PROCEDURE IF EXISTS copy_catalogs//
CREATE PROCEDURE copy_catalogs ()
BEGIN
  DECLARE id INT;
  DECLARE is_end INT DEFAULT 0;
  DECLARE name TINYTEXT;
  DECLARE email TINYTEXT;
  DECLARE fax TINYTEXT;
  DECLARE phone TINYTEXT;   
  DECLARE price TINYTEXT;  
  
  DECLARE curcat CURSOR FOR SELECT * FROM supplier;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET is_end = 1;

  OPEN curcat;

  cycle : LOOP
	FETCH curcat INTO id, name, Email, Fax, Phone, price;
	IF is_end THEN LEAVE cycle;
	END IF;
	INSERT INTO new_supplier VALUES(id, name, email, fax, phone, price);
  END LOOP cycle;

  CLOSE curcat;
END//

CALL copy_catalogs();
SELECT * FROM new_supplier;


-- Триггеры.

/* Создадим триггер, который при вставке новой товарной позиции в таблицу product 
   будет следить за состоянием внешнего ключа id_product_article.
   Если внешний ключ будет оставаться незаполненным, 
   триггер будет извлекать из таблицы order_product наименьший идентификатор number_order 
   и назначать его записи */

DELIMITER //
DROP TRIGGER IF EXISTS product_article//
CREATE TRIGGER product_article BEFORE INSERT ON product
FOR EACH ROW
BEGIN
  DECLARE article_id INT;
  SELECT number_order INTO article_id FROM order_product ORDER BY number_order LIMIT 1;
  SET NEW.id_product_article = COALESCE(NEW.id_product_article, article_id);
END//

INSERT INTO `tmd_shop`.`product` (
	`id_product_article`, 
    `product_price`, 
    `product_weight`, 
    `product_length`, 
    `product_width`, 
    `product_height`, 
    `product_image`, 
    `product_name`, 
    `product_category`, 
    `product_guarantee_months`, 
    `product_description`) 
VALUES (NULL, '4799', '6', '76', '56', '39', '1', 'Amlodipine Besylate and Benazepril Hydrochloride', '1', '50', 'c6deeb62c7cc02b0efe1788de2657c229c3ec1d5');

-- Как видим, товарная позиция автоматически получает значение 1


/*  Создадим триггер для команды UPDATE. При попытке назначить полю id_product_article 
	значение будем оставлять текущее, если оно отлично от NULL, 
    или заменять его не NULL-значением.*/

DELIMITER //    
CREATE TRIGGER product_article_update BEFORE UPDATE ON product
FOR EACH ROW
BEGIN
  DECLARE artic_id INT;
  SELECT number_order INTO artic_id FROM order_product ORDER BY number_order LIMIT 1;
  SET NEW.id_product_article = COALESCE(NEW.id_product_article, OLD.id_product_article, artic_id);
END//
