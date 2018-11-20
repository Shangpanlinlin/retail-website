/*
SQLyog v10.2
MySQL - 8.0.12 : Database - param
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`param` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `param`;

/*Table structure for table `tb_address` */

DROP TABLE IF EXISTS `tb_address`;

CREATE TABLE `tb_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) DEFAULT NULL COMMENT ' user ID',
  `province_id` varchar(10) DEFAULT NULL COMMENT 'area or province',
  `city_id` varchar(10) DEFAULT NULL COMMENT 'city',
  `town_id` varchar(10) DEFAULT NULL COMMENT 'town',
  `mobile` varchar(255) DEFAULT NULL COMMENT 'telephone',
  `address` varchar(255) DEFAULT NULL COMMENT 'address',
  `contact` varchar(255) DEFAULT NULL COMMENT 'contactor name',
  `is_default` varchar(1) DEFAULT NULL COMMENT 'is default 1-default 0-nondefault',
  `notes` varchar(255) DEFAULT NULL COMMENT 'other notice',
  `create_date` datetime DEFAULT NULL COMMENT 'create date',
  `alias` varchar(50) DEFAULT NULL COMMENT 'alias',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

/*Data for the table `tb_address`  some test usage data in development environment*/

insert  into `tb_address`(`id`,`user_id`,`province_id`,`city_id`,`town_id`,`mobile`,`address`,`contact`,`is_default`,`notes`,`create_date`,`alias`) values (59,'testUser1',NULL,NULL,NULL,'13900112222','1st Victoria Avenue','Joshua','0',NULL,NULL,NULL);
insert  into `tb_address`(`id`,`user_id`,`province_id`,`city_id`,`town_id`,`mobile`,`address`,`contact`,`is_default`,`notes`,`create_date`,`alias`) values (60,'testUser2',NULL,NULL,NULL,'13700221122','34 asscot avenue','Charlie','0',NULL,NULL,NULL);
insert  into `tb_address`(`id`,`user_id`,`province_id`,`city_id`,`town_id`,`mobile`,`address`,`contact`,`is_default`,`notes`,`create_date`,`alias`) values (61,'testUser3',NULL,NULL,NULL,'13301212233','6 brookland palace','Geogana','0',NULL,NULL,NULL);
insert  into `tb_address`(`id`,`user_id`,`province_id`,`city_id`,`town_id`,`mobile`,`address`,`contact`,`is_default`,`notes`,`create_date`,`alias`) values (62,'testUser4',NULL,NULL,NULL,NULL,'1 broadway road','Katrina','1',NULL,NULL,NULL);
insert  into `tb_address`(`id`,`user_id`,`province_id`,`city_id`,`town_id`,`mobile`,`address`,`contact`,`is_default`,`notes`,`create_date`,`alias`) values (63,'testUser5',NULL,NULL,NULL,'11011011','4 st vincent avenue','Jack',NULL,NULL,NULL,'family address');
insert  into `tb_address`(`id`,`user_id`,`province_id`,`city_id`,`town_id`,`mobile`,`address`,`contact`,`is_default`,`notes`,`create_date`,`alias`) values (64,'testUser6',NULL,NULL,NULL,'999111','3 remuera rd','Max','1',NULL,NULL,'office address');

/*Table structure for table `tb_areas` */

DROP TABLE IF EXISTS `tb_areas`;

/*Table structure for table `tb_brand` this part data will fetch from offical web that will have the info of all areas of NewZealand*/
CREATE TABLE `tb_areas` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'unique ID',
  `areaid` varchar(20) NOT NULL COMMENT 'area ID',
  `area` varchar(50) NOT NULL COMMENT 'area name',
  `cityid` varchar(20) NOT NULL COMMENT 'city ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3145 DEFAULT CHARSET=utf8 COMMENT='the offical area table';




/*Table structure for table `tb_provinces` */

DROP TABLE IF EXISTS `tb_provinces`;

CREATE TABLE `tb_provinces` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'unque ID',
  `provinceid` varchar(20) NOT NULL COMMENT 'province ID',
  `province` varchar(50) NOT NULL COMMENT 'province Name',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='province information';


/*Table structure for table `tb_brand` */

DROP TABLE IF EXISTS `tb_brand`;

CREATE TABLE `tb_brand` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT 'brand name',
  `first_char` varchar(1) DEFAULT NULL COMMENT 'first letter',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `tb_brand` init some test data */
insert  into `tb_brand`(`id`,`name`,`first_char`) values (10,'VIVO','V');
insert  into `tb_brand`(`id`,`name`,`first_char`) values (22,'LG','L');

/*Table structure for table `tb_cities` */
DROP TABLE IF EXISTS `tb_cities`;

CREATE TABLE `tb_cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'uniqueID',
  `cityid` varchar(20) NOT NULL COMMENT 'cityID',
  `city` varchar(50) NOT NULL COMMENT 'cityName',
  `provinceid` varchar(20) NOT NULL COMMENT 'area or province ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=346 DEFAULT CHARSET=utf8 COMMENT='city information';


/*Data for the table will be fetch from offical web that contain the information of city */

/*Table structure for table `tb_content` this table is the content of advertisement */

DROP TABLE IF EXISTS `tb_content`;

CREATE TABLE `tb_content` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) NOT NULL COMMENT ' contentID',
  `title` varchar(200) DEFAULT NULL COMMENT 'content title ',
  `url` varchar(500) DEFAULT NULL COMMENT 'content link',
  `pic` varchar(300) DEFAULT NULL COMMENT 'absolute path of image',
  `status` varchar(1) DEFAULT NULL COMMENT 'status',
  `sort_order` int(11) DEFAULT NULL COMMENT 'order',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `tb_content` insert come test */

insert  into `tb_content`(`id`,`category_id`,`title`,`url`,`pic`,`status`,`sort_order`) values (5,1,'test advertisement','http://www.baidu.com','http://192.168.25.133/group1/M00/00/00/wKgZhVnIhVqAAa0jAActhhatATY291.png','1',3);
insert  into `tb_content`(`id`,`category_id`,`title`,`url`,`pic`,`status`,`sort_order`) values (8,1,'this is an advertisement','http://www.baidu.com','http://192.168.25.133/group1/M00/00/00/wKgZhVnJrmSAc6LvAAJLX6bBPuo913.jpg','1',10);
insert  into `tb_content`(`id`,`category_id`,`title`,`url`,`pic`,`status`,`sort_order`) values (9,1,'1 dollar mooncake','http://www.163.com','http://192.168.25.133/group1/M00/00/00/wKgZhVnJ1pyAFbWqAAFyVK2N7Ig973.jpg','1',6);

/*Table structure for table `tb_content_category`  this is advertisement content category,*/

DROP TABLE IF EXISTS `tb_content_category`;

CREATE TABLE `tb_content_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'category ID',
  `name` varchar(50) DEFAULT NULL COMMENT 'category Name',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='content category';

/*Data for the table `tb_content_category` */
insert  into `tb_content_category`(`id`,`name`) values (1,'front page rolling');
insert  into `tb_content_category`(`id`,`name`) values (2,'today recommond');
insert  into `tb_content_category`(`id`,`name`) values (3,'activities area');
insert  into `tb_content_category`(`id`,`name`) values (4,'guess you like');
insert  into `tb_content_category`(`id`,`name`) values (5,'new arrival adv');


/*Table structure for table `tb_goods` this will save products.  SPU table*/

CREATE TABLE `tb_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `name` varchar(100) NOT NULL COMMENT 'product name',
  `SKU` bigint(20) NOT NULL COMMENT 'SKU',
  `audit_status` varchar(2) NOT NULL COMMENT 'audit status',
  `is_marketable` varchar(1) NOT NULL COMMENT 'if this item will be put on web for sale, 1-put on web 0-not put on web',
  `brand_id` bigint(10) NOT NULL COMMENT 'brand',
  `barcode` varchar(20) DEFAULT NULL,
  `in_stock` varchar(1) NOT NULL,
  `caption` varchar(100) DEFAULT NULL COMMENT 'sub-title',
  `category1_id` bigint(20) NOT NULL COMMENT 'first level category',
  `category2_id` bigint(10) DEFAULT NULL COMMENT 'second level category',
  `category3_id` bigint(10) DEFAULT NULL COMMENT 'third level category',
  `image` varchar(150) NOT NULL COMMENT 'image',
  `pack_size` varchar(10) DEFAULT NULL COMMENT '',
  `discounted_price` decimal(10,2) NOT NULL COMMENT '',
  `save_percent` decimal(10,2) DEFAULT NULL COMMENT '',
  `retail_price` decimal(10,2) DEFAULT NULL COMMENT 'retail price',
  `type_template_id` bigint(20) DEFAULT NULL COMMENT 'category template ID',
  `is_enable_spec` varchar(1) DEFAULT NULL COMMENT 'if this item use the specification template. 1-will use 0-do not use',
  `is_delete` varchar(1) DEFAULT NULL COMMENT 'is deleted, this is logical delete tag, we do not really remove item from table',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=149187842867962 DEFAULT CHARSET=utf8;

/*Data for the table `tb_goods` */


DROP TABLE IF EXISTS `tb_goods_desc`;

CREATE TABLE `tb_goods_desc` (
  `goods_id` bigint(20) NOT NULL COMMENT 'the id in tb_goods',
  `introduction` varchar(3000) DEFAULT NULL COMMENT 'description',
  `specification_items` varchar(3000) DEFAULT NULL COMMENT 'specification set, all the specifation of item contain isSelected',
  `custom_attribute_items` varchar(3000) DEFAULT NULL COMMENT 'customize the attributes',
  `item_images` varchar(3000) DEFAULT NULL,
  `package_list` varchar(3000) DEFAULT NULL COMMENT 'package list',
  `sale_service` varchar(3000) DEFAULT NULL COMMENT 'after sales',
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tb_item`  SKU information*/

DROP TABLE IF EXISTS `tb_item`;

CREATE TABLE `tb_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品id，同时也是商品编号',
  `title` varchar(100) NOT NULL COMMENT '商品标题',
  `sell_point` varchar(500) DEFAULT NULL COMMENT '商品卖点',
  `price` decimal(20,2) NOT NULL COMMENT '商品价格，单位为：元',
  `stock_count` int(10) DEFAULT NULL,
  `num` int(10) NOT NULL COMMENT '库存数量',
  `barcode` varchar(30) DEFAULT NULL COMMENT '商品条形码',
  `image` varchar(2000) DEFAULT NULL COMMENT '商品图片',
  `categoryId` bigint(10) NOT NULL COMMENT '所属类目，叶子类目',
  `status` varchar(1) NOT NULL COMMENT '商品状态，1-正常，2-下架，3-删除',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `item_sn` varchar(30) DEFAULT NULL,
  `cost_pirce` decimal(10,2) DEFAULT NULL,
  `market_price` decimal(10,2) DEFAULT NULL,
  `is_default` varchar(1) DEFAULT NULL,
  `goods_id` bigint(20) DEFAULT NULL,
  `seller_id` varchar(30) DEFAULT NULL,
  `cart_thumbnail` varchar(150) DEFAULT NULL,
  `category` varchar(200) DEFAULT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `spec` varchar(200) DEFAULT NULL,
  `seller` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cid` (`categoryId`),
  KEY `status` (`status`),
  KEY `updated` (`update_time`)
) ENGINE=InnoDB AUTO_INCREMENT=1369284 DEFAULT CHARSET=utf8 COMMENT='product';


/*Table structure for table `tb_item_cat` */

DROP TABLE IF EXISTS `tb_item_cat`;

CREATE TABLE `tb_item_cat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'category ID',
  `parent_id` bigint(20) DEFAULT NULL COMMENT 'parent ID, if parent ID = 0, indicate this is a parent category',
  `name` varchar(50) DEFAULT NULL COMMENT 'category name',
  `type_id` bigint(11) DEFAULT NULL COMMENT 'category id',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1205 DEFAULT CHARSET=utf8 COMMENT='category';



/*Table structure for table `tb_order`  use chinese as comment for read convinience*/

DROP TABLE IF EXISTS `tb_order`;

CREATE TABLE `tb_order` (
  `order_id` bigint(20) NOT NULL COMMENT '订单id',
  `payment` decimal(20,2) DEFAULT NULL COMMENT '实付金额。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `payment_type` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '支付类型，1、在线支付，2、货到付款',
  `post_fee` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '邮费。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `status` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '状态：1、未付款，2、已付款，3、未发货，4、已发货，5、交易成功，6、交易关闭,7、待评价',
  `create_time` datetime DEFAULT NULL COMMENT '订单创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '订单更新时间',
  `payment_time` datetime DEFAULT NULL COMMENT '付款时间',
  `consign_time` datetime DEFAULT NULL COMMENT '发货时间',
  `end_time` datetime DEFAULT NULL COMMENT '交易完成时间',
  `close_time` datetime DEFAULT NULL COMMENT '交易关闭时间',
  `shipping_name` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '物流名称',
  `shipping_code` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '物流单号',
  `user_id` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '用户id',
  `buyer_message` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '买家留言',
  `buyer_nick` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '买家昵称',
  `buyer_rate` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '买家是否已经评价',
  `receiver_area_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人地区名称(省，市，县)街道',
  `receiver_mobile` varchar(12) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人手机',
  `receiver_zip_code` varchar(15) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人邮编',
  `receiver` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '收货人',
  `expire` datetime DEFAULT NULL COMMENT '过期时间，定期清理',
  `invoice_type` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '发票类型(普通发票，电子发票，增值税发票)',
  `source_type` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '订单来源：1:app端，2：pc端，3：M端，4：微信端，5：手机qq端',
  `seller_id` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '商家ID',
  PRIMARY KEY (`order_id`),
  KEY `create_time` (`create_time`),
  KEY `buyer_nick` (`buyer_nick`),
  KEY `status` (`status`),
  KEY `payment_type` (`payment_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tb_order_item` use chinese as comment for read convinience*/

DROP TABLE IF EXISTS `tb_order_item`;

CREATE TABLE `tb_order_item` (
  `id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL COMMENT '商品id',
  `goods_id` bigint(20) DEFAULT NULL COMMENT 'SPU_ID',
  `order_id` bigint(20) NOT NULL COMMENT '订单id',
  `title` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商品标题',
  `price` decimal(20,2) DEFAULT NULL COMMENT '商品单价',
  `num` int(10) DEFAULT NULL COMMENT '商品购买数量',
  `total_fee` decimal(20,2) DEFAULT NULL COMMENT '商品总金额',
  `pic_path` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商品图片地址',
  `seller_id` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Table structure for table `tb_pay_log` */

DROP TABLE IF EXISTS `tb_pay_log`;

CREATE TABLE `tb_pay_log` (
  `out_trade_no` varchar(30) NOT NULL COMMENT 'payment trade number',
  `create_time` datetime DEFAULT NULL COMMENT 'create time',
  `pay_time` datetime DEFAULT NULL COMMENT 'finish time',
  `total_fee` bigint(20) DEFAULT NULL COMMENT 'amount the precise is cent',
  `user_id` varchar(50) DEFAULT NULL COMMENT 'user ID',
  `transaction_id` varchar(30) DEFAULT NULL COMMENT 'transaction number',
  `trade_state` varchar(1) DEFAULT NULL COMMENT 'transaction status',
  `order_list` varchar(200) DEFAULT NULL COMMENT 'orders list, ',
  `pay_type` varchar(1) DEFAULT NULL COMMENT 'pay type, credit/cheque/debit/wechat/alipay',
  PRIMARY KEY (`out_trade_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table, using chinese comment for reading convinience.  `tb_seckill_goods` 秒杀表*/

DROP TABLE IF EXISTS `tb_seckill_goods`;

CREATE TABLE `tb_seckill_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(20) DEFAULT NULL COMMENT 'spu ID',
  `item_id` bigint(20) DEFAULT NULL COMMENT 'sku ID',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `small_pic` varchar(150) DEFAULT NULL COMMENT '商品图片',
  `price` decimal(10,2) DEFAULT NULL COMMENT '原价格',
  `cost_price` decimal(10,2) DEFAULT NULL COMMENT '秒杀价格',
  `seller_id` varchar(100) DEFAULT NULL COMMENT '商家ID',
  `create_time` datetime DEFAULT NULL COMMENT '添加日期',
  `check_time` datetime DEFAULT NULL COMMENT '审核日期',
  `status` varchar(1) DEFAULT NULL COMMENT '审核状态',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `num` int(11) DEFAULT NULL COMMENT '秒杀商品数',
  `stock_count` int(11) DEFAULT NULL COMMENT '剩余库存数',
  `introduction` varchar(2000) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Table structure for table `tb_seckill_order` using chinese comment for reading convinience.*/

DROP TABLE IF EXISTS `tb_seckill_order`;

CREATE TABLE `tb_seckill_order` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `seckill_id` bigint(20) DEFAULT NULL COMMENT '秒杀商品ID',
  `money` decimal(10,2) DEFAULT NULL COMMENT '支付金额',
  `user_id` varchar(50) DEFAULT NULL COMMENT '用户',
  `seller_id` varchar(50) DEFAULT NULL COMMENT '商家',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `status` varchar(1) DEFAULT NULL COMMENT '状态',
  `receiver_address` varchar(200) DEFAULT NULL COMMENT '收货人地址',
  `receiver_mobile` varchar(20) DEFAULT NULL COMMENT '收货人电话',
  `receiver` varchar(20) DEFAULT NULL COMMENT '收货人',
  `transaction_id` varchar(30) DEFAULT NULL COMMENT '交易流水',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `tb_specification` */

DROP TABLE IF EXISTS `tb_specification`;

CREATE TABLE `tb_specification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `spec_name` varchar(255) DEFAULT NULL COMMENT 'name',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

/*Data for the table `tb_specification` this is just part of example*/

insert  into `tb_specification`(`id`,`spec_name`) values (26,'Item Weight');
insert  into `tb_specification`(`id`,`spec_name`) values (27,'Net type');
insert  into `tb_specification`(`id`,`spec_name`) values (28,'Screen Size');
insert  into `tb_specification`(`id`,`spec_name`) values (32,'Product Dimensions');
insert  into `tb_specification`(`id`,`spec_name`) values (33,'Hardcover');

/*Table structure for table `tb_specification_option` , this table is used to save the values for all the specification*/

DROP TABLE IF EXISTS `tb_specification_option`;

CREATE TABLE `tb_specification_option` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'option ID',
  `option_name` varchar(200) DEFAULT NULL COMMENT 'option value',
  `spec_id` bigint(30) DEFAULT NULL COMMENT 'specification ID',
  `orders` int(11) DEFAULT NULL COMMENT 'order',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8;

/*Data for the table `tb_specification_option` */

insert  into `tb_specification_option`(`id`,`option_name`,`spec_id`,`orders`) values (91,'12kg',26,1);
insert  into `tb_specification_option`(`id`,`option_name`,`spec_id`,`orders`) values (92,'8kg',26,2);
insert  into `tb_specification_option`(`id`,`option_name`,`spec_id`,`orders`) values (93,'3kg',26,3);
insert  into `tb_specification_option`(`id`,`option_name`,`spec_id`,`orders`) values (97,'10kg',26,4);
insert  into `tb_specification_option`(`id`,`option_name`,`spec_id`,`orders`) values (98,'vodafone 3G',27,1);
insert  into `tb_specification_option`(`id`,`option_name`,`spec_id`,`orders`) values (99,'vodafone 4G',27,2);
insert  into `tb_specification_option`(`id`,`option_name`,`spec_id`,`orders`) values (108,'4.5 inch',28,1);
insert  into `tb_specification_option`(`id`,`option_name`,`spec_id`,`orders`) values (109,'5 inch',28,2);
insert  into `tb_specification_option`(`id`,`option_name`,`spec_id`,`orders`) values (110,'5.5 inch',28,3);
insert  into `tb_specification_option`(`id`,`option_name`,`spec_id`,`orders`) values (111,'6 inch',28,4);
insert  into `tb_specification_option`(`id`,`option_name`,`spec_id`,`orders`) values (118,'16.2 x 3.9 x 24 cm ',32,1);
insert  into `tb_specification_option`(`id`,`option_name`,`spec_id`,`orders`) values (119,'10.2 x 3.9 x 24 cm ',32,2);
insert  into `tb_specification_option`(`id`,`option_name`,`spec_id`,`orders`) values (120,'16.2 x 8 x 24 cm ',32,3);
insert  into `tb_specification_option`(`id`,`option_name`,`spec_id`,`orders`) values (122,'448 pages',33,1);

/*Table structure for table `tb_type_template`,for different product, some belong different type like makeup, book ...,
different type have different specification and brand, the link between type and specification and brand will save in this table*/

DROP TABLE IF EXISTS `tb_type_template`;

CREATE TABLE `tb_type_template` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL COMMENT 'tempalte name',
  `spec_ids` varchar(1000) DEFAULT NULL COMMENT 'all the ids of specification',
  `brand_ids` varchar(1000) DEFAULT NULL COMMENT 'all the brands ',
  `custom_attribute_items` varchar(2000) DEFAULT NULL COMMENT 'customize attribute',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

/*Data for the table `tb_type_template`,  below is example of the data in Chinsese in this table might be. not actually data, just for example*/

insert  into `tb_type_template`(`id`,`name`,`spec_ids`,`brand_ids`,`custom_attribute_items`) values (35,'手机','[{\"id\":27,\"text\":\"网络\"},{\"id\":32,\"text\":\"机身内存\"}]','[{\"id\":1,\"text\":\"联想\"},{\"id\":3,\"text\":\"三星\"},{\"id\":2,\"text\":\"华为\"},{\"id\":5,\"text\":\"OPPO\"},{\"id\":4,\"text\":\"小米\"},{\"id\":9,\"text\":\"苹果\"},{\"id\":8,\"text\":\"魅族\"},{\"id\":6,\"text\":\"360\"},{\"id\":10,\"text\":\"VIVO\"},{\"id\":11,\"text\":\"诺基亚\"},{\"id\":12,\"text\":\"锤子\"}]','[{\"text\":\"内存大小\"},{\"text\":\"颜色\"}]');
insert  into `tb_type_template`(`id`,`name`,`spec_ids`,`brand_ids`,`custom_attribute_items`) values (37,'电视','[{\"id\":33,\"text\":\"电视屏幕尺寸\"}]','[{\"id\":16,\"text\":\"TCL\"},{\"id\":13,\"text\":\"长虹\"},{\"id\":14,\"text\":\"海尔\"},{\"id\":19,\"text\":\"创维\"},{\"id\":21,\"text\":\"康佳\"},{\"id\":18,\"text\":\"夏普\"},{\"id\":17,\"text\":\"海信\"},{\"id\":20,\"text\":\"东芝\"},{\"id\":15,\"text\":\"飞利浦\"},{\"id\":22,\"text\":\"LG\"}]','[]');

/*Table structure for table `tb_user`, comment in chinese for reading convinience */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码，加密存储',
  `phone` varchar(20) DEFAULT NULL COMMENT '注册手机号',
  `email` varchar(50) DEFAULT NULL COMMENT '注册邮箱',
  `created` datetime NOT NULL COMMENT '创建时间',
  `updated` datetime NOT NULL,
  `source_type` varchar(1) DEFAULT NULL COMMENT '会员来源：1:PC，2：H5，3：Android，4：IOS，5：WeChat',
  `nick_name` varchar(50) DEFAULT NULL COMMENT '昵称',
  `name` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `status` varchar(1) DEFAULT NULL COMMENT '使用状态（Y正常 N非正常）',
  `head_pic` varchar(150) DEFAULT NULL COMMENT '头像地址',
  `qq` varchar(20) DEFAULT NULL COMMENT 'QQ号码',
  `account_balance` decimal(10,0) DEFAULT NULL COMMENT '账户余额',
  `is_mobile_check` varchar(1) DEFAULT '0' COMMENT '手机是否验证 （0否  1是）',
  `is_email_check` varchar(1) DEFAULT '0' COMMENT '邮箱是否检测（0否  1是）',
  `gender` varchar(1) DEFAULT '0' COMMENT '性别，1男，2女',
  `user_level` int(11) DEFAULT NULL COMMENT '会员等级',
  `points` int(11) DEFAULT NULL COMMENT '积分',
  `experience_value` int(11) DEFAULT NULL COMMENT '经验值',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='用户表';


