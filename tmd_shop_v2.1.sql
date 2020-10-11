DROP SCHEMA IF EXISTS `tmd_shop`;
CREATE SCHEMA `tmd_shop` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;

USE `tmd_shop`;

DROP TABLE IF EXISTS `tmd_shop`.`supplier`;
CREATE TABLE `tmd_shop`.`supplier` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `supplier_name` VARCHAR(45) NOT NULL,
  `E-mail` VARCHAR(100) NOT NULL,
  `Fax` VARCHAR(45) NOT NULL,
  `Phone` VARCHAR(45) NOT NULL,
  `Price_list` MEDIUMTEXT NULL,
  PRIMARY KEY (`id`));

INSERT INTO `tmd_shop`.`supplier` (`id`, `supplier_name`, `E-mail`, `Fax`, `Phone`, `Price_list`) VALUES ('1', 'Electrolux', 'pamberson0@miitbeian.gov.cn', '462-950-5245', '301-592-4266', 'https://house.gov');
INSERT INTO `tmd_shop`.`supplier` (`supplier_name`, `E-mail`, `Fax`, `Phone`, `Price_list`) VALUES ('LG', 'acollopy1@drupal.org', '862-454-7266', '300-921-4777', 'http://mayoclinic.com');
INSERT INTO `tmd_shop`.`supplier` (`supplier_name`, `E-mail`, `Fax`, `Phone`, `Price_list`) VALUES ('Phillips', 'aglas2@nbcnews.com', '218-728-2478', '371-455-8631', 'http://yale.edu');
INSERT INTO `tmd_shop`.`supplier` (`supplier_name`, `E-mail`, `Fax`, `Phone`, `Price_list`) VALUES ('Zanussi', 'jizatt3@wikispaces.com', '931-233-2454', '723-115-5008', 'http://amazon.de');
INSERT INTO `tmd_shop`.`supplier` (`supplier_name`, `E-mail`, `Fax`, `Phone`, `Price_list`) VALUES ('Bocsh', 'ahathway4@spiegel.de', '372-953-9097', '793-367-5037', 'http://rambler.ru');
INSERT INTO `tmd_shop`.`supplier` (`supplier_name`, `E-mail`, `Fax`, `Phone`, `Price_list`) VALUES ('Kio', 'sgoodlett5@qq.com', '490-970-5909', '513-443-3428', 'http://netvibes.com');
INSERT INTO `tmd_shop`.`supplier` (`supplier_name`, `E-mail`, `Fax`, `Phone`, `Price_list`) VALUES ('Xiaomi', 'ljiroutek6@wikimedia.org', '987-237-4214', '442-447-3995', 'https://slideshare.net');
INSERT INTO `tmd_shop`.`supplier` (`supplier_name`, `E-mail`, `Fax`, `Phone`, `Price_list`) VALUES ('Ariston', 'lburke7@businessinsider.com', '980-274-1535', '485-835-0181', 'https://phpbb.com');
INSERT INTO `tmd_shop`.`supplier` (`supplier_name`, `E-mail`, `Fax`, `Phone`, `Price_list`) VALUES ('Dell', 'mpetts8@bravesites.com', '416-483-3958', '967-256-6215', 'http://geocities.jp');
INSERT INTO `tmd_shop`.`supplier` (`supplier_name`, `E-mail`, `Fax`, `Phone`, `Price_list`) VALUES ('Asus', 'bannies9@slashdot.org', '910-402-1773', '107-797-0846', 'http://cnn.com');


DROP TABLE IF EXISTS `tmd_shop`.`supplier_category`;
CREATE TABLE `tmd_shop`.`supplier_category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `product_category` VARCHAR(100) NOT NULL,
  `supplier_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));

INSERT INTO `tmd_shop`.`supplier_category` (`id`, `product_category`, `supplier_name`) VALUES ('1', 'Appliances', 'Electrolux');
INSERT INTO `tmd_shop`.`supplier_category` (`product_category`, `supplier_name`) VALUES ('Appliances', 'LG');
INSERT INTO `tmd_shop`.`supplier_category` (`product_category`, `supplier_name`) VALUES ('Appliances', 'Phillips');
INSERT INTO `tmd_shop`.`supplier_category` (`product_category`, `supplier_name`) VALUES ('Appliances', 'Zanussi');
INSERT INTO `tmd_shop`.`supplier_category` (`product_category`, `supplier_name`) VALUES ('Appliances', 'Bocsh');
INSERT INTO `tmd_shop`.`supplier_category` (`product_category`, `supplier_name`) VALUES ('Appliances', 'Kio');
INSERT INTO `tmd_shop`.`supplier_category` (`product_category`, `supplier_name`) VALUES ('Appliances', 'Xiaomi');
INSERT INTO `tmd_shop`.`supplier_category` (`product_category`, `supplier_name`) VALUES ('Appliances', 'Ariston');
INSERT INTO `tmd_shop`.`supplier_category` (`product_category`, `supplier_name`) VALUES ('Сomputer', 'Dell');
INSERT INTO `tmd_shop`.`supplier_category` (`product_category`, `supplier_name`) VALUES ('Сomputer', 'Asus');

ALTER TABLE `tmd_shop`.`supplier` 
ADD CONSTRAINT `fk_supplier`
  FOREIGN KEY (`id`)
  REFERENCES `tmd_shop`.`supplier_category` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

DROP TABLE IF EXISTS `tmd_shop`.`buyer`;
CREATE TABLE `tmd_shop`.`buyer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `e-mail` VARCHAR(100) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(200) NOT NULL,
  `birthday` DATE NOT NULL,
  PRIMARY KEY (`id`, `login`));
  
INSERT INTO `tmd_shop`.`buyer` (`id`, `login`, `password`, `e-mail`, `name`, `address`, `birthday`) VALUES (1, 'Winona', 'W2EeysN', 'wposkitt0@twitpic.com', 'Winona Poskitt', '22086 Iowa Lane', '1985-03-23');
INSERT INTO `tmd_shop`.`buyer` (`id`, `login`, `password`, `e-mail`, `name`, `address`, `birthday`) VALUES (2, 'Effie', '5C3qd9ykgVY', 'estoven1@tripadvisor.com', 'Effie Stoven', '06038 Lakeland Parkway', '1956-09-23');
INSERT INTO `tmd_shop`.`buyer` (`id`, `login`, `password`, `e-mail`, `name`, `address`, `birthday`) VALUES (3, 'Kattie', 'aALIaePQQ', 'knoller2@lycos.com', 'Kattie Noller', '1915 Larry Avenue', '1952-05-12');
INSERT INTO `tmd_shop`.`buyer` (`id`, `login`, `password`, `e-mail`, `name`, `address`, `birthday`) VALUES (4, 'Wilt', 'wmbYXGloKou', 'wcastiglio3@ow.ly', 'Wilt Castiglio', '6 Comanche Trail', '1996-04-16');
INSERT INTO `tmd_shop`.`buyer` (`id`, `login`, `password`, `e-mail`, `name`, `address`, `birthday`) VALUES (5, 'Grier', 'AR8HWCHbT', 'gantusch4@1688.com', 'Grier Antusch', '24079 Buhler Alley', '1970-05-11');
INSERT INTO `tmd_shop`.`buyer` (`id`, `login`, `password`, `e-mail`, `name`, `address`, `birthday`) VALUES (6, 'Theodora', '2hGokEYr8DD', 'tcostell5@123-reg.co.uk', 'Theodora Costell', '979 Continental Lane', '1980-02-21');
INSERT INTO `tmd_shop`.`buyer` (`id`, `login`, `password`, `e-mail`, `name`, `address`, `birthday`) VALUES (7, 'Corey', 'BzoPbQX', 'ccourse6@google.nl', 'Corey Course', '64 Grim Terrace', '1979-05-03');
INSERT INTO `tmd_shop`.`buyer` (`id`, `login`, `password`, `e-mail`, `name`, `address`, `birthday`) VALUES (8, 'Nobe', 'XIrc2iJV', 'nlamplough7@foxnews.com', 'Nobe Lamplough', '33 Laurel Lane', '1999-07-01');
INSERT INTO `tmd_shop`.`buyer` (`id`, `login`, `password`, `e-mail`, `name`, `address`, `birthday`) VALUES (9, 'Courtnay', 'gJFhsDOTQWl', 'cglendinning8@zdnet.com', 'Courtnay Glendinning', '6 Morning Avenue', '1969-09-25');
INSERT INTO `tmd_shop`.`buyer` (`id`, `login`, `password`, `e-mail`, `name`, `address`, `birthday`) VALUES (10, 'Nevil', 'lO5AT41p', 'nboycott9@skype.com', 'Nevil Boycott', '24 Mockingbird Circle', '1994-06-03');  


DROP TABLE IF EXISTS `tmd_shop`.`buyer_phone`;
CREATE TABLE `tmd_shop`.`buyer_phone` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `phone` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`, `phone`));
  
INSERT INTO `tmd_shop`.`buyer_phone` (`id`, `phone`) VALUES (1, '326-851-0264');
INSERT INTO `tmd_shop`.`buyer_phone` (`id`, `phone`) VALUES (2, '333-938-5404');
INSERT INTO `tmd_shop`.`buyer_phone` (`id`, `phone`) VALUES (3, '528-741-8901');
INSERT INTO `tmd_shop`.`buyer_phone` (`id`, `phone`) VALUES (4, '632-980-4385');
INSERT INTO `tmd_shop`.`buyer_phone` (`id`, `phone`) VALUES (5, '264-887-2133');
INSERT INTO `tmd_shop`.`buyer_phone` (`id`, `phone`) VALUES (6, '993-877-1596');
INSERT INTO `tmd_shop`.`buyer_phone` (`id`, `phone`) VALUES (7, '845-236-7750');
INSERT INTO `tmd_shop`.`buyer_phone` (`id`, `phone`) VALUES (8, '151-564-3584');
INSERT INTO `tmd_shop`.`buyer_phone` (`id`, `phone`) VALUES (9, '503-760-1612');
INSERT INTO `tmd_shop`.`buyer_phone` (`id`, `phone`) VALUES (10, '570-599-0342');  
  
ALTER TABLE `tmd_shop`.`buyer` 
ADD CONSTRAINT `fk_buyer_buyer_phone`
  FOREIGN KEY (`id`)
  REFERENCES `tmd_shop`.`buyer_phone` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
  
DROP TABLE IF EXISTS `tmd_shop`.`credit_card`;
CREATE TABLE `tmd_shop`.`credit_card` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `credit_card_number` VARCHAR(20) NOT NULL,
  `owners_name` VARCHAR(100) NOT NULL,
  `code` VARCHAR(10) NOT NULL,
  `expiration_date` DATE NOT NULL,
  PRIMARY KEY (`id`, `credit_card_number`));
  
INSERT INTO `tmd_shop`.`credit_card` (`id`, `credit_card_number`, `owners_name`, `code`, `expiration_date`) VALUES (1, '5602', 'Nicki Kynaston', '52125-124', '2015-10-12');
INSERT INTO `tmd_shop`.`credit_card` (`id`, `credit_card_number`, `owners_name`, `code`, `expiration_date`) VALUES (2, '5641', 'Lorianna Towsie', '0009-0626', '2018-07-23');
INSERT INTO `tmd_shop`.`credit_card` (`id`, `credit_card_number`, `owners_name`, `code`, `expiration_date`) VALUES (3, '6336', 'Arne Gaither', '68788-9052', '2017-09-03');
INSERT INTO `tmd_shop`.`credit_card` (`id`, `credit_card_number`, `owners_name`, `code`, `expiration_date`) VALUES (4, '0604', 'Catharine Gillean', '60505-0135', '2020-04-06');
INSERT INTO `tmd_shop`.`credit_card` (`id`, `credit_card_number`, `owners_name`, `code`, `expiration_date`) VALUES (5, '3577', 'Devland Cammish', '0093-0576', '2015-12-07');
INSERT INTO `tmd_shop`.`credit_card` (`id`, `credit_card_number`, `owners_name`, `code`, `expiration_date`) VALUES (6, '3582', 'Trina Stonhouse', '0268-1069', '2017-08-27');
INSERT INTO `tmd_shop`.`credit_card` (`id`, `credit_card_number`, `owners_name`, `code`, `expiration_date`) VALUES (7, '3549', 'Cristobal Trinke', '51079-346', '2020-04-15');
INSERT INTO `tmd_shop`.`credit_card` (`id`, `credit_card_number`, `owners_name`, `code`, `expiration_date`) VALUES (8, '3537', 'Chen Theurer', '16590-837', '2017-10-27');
INSERT INTO `tmd_shop`.`credit_card` (`id`, `credit_card_number`, `owners_name`, `code`, `expiration_date`) VALUES (9, '5499', 'Michel Stamper', '53203-101', '2019-05-08');
INSERT INTO `tmd_shop`.`credit_card` (`id`, `credit_card_number`, `owners_name`, `code`, `expiration_date`) VALUES (10, '3556', 'Allin Mawhinney', '0078-0359', '2017-12-15');

ALTER TABLE `tmd_shop`.`buyer` 
ADD CONSTRAINT `fk_buyer_credit_card`
  FOREIGN KEY (`id`)
  REFERENCES `tmd_shop`.`credit_card` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

DROP TABLE IF EXISTS `tmd_shop`.`product`;  
CREATE TABLE `tmd_shop`.`product` (
  `id_product_article` BIGINT(50) NOT NULL,
  `product_price` DECIMAL(10) NOT NULL,
  `product_weight` INT NOT NULL,
  `product_length` INT NOT NULL,
  `product_width` INT NOT NULL,
  `product_height` INT NOT NULL,
  `product_image` BLOB NOT NULL,
  `product_name` VARCHAR(200) NOT NULL,
  `product_category` INT NOT NULL,
  `product_guarantee_months` INT NOT NULL,
  `product_description` MEDIUMTEXT NOT NULL,
  PRIMARY KEY (`id_product_article`, `product_category`));
  
INSERT INTO `tmd_shop`.`product` (`id_product_article`, `product_price`, `product_weight`, `product_length`, `product_width`, `product_height`, `product_image`, `product_name`, `product_category`, `product_guarantee_months`, `product_description`) VALUES ('560222983762121475', '4798.88', 6, 76, 56, 39, 'https://robohash.org/quiaetdignissimos.png?size=50x50&set=set1', 'Amlodipine Besylate and Benazepril Hydrochloride', 1, 50, 'c6deeb62c7cc02b0efe1788de2657c229c3ec1d5');
INSERT INTO `tmd_shop`.`product` (`id_product_article`, `product_price`, `product_weight`, `product_length`, `product_width`, `product_height`, `product_image`, `product_name`, `product_category`, `product_guarantee_months`, `product_description`) VALUES ('348490240566723', '6471.41', 1, 60, 38, 23, 'https://robohash.org/suscipitquidolor.png?size=50x50&set=set1', 'TOFRANIL', 2, 40, 'c6deeb62c7cc02b0efe1788de2657c229c3ec1d5');
INSERT INTO `tmd_shop`.`product` (`id_product_article`, `product_price`, `product_weight`, `product_length`, `product_width`, `product_height`, `product_image`, `product_name`, `product_category`, `product_guarantee_months`, `product_description`) VALUES ('3543195644508893', '3965.50', 16, 36, 67, 61, 'https://robohash.org/aliquiddolorumut.png?size=50x50&set=set1', 'Oxycodone and Acetaminophen', 3, 30, 'c6deeb62c7cc02b0efe1788de2657c229c3ec1d5');
INSERT INTO `tmd_shop`.`product` (`id_product_article`, `product_price`, `product_weight`, `product_length`, `product_width`, `product_height`, `product_image`, `product_name`, `product_category`, `product_guarantee_months`, `product_description`) VALUES ('4017953472867', '3058.39', 45, 32, 40, 40, 'https://robohash.org/exidmollitia.png?size=50x50&set=set1', 'Dandelion', 4, 21, 'c6deeb62c7cc02b0efe1788de2657c229c3ec1d5');
INSERT INTO `tmd_shop`.`product` (`id_product_article`, `product_price`, `product_weight`, `product_length`, `product_width`, `product_height`, `product_image`, `product_name`, `product_category`, `product_guarantee_months`, `product_description`) VALUES ('6762370103581650', '1483.87', 71, 47, 52, 72, 'https://robohash.org/magnieaquesimilique.png?size=50x50&set=set1', 'Enteric Coated Aspirin', 5, 11, 'c6deeb62c7cc02b0efe1788de2657c229c3ec1d5');
INSERT INTO `tmd_shop`.`product` (`id_product_article`, `product_price`, `product_weight`, `product_length`, `product_width`, `product_height`, `product_image`, `product_name`, `product_category`, `product_guarantee_months`, `product_description`) VALUES ('6763511007867633', '3893.29', 99, 17, 18, 53, 'https://robohash.org/repudiandaeestab.png?size=50x50&set=set1', 'Isopropyl Alcohol', 6, 31, 'c6deeb62c7cc02b0efe1788de2657c229c3ec1d5');
INSERT INTO `tmd_shop`.`product` (`id_product_article`, `product_price`, `product_weight`, `product_length`, `product_width`, `product_height`, `product_image`, `product_name`, `product_category`, `product_guarantee_months`, `product_description`) VALUES ('4844014806496074', '9044.10', 76, 36, 86, 88, 'https://robohash.org/consequunturmolestiaeest.png?size=50x50&set=set1', 'Night Time Liquid Caps', 7, 15, 'c6deeb62c7cc02b0efe1788de2657c229c3ec1d5');
INSERT INTO `tmd_shop`.`product` (`id_product_article`, `product_price`, `product_weight`, `product_length`, `product_width`, `product_height`, `product_image`, `product_name`, `product_category`, `product_guarantee_months`, `product_description`) VALUES ('374288179638530', '1757.70', 28, 19, 22, 19, 'https://robohash.org/consequaturinventoreconsequuntur.png?size=50x50&set=set1', 'Oxacillin', 8, 10, 'c6deeb62c7cc02b0efe1788de2657c229c3ec1d5');
INSERT INTO `tmd_shop`.`product` (`id_product_article`, `product_price`, `product_weight`, `product_length`, `product_width`, `product_height`, `product_image`, `product_name`, `product_category`, `product_guarantee_months`, `product_description`) VALUES ('374622511608654', '6767.93', 96, 36, 81, 23, 'https://robohash.org/suntdoloribusquam.png?size=50x50&set=set1', 'Lamotrigine', 9, 44, 'c6deeb62c7cc02b0efe1788de2657c229c3ec1d5');
INSERT INTO `tmd_shop`.`product` (`id_product_article`, `product_price`, `product_weight`, `product_length`, `product_width`, `product_height`, `product_image`, `product_name`, `product_category`, `product_guarantee_months`, `product_description`) VALUES('4041593939440', '2162.05', 77, 31, 13, 79, 'https://robohash.org/voluptatespariaturvoluptatem.png?size=50x50&set=set1', 'L-Dopa', 10, 38, 'c6deeb62c7cc02b0efe1788de2657c229c3ec1d5'); 

DROP TABLE IF EXISTS `tmd_shop`.`product_evaluation`; 
CREATE TABLE `tmd_shop`.`product_evaluation` (
  `id_product` BIGINT(50) NOT NULL,
  `buyer_id` INT NOT NULL,
  `evaluation` tinyint(1) default NULL,
  PRIMARY KEY (`id_product`, `buyer_id`),
  INDEX `fk_productEvaluation_buyer_idx` (`buyer_id` ASC) VISIBLE,
  CONSTRAINT `fk_productEvaluation_product`
    FOREIGN KEY (`id_product`)
    REFERENCES `tmd_shop`.`product` (`id_product_article`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productEvaluation_buyer`
    FOREIGN KEY (`buyer_id`)
    REFERENCES `tmd_shop`.`buyer` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

INSERT INTO `tmd_shop`.`product_evaluation` (`id_product`, `buyer_id`, `evaluation`) VALUES ('560222983762121475', '1', '7');
INSERT INTO `tmd_shop`.`product_evaluation` (`id_product`, `buyer_id`, `evaluation`) VALUES ('348490240566723', '3', '10');
INSERT INTO `tmd_shop`.`product_evaluation` (`id_product`, `buyer_id`, `evaluation`) VALUES ('3543195644508893', '1', '5');
INSERT INTO `tmd_shop`.`product_evaluation` (`id_product`, `buyer_id`, `evaluation`) VALUES ('4017953472867', '7', '3');

DROP TABLE IF EXISTS `tmd_shop`.`order_product`; 
CREATE TABLE `tmd_shop`.`order_product` (
  `number_order` INT NOT NULL,
  `id_product` BIGINT(50) NOT NULL,
  PRIMARY KEY (`number_order`, `id_product`),
  INDEX `fk_orderProduct_product_idx` (`id_product` ASC) VISIBLE,
  CONSTRAINT `fk_orderProduct_product`
    FOREIGN KEY (`id_product`)
    REFERENCES `tmd_shop`.`product` (`id_product_article`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION);

INSERT INTO `tmd_shop`.`order_product` (`number_order`, `id_product`) VALUES ('1', '4017953472867');
INSERT INTO `tmd_shop`.`order_product` (`number_order`, `id_product`) VALUES ('2', '4041593939440');
INSERT INTO `tmd_shop`.`order_product` (`number_order`, `id_product`) VALUES ('3', '348490240566723');
INSERT INTO `tmd_shop`.`order_product` (`number_order`, `id_product`) VALUES ('4', '374288179638530');
INSERT INTO `tmd_shop`.`order_product` (`number_order`, `id_product`) VALUES ('5', '374622511608654');


DROP TABLE IF EXISTS `tmd_shop`.`order`;
CREATE TABLE `tmd_shop`.`order` (
  `id_order` INT NOT NULL AUTO_INCREMENT,
  `date_order` DATETIME NOT NULL,
  `status_order` VARCHAR(45) NOT NULL,
  `cost_order` DECIMAL(10) NOT NULL,
  `payment_method` VARCHAR(45) NOT NULL,
  `receiving_goods_methods` VARCHAR(45) NOT NULL,
  `login` INT NOT NULL,
  `Personnel_Number` INT NOT NULL,
  `point_of_delivery_name` INT NOT NULL,
  PRIMARY KEY (`id_order`, `Personnel_Number`, `point_of_delivery_name`, `login`));

insert into `tmd_shop`.`order` (id_order, date_order, status_order, cost_order, payment_method, receiving_goods_methods, login, Personnel_Number, point_of_delivery_name) values (1, '2020-08-26', false, '35061.34', 'jcb', 'AF', 1, 1, 1);
insert into `tmd_shop`.`order` (id_order, date_order, status_order, cost_order, payment_method, receiving_goods_methods, login, Personnel_Number, point_of_delivery_name) values (2, '2020-02-23', false, '48338.87', 'laser', 'IL', 2, 2, 2);
insert into `tmd_shop`.`order` (id_order, date_order, status_order, cost_order, payment_method, receiving_goods_methods, login, Personnel_Number, point_of_delivery_name) values (3, '2020-01-20', false, '93793.88', 'jcb', 'CN', 3, 3, 3);
insert into `tmd_shop`.`order` (id_order, date_order, status_order, cost_order, payment_method, receiving_goods_methods, login, Personnel_Number, point_of_delivery_name) values (4, '2020-02-21', true, '20260.50', 'jcb', 'CN', 4, 4, 4);
insert into `tmd_shop`.`order` (id_order, date_order, status_order, cost_order, payment_method, receiving_goods_methods, login, Personnel_Number, point_of_delivery_name) values (5, '2019-11-06', true, '79680.08', 'jcb', 'MN', 5, 5, 5);
insert into `tmd_shop`.`order` (id_order, date_order, status_order, cost_order, payment_method, receiving_goods_methods, login, Personnel_Number, point_of_delivery_name) values (6, '2020-07-09', true, '66295.66', 'americanexpress', 'PL', 6, 6, 6);
insert into `tmd_shop`.`order` (id_order, date_order, status_order, cost_order, payment_method, receiving_goods_methods, login, Personnel_Number, point_of_delivery_name) values (7, '2019-12-17', false, '39609.15', 'jcb', 'PH', 7, 7, 7);
insert into `tmd_shop`.`order` (id_order, date_order, status_order, cost_order, payment_method, receiving_goods_methods, login, Personnel_Number, point_of_delivery_name) values (8, '2020-08-05', true, '18687.37', 'americanexpress', 'PT', 8, 8, 8);
insert into `tmd_shop`.`order` (id_order, date_order, status_order, cost_order, payment_method, receiving_goods_methods, login, Personnel_Number, point_of_delivery_name) values (9, '2020-09-12', false, '48481.69', 'bankcard', 'LY', 9, 9, 9);
insert into `tmd_shop`.`order` (id_order, date_order, status_order, cost_order, payment_method, receiving_goods_methods, login, Personnel_Number, point_of_delivery_name) values (10, '2020-07-09', false, '81656.23', 'jcb', 'FI', 10, 10, 10);

ALTER TABLE `tmd_shop`.`order` 
ADD INDEX `fk_order_login_buyer_id_idx` (`login` ASC) VISIBLE;
;
ALTER TABLE `tmd_shop`.`order` 
ADD CONSTRAINT `fk_order_login_buyer_id`
  FOREIGN KEY (`login`)
  REFERENCES `tmd_shop`.`buyer` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
DROP TABLE IF EXISTS `tmd_shop`.`point_of_delivery`;
CREATE TABLE `tmd_shop`.`point_of_delivery` (
  `id_point_of_delivery` INT NOT NULL,
  `adress_point_of_deliverycol` VARCHAR(150) NOT NULL,
  `working_hours` VARCHAR(20),
  `driving_directions` BLOB NOT NULL,
  PRIMARY KEY (`id_point_of_delivery`));
  
insert into `tmd_shop`.`point_of_delivery` (id_point_of_delivery, adress_point_of_deliverycol, working_hours, driving_directions) values (1, '37 Ohio Terrace', '10:10 AM', 'http://dummyimage.com/228x216.jpg/cc0000/ffffff');
insert into `tmd_shop`.`point_of_delivery` (id_point_of_delivery, adress_point_of_deliverycol, working_hours, driving_directions) values (2, '615 Saint Paul Terrace', '8:26 PM', 'http://dummyimage.com/101x113.jpg/dddddd/000000');
insert into `tmd_shop`.`point_of_delivery` (id_point_of_delivery, adress_point_of_deliverycol, working_hours, driving_directions) values (3, '91828 Mallory Plaza', '5:17 PM', 'http://dummyimage.com/142x140.jpg/ff4444/ffffff');
insert into `tmd_shop`.`point_of_delivery` (id_point_of_delivery, adress_point_of_deliverycol, working_hours, driving_directions) values (4, '43933 Warrior Way', '2:16 AM', 'http://dummyimage.com/244x238.jpg/dddddd/000000');
insert into `tmd_shop`.`point_of_delivery` (id_point_of_delivery, adress_point_of_deliverycol, working_hours, driving_directions) values (5, '73 Scott Plaza', '9:57 AM', 'http://dummyimage.com/168x236.jpg/dddddd/000000');
insert into `tmd_shop`.`point_of_delivery` (id_point_of_delivery, adress_point_of_deliverycol, working_hours, driving_directions) values (6, '53 Blackbird Point', '11:31 AM', 'http://dummyimage.com/148x114.jpg/5fa2dd/ffffff');
insert into `tmd_shop`.`point_of_delivery` (id_point_of_delivery, adress_point_of_deliverycol, working_hours, driving_directions) values (7, '78 Bultman Trail', '1:37 AM', 'http://dummyimage.com/120x194.jpg/cc0000/ffffff');
insert into `tmd_shop`.`point_of_delivery` (id_point_of_delivery, adress_point_of_deliverycol, working_hours, driving_directions) values (8, '29651 Colorado Circle', '11:02 PM', 'http://dummyimage.com/216x203.jpg/dddddd/000000');
insert into `tmd_shop`.`point_of_delivery` (id_point_of_delivery, adress_point_of_deliverycol, working_hours, driving_directions) values (9, '45382 La Follette Circle', '1:35 PM', 'http://dummyimage.com/143x165.jpg/dddddd/000000');
insert into `tmd_shop`.`point_of_delivery` (id_point_of_delivery, adress_point_of_deliverycol, working_hours, driving_directions) values (10, '32795 Scofield Park', '7:06 AM', 'http://dummyimage.com/127x104.jpg/5fa2dd/ffffff');

ALTER TABLE `tmd_shop`.`order` 
ADD INDEX `fk_order_point_delivery_point_id_idx` (`point_of_delivery_name` ASC) VISIBLE;
;
ALTER TABLE `tmd_shop`.`order` 
ADD CONSTRAINT `fk_order_point_delivery_point_id`
  FOREIGN KEY (`point_of_delivery_name`)
  REFERENCES `tmd_shop`.`point_of_delivery` (`id_point_of_delivery`)
  ON DELETE CASCADE
  ON UPDATE NO ACTION;
  
DROP TABLE IF EXISTS `tmd_shop`.`point_of_delivery_phone`;
CREATE TABLE `tmd_shop`.`point_of_delivery_phone` (
  `id_point_of_delivery` INT NOT NULL,
  `point_delivery_phone` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_point_of_delivery`));

insert into `tmd_shop`.`point_of_delivery_phone` (id_point_of_delivery, point_delivery_phone) values (1, '354-530-8839');
insert into `tmd_shop`.`point_of_delivery_phone` (id_point_of_delivery, point_delivery_phone) values (2, '685-515-1580');
insert into `tmd_shop`.`point_of_delivery_phone` (id_point_of_delivery, point_delivery_phone) values (3, '699-452-2817');
insert into `tmd_shop`.`point_of_delivery_phone` (id_point_of_delivery, point_delivery_phone) values (4, '809-279-6452');
insert into `tmd_shop`.`point_of_delivery_phone` (id_point_of_delivery, point_delivery_phone) values (5, '624-855-6245');
insert into `tmd_shop`.`point_of_delivery_phone` (id_point_of_delivery, point_delivery_phone) values (6, '773-567-1054');
insert into `tmd_shop`.`point_of_delivery_phone` (id_point_of_delivery, point_delivery_phone) values (7, '274-607-1995');
insert into `tmd_shop`.`point_of_delivery_phone` (id_point_of_delivery, point_delivery_phone) values (8, '761-386-3855');
insert into `tmd_shop`.`point_of_delivery_phone` (id_point_of_delivery, point_delivery_phone) values (9, '713-689-0050');
insert into `tmd_shop`.`point_of_delivery_phone` (id_point_of_delivery, point_delivery_phone) values (10, '860-707-4145');

ALTER TABLE `tmd_shop`.`point_of_delivery` 
ADD CONSTRAINT `fk_point_of_del_point_del_phone`
  FOREIGN KEY (`id_point_of_delivery`)
  REFERENCES `tmd_shop`.`point_of_delivery_phone` (`id_point_of_delivery`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

DROP TABLE IF EXISTS `tmd_shop`.`delivery`;
CREATE TABLE `tmd_shop`.`delivery` (
  `id_order` INT NOT NULL AUTO_INCREMENT,
  `total_weight` INT NOT NULL,
  `total_volume` INT NOT NULL,
  `delivery_date` DATETIME NOT NULL,
  `cost_of_delivery` DECIMAL(10) NOT NULL,
  `Personnel_Number` INT NOT NULL,
  `delivery_status` VARCHAR(45) NOT NULL,
  `type_of_delivery` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_order`, `Personnel_Number`));
  
insert into `tmd_shop`.`delivery` (id_order, total_weight, total_volume, delivery_date, cost_of_delivery, Personnel_Number, delivery_status, type_of_delivery) values (1, 77, 44, '2020-07-06', '254.21', 1, true, 'Cooper');
insert into `tmd_shop`.`delivery` (id_order, total_weight, total_volume, delivery_date, cost_of_delivery, Personnel_Number, delivery_status, type_of_delivery) values (2, 86, 16, '2019-12-20', '107.91', 2, true, 'Esprit');
insert into `tmd_shop`.`delivery` (id_order, total_weight, total_volume, delivery_date, cost_of_delivery, Personnel_Number, delivery_status, type_of_delivery) values (3, 97, 59, '2019-12-28', '883.51', 3, false, '57');
insert into `tmd_shop`.`delivery` (id_order, total_weight, total_volume, delivery_date, cost_of_delivery, Personnel_Number, delivery_status, type_of_delivery) values (4, 57, 28, '2020-07-07', '372.96', 4, true, 'V70');
insert into `tmd_shop`.`delivery` (id_order, total_weight, total_volume, delivery_date, cost_of_delivery, Personnel_Number, delivery_status, type_of_delivery) values (5, 63, 67, '2020-09-26', '165.91', 5, true, 'Quantum');
insert into `tmd_shop`.`delivery` (id_order, total_weight, total_volume, delivery_date, cost_of_delivery, Personnel_Number, delivery_status, type_of_delivery) values (6, 8, 22, '2020-03-19', '423.40', 6, true, 'Tacoma');
insert into `tmd_shop`.`delivery` (id_order, total_weight, total_volume, delivery_date, cost_of_delivery, Personnel_Number, delivery_status, type_of_delivery) values (7, 41, 18, '2020-03-03', '341.97', 7, true, 'GT-R');
insert into `tmd_shop`.`delivery` (id_order, total_weight, total_volume, delivery_date, cost_of_delivery, Personnel_Number, delivery_status, type_of_delivery) values (8, 50, 6, '2019-12-09', '869.88', 8, true, 'Fit');
insert into `tmd_shop`.`delivery` (id_order, total_weight, total_volume, delivery_date, cost_of_delivery, Personnel_Number, delivery_status, type_of_delivery) values (9, 17, 78, '2019-11-21', '387.57', 9, false, 'Xterra');
insert into `tmd_shop`.`delivery` (id_order, total_weight, total_volume, delivery_date, cost_of_delivery, Personnel_Number, delivery_status, type_of_delivery) values (10, 39, 82, '2019-10-17', '356.74', 10, false, 'Cabriolet');

ALTER TABLE `tmd_shop`.`order` 
ADD CONSTRAINT `fk_order_delivery`
  FOREIGN KEY (`id_order`)
  REFERENCES `tmd_shop`.`delivery` (`id_order`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
  
