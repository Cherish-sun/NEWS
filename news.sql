-- --------------------------------------------------------
-- 主机:                           192.168.31.140
-- Server version:               5.7.26-0ubuntu0.16.04.1-log - (Ubuntu)
-- Server OS:                    Linux
-- HeidiSQL 版本:                  10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for news
CREATE DATABASE IF NOT EXISTS `news` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `news`;

-- Dumping structure for table news.article_ad
CREATE TABLE IF NOT EXISTS `article_ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `pic` varchar(100) NOT NULL,
  `adurl` varchar(200) NOT NULL,
  `adlocation` varchar(2) NOT NULL,
  `status` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table news.article_ad: ~3 rows (approximately)
DELETE FROM `article_ad`;
/*!40000 ALTER TABLE `article_ad` DISABLE KEYS */;
INSERT INTO `article_ad` (`id`, `title`, `pic`, `adurl`, `adlocation`, `status`) VALUES
	(3, 'python', 'uploads/3_DcYcHQR.jpg', 'https://www.jianshu.com/p/3914a05458d9', 'a3', '3'),
	(4, '人工智能', 'uploads/0_5bxvnlz.jpg', 'https://www.jianshu.com/p/3914a05458d9', 'a2', '2'),
	(5, '机器学习', 'uploads/00_D4ayYu8.jpg', 'https://www.jianshu.com/p/3914a05458d9', 'a1', '1');
/*!40000 ALTER TABLE `article_ad` ENABLE KEYS */;

-- Dumping structure for table news.article_article
CREATE TABLE IF NOT EXISTS `article_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `content` longtext NOT NULL,
  `status` varchar(2) NOT NULL,
  `publish_date` datetime(6) NOT NULL,
  `expiration_date` datetime(6) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `pic` varchar(100) NOT NULL,
  `praise_num` int(11) NOT NULL,
  `read_num` int(11) NOT NULL,
  `fav_num` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article_article_slug_b5fb1cdb` (`slug`),
  KEY `article_article_item_id_985845bc_fk_article_item_id` (`item_id`),
  KEY `article_article_author_id_e6b479f8_fk` (`author_id`),
  CONSTRAINT `article_article_author_id_e6b479f8_fk` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `article_article_item_id_985845bc_fk_article_item_id` FOREIGN KEY (`item_id`) REFERENCES `article_item` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table news.article_article: ~1 rows (approximately)
DELETE FROM `article_article`;
/*!40000 ALTER TABLE `article_article` DISABLE KEYS */;
INSERT INTO `article_article` (`id`, `title`, `slug`, `content`, `status`, `publish_date`, `expiration_date`, `is_active`, `pic`, `praise_num`, `read_num`, `fav_num`, `author_id`, `item_id`) VALUES
	(1, '人工智能', 'AI', '<p><a target="_blank" href="https://baike.baidu.com/item/%E4%BA%BA%E5%B7%A5%E6%99%BA%E8%83%BD/9180" data-lemmaid="9180" style="color: rgb(19, 110, 194); text-decoration-line: none;">人工智能</a>（Artificial Intelligence），<a target="_blank" href="https://baike.baidu.com/item/%E8%8B%B1%E6%96%87/3079091" data-lemmaid="3079091" style="color: rgb(19, 110, 194); text-decoration-line: none;">英文</a>缩写为AI。它是<a target="_blank" href="https://baike.baidu.com/item/%E7%A0%94%E7%A9%B6/1883844" data-lemmaid="1883844" style="color: rgb(19, 110, 194); text-decoration-line: none;">研究</a>、<a target="_blank" href="https://baike.baidu.com/item/%E5%BC%80%E5%8F%91/9400971" data-lemmaid="9400971" style="color: rgb(19, 110, 194); text-decoration-line: none;">开发</a>用于<a target="_blank" href="https://baike.baidu.com/item/%E6%A8%A1%E6%8B%9F/7698898" data-lemmaid="7698898" style="color: rgb(19, 110, 194); text-decoration-line: none;">模拟</a>、<a target="_blank" href="https://baike.baidu.com/item/%E5%BB%B6%E4%BC%B8/7834264" data-lemmaid="7834264" style="color: rgb(19, 110, 194); text-decoration-line: none;">延伸</a>和扩展人的<a target="_blank" href="https://baike.baidu.com/item/%E6%99%BA%E8%83%BD/66637" data-lemmaid="66637" style="color: rgb(19, 110, 194); text-decoration-line: none;">智能</a>的理论、方法、技术及应用系统的一门新的技术科学。</p><p>人工智能是<a target="_blank" href="https://baike.baidu.com/item/%E8%AE%A1%E7%AE%97%E6%9C%BA" style="color: rgb(19, 110, 194); text-decoration-line: none;">计算机</a>科学的一个分支，它企图了解智能的实质，并生产出一种新的能以<a target="_blank" href="https://baike.baidu.com/item/%E4%BA%BA%E7%B1%BB%E6%99%BA%E8%83%BD/2287229" data-lemmaid="2287229" style="color: rgb(19, 110, 194); text-decoration-line: none;">人类智能</a>相似的方式做出反应的智能机器，该领域的研究包括机器人、语言识别、图像识别、自然语言处理和<a target="_blank" href="https://baike.baidu.com/item/%E4%B8%93%E5%AE%B6%E7%B3%BB%E7%BB%9F/267819" data-lemmaid="267819" style="color: rgb(19, 110, 194); text-decoration-line: none;">专家系统</a>等。人工智能从诞生以来，理论和技术日益成熟，应用领域也不断扩大，可以设想，未来人工智能带来的科技产品，将会是人类<a target="_blank" href="https://baike.baidu.com/item/%E6%99%BA%E6%85%A7/129438" data-lemmaid="129438" style="color: rgb(19, 110, 194); text-decoration-line: none;">智慧</a>的“容器”。人工智能可以对人的意识、思维的信息过程的模拟。人工智能不是人的智能，但能像人那样思考、也可能超过人的智能。</p><p><a target="_blank" href="https://baike.baidu.com/item/%E4%BA%BA%E5%B7%A5%E6%99%BA%E8%83%BD/9180" data-lemmaid="9180" style="color: rgb(19, 110, 194); text-decoration-line: none;">人工智能</a>是一门极富挑战性的科学，从事这项工作的人必须懂得计算机知识，心理学和哲学。人工智能是包括十分广泛的科学，它由不同的领域组成，如机器学习，计算机视觉等等，总的说来，人工智能研究的一个主要目标是使机器能够胜任一些通常需要人类智能才能完成的复杂工作。但不同的时代、不同的人对这种“复杂工作”的理解是不同的。<span class="sup--normal" data-sup="1" data-ctrmap=":1," style="font-size: 12px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em; margin-left: 2px; color: rgb(51, 102, 204); cursor: pointer; padding: 0px 2px;">&nbsp;[1]</span><a style="color: rgb(19, 110, 194); position: relative; top: -50px; font-size: 0px; line-height: 0;" name="ref_[1]_5816869"></a>&nbsp;&nbsp;2017年12月，人工智能入选“2017年度中国媒体十大流行语”。</p><p><br/></p>', '2', '2019-03-04 11:21:00.000000', NULL, 1, 'uploads/django01.jpg', 0, 7, 0, 1, 9),
	(2, 'python基础', '33333', '<h4 style="box-sizing: border-box; font-family: -apple-system, &quot;SF UI Text&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; line-height: 1.7; color: rgb(47, 47, 47); margin: 0px 0px 15px; font-size: 20px; text-rendering: optimizelegibility; white-space: normal; background-color: rgb(255, 255, 255);">一、<em style="box-sizing: border-box;">arg,</em>*kwarg这两个参数什么意思？我们为什么要使用它们？</h4><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 25px; color: rgb(47, 47, 47); font-family: -apple-system, &quot;SF UI Text&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); word-break: break-word !important;">1、解决参数个数的不确定性。<br style="box-sizing: border-box;"/>2、<em style="box-sizing: border-box;">arg返回的是一个元组，可以传入多个值，类型可以是字符串、列表、字典、数字或者不传。<br style="box-sizing: border-box;"/>3、</em>*kwarg返回的是一个字典，可以传入多个值，传入的值必须是数值（比如：a = 1）,也可以不传。</p><h4 style="box-sizing: border-box; font-family: -apple-system, &quot;SF UI Text&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; line-height: 1.7; color: rgb(47, 47, 47); margin: 0px 0px 15px; font-size: 20px; text-rendering: optimizelegibility; white-space: normal; background-color: rgb(255, 255, 255);">二、谈一谈Python装饰器</h4><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 25px; color: rgb(47, 47, 47); font-family: -apple-system, &quot;SF UI Text&quot;, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); word-break: break-word !important;">装饰器本质上是一个Python函数，它可以让其它函数在不作任何变动的情况下增加额外功能，装饰器的返回值也是一个函数对象。它经常用的场景，比如：插入日志、性能测试、事务处理、缓存、权限校验等。有了装饰器我们就可以对于具有相同函数功能代码进行重用。</p><p><br/></p>', '2', '2019-03-04 13:14:00.000000', NULL, 1, 'uploads/12_fxbtEFv.jpg', 0, 14, 0, 1, 1),
	(5, '机器学习', 'big', '<p>fghfghfghfghgfhgfhfg</p>', '2', '2019-03-21 09:47:00.000000', NULL, 1, 'uploads/djangoblog.jpg', 0, 2, 0, 5, 2);
/*!40000 ALTER TABLE `article_article` ENABLE KEYS */;

-- Dumping structure for table news.article_article_tags
CREATE TABLE IF NOT EXISTS `article_article_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_article_tags_article_id_tag_id_d45ad9d9_uniq` (`article_id`,`tag_id`),
  KEY `article_article_tags_tag_id_61af53b5_fk_article_tag_id` (`tag_id`),
  CONSTRAINT `article_article_tags_article_id_85c8d0ac_fk_article_article_id` FOREIGN KEY (`article_id`) REFERENCES `article_article` (`id`),
  CONSTRAINT `article_article_tags_tag_id_61af53b5_fk_article_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `article_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table news.article_article_tags: ~2 rows (approximately)
DELETE FROM `article_article_tags`;
/*!40000 ALTER TABLE `article_article_tags` DISABLE KEYS */;
INSERT INTO `article_article_tags` (`id`, `article_id`, `tag_id`) VALUES
	(1, 1, 2),
	(2, 2, 4),
	(4, 5, 2);
/*!40000 ALTER TABLE `article_article_tags` ENABLE KEYS */;

-- Dumping structure for table news.article_category
CREATE TABLE IF NOT EXISTS `article_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table news.article_category: ~2 rows (approximately)
DELETE FROM `article_category`;
/*!40000 ALTER TABLE `article_category` DISABLE KEYS */;
INSERT INTO `article_category` (`id`, `title`) VALUES
	(3, '人工智能'),
	(5, '开发');
/*!40000 ALTER TABLE `article_category` ENABLE KEYS */;

-- Dumping structure for table news.article_item
CREATE TABLE IF NOT EXISTS `article_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `completed` tinyint(1) NOT NULL,
  `categorys_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article_item_categorys_id_d8a97ee8_fk_article_category_id` (`categorys_id`),
  CONSTRAINT `article_item_categorys_id_d8a97ee8_fk_article_category_id` FOREIGN KEY (`categorys_id`) REFERENCES `article_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Dumping data for table news.article_item: ~5 rows (approximately)
DELETE FROM `article_item`;
/*!40000 ALTER TABLE `article_item` DISABLE KEYS */;
INSERT INTO `article_item` (`id`, `title`, `created_date`, `completed`, `categorys_id`) VALUES
	(1, 'python', '2019-03-01 17:50:00.000000', 0, 5),
	(2, '人脸识别', '2019-03-01 17:50:00.000000', 0, 3),
	(8, 'JAVA开发', '2019-03-01 17:52:00.000000', 0, 5),
	(9, '机器人', '2019-03-01 17:52:00.000000', 0, 3),
	(12, '前端开发', '2019-03-01 17:55:00.000000', 0, 5);
/*!40000 ALTER TABLE `article_item` ENABLE KEYS */;

-- Dumping structure for table news.article_tag
CREATE TABLE IF NOT EXISTS `article_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article_tag_slug_93468cb1` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table news.article_tag: ~4 rows (approximately)
DELETE FROM `article_tag`;
/*!40000 ALTER TABLE `article_tag` DISABLE KEYS */;
INSERT INTO `article_tag` (`id`, `name`, `slug`) VALUES
	(1, '人工智能', 'AI'),
	(2, '人工智能', 'bigdata'),
	(3, 'good test', 'good test'),
	(4, 'python', 'python');
/*!40000 ALTER TABLE `article_tag` ENABLE KEYS */;

-- Dumping structure for table news.article_userfav
CREATE TABLE IF NOT EXISTS `article_userfav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `articles_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_userfav_user_id_articles_id_722a4e77_uniq` (`user_id`,`articles_id`),
  KEY `article_userfav_articles_id_a6a3b062_fk_article_article_id` (`articles_id`),
  CONSTRAINT `article_userfav_articles_id_a6a3b062_fk_article_article_id` FOREIGN KEY (`articles_id`) REFERENCES `article_article` (`id`),
  CONSTRAINT `article_userfav_user_id_025431dc_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table news.article_userfav: ~2 rows (approximately)
DELETE FROM `article_userfav`;
/*!40000 ALTER TABLE `article_userfav` DISABLE KEYS */;
INSERT INTO `article_userfav` (`id`, `add_time`, `articles_id`, `user_id`) VALUES
	(1, '2019-03-04 17:40:29.991391', 2, 1),
	(2, '2019-03-04 17:40:59.270379', 1, 1),
	(3, '2019-03-21 17:56:12.741617', 5, 5);
/*!40000 ALTER TABLE `article_userfav` ENABLE KEYS */;

-- Dumping structure for table news.authtoken_token
CREATE TABLE IF NOT EXISTS `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table news.authtoken_token: ~5 rows (approximately)
DELETE FROM `authtoken_token`;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` (`key`, `created`, `user_id`) VALUES
	('65690bbd8c56c728cad4dcf64b0bb0aab3e8aa80', '2019-03-21 13:59:47.055373', 6),
	('89de8267c100c99421d5d23bfcf2368b6830e42f', '2019-03-21 11:56:49.602969', 5),
	('8c606ffab63103437cbc99a0ba0eede3856a2b4f', '2019-03-04 14:16:14.330384', 1),
	('c2a6aa7214785f45f3d3289e1480256dd0b89cb7', '2019-05-05 09:50:54.921206', 7),
	('e39fc29b74988e8b926183dcce71893b004dc928', '2019-03-04 17:01:53.276893', 4),
	('fd92cb28a821ac69a5db81fd1171cbe86f76aedc', '2019-03-04 14:43:14.102939', 3);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;

-- Dumping structure for table news.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table news.auth_group: ~0 rows (approximately)
DELETE FROM `auth_group`;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;

-- Dumping structure for table news.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table news.auth_group_permissions: ~0 rows (approximately)
DELETE FROM `auth_group_permissions`;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;

-- Dumping structure for table news.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- Dumping data for table news.auth_permission: ~39 rows (approximately)
DELETE FROM `auth_permission`;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can add permission', 2, 'add_permission'),
	(5, 'Can change permission', 2, 'change_permission'),
	(6, 'Can delete permission', 2, 'delete_permission'),
	(7, 'Can add group', 3, 'add_group'),
	(8, 'Can change group', 3, 'change_group'),
	(9, 'Can delete group', 3, 'delete_group'),
	(10, 'Can add user', 4, 'add_user'),
	(11, 'Can change user', 4, 'change_user'),
	(12, 'Can delete user', 4, 'delete_user'),
	(13, 'Can add content type', 5, 'add_contenttype'),
	(14, 'Can change content type', 5, 'change_contenttype'),
	(15, 'Can delete content type', 5, 'delete_contenttype'),
	(16, 'Can add session', 6, 'add_session'),
	(17, 'Can change session', 6, 'change_session'),
	(18, 'Can delete session', 6, 'delete_session'),
	(19, 'Can add ad', 7, 'add_ad'),
	(20, 'Can change ad', 7, 'change_ad'),
	(21, 'Can delete ad', 7, 'delete_ad'),
	(22, 'Can add 新闻文章', 8, 'add_article'),
	(23, 'Can change 新闻文章', 8, 'change_article'),
	(24, 'Can delete 新闻文章', 8, 'delete_article'),
	(25, 'Can add 新闻类别', 9, 'add_category'),
	(26, 'Can change 新闻类别', 9, 'change_category'),
	(27, 'Can delete 新闻类别', 9, 'delete_category'),
	(28, 'Can add 新闻子栏目', 10, 'add_item'),
	(29, 'Can change 新闻子栏目', 10, 'change_item'),
	(30, 'Can delete 新闻子栏目', 10, 'delete_item'),
	(31, 'Can add 标签', 11, 'add_tag'),
	(32, 'Can change 标签', 11, 'change_tag'),
	(33, 'Can delete 标签', 11, 'delete_tag'),
	(34, 'Can add 用户收藏', 12, 'add_userfav'),
	(35, 'Can change 用户收藏', 12, 'change_userfav'),
	(36, 'Can delete 用户收藏', 12, 'delete_userfav'),
	(37, 'Can add Token', 13, 'add_token'),
	(38, 'Can change Token', 13, 'change_token'),
	(39, 'Can delete Token', 13, 'delete_token');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

-- Dumping structure for table news.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Dumping data for table news.auth_user: ~6 rows (approximately)
DELETE FROM `auth_user`;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
	(1, 'pbkdf2_sha256$100000$vBoS2vIZu8gx$0vUPhkWJyS2tYIDyZlEkmMMC4dQZN/+oCUKhQOutghc=', '2019-03-04 11:23:53.209217', 1, 'wyq', '', '', '97643434@qq.com', 1, 1, '2019-03-01 16:08:19.839993'),
	(2, 'pbkdf2_sha256$100000$CA60ljlAc4p6$vEZ0lAc85VDpIrn4iAIZSf0DmYh1l8dtdFgM34tRvqE=', NULL, 0, '8888', '', '', '', 0, 1, '2019-03-04 13:38:23.989248'),
	(3, 'pbkdf2_sha256$100000$gW2H1dXA9J0k$2XxBI8x5DXAhSOw/Q5xl2MpyqwDXYRo8x6eYqxOeHPE=', NULL, 0, '333', '', '', '', 0, 1, '2019-03-04 14:43:13.777662'),
	(4, 'pbkdf2_sha256$100000$rUqyJMnpBMP6$jKM/LTX22mUV/o+jbaSFNv0fapNd1esr5KiUXw6r++o=', NULL, 0, '976367613@qq.com', '', '', '', 0, 1, '2019-03-04 17:01:52.857773'),
	(5, 'pbkdf2_sha256$100000$HxWS69K9YPt5$Kjvpx8dkeLOTds2PZpTcDfGSiBx0H5RpvzR/kXOOGiA=', '2019-03-21 11:54:02.490716', 1, 'ansiyida', '', '', '454545@qq.com', 1, 1, '2019-03-21 11:53:56.116047'),
	(6, 'pbkdf2_sha256$100000$3sL7k8atwZIk$UIU38ZCZkZN1mhILXF/LOH4KJCGCwF3XPPAPYDjxWEU=', NULL, 0, '18911726456', '', '', '', 0, 1, '2019-03-21 13:59:46.656748'),
	(7, 'pbkdf2_sha256$100000$eDtTMMxwIJai$9V2uM6by1WUMx3d7qJrH1i6BiCi5oupJNO/TJbqhBbk=', NULL, 0, '12345678@qq.com', '', '', '', 0, 1, '2019-05-05 09:50:54.521116');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;

-- Dumping structure for table news.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table news.auth_user_groups: ~0 rows (approximately)
DELETE FROM `auth_user_groups`;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;

-- Dumping structure for table news.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table news.auth_user_user_permissions: ~0 rows (approximately)
DELETE FROM `auth_user_user_permissions`;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;

-- Dumping structure for table news.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

-- Dumping data for table news.django_admin_log: ~67 rows (approximately)
DELETE FROM `django_admin_log`;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(1, '2019-03-01 16:20:07.381481', '1', '人工智能', 1, '[{"added": {}}]', 9, 1),
	(2, '2019-03-01 16:20:14.593543', '1', '大数据', 2, '[{"changed": {"fields": ["title"]}}]', 9, 1),
	(3, '2019-03-01 16:20:22.900912', '1', '区块链', 2, '[{"changed": {"fields": ["title"]}}]', 9, 1),
	(4, '2019-03-01 16:20:25.143850', '1', '区块链', 2, '[]', 9, 1),
	(5, '2019-03-01 16:21:04.202732', '1', '机器学习', 2, '[{"changed": {"fields": ["title"]}}]', 9, 1),
	(6, '2019-03-01 16:21:19.657851', '1', '设计', 2, '[{"changed": {"fields": ["title"]}}]', 9, 1),
	(7, '2019-03-01 16:21:42.963942', '2', '大数据', 1, '[{"added": {}}]', 9, 1),
	(8, '2019-03-01 16:21:50.016431', '3', '人工智能', 1, '[{"added": {}}]', 9, 1),
	(9, '2019-03-01 16:21:57.482524', '4', '机器学习', 1, '[{"added": {}}]', 9, 1),
	(10, '2019-03-01 16:22:01.791717', '5', '开发', 1, '[{"added": {}}]', 9, 1),
	(11, '2019-03-01 17:50:16.969255', '1', 'python', 1, '[{"added": {}}]', 10, 1),
	(12, '2019-03-01 17:50:31.317650', '2', '人脸识别', 1, '[{"added": {}}]', 10, 1),
	(13, '2019-03-01 17:51:04.142274', '3', '大数据平台', 1, '[{"added": {}}]', 10, 1),
	(14, '2019-03-01 17:51:18.473897', '4', '深度学习', 1, '[{"added": {}}]', 10, 1),
	(15, '2019-03-01 17:51:30.188470', '5', '神经网络', 1, '[{"added": {}}]', 10, 1),
	(16, '2019-03-01 17:51:49.091886', '6', 'UI设计', 1, '[{"added": {}}]', 10, 1),
	(17, '2019-03-01 17:52:02.288590', '7', '广告设计', 1, '[{"added": {}}]', 10, 1),
	(18, '2019-03-01 17:52:15.044215', '8', 'JAVA开发', 1, '[{"added": {}}]', 10, 1),
	(19, '2019-03-01 17:52:30.507301', '9', '机器人', 1, '[{"added": {}}]', 10, 1),
	(20, '2019-03-01 17:52:48.095810', '10', '自然语言处理', 1, '[{"added": {}}]', 10, 1),
	(21, '2019-03-01 17:53:00.585577', '11', '数据清洗', 1, '[{"added": {}}]', 10, 1),
	(22, '2019-03-01 17:55:26.636598', '12', '前端开发', 1, '[{"added": {}}]', 10, 1),
	(23, '2019-03-04 11:24:11.707905', '1', '人工智能', 1, '[{"added": {}}]', 11, 1),
	(24, '2019-03-04 11:26:32.929721', '1', 'Ad object (1)', 1, '[{"added": {}}]', 7, 1),
	(25, '2019-03-04 11:27:46.266065', '2', '人工智能', 1, '[{"added": {}}]', 11, 1),
	(26, '2019-03-04 11:28:15.382296', '1', '人工智能', 1, '[{"added": {}}]', 8, 1),
	(27, '2019-03-04 13:20:02.576649', '2', 'python基础', 1, '[{"added": {}}]', 8, 1),
	(28, '2019-03-04 13:38:24.092919', '2', '8888', 1, '[{"added": {}}]', 4, 1),
	(29, '2019-03-04 13:39:04.954491', '3', '技术', 1, '[{"added": {}}]', 8, 1),
	(30, '2019-03-04 15:41:43.755604', '3', '技术', 2, '[{"changed": {"fields": ["pic"]}}]', 8, 1),
	(31, '2019-03-04 15:42:04.882122', '2', 'python基础', 2, '[{"changed": {"fields": ["pic"]}}]', 8, 1),
	(32, '2019-03-04 15:42:14.860842', '1', '人工智能', 2, '[{"changed": {"fields": ["pic"]}}]', 8, 1),
	(33, '2019-03-04 15:54:23.800372', '3', 'git学习笔记', 2, '[{"changed": {"fields": ["title", "slug", "content"]}}]', 8, 1),
	(34, '2019-03-04 15:56:07.710270', '2', 'Ad object (2)', 1, '[{"added": {}}]', 7, 1),
	(35, '2019-03-04 15:56:17.064822', '3', 'Ad object (3)', 1, '[{"added": {}}]', 7, 1),
	(36, '2019-03-04 15:56:31.414863', '4', 'Ad object (4)', 1, '[{"added": {}}]', 7, 1),
	(37, '2019-03-04 16:21:37.878395', '5', 'Ad object (5)', 1, '[{"added": {}}]', 7, 1),
	(38, '2019-03-04 16:22:44.670621', '4', '设计基础', 1, '[{"added": {}}]', 8, 1),
	(39, '2019-03-04 16:53:42.777019', '2', '大数据', 3, '', 9, 1),
	(40, '2019-03-04 16:53:42.921622', '4', '机器学习', 3, '', 9, 1),
	(41, '2019-03-04 16:53:42.987094', '1', '设计', 3, '', 9, 1),
	(42, '2019-03-04 16:54:19.350572', '8', 'JAVA开发', 2, '[]', 10, 1),
	(43, '2019-03-04 16:54:25.601971', '1', 'python', 2, '[{"changed": {"fields": ["categorys"]}}]', 10, 1),
	(44, '2019-03-04 16:56:10.642775', '2', 'python基础', 2, '[{"changed": {"fields": ["pic"]}}]', 8, 1),
	(45, '2019-03-04 16:56:15.052355', '2', 'python基础', 2, '[]', 8, 1),
	(46, '2019-03-04 16:57:26.850042', '1', '人工智能', 2, '[{"changed": {"fields": ["content"]}}]', 8, 1),
	(47, '2019-03-04 17:20:01.500513', '2', 'python基础', 2, '[{"changed": {"fields": ["pic"]}}]', 8, 1),
	(48, '2019-03-04 17:20:14.430372', '2', 'python基础', 2, '[{"changed": {"fields": ["pic"]}}]', 8, 1),
	(49, '2019-03-04 17:21:01.494837', '5', 'Ad object (5)', 2, '[]', 7, 1),
	(50, '2019-03-04 17:21:18.404853', '2', 'Ad object (2)', 3, '', 7, 1),
	(51, '2019-03-04 17:21:18.521865', '1', 'Ad object (1)', 3, '', 7, 1),
	(52, '2019-03-04 18:10:40.389763', '5', 'Ad object (5)', 2, '[{"changed": {"fields": ["pic"]}}]', 7, 1),
	(53, '2019-03-04 18:10:49.114944', '4', 'Ad object (4)', 2, '[{"changed": {"fields": ["pic"]}}]', 7, 1),
	(54, '2019-03-04 18:11:01.198090', '3', 'Ad object (3)', 2, '[{"changed": {"fields": ["pic"]}}]', 7, 1),
	(55, '2019-03-04 18:19:14.593249', '5', 'Ad object (5)', 2, '[{"changed": {"fields": ["adlocation"]}}]', 7, 1),
	(56, '2019-03-04 18:19:20.554422', '4', 'Ad object (4)', 2, '[{"changed": {"fields": ["adlocation"]}}]', 7, 1),
	(57, '2019-03-04 18:19:27.580592', '3', 'Ad object (3)', 2, '[]', 7, 1),
	(58, '2019-03-04 18:21:35.407336', '5', 'Ad object (5)', 2, '[{"changed": {"fields": ["adlocation"]}}]', 7, 1),
	(59, '2019-03-04 18:21:43.638867', '4', 'Ad object (4)', 2, '[{"changed": {"fields": ["adlocation", "status"]}}]', 7, 1),
	(60, '2019-03-04 18:21:50.526684', '3', 'Ad object (3)', 2, '[{"changed": {"fields": ["adlocation", "status"]}}]', 7, 1),
	(61, '2019-03-04 18:24:09.061047', '5', 'Ad object (5)', 2, '[{"changed": {"fields": ["pic"]}}]', 7, 1),
	(62, '2019-03-04 18:24:17.384314', '4', 'Ad object (4)', 2, '[{"changed": {"fields": ["pic"]}}]', 7, 1),
	(63, '2019-03-04 18:24:31.808764', '3', 'Ad object (3)', 2, '[{"changed": {"fields": ["pic"]}}]', 7, 1),
	(64, '2019-03-04 18:24:55.603967', '6', 'Ad object (6)', 1, '[{"added": {}}]', 7, 1),
	(65, '2019-03-04 18:25:14.239995', '7', 'Ad object (7)', 1, '[{"added": {}}]', 7, 1),
	(66, '2019-03-05 09:44:09.670560', '7', 'Ad object (7)', 3, '', 7, 1),
	(67, '2019-03-05 09:44:09.813409', '6', 'Ad object (6)', 3, '', 7, 1),
	(68, '2019-03-05 09:44:21.020276', '5', 'Ad object (5)', 2, '[{"changed": {"fields": ["pic"]}}]', 7, 1),
	(69, '2019-03-05 09:44:37.199906', '5', 'Ad object (5)', 2, '[{"changed": {"fields": ["pic"]}}]', 7, 1),
	(70, '2019-03-05 09:44:50.954789', '4', 'Ad object (4)', 2, '[{"changed": {"fields": ["pic"]}}]', 7, 1),
	(71, '2019-03-05 09:45:06.084628', '3', 'Ad object (3)', 2, '[{"changed": {"fields": ["pic"]}}]', 7, 1),
	(72, '2019-03-05 10:06:33.400127', '8', 'JAVA开发', 2, '[]', 10, 1),
	(73, '2019-03-21 11:55:39.229106', '5', '机器学习', 1, '[{"added": {}}]', 8, 5);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;

-- Dumping structure for table news.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Dumping data for table news.django_content_type: ~13 rows (approximately)
DELETE FROM `django_content_type`;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(7, 'article', 'ad'),
	(8, 'article', 'article'),
	(9, 'article', 'category'),
	(10, 'article', 'item'),
	(11, 'article', 'tag'),
	(12, 'article', 'userfav'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(13, 'authtoken', 'token'),
	(5, 'contenttypes', 'contenttype'),
	(6, 'sessions', 'session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

-- Dumping structure for table news.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- Dumping data for table news.django_migrations: ~17 rows (approximately)
DELETE FROM `django_migrations`;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2019-03-01 15:54:01.558153'),
	(2, 'auth', '0001_initial', '2019-03-01 15:54:12.869449'),
	(3, 'admin', '0001_initial', '2019-03-01 15:54:15.011270'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2019-03-01 15:54:15.139734'),
	(5, 'article', '0001_initial', '2019-03-01 15:54:27.008918'),
	(6, 'contenttypes', '0002_remove_content_type_name', '2019-03-01 15:54:28.595055'),
	(7, 'auth', '0002_alter_permission_name_max_length', '2019-03-01 15:54:30.018584'),
	(8, 'auth', '0003_alter_user_email_max_length', '2019-03-01 15:54:30.973194'),
	(9, 'auth', '0004_alter_user_username_opts', '2019-03-01 15:54:31.124444'),
	(10, 'auth', '0005_alter_user_last_login_null', '2019-03-01 15:54:31.904429'),
	(11, 'auth', '0006_require_contenttypes_0002', '2019-03-01 15:54:32.000604'),
	(12, 'auth', '0007_alter_validators_add_error_messages', '2019-03-01 15:54:32.140681'),
	(13, 'auth', '0008_alter_user_username_max_length', '2019-03-01 15:54:36.928437'),
	(14, 'auth', '0009_alter_user_last_name_max_length', '2019-03-01 15:54:38.091503'),
	(15, 'authtoken', '0001_initial', '2019-03-01 15:54:39.527982'),
	(16, 'authtoken', '0002_auto_20160226_1747', '2019-03-01 15:54:40.718321'),
	(17, 'sessions', '0001_initial', '2019-03-01 15:54:41.730239'),
	(18, 'article', '0002_auto_20190304_1321', '2019-03-04 13:22:14.369689'),
	(19, 'article', '0003_auto_20190304_1429', '2019-03-04 14:29:19.409647');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

-- Dumping structure for table news.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table news.django_session: ~3 rows (approximately)
DELETE FROM `django_session`;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('9waavvmmd4mq4oxb3fc5scr8mnx9e1yn', 'NzY3YmUyNzRhYjJkYzQ1ZjE0NzQ0ZDkxNTAzODIzMDk5YzQ1YzkzNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NDJkMWNiOTNkOTAyZTVlZGE1Yzc3ODBkOTA2OTU2M2FmZmE4MmQ2In0=', '2019-03-15 16:18:32.676863'),
	('blp8j8iuso3raf1ce5b9vclfxm5a4ydf', 'YjI2YmI4NGE0MWZmNWY0NTJmMmU1ZTIyMTVmNmY5MmM0ZGNhMzVmZjp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2ZDQ0MDI1MTBhOGI2Y2JjOTBhOWQwMTgyMGNkMWI5ZWYyODZjZTY5In0=', '2019-04-04 11:54:02.574044'),
	('zi3ol2ypmn3vqc4eafmypyi67zai9b8r', 'NzY3YmUyNzRhYjJkYzQ1ZjE0NzQ0ZDkxNTAzODIzMDk5YzQ1YzkzNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NDJkMWNiOTNkOTAyZTVlZGE1Yzc3ODBkOTA2OTU2M2FmZmE4MmQ2In0=', '2019-03-18 11:23:53.315863');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
