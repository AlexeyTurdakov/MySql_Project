DROP SCHEMA IF EXISTS `tmd_shop`;
CREATE SCHEMA `tmd_shop` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;

USE `tmd_shop`;

DROP TABLE IF EXISTS `tmd_shop`.`category`;
CREATE TABLE `tmd_shop`.`category` (
   `id` INT NOT NULL AUTO_INCREMENT,
   `name` VARCHAR(128) NOT NULL,
   `discount` TINYINT NOT NULL,
   PRIMARY KEY (`id`));
   
INSERT INTO `tmd_shop`.`category` (`id`, `name`, `discount`) VALUES ('1', 'Womens clothing', '10');
INSERT INTO `tmd_shop`.`category` (`id`, `name`, `discount`) VALUES ('2', 'Mans clothing', '10');
INSERT INTO `tmd_shop`.`category` (`id`, `name`, `discount`) VALUES ('3', 'Kids clothing', '15');


DROP TABLE IF EXISTS `tmd_shop`.`brand`;
CREATE TABLE `tmd_shop`.`brand` (
   `id` INT NOT NULL AUTO_INCREMENT,
   `name` VARCHAR(128) NOT NULL,
   PRIMARY KEY (`id`));
   
insert into `tmd_shop`.`brand` (id, name) values (1, 'balance-n-brighten');
insert into `tmd_shop`.`brand` (id, name) values (2, 'NO-AD 60 Sunscreen');
insert into `tmd_shop`.`brand` (id, name) values (3, 'PRAVASTATIN SODIUM');
insert into `tmd_shop`.`brand` (id, name) values (4, 'Duloxetine hydrochloride');
insert into `tmd_shop`.`brand` (id, name) values (5, 'Medrox');
insert into `tmd_shop`.`brand` (id, name) values (6, 'Fever Infection');
insert into `tmd_shop`.`brand` (id, name) values (7, 'Dove');
insert into `tmd_shop`.`brand` (id, name) values (8, 'Terazol 7');
insert into `tmd_shop`.`brand` (id, name) values (9, 'Hand Sanitizer');
insert into `tmd_shop`.`brand` (id, name) values (10, 'EpiSoft');


DROP TABLE IF EXISTS `tmd_shop`.`product_type`;
CREATE TABLE `tmd_shop`.`product_type` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(128) NOT NULL,
	PRIMARY KEY (`id`));
    
INSERT INTO `tmd_shop`.`product_type` (`id`, `name`) VALUES ('1', 'T-shirt');
INSERT INTO `tmd_shop`.`product_type` (`name`) VALUES ('jeans');
INSERT INTO `tmd_shop`.`product_type` (`name`) VALUES ('pants');
INSERT INTO `tmd_shop`.`product_type` (`name`) VALUES ('jacket');
INSERT INTO `tmd_shop`.`product_type` (`name`) VALUES ('sweater');
INSERT INTO `tmd_shop`.`product_type` (`name`) VALUES ('hat');


DROP TABLE IF EXISTS `tmd_shop`.`order`;
CREATE TABLE `tmd_shop`.`order` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(128) NOT NULL,
  `phone` VARCHAR(32) NOT NULL,
  `mail` VARCHAR(128) NOT NULL,
  `datetime` DATETIME NOT NULL,
  PRIMARY KEY (`id`));

insert into `tmd_shop`.`order` (id, user_name, phone, mail, datetime) values (1, 'Natty', '417-793-8262', 'ntumielli0@webeden.co.uk', '2020-07-16 00:02:06');
insert into `tmd_shop`.`order` (id, user_name, phone, mail, datetime) values (2, 'Ginger', '335-139-7707', 'gscoullar1@multiply.com', '2020-07-05 15:14:17');
insert into `tmd_shop`.`order` (id, user_name, phone, mail, datetime) values (3, 'Petr', '560-891-8375', 'pcissell2@apple.com', '2020-06-07 04:17:16');
insert into `tmd_shop`.`order` (id, user_name, phone, mail, datetime) values (4, 'Amalee', '148-707-5255', 'aneed3@barnesandnoble.com', '2020-02-22 15:27:13');
insert into `tmd_shop`.`order` (id, user_name, phone, mail, datetime) values (5, 'Patsy', '133-225-9854', 'paudiss4@flavors.me', '2020-05-31 00:47:13');
insert into `tmd_shop`.`order` (id, user_name, phone, mail, datetime) values (6, 'Emma', '941-981-5825', 'ecanny5@plala.or.jp', '2020-04-22 19:24:43');
insert into `tmd_shop`.`order` (id, user_name, phone, mail, datetime) values (7, 'Clementina', '600-258-6394', 'ckeme6@rediff.com', '2020-09-13 19:03:50');
insert into `tmd_shop`.`order` (id, user_name, phone, mail, datetime) values (8, 'Carmela', '593-275-2062', 'cvoss7@stumbleupon.com', '2020-02-11 01:43:15');
insert into `tmd_shop`.`order` (id, user_name, phone, mail, datetime) values (9, 'Devy', '563-315-3685', 'dlots8@wunderground.com', '2019-12-20 22:01:49');
insert into `tmd_shop`.`order` (id, user_name, phone, mail, datetime) values (10, 'Ramonda', '175-186-6739', 'rdavidou9@google.de', '2020-08-25 09:07:20');


DROP TABLE IF EXISTS `tmd_shop`.`order_products`;
CREATE TABLE `tmd_shop`.`order_products` (
  `order_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `count` INT NOT NULL,
  PRIMARY KEY (`order_id`, `product_id`));
  
INSERT INTO `tmd_shop`.`order_products` (`order_id`, `product_id`, `count`) VALUES ('1', '2', '1');
INSERT INTO `tmd_shop`.`order_products` (`order_id`, `product_id`, `count`) VALUES ('2', '4', '1');
INSERT INTO `tmd_shop`.`order_products` (`order_id`, `product_id`, `count`) VALUES ('5', '6', '2');
INSERT INTO `tmd_shop`.`order_products` (`order_id`, `product_id`, `count`) VALUES ('6', '7', '3');
INSERT INTO `tmd_shop`.`order_products` (`order_id`, `product_id`, `count`) VALUES ('8', '7', '4');


DROP TABLE IF EXISTS `tmd_shop`.`product`;
CREATE TABLE `tmd_shop`.`product` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`brand_id` INT NOT NULL,
	`product_type_id` INT NOT NULL,
	`category_id` INT NOT NULL,
	`price` DECIMAL(10) NOT NULL,
	PRIMARY KEY (`id`));

INSERT INTO `tmd_shop`.`product` (`id`, `brand_id`, `product_type_id`, `category_id`, `price`) VALUES ('1', '2', '3', '1', '5600');
INSERT INTO `tmd_shop`.`product` (`id`, `brand_id`, `product_type_id`, `category_id`, `price`) VALUES ('2', '3', '4', '2', '3400');
INSERT INTO `tmd_shop`.`product` (`id`, `brand_id`, `product_type_id`, `category_id`, `price`) VALUES ('3', '5', '6', '3', '2300');
INSERT INTO `tmd_shop`.`product` (`id`, `brand_id`, `product_type_id`, `category_id`, `price`) VALUES ('4', '6', '6', '1', '3400');
INSERT INTO `tmd_shop`.`product` (`id`, `brand_id`, `product_type_id`, `category_id`, `price`) VALUES ('5', '7', '1', '2', '1500');
INSERT INTO `tmd_shop`.`product` (`id`, `brand_id`, `product_type_id`, `category_id`, `price`) VALUES ('6', '8', '3', '2', '2300');
INSERT INTO `tmd_shop`.`product` (`id`, `brand_id`, `product_type_id`, `category_id`, `price`) VALUES ('7', '9', '4', '2', '1200');
INSERT INTO `tmd_shop`.`product` (`id`, `brand_id`, `product_type_id`, `category_id`, `price`) VALUES ('8', '3', '5', '1', '2400');
INSERT INTO `tmd_shop`.`product` (`id`, `brand_id`, `product_type_id`, `category_id`, `price`) VALUES ('9', '5', '2', '3', '100');
INSERT INTO `tmd_shop`.`product` (`id`, `brand_id`, `product_type_id`, `category_id`, `price`) VALUES ('10', '3', '3', '3', '10000');

ALTER TABLE `tmd_shop`.`product` 
ADD INDEX `fk_brand_product_id` (`brand_id` ASC) VISIBLE,
ADD CONSTRAINT `fk_brand_product`
	FOREIGN KEY (`brand_id`)
	REFERENCES `tmd_shop`.`brand` (`id`)
	ON DELETE CASCADE
	ON UPDATE NO ACTION,
ADD INDEX `fk_category_product_id` (`category_id` ASC) VISIBLE,
ADD CONSTRAINT `fk_category_product`
	FOREIGN KEY (`category_id`)
	REFERENCES `tmd_shop`.`category` (`id`)
	ON DELETE CASCADE
	ON UPDATE NO ACTION,
ADD INDEX `fk_product_type_product_id` (`product_type_id` ASC) VISIBLE,
ADD CONSTRAINT `fk_product_type_product`
	FOREIGN KEY (`product_type_id`)
	REFERENCES `tmd_shop`.`product_type` (`id`)
	ON DELETE CASCADE
	ON UPDATE NO ACTION;
    
ALTER TABLE `tmd_shop`.`order_products`    
ADD INDEX `fk_order_products_product_idx` (`product_id` ASC) VISIBLE,
  ADD CONSTRAINT `fk_order_products_order`
    FOREIGN KEY (`order_id`)
    REFERENCES `tmd_shop`.`order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_order_products_product`
    FOREIGN KEY (`product_id`)
    REFERENCES `tmd_shop`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;