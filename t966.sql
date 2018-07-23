-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2018 �?07 �?23 �?14:09
-- 服务器版本: 5.5.47
-- PHP 版本: 5.5.30

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `demo`
--

-- --------------------------------------------------------

--
-- 表的结构 `think_article`
--

CREATE TABLE IF NOT EXISTS `think_article` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `date` bigint(20) NOT NULL COMMENT '日期',
  `content` longtext NOT NULL COMMENT '内容',
  `excerpt` longtext NOT NULL COMMENT '摘要',
  `alias` varchar(200) NOT NULL DEFAULT '' COMMENT '别名',
  `author` int(10) NOT NULL DEFAULT '1' COMMENT '作者',
  `sortid` int(10) NOT NULL DEFAULT '-1' COMMENT '分类ID',
  `type` varchar(20) NOT NULL DEFAULT 'blog' COMMENT '标签',
  `views` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览数',
  `tagid` varchar(255) NOT NULL DEFAULT '0',
  `attnum` int(10) unsigned NOT NULL DEFAULT '0',
  `top` enum('n','y') NOT NULL DEFAULT 'n' COMMENT '全局置顶',
  `sortop` enum('n','y') NOT NULL DEFAULT 'n' COMMENT '分类置顶',
  `hide` enum('n','y') NOT NULL DEFAULT 'n' COMMENT '文章隐藏',
  `checked` enum('n','y') NOT NULL DEFAULT 'y',
  `allow_remark` enum('n','y') NOT NULL DEFAULT 'y',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '文章密码',
  `template` varchar(255) NOT NULL DEFAULT '' COMMENT '文章模板',
  `status` varchar(255) NOT NULL COMMENT '-1 => ''删除'', 0 => ''禁用'', 1 => ''正常'', 2 => ''待审核''',
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `author` (`author`),
  KEY `sortid` (`sortid`),
  KEY `type` (`type`),
  KEY `views` (`views`),
  KEY `comnum` (`tagid`),
  KEY `hide` (`hide`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=277 ;

-- --------------------------------------------------------

--
-- 表的结构 `think_article_tag`
--

CREATE TABLE IF NOT EXISTS `think_article_tag` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tagname` varchar(60) NOT NULL DEFAULT '',
  `gid` text NOT NULL,
  PRIMARY KEY (`tid`),
  KEY `tagname` (`tagname`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=56 ;

-- --------------------------------------------------------

--
-- 表的结构 `think_config`
--

CREATE TABLE IF NOT EXISTS `think_config` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `appid` bigint(36) NOT NULL,
  `appkey` text NOT NULL,
  `my_url` text NOT NULL,
  `username` text COMMENT '名称',
  `password` text,
  `name` text COMMENT '状态',
  `phone` bigint(11) DEFAULT NULL,
  `email` text,
  `invite` int(11) DEFAULT NULL,
  `token` varchar(200) DEFAULT NULL,
  `online_time` int(11) DEFAULT NULL,
  `start_time` int(11) DEFAULT NULL,
  `expiration_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  `rand` int(11) DEFAULT '0',
  `ip` text NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  KEY `phone_2` (`phone`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `think_config`
--

INSERT INTO `think_config` (`id`, `appid`, `appkey`, `my_url`, `username`, `password`, `name`, `phone`, `email`, `invite`, `token`, `online_time`, `start_time`, `expiration_time`, `delete_time`, `rand`, `ip`, `create_time`, `update_time`) VALUES
(1, 100112288, 'ac07166c888888887beec4e423a6bc46', 'http://open.gaoxueya.com/index/api/qq', 'qq', NULL, 'qq', 0, '0', NULL, NULL, NULL, NULL, NULL, NULL, 0, '', 0, 0),
(2, 1460956555, '5ac13fe8888888888d62b90e33673d03', 'http://open.gaoxueya.com/index/api/weibo', 'weibo', NULL, 'weibo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', 0, 0),
(3, 1, '1', 'http://api.chanyoo.cn/utf8/interface/send_sms.aspx', 'usernaem', '65569MdN', 'sms', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '', 0, 0),
(4, 20880066666666889, 'ynsongdft999999996wfpoz9j7h', 'http://open.gaoxueya.com/index/api/jack', NULL, '3', 'alipay', NULL, 'rinuo@vip.qq.com', NULL, NULL, NULL, NULL, NULL, NULL, 0, '', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `think_data`
--

CREATE TABLE IF NOT EXISTS `think_data` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '名称',
  `shop` int(11) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `title` varchar(1000) NOT NULL,
  `age` int(11) NOT NULL,
  `ip` text,
  `session_id` text,
  `delete_time` int(11) DEFAULT NULL,
  `content` text,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2078 ;

--
-- 转存表中的数据 `think_data`
--

INSERT INTO `think_data` (`id`, `name`, `shop`, `phone`, `status`, `title`, `age`, `ip`, `session_id`, `delete_time`, `content`, `create_time`, `update_time`) VALUES
(2072, '127.0.0.1', 111, 15966982315, 0, '发个说说', 0, '127.0.0.1', 'c7ihudnqcpm3ls69qpc6tukbj3', NULL, NULL, 1532257622, 1532257622),
(2073, '127.0.0.1', 111, 15966982315, 0, '学习tp5中', 0, '127.0.0.1', 'c7ihudnqcpm3ls69qpc6tukbj3', NULL, NULL, 1532257641, 1532257641),
(2074, '127.0.0.1', 111, 15966982315, 0, '我来学习了', 0, '127.0.0.1', 'c7ihudnqcpm3ls69qpc6tukbj3', NULL, NULL, 1532259047, 1532259047),
(2075, '127.0.0.1', 111, 15966982315, 0, '我们一定要给自己提出这样的任务：第一，学习，第二是学习，第三还是学习。', 0, '127.0.0.1', 'c7ihudnqcpm3ls69qpc6tukbj3', NULL, NULL, 1532259280, 1532259280),
(2076, '127.0.0.1', 111, 15966982315, 0, '书山有路勤为径,学海无涯苦作舟。', 0, '127.0.0.1', 'c7ihudnqcpm3ls69qpc6tukbj3', NULL, NULL, 1532259309, 1532259309),
(2077, '127.0.0.1', 111, 15966982315, 0, '不渴望能够一跃千里,只希望每天能够前进一步。', 0, '127.0.0.1', 'c7ihudnqcpm3ls69qpc6tukbj3', NULL, NULL, 1532259322, 1532259322);

-- --------------------------------------------------------

--
-- 表的结构 `think_footprint`
--

CREATE TABLE IF NOT EXISTS `think_footprint` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `phone` bigint(255) DEFAULT NULL COMMENT '名称',
  `lesson` varchar(255) DEFAULT NULL,
  `referer` text COMMENT '来路',
  `domain` text COMMENT '来自域名',
  `browser` text COMMENT '浏览器类型',
  `pathinfo` text,
  `address` text,
  `url` text,
  `product` text,
  `os` text COMMENT '操作系统',
  `mobile` text,
  `status` tinyint(2) DEFAULT '0' COMMENT '状态',
  `title` text CHARACTER SET utf8,
  `age` int(11) DEFAULT NULL,
  `ip` text,
  `delete_time` int(11) DEFAULT NULL,
  `content` text CHARACTER SET utf8,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=22498 ;

--
-- 转存表中的数据 `think_footprint`
--

INSERT INTO `think_footprint` (`id`, `phone`, `lesson`, `referer`, `domain`, `browser`, `pathinfo`, `address`, `url`, `product`, `os`, `mobile`, `status`, `title`, `age`, `ip`, `delete_time`, `content`, `create_time`, `update_time`) VALUES
(22386, 15555553306, NULL, 'www.tp5.com/', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/member/diary', '', '/index/member/diary', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532162127, 1532162127),
(22387, 15555553306, NULL, 'www.tp5.com/index/member/diary', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/member/news', '', '/index/member/news', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532164071, 1532164071),
(22388, 15555553306, NULL, 'www.tp5.com/index/member/diary', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/member/news', '', '/index/member/news', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532164488, 1532164488),
(22389, 15555553306, NULL, 'www.tp5.com/index/member/news', 'www.tp5.com', 'Chrome(65.0.3325.181)', '/', '', '/', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532164502, 1532164502),
(22390, 0, NULL, 'www.tp5.com/', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/index/all', '', '/index/index/all', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532164512, 1532164512),
(22391, 0, NULL, '', '', 'Chrome(65.0.3325.181)', '/', '', '/', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532255779, 1532255779),
(22392, 0, NULL, '', '', 'Chrome(65.0.3325.181)', '/', '', '/', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532255970, 1532255970),
(22393, 0, NULL, '', '', 'Chrome(65.0.3325.181)', '/', '', '/', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532256012, 1532256012),
(22394, 0, NULL, 'www.tp5.com/', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/member/news', '', '/index/member/news', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532256022, 1532256022),
(22395, 0, NULL, 'www.tp5.com/index/member/news', 'www.tp5.com', 'Chrome(65.0.3325.181)', '/', '', '/', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532256028, 1532256028),
(22396, 0, NULL, 'www.tp5.com/', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/index/view/id/168', '', '/index/index/view/id/168', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532256031, 1532256031),
(22397, 0, NULL, 'www.tp5.com/index/index/view/id/168', 'www.tp5.com', 'Chrome(65.0.3325.181)', '/', '', '/', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532256043, 1532256043),
(22398, 0, NULL, 'www.tp5.com/', 'www.tp5.com', 'Chrome(65.0.3325.181)', '/', '', '/', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532256057, 1532256057),
(22399, 0, NULL, '', '', 'Chrome(65.0.3325.181)', '/', '', '/', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532256085, 1532256085),
(22400, 0, NULL, 'www.tp5.com/', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/index/view/id/250', '', '/index/index/view/id/250', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532256092, 1532256092),
(22401, 0, NULL, 'www.tp5.com/index/index/view/id/250', 'www.tp5.com', 'Chrome(65.0.3325.181)', '/', '', '/', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532256100, 1532256100),
(22402, 0, NULL, 'www.tp5.com/', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/index/all', '', '/index/index/all', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532256102, 1532256102),
(22403, 0, NULL, 'www.tp5.com/index/index/all', 'www.tp5.com', 'Chrome(65.0.3325.181)', '/', '', '/', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532256130, 1532256130),
(22404, 0, NULL, 'www.tp5.com/', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/index/news', '', '/index/index/news', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532256204, 1532256204),
(22405, 0, NULL, 'www.tp5.com/index/index/news', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/index/all', '', '/index/index/all', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532256221, 1532256221),
(22406, 0, NULL, 'www.tp5.com/', 'www.tp5.com', 'Chrome(65.0.3325.181)', '/', '', '/', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532256406, 1532256406),
(22407, 0, NULL, 'www.tp5.com/', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/index/news', '', '/index/index/news', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532256408, 1532256408),
(22408, 0, NULL, 'www.tp5.com/index/index/news', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/index/all', '', '/index/index/all', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532256439, 1532256439),
(22409, 0, NULL, 'www.tp5.com/index/index/all', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/ajax/ajaxrun', '', '/index/ajax/ajaxrun', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532256545, 1532256545),
(22410, 0, NULL, 'www.tp5.com/index/ajax/ajaxrun', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/member/news', '', '/index/member/news', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532256562, 1532256562),
(22411, 0, NULL, 'www.tp5.com/index/member/news', 'www.tp5.com', 'Chrome(65.0.3325.181)', '/', '', '/', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532256584, 1532256584),
(22412, 0, NULL, 'www.tp5.com/', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/index/view/id/38', '', '/index/index/view/id/38', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532256595, 1532256595),
(22413, 0, NULL, 'www.tp5.com/', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/index/view/id/38', '', '/index/index/view/id/38', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532256677, 1532256677),
(22414, 0, NULL, 'www.tp5.com/', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/index/view/id/38', '', '/index/index/view/id/38', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532256784, 1532256784),
(22415, 0, NULL, 'www.tp5.com/', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/index/view/id/38', '', '/index/index/view/id/38', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532256870, 1532256870),
(22416, 0, NULL, 'www.tp5.com/index/index/all', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/index/view/id/39', '', '/index/index/view/id/39', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532256963, 1532256963),
(22417, 0, NULL, 'www.tp5.com/', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/index/view/id/38', '', '/index/index/view/id/38', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532256983, 1532256983),
(22418, 0, NULL, 'www.tp5.com/', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/index/view/id/38', '', '/index/index/view/id/38', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532257043, 1532257043),
(22419, 0, NULL, 'www.tp5.com/index/index/view/id/38', 'www.tp5.com', 'Chrome(65.0.3325.181)', '/', '', '/', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532257242, 1532257242),
(22420, 0, NULL, 'www.tp5.com/', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/index/view/id/40', '', '/index/index/view/id/40', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532257247, 1532257247),
(22421, 0, NULL, 'www.tp5.com/index/index/view/id/38', 'www.tp5.com', 'Chrome(65.0.3325.181)', '/', '', '/', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532257274, 1532257274),
(22422, 0, NULL, 'www.tp5.com/', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/index/view/id/38', '', '/index/index/view/id/38', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532257277, 1532257277),
(22423, 0, NULL, 'www.tp5.com/', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/index/view/id/38', '', '/index/index/view/id/38', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532257395, 1532257395),
(22424, 0, NULL, 'www.tp5.com/', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/index/view/id/38', '', '/index/index/view/id/38', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532257418, 1532257418),
(22425, 0, NULL, 'www.tp5.com/index/index/view/id/38', 'www.tp5.com', 'Chrome(65.0.3325.181)', '/', '', '/', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532257425, 1532257425),
(22426, 0, NULL, 'www.tp5.com/', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/index/view/id/39', '', '/index/index/view/id/39', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532257428, 1532257428),
(22427, 0, NULL, 'www.tp5.com/index/index/view/id/39', 'www.tp5.com', 'Chrome(65.0.3325.181)', '/', '', '/', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532257580, 1532257580),
(22428, 0, NULL, 'www.tp5.com/index/index/view/id/39', 'www.tp5.com', 'Chrome(65.0.3325.181)', '/', '', '/', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532257643, 1532257643),
(22429, 0, NULL, 'www.tp5.com/', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/bbs/show', '', '/index/bbs/show', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532257652, 1532257652),
(22430, 0, NULL, 'www.tp5.com/index/bbs/show', 'www.tp5.com', 'Chrome(65.0.3325.181)', '/', '', '/', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532257660, 1532257660),
(22431, 0, NULL, 'www.tp5.com/', 'www.tp5.com', 'Chrome(65.0.3325.181)', '/', '', '/', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532259054, 1532259054),
(22432, 0, NULL, 'www.tp5.com/', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/bbs/show', '', '/index/bbs/show', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532259057, 1532259057),
(22433, 0, NULL, 'www.tp5.com/index/bbs/show', 'www.tp5.com', 'Chrome(65.0.3325.181)', '/', '', '/', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532259062, 1532259062),
(22434, 0, NULL, 'www.tp5.com/index/bbs/show', 'www.tp5.com', 'Chrome(65.0.3325.181)', '/', '', '/', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532259793, 1532259793),
(22435, 0, NULL, '', '', 'Chrome(65.0.3325.181)', '/', '', '/', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532312443, 1532312443),
(22436, 0, NULL, 'www.tp5.com/', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/index/like', '', '/index/index/like?search=API', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532312565, 1532312565),
(22437, 0, NULL, 'www.tp5.com/index/index/like?search=API', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/member/top', '', '/index/member/top', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532312582, 1532312582),
(22438, 0, NULL, 'www.tp5.com/index/member/top', 'www.tp5.com', 'Chrome(65.0.3325.181)', '/', '', '/', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532312592, 1532312592),
(22439, 0, NULL, 'www.tp5.com/', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/index/like', '', '/index/index/like?search=ajax', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532312599, 1532312599),
(22440, 0, NULL, 'www.tp5.com/index/index/like?search=ajax', 'www.tp5.com', 'Chrome(65.0.3325.181)', '/', '', '/', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532312603, 1532312603),
(22441, 0, NULL, 'www.tp5.com/', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/member/news', '', '/index/member/news', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532312622, 1532312622),
(22442, 0, NULL, 'www.tp5.com/index/member/news', 'www.tp5.com', 'Chrome(65.0.3325.181)', '/', '', '/', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532312652, 1532312652),
(22443, 0, NULL, 'www.tp5.com/', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/index/login', '', '/index/index/login', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532312690, 1532312690),
(22444, 0, NULL, 'www.tp5.com/index/index/login', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/index/login', '', '/index/index/login', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532312725, 1532312725),
(22445, 0, NULL, 'www.tp5.com/index/index/login', 'www.tp5.com', 'Chrome(65.0.3325.181)', '/', '', '/', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532315832, 1532315832),
(22446, 0, NULL, 'www.tp5.com/', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/index/like', '', '/index/index/like?search=%E7%AD%BE%E5%88%B0', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532315857, 1532315857),
(22447, 0, NULL, 'www.tp5.com/index/index/like?search=%E7%AD%BE%E5%88%B0', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/member/top', '', '/index/member/top', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532315944, 1532315944),
(22448, 0, NULL, 'www.tp5.com/index/member/top', 'www.tp5.com', 'Chrome(65.0.3325.181)', '/', '', '/', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532315954, 1532315954),
(22449, 0, NULL, 'www.tp5.com/', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/member/registration', '', '/index/member/registration', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532315956, 1532315956),
(22450, 0, NULL, 'www.tp5.com/index/member/registration', 'www.tp5.com', 'Chrome(65.0.3325.181)', '/', '', '/', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532315960, 1532315960),
(22451, 0, NULL, 'www.tp5.com/', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/index/like', '', '/index/index/like?search=%E7%9F%AD%E4%BF%A1', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532315963, 1532315963),
(22452, 0, NULL, 'www.tp5.com/index/index/like?search=%E7%9F%AD%E4%BF%A1', 'www.tp5.com', 'Chrome(65.0.3325.181)', '/', '', '/', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532315966, 1532315966),
(22453, 0, NULL, 'www.tp5.com/', 'www.tp5.com', 'Chrome(65.0.3325.181)', '/', '', '/', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532315974, 1532315974),
(22454, 0, NULL, 'www.tp5.com/', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/member/news', '', '/index/member/news', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532316054, 1532316054),
(22455, 0, NULL, 'www.tp5.com/index/member/news', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/ajax/ajaxrun', '', '/index/ajax/ajaxrun', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532316060, 1532316060),
(22456, 0, NULL, 'www.tp5.com/index/ajax/ajaxrun', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/index/login', '', '/index/index/login', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532316065, 1532316065),
(22457, 0, NULL, 'www.tp5.com/index/index/login', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/index/login', '', '/index/index/login', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532316073, 1532316073),
(22458, 0, NULL, 'www.tp5.com/index/index/login', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/index/login', '', '/index/index/login', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532316082, 1532316082),
(22459, 0, NULL, 'www.tp5.com/index/index/login', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/index/login', '', '/index/index/login', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532316091, 1532316091),
(22460, 0, NULL, 'www.tp5.com/index/index/login', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/index/register', '', '/index/index/register', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532316117, 1532316117),
(22461, 18210787405, NULL, 'www.tp5.com/index/index/register', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/index/index', '', '/index/index/index.html', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532316134, 1532316134),
(22462, 18210787405, NULL, 'www.tp5.com/index/index/index.html', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/ajax/ajaxrun', '', '/index/ajax/ajaxrun', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532316139, 1532316139),
(22463, 18210787405, NULL, 'www.tp5.com/index/ajax/ajaxrun', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/member/vip', '', '/index/member/vip', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532316169, 1532316169),
(22464, 18210787405, NULL, 'www.tp5.com/index/member/vip', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/member/invite', '', '/index/member/invite', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532316276, 1532316276),
(22465, 0, NULL, 'www.tp5.com/index/index/login/logout/1', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/index/login', '', '/index/index/login.html', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532316285, 1532316285),
(22466, 0, NULL, 'www.tp5.com/index/index/login.html', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/index/register', '', '/index/index/register', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532316287, 1532316287),
(22467, 18210787406, NULL, 'www.tp5.com/index/index/register', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/index/index', '', '/index/index/index.html', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532316700, 1532316700),
(22468, 18210787406, NULL, 'www.tp5.com/index/index/index.html', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/ajax/ajaxrun', '', '/index/ajax/ajaxrun', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532316705, 1532316705),
(22469, 18210787406, NULL, 'www.tp5.com/index/ajax/ajaxrun', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/member/top', '', '/index/member/top', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532316717, 1532316717),
(22470, 18210787406, NULL, 'www.tp5.com/index/member/top', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/member/news', '', '/index/member/news', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532316735, 1532316735),
(22471, 18210787406, NULL, 'www.tp5.com/index/member/top', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/member/news', '', '/index/member/news', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532317037, 1532317037),
(22472, 18210787406, NULL, 'www.tp5.com/index/member/top', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/member/news', '', '/index/member/news', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532317238, 1532317238),
(22473, 18210787406, NULL, 'www.tp5.com/index/member/news', 'www.tp5.com', 'Chrome(65.0.3325.181)', '/', '', '/', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532317287, 1532317287),
(22474, 18210787406, NULL, 'www.tp5.com/', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/ajax/ajaxrun', '', '/index/ajax/ajaxrun', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532317292, 1532317292),
(22475, 18210787406, NULL, 'www.tp5.com/index/ajax/ajaxrun', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/member/top', '', '/index/member/top', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532317295, 1532317295),
(22476, 18210787406, NULL, 'www.tp5.com/index/member/top', 'www.tp5.com', 'Chrome(65.0.3325.181)', '/', '', '/', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532317299, 1532317299),
(22477, 18210787406, NULL, 'www.tp5.com/', 'www.tp5.com', 'Chrome(65.0.3325.181)', '/', '', '/', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532317543, 1532317543),
(22478, 18210787406, NULL, 'www.tp5.com/', 'www.tp5.com', 'Chrome(65.0.3325.181)', '/', '', '/', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532317565, 1532317565),
(22479, 18210787406, NULL, 'www.tp5.com/admin/index/login', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index', '', '/index.html', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532318587, 1532318587),
(22480, 18210787406, NULL, 'www.tp5.com/admin/index/login', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/index/login', '', '/index/index/login.html', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532318639, 1532318639),
(22481, 18210787406, NULL, 'www.tp5.com/admin/index/login', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/index/Register', '', '/index/index/Register.html', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532318644, 1532318644),
(22482, 18210787406, NULL, 'www.tp5.com/admin/index/login', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index', '', '/index.html', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532319411, 1532319411),
(22483, 18210787406, NULL, 'www.tp5.com/index.html', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/ajax/ajaxrun', '', '/index/ajax/ajaxrun', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532319422, 1532319422),
(22484, 18210787406, NULL, 'www.tp5.com/index/ajax/ajaxrun', 'www.tp5.com', 'Chrome(65.0.3325.181)', '/', '', '/', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532319429, 1532319429),
(22485, 18210787406, NULL, 'www.tp5.com/', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/index/like', '', '/index/index/like?search=API', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532319432, 1532319432),
(22486, 18210787406, NULL, 'www.tp5.com/index/index/like?search=API', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/ajax/ajaxrun', '', '/index/ajax/ajaxrun', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532319494, 1532319494),
(22487, 18210787406, NULL, 'www.tp5.com/admin/index/login', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/index/login', '', '/index/index/login.html', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532319593, 1532319593),
(22488, 18210787406, NULL, 'www.tp5.com/admin/index/login', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index', '', '/index.html', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532319596, 1532319596),
(22489, 18210787406, NULL, 'www.tp5.com/admin/index/login', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index', '', '/index.html', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532323790, 1532323790),
(22490, 18210787405, NULL, 'www.tp5.com/admin/index/login', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index', '', '/index.html', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532324803, 1532324803),
(22491, 0, NULL, 'www.tp5.com/index/index/login/logout/1', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/index/login', '', '/index/index/login.html', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532324811, 1532324811),
(22492, 18210787406, NULL, 'www.tp5.com/admin/index/login', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/index/index', '', '/index/index/index.html', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532324890, 1532324890),
(22493, 0, NULL, 'www.tp5.com/index/index/login/logout/1', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/index/login', '', '/index/index/login.html', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532324910, 1532324910),
(22494, 18210787406, NULL, 'www.tp5.com/admin/index/login', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/index/index', '', '/index/index/index.html', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532324925, 1532324925),
(22495, 18210787405, NULL, 'www.tp5.com/admin/index/index.html', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/index/index', '', '/index/index/index', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532325431, 1532325431),
(22496, 0, NULL, 'www.tp5.com/index/index/login/logout/1', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/index/login', '', '/index/index/login.html', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532325441, 1532325441),
(22497, 0, NULL, 'www.tp5.com/admin/index/index.html', 'www.tp5.com', 'Chrome(65.0.3325.181)', 'index/index/index', '', '/index/index/index', NULL, 'Windows 10', '0', 0, NULL, NULL, '127.0.0.1', NULL, NULL, 1532326063, 1532326063);

-- --------------------------------------------------------

--
-- 表的结构 `think_ipinfo`
--

CREATE TABLE IF NOT EXISTS `think_ipinfo` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `phone` bigint(255) DEFAULT NULL COMMENT '名称',
  `country` varchar(255) DEFAULT NULL COMMENT '国家',
  `area` text COMMENT '地区',
  `isp` text COMMENT '网路',
  `region` text COMMENT '浏览器类型',
  `city` text,
  `country_id` text,
  `area_id` text,
  `region_id` text,
  `city_id` text COMMENT '操作系统',
  `isp_id` text,
  `status` tinyint(2) DEFAULT '0' COMMENT '状态',
  `title` text CHARACTER SET utf8,
  `age` int(11) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  `content` text CHARACTER SET utf8,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip` (`ip`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=2073 ;

-- --------------------------------------------------------

--
-- 表的结构 `think_likes`
--

CREATE TABLE IF NOT EXISTS `think_likes` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `phone` bigint(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `data_id` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  `ip` text NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  KEY `phone_2` (`phone`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=400 ;

-- --------------------------------------------------------

--
-- 表的结构 `think_money`
--

CREATE TABLE IF NOT EXISTS `think_money` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `phone` bigint(255) NOT NULL COMMENT '名称',
  `lesson` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `address` text,
  `product` text,
  `label` text,
  `money` decimal(10,0) DEFAULT NULL,
  `status` tinyint(2) DEFAULT '0' COMMENT '状态',
  `title` text CHARACTER SET utf8,
  `age` int(11) DEFAULT NULL,
  `ip` text,
  `delete_time` int(11) DEFAULT NULL,
  `content` text CHARACTER SET utf8,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=335 ;

--
-- 转存表中的数据 `think_money`
--

INSERT INTO `think_money` (`id`, `phone`, `lesson`, `sort`, `address`, `product`, `label`, `money`, `status`, `title`, `age`, `ip`, `delete_time`, `content`, `create_time`, `update_time`) VALUES
(331, 15966982315, NULL, NULL, NULL, NULL, NULL, '10', 0, NULL, 30, NULL, NULL, '邀请了会员182****7405注册奖励', 1532316134, 1532316134),
(332, 18210787405, NULL, NULL, NULL, NULL, NULL, '10', 0, NULL, 30, NULL, NULL, '新注册获得奖励', 1532316134, 1532316134),
(333, 15966982315, NULL, NULL, NULL, NULL, NULL, '10', 0, NULL, 30, NULL, NULL, '邀请了会员182****7406注册奖励', 1532316699, 1532316699),
(334, 18210787406, NULL, NULL, NULL, NULL, NULL, '10', 0, NULL, 30, NULL, NULL, '新注册获得奖励', 1532316699, 1532316699);

-- --------------------------------------------------------

--
-- 表的结构 `think_order`
--

CREATE TABLE IF NOT EXISTS `think_order` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '名称',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `phone` bigint(13) NOT NULL,
  `age` int(11) NOT NULL,
  `delete_time` int(11) DEFAULT NULL,
  `rand` int(11) DEFAULT NULL,
  `ip` text NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `buyer_email` text NOT NULL COMMENT '买家支付宝手机或邮箱',
  `buyer_id` bigint(20) NOT NULL COMMENT '买家支付宝唯一用户号',
  `total_fee` decimal(10,2) NOT NULL COMMENT '交易金额',
  `body` text NOT NULL COMMENT '商品描述',
  `subject` text NOT NULL COMMENT '商品名称',
  `out_trade_no` text NOT NULL COMMENT '唯一订单号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=721 ;

--
-- 转存表中的数据 `think_order`
--

INSERT INTO `think_order` (`id`, `name`, `status`, `phone`, `age`, `delete_time`, `rand`, `ip`, `create_time`, `update_time`, `buyer_email`, `buyer_id`, `total_fee`, `body`, `subject`, `out_trade_no`) VALUES
(718, '127.0.0.1', 0, 15555553306, 20, NULL, 1, '127.0.0.1', 1532161353, 1532161353, '', 0, '0.00', '135', '签到', ''),
(719, '127.0.0.1', 0, 18210787405, 20, NULL, 1, '127.0.0.1', 1532316136, 1532316136, '', 0, '0.00', '135', '签到', ''),
(720, '127.0.0.1', 0, 18210787406, 20, NULL, 1, '127.0.0.1', 1532316702, 1532316702, '', 0, '0.00', '135', '签到', '');

-- --------------------------------------------------------

--
-- 表的结构 `think_shop`
--

CREATE TABLE IF NOT EXISTS `think_shop` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '名称',
  `lesson` varchar(255) NOT NULL,
  `sort` int(11) NOT NULL,
  `address` text,
  `product` text,
  `label` text NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `title` text CHARACTER SET utf8 NOT NULL,
  `age` int(11) NOT NULL,
  `page_view` int(11) NOT NULL,
  `delete_time` int(11) DEFAULT NULL,
  `content` text CHARACTER SET utf8 NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=376 ;

--
-- 转存表中的数据 `think_shop`
--

INSERT INTO `think_shop` (`id`, `name`, `lesson`, `sort`, `address`, `product`, `label`, `price`, `status`, `title`, `age`, `page_view`, `delete_time`, `content`, `create_time`, `update_time`) VALUES
(38, '117.136.37.167', '', 1, '1', '', '', '0.00', 0, '1课 tp5入门 第一课 课程概述 案例演示', 30, 924, NULL, '<p><strong>提示：第一次录课，前面20课左右因为用错了麦克风，声音有点小，需要大家把音量调节</strong><span style="color: rgb(255, 0, 0);"><strong>最大声</strong></span><strong>。</strong></p>', 1510799689, 1532244537),
(39, '58.252.63.202', '', 2, 'http://gudq.qiniudn.com/2%E8%AF%BE%20%20tp5%20%E7%AC%AC%E4%BA%8C%E8%AF%BE%20%E5%AE%89%E8%A3%85ThinkPHP.mp4', '', 'tp5 商城', '0.00', 0, '2课  tp5 第二课 安装thinkphp', 30, 383, NULL, '', 1510799738, 1532244515),
(40, '14.152.64.153', '', 3, 'http://gudq.qiniudn.com/3%E8%AF%BE%20%20tp5%20%20%E4%BF%AE%E6%94%B9%E7%AC%91%E8%84%B8%20%E7%AC%AC%E4%B8%80%E6%AC%A1%E5%8A%A8%E6%89%8B.mp4', '', 'tp5 商城', '0.00', 0, '3课 tp5  修改笑脸 第一次动手', 30, 329, NULL, '', 1510799807, 1532020119),
(41, '47.100.104.184', '', 4, 'http://gudq.qiniudn.com/4%E8%AF%BE%20%20tp5%20%E5%BC%80%E5%90%AF%E8%B0%83%E8%AF%95%E6%A8%A1%E5%BC%8F.%20%E6%96%B9%E4%BE%BF%E6%9F%A5%E7%9C%8B%E9%94%99%E8%AF%AF%E7%BB%86%E8%8A%82.mp4', '', 'tp5 商城', '0.01', 0, '4课 tp5 开启调试模式. 方便查看错误细节', 30, 256, NULL, '', 1510799863, 1532232470),
(42, '121.35.184.97', '', 5, 'http://gudq.qiniudn.com/5%E8%AF%BE%20%20tp5%20URL%E4%BC%A0%E5%80%BC%E8%A7%84%E5%88%99%20MVC%E6%A8%A1%E5%BC%8F.mp4', '', 'tp5 商城', '0.01', 0, '5课 tp5 url传值规则 mvc模式', 30, 292, NULL, '', 1510799922, 1531645699),
(43, '1.89.88.229', '', 6, 'http://gudq.qiniudn.com/6%E8%AF%BE%20%20%20tp5%20%E5%BF%AB%E9%80%9F%E5%85%A5%E9%97%A8%E6%95%B0%E6%8D%AE%E5%BA%93%20%E6%8F%92%E5%85%A5%E4%B8%80%E4%B8%AA%E7%AC%91%E8%84%B8.mp4', '', 'tp5 商城', '0.01', 0, '6课   tp5 快速入门数据库 插入一个笑脸', 30, 254, NULL, '', 1510800005, 1531475754),
(44, '180.169.174.134', '', 89, 'http://gudq.qiniudn.com/89%E8%AF%BE%20%E5%95%86%E5%93%81%E7%9A%84%E5%90%8E%E5%8F%B0%E7%BC%96%E8%BE%91%E4%BF%AE%E6%94%B9%20%E5%AF%B9%E6%8E%A5%E6%A8%A1%E5%9E%8B%E4%BF%AE%E6%94%B9%E6%96%B9%E6%B3%95.mp4', '', 'tp5 商城 模型', '0.10', 0, '89课 商品的后台编辑修改 对接模型修改方法', 30, 51, NULL, '', 1510800005, 1531907086),
(45, '171.8.154.242', '', 74, 'http://gudq.qiniudn.com/74%E8%AF%BE%20Cookie%E7%9A%84%E4%BD%BF%E7%94%A8%E5%85%A5%E9%97%A8.mp4', '', 'tp5 商城', '0.10', 0, '74课 cookie的使用入门', 30, 52, NULL, '', 1510803862, 1531472624),
(46, '59.109.152.35', '', 7, 'http://gudq.qiniudn.com/7%E8%AF%BE%20%20%20tp5%20%20%E6%95%B0%E6%8D%AE%E5%BA%93%E6%8F%92%E5%85%A5%E6%95%B0%E6%8D%AE%E7%9A%844%E7%A7%8D%E5%86%99%E6%B3%95.mp4', '', 'tp5 商城', '0.01', 0, '7课   tp5  数据库插入数据的4种写法', 30, 214, NULL, '', 1510803942, 1531669215),
(37, '66.249.73.74', '', 1008689, '', '恭喜您打赏成功~\r\n\r\n赞赏者将会被展示在一份充满友爱的名册中：赞赏者名单，开发中。。。\r\n', 'tp5 商城', '0.10', 0, '打赏 ', 30, 33, NULL, '赞赏者将会被展示在一份充满友爱的名册中', 1510737182, 1530850468),
(212, '183.48.246.9', '', 165, '1', '', '  debug 暴露数据库密码   localhost 绑定 自定义 域名', '0.10', 0, '165课 开启debug暴露数据库密码及本地localhost绑定自定义域名', 30, 41, NULL, '', 1515138206, 1531816245),
(47, '117.158.207.228', '', 8, 'http://gudq.qiniudn.com/8%E8%AF%BE%20%20%20tp5%20%20%E6%95%B0%E6%8D%AE%E5%BA%93update%E6%9B%B4%E6%96%B0%E7%9A%844%E7%A7%8D%E5%86%99%E6%B3%95.mp4', '', 'tp5 商城', '0.01', 0, '8课   tp5  数据库update更新的4种写法', 30, 107, NULL, '', 1510804008, 1531980466),
(48, '171.8.154.242', '', 9, 'http://gudq.qiniudn.com/9%20%E8%AF%BE%20%20%20tp5%20%20%E6%95%B0%E6%8D%AE%E5%BA%93select%E6%9F%A5%E8%AF%A2%E7%9A%844%E7%A7%8D%E6%96%B9%E6%B3%95.mp4', '', 'tp5 商城', '0.01', 0, '9 课   tp5  数据库select查询的4种方法', 30, 129, NULL, '', 1510819656, 1531465416),
(49, '42.49.147.186', '', 10, 'http://gudq.qiniudn.com/10%E8%AF%BE%20%20%20tp5%20%20%E6%95%B0%E6%8D%AE%E5%BA%93delete%E5%88%A0%E9%99%A4%E7%9A%845%E7%A7%8D%E6%96%B9%E6%B3%95.mp4', '', 'tp5 商城', '0.01', 0, '10课   tp5  数据库delete删除的5种方法', 30, 113, NULL, '', 1510819840, 1531829696),
(50, '58.252.63.202', '', 11, 'http://gudq.qiniudn.com/11%E8%AF%BE%20%20%20tp5%20%20%E6%95%B0%E6%8D%AE%E5%BA%93%20%E7%BB%93%E5%90%88url%E4%BC%A0%E5%80%BC%20%E5%A2%9E%E5%88%A0%E5%BA%94%E7%94%A8%E7%A4%BA%E4%BE%8B.mp4', '', 'tp5 商城', '0.01', 0, '11课   tp5  数据库 结合url传值 增删应用示例', 30, 170, NULL, '', 1510819877, 1532244854),
(51, '121.35.184.97', '', 12, 'http://gudq.qiniudn.com/12%E8%AF%BE%20%20%20tp5%20%E6%A8%A1%E6%9D%BF%E8%B0%83%E7%94%A8%E5%BF%AB%E9%80%9F%E5%85%A5%E9%97%A8%20%E6%BA%90%E7%A0%81.mp4', '', 'tp5 商城', '0.01', 0, '12课   tp5 模板调用快速入门 源码', 30, 192, NULL, '', 1510881566, 1531647944),
(52, '121.35.184.97', '', 13, 'http://gudq.qiniudn.com/13%E8%AF%BE%20%20%20tp5%20%E6%A8%A1%E6%9D%BF%E5%92%8C%E6%95%B0%E6%8D%AE%E5%BA%93%20%E7%BB%84%E5%90%88%E6%93%8D%E4%BD%9C%E5%85%A5%E9%97%A8.mp4', '', 'tp5 商城 数据库 模板', '0.01', 0, '13课   tp5 模板和数据库 组合操作入门', 30, 132, NULL, '', 1510882168, 1531648293),
(53, '180.169.174.134', '', 14, 'http://gudq.qiniudn.com/14%E8%AF%BE%20%20%20tp5%20Bbs%E6%B5%8F%E8%A7%88%E5%B1%95%E7%A4%BA%E9%A1%B5%E9%9D%A2.mp4', '', 'tp5 商城', '0.01', 0, '14课   tp5 bbs浏览展示页面', 30, 131, NULL, '', 1510882204, 1531906494),
(54, '182.149.189.59', '', 15, 'http://gudq.qiniudn.com/15%E8%AF%BE%20%20%20tp5%20%E5%88%86%E9%A1%B5%E5%AE%9E%E7%8E%B0%E5%85%A5%E9%97%A8.mp4', '', 'tp5 商城 分页', '0.01', 0, '15课   tp5 分页实现入门', 30, 199, NULL, '', 1510882240, 1532253618),
(55, '58.252.63.202', '', 16, 'http://gudq.qiniudn.com/16%E8%AF%BE%20%20%20tp5%20%E5%88%86%E9%A1%B5%E7%94%A8Ajax%E6%97%A0%E5%88%B7%E6%96%B0%E5%AE%9E%E7%8E%B0%E5%BF%AB%E9%80%9F%E5%85%A5%E9%97%A8.mp4', '', 'tp5 商城 分页 ajax 无刷新', '0.01', 0, '16课   tp5 分页用ajax无刷新实现快速入门', 30, 227, NULL, '', 1510882285, 1532245146),
(56, '223.104.1.23', '', 17, 'http://gudq.qiniudn.com/17%E8%AF%BE%20%20%20tp5%20%E5%88%86%E9%A1%B5%E7%94%A8Bootstap%E7%BE%8E%E5%8C%96%E7%95%8C%E9%9D%A2%E5%85%A5%E9%97%A8.mp4', '', 'tp5 商城 分页 bootstrap', '0.01', 0, '17课   tp5 分页用bootstrap美化界面入门', 30, 180, NULL, '', 1510882352, 1532090939),
(57, '221.223.80.234', '', 18, 'http://gudq.qiniudn.com/18%E8%AF%BE%20%20%20tp5%20%E5%88%97%E8%A1%A8%E7%94%A8Bootstrap%E7%BE%8E%E5%8C%96%E5%86%85%E5%AE%B9%E5%85%A5%E9%97%A8.mp4', '', 'tp5 商城 列表 bootstrap', '0.01', 0, '18课   tp5 列表用bootstrap美化内容入门', 30, 121, NULL, '', 1510882397, 1531894312),
(58, '121.35.184.97', '', 19, 'http://gudq.qiniudn.com/19%E8%AF%BE%20%20%20tp5%20Bbs%E7%AE%80%E5%8D%95%E5%8F%91%E5%B8%83%E5%8A%9F%E8%83%BD%E7%9A%84%E5%AE%9E%E7%8E%B0%20%E5%8F%91%E5%B8%83%E4%B9%8B%E8%A1%A8%E5%8D%95%E7%9A%84%E5%88%B6%E4%BD%9C.mp4', '', 'tp5 BBS 表单', '0.01', 0, '19课 tp5 bbs简单发布功能的实现 发布之表单的制作', 30, 107, NULL, '', 1510882439, 1531651822),
(59, '112.14.75.189', '', 20, '20', ' ', 'tp5 bbs 表单', '0.01', 0, '20课 tp5 bbs发布快速入门 表单数据的接收', 30, 93, NULL, '', 1510901605, 1531658486),
(60, '5.255.250.138', '', 21, 'http://gudq.qiniudn.com/21%E8%AF%BE%20%20%20tp5%20Bbs%E5%8F%91%E5%B8%83%E5%BF%AB%E9%80%9F%E5%85%A5%E9%97%A8%20%E6%8A%8A%E8%A1%A8%E5%8D%95%E6%95%B0%E6%8D%AE%E5%AD%98%E5%85%A5%E5%88%B0%E6%95%B0%E6%8D%AE%E5%BA%93.mp4', '', 'tp5', '0.01', 0, '21课 tp5 bbs发布快速入门 把表单数据存入到数据库', 30, 89, NULL, '', 1510901640, 1532235779),
(61, '171.8.154.242', '', 22, 'http://gudq.qiniudn.com/22%E8%AF%BE%20%20%20tp5%20Bbs%E5%B1%95%E7%A4%BA%E9%A1%B5%E5%AD%97%E6%AE%B5%E5%A4%84%E7%90%86%E5%AE%8C%E5%96%84.mp4', '', 'tp5', '0.01', 0, '22课 tp5 bbs展示页字段处理完善', 30, 1752, NULL, '', 1510901665, 1531468588),
(62, '171.8.154.242', '', 23, 'http://gudq.qiniudn.com/23%E8%AF%BE%20%20%20tp5%20Bbs%E8%AF%A6%E6%83%85%E9%A1%B5%E7%9A%84%E5%BF%AB%E9%80%9F%E5%AE%9E%E7%8E%B0%E5%85%A5%E9%97%A8.mp4', '', 'tp5', '0.01', 0, '23课 tp5 bbs详情页的快速实现入门', 30, 72, NULL, '', 1510901721, 1531468607),
(63, '27.217.88.157', '', 24, 'http://gudq.qiniudn.com/24%E8%AF%BE%20%20%20tp5%20%E4%B8%8A%E4%B8%80%E9%A1%B5%E5%92%8C%E4%B8%8B%E4%B8%80%E9%A1%B5%E7%9A%84%E5%BF%AB%E9%80%9F%E5%AE%9E%E7%8E%B0%E5%85%A5%E9%97%A8.mp4', '', 'tp5 分页 上一页 下一页', '0.01', 0, '24课 tp5 上一页和下一页的快速实现入门', 30, 87, NULL, '', 1510901771, 1531897747),
(64, '171.8.154.242', '', 25, 'http://gudq.qiniudn.com/25%E8%AF%BE%20%20tp5%20Bbs%E8%AF%A6%E6%83%85%E9%A1%B5%E7%95%8C%E9%9D%A2%E4%B8%8E%E5%89%8D%E7%AB%AFBootstap%E5%AF%B9%E6%8E%A5%20.mp4', '', 'tp5 bbs Bootstrap', '0.01', 0, '25课  tp5 bbs详情页界面与前端bootstrap对接', 30, 67, NULL, '', 1510901812, 1531468609),
(65, '40.77.167.90', '', 26, 'http://gudq.qiniudn.com/26%E8%AF%BE%20%20%20tp5%20%20%E6%A8%A1%E5%9E%8B%E5%BF%AB%E9%80%9F%E4%B8%8A%E6%89%8B%20%E6%9F%A5%E5%87%BA%E4%B8%80%E4%B8%AA%E7%AC%91%E8%84%B8.mp4', '26课   tp5  模型快速上手 查出一个笑脸', 'tp5 模型 model', '0.01', 0, '26课   tp5  模型快速上手 查出一个笑脸', 30, 121, NULL, '', 1510901856, 1531885539),
(66, '93.158.161.62', '', 27, 'http://7o50vy.com1.z0.glb.clouddn.com/27%E8%AF%BE%20%20%20tp5%20%20%E6%A8%A1%E5%9E%8B%E7%9A%844%E7%A7%8D%E8%B0%83%E7%94%A8%E6%96%B9%E6%B3%95%20%204%E7%A7%8D%E6%96%B9%E5%BC%8F%E6%9F%A5%E8%AF%A2%E5%87%BA%E7%AC%91%E8%84%B8%E6%9D%A5.mp4', '27 课   tp5  模型的4种调用方法  4种方式查询出笑脸来', 'tp5 商城', '0.01', 0, '27 课   tp5  模型的4种调用方法  4种方式查询出笑脸来', 30, 102, NULL, '', 1510901887, 1532147670),
(67, '121.35.184.97', '', 28, 'http://gudq.qiniudn.com/28%E8%AF%BE%20%20%20tp5%E9%A1%B9%E7%9B%AE%E5%8F%91%E5%B8%83%E4%B8%8A%E7%BA%BF%E5%BF%AB%E9%80%9F%E5%85%A5%E9%97%A8%20%E5%87%86%E5%A4%87%E5%B7%A5%E4%BD%9C.mp4', '', 'tp5 商城 上线', '0.01', 0, '28课   tp5项目发布上线快速入门 准备工作', 30, 82, NULL, '28课   tp5项目发布上线快速入门 准备工作', 1510901925, 1531653939),
(68, '144.52.41.41', '', 29, 'http://gudq.qiniudn.com/29%E8%AF%BE%20%20%20tp5%20%20%E9%A1%B9%E7%9B%AE%E5%8F%91%E5%B8%83%E4%B8%8A%E7%BA%BF%E5%BF%AB%E9%80%9F%E5%85%A5%E9%97%A8%20%E6%88%90%E5%8A%9F%E4%B8%8A%E7%BA%BF.mp4', '', 'tp5 上线 发布', '0.01', 0, '29课   tp5  项目发布上线快速入门 成功上线', 30, 66, NULL, '29课   tp5  项目发布上线快速入门 成功上线', 1510901983, 1531740257),
(69, '223.73.123.214', '', 30, 'http://gudq.qiniudn.com/30%E8%AF%BE%20%20%20tp5%20%E7%AC%AC%E4%B8%89%E6%96%B9API%E6%8E%A5%E5%8F%A3%E8%B0%83%E7%94%A8%E5%BF%AB%E9%80%9F%E5%85%A5%E9%97%A8%20%E4%BA%8C%E7%BB%B4%E7%A0%81%E6%8E%A5%E5%8F%A3%E5%AE%9E%E7%8E%B0%20.mp4', '', 'tp5 api 二维码  接口 第三方', '0.01', 0, '30课   tp5 第三方api接口调用快速入门 二维码接口实现', 30, 295, NULL, '30课   tp5 第三方api接口调用快速入门 二维码接口实现', 1510902059, 1532190737),
(70, '171.8.154.242', '', 31, 'http://gudq.qiniudn.com/31%E8%AF%BE%20%20%20tp5%20%E7%AC%AC%E4%B8%89%E6%96%B9API%E6%8E%A5%E5%8F%A3%E8%B0%83%E7%94%A8%E5%BF%AB%E9%80%9F%E5%85%A5%E9%97%A8%20%E5%9F%9F%E5%90%8D%E6%9F%A5%E8%AF%A2%E6%8E%A5%E5%8F%A3%E5%AE%9E%E7%8E%B0%20.mp4', '', 'tp5 api thinkphp5 第三方 域名 接口 ', '0.01', 0, '31课   tp5 第三方api接口调用快速入门 域名查询接口实现 ', 30, 98, NULL, '', 1510902120, 1531469127),
(71, '101.227.131.219', '', 32, 'http://gudq.qiniudn.com/32%E8%AF%BE%20%20%20tp5%20%20%E7%AC%AC%E4%B8%89%E6%96%B9API%E6%8E%A5%E5%8F%A3%E8%B0%83%E7%94%A8%E5%BF%AB%E9%80%9F%E5%85%A5%E9%97%A8%20%E5%BE%AE%E5%8D%9A%E7%99%BB%E5%BD%95%E6%8E%A5%E5%8F%A3%E5%85%A5%E9%97%A8%E5%BC%80%E5%8F%91%E5%AE%9E%E6%88%98%20%E5%87%86%E5%A4%87%E5%B7%A5%E4%BD%9C%20.mp4', '', 'tp5 微博 微博登录 api 接口 ', '0.01', 0, '32课   tp5  第三方api接口调用快速入门 微博登录接口入门开发实战 准备工作', 30, 123, NULL, '', 1510902178, 1531794320),
(72, '66.249.64.17', '', 33, 'http://gudq.qiniudn.com/33%E8%AF%BE%20%20%20tp5%20%20%20%E5%BE%AE%E5%8D%9A%E7%99%BB%E5%BD%95%E6%8E%A5%E5%8F%A3%E5%85%A5%E9%97%A8%E5%BC%80%E5%8F%91%E4%B8%8A%E6%89%8B%204-1%E8%8E%B7%E5%8F%96code%E5%80%BC%20.mp4', '', 'tp5 api  接口 微博 微博登录', '0.01', 0, '33课   tp5   微博登录接口入门开发上手 4-1获取code值', 30, 69, NULL, '33课   tp5   微博登录接口入门开发上手 4-1获取code值', 1510902227, 1532126194),
(73, '112.14.72.196', '', 33, 'http://gudq.qiniudn.com/33%E8%AF%BE%20%20%20tp5%20%20%20%E5%BE%AE%E5%8D%9A%E7%99%BB%E5%BD%95%E6%8E%A5%E5%8F%A3%E5%85%A5%E9%97%A8%E5%BC%80%E5%8F%91%E4%B8%8A%E6%89%8B%204-2%E8%8E%B7%E5%8F%96%E5%94%AF%E4%B8%80%E9%92%A5%E5%8C%99.mp4', '', 'tp5 微博 api 接口', '0.01', 0, '33课   tp5   微博登录接口入门开发上手 4-2获取唯一钥匙.', 30, 89, NULL, '33课   tp5   微博登录接口入门开发上手 4-2获取唯一钥匙.', 1510902281, 1532062334),
(74, '110.53.16.94', '', 88, 'http://gudq.qiniudn.com/88%E8%AF%BE%20%E5%95%86%E5%93%81%E7%9A%84%E5%90%8E%E5%8F%B0%E7%BC%96%E8%BE%91%E4%BF%AE%E6%94%B9%20%E6%98%BE%E7%A4%BA%E4%BF%AE%E6%94%B9%E5%86%85%E5%AE%B9.mp4', '', 'tp5 商城', '0.10', 0, '88课 商品的后台编辑修改 显示修改内容', 30, 42, NULL, '', 1510903638, 1531550193),
(75, '171.8.154.242', '', 87, 'http://gudq.qiniudn.com/87%E8%AF%BE%20%E5%95%86%E5%9F%8E1.0%E7%89%88%E4%B8%8A%E7%BA%BF%E6%BC%94%E7%A4%BA.mp4', '', 'tp5 商城', '0.10', 0, '87课 商城1.0版上线演示', 30, 55, NULL, '', 1510903672, 1531472692),
(76, '171.8.154.242', '', 86, 'http://gudq.qiniudn.com/86%E8%AF%BE%20%E5%95%86%E5%9F%8E%E6%94%AF%E4%BB%98%E4%B8%8A%E7%BA%BF%E6%94%AF%E4%BB%98%E5%AE%9E%E6%88%98%E6%B5%8B%E8%AF%95.mp4', '', 'tp5 商城 支付 支付宝 ', '0.10', 0, '86课 商城支付上线支付实战测试', 30, 45, NULL, '', 1510903854, 1531472694),
(77, '171.8.154.242', '', 85, 'http://gudq.qiniudn.com/85%E8%AF%BE%20%E6%94%AF%E4%BB%98%E6%88%90%E5%8A%9F%E5%90%8E%E8%AE%A2%E5%8D%95%E5%85%A5%E5%BA%93%E6%93%8D%E4%BD%9C.mp4', '', 'tp5 商城 支付 订单 支付宝', '0.10', 0, '85课 支付成功后订单入库操作', 30, 77, NULL, '', 1510903893, 1531472704),
(78, '113.195.228.17', '', 84, 'http://gudq.qiniudn.com/84%E8%AF%BE%20%E6%9C%AA%E6%B3%A8%E5%86%8C%E4%BC%9A%E5%91%98%E6%97%B6%E8%87%AA%E5%8A%A8%E5%AE%9E%E7%8E%B0%E6%94%AF%E4%BB%98%E5%B9%B6%E6%B3%A8%E5%86%8C%E7%99%BB%E5%BD%95.mp4', '', 'tp5 商城 支付 自动注册 登录 注册', '0.10', 0, '84课 未注册会员时自动实现支付并注册登录', 30, 49, NULL, '', 1510903947, 1531538630),
(79, '171.8.154.242', '', 83, 'http://gudq.qiniudn.com/83%E8%AF%BE%20%E6%B3%A8%E9%94%80%E9%80%80%E5%87%BA%E7%99%BB%E5%BD%95%E7%9A%84%E7%AE%80%E5%8D%95%E5%AE%9E%E7%8E%B0%E6%BC%94%E7%A4%BA.mp4', '', 'tp5 商城 注册 退出  登录', '0.10', 0, '83课 注销退出登录的简单实现演示', 30, 63, NULL, '', 1510904006, 1531472690),
(80, '101.242.123.50', '', 82, 'http://gudq.qiniudn.com/82%E8%AF%BE%20%E4%BC%9A%E5%91%98%E7%99%BB%E5%BD%95%E5%90%8E%E7%9A%84%E8%B4%AD%E4%B9%B0%E8%AE%BE%E7%BD%AE.mp4', '82课 会员登录后的购买设置', 'tp5 商城 会员 登录 购买', '0.10', 0, '82课 会员登录后的购买设置', 30, 60, NULL, '', 1510904047, 1532070749),
(81, '101.242.123.50', '', 81, 'http://gudq.qiniudn.com/81%E8%AF%BE%20%E5%90%8E%E5%8F%B0%E7%AE%A1%E7%90%86%E5%91%98%E7%99%BB%E5%BD%95%E9%AA%8C%E8%AF%81%E7%AE%80%E6%98%93%E5%AE%9E%E7%8E%B0.mp4', '', 'tp5 商城 后台 登录 ', '0.10', 0, '81课 后台管理员登录验证简易实现', 30, 76, NULL, '', 1510904111, 1532070729),
(82, '27.217.88.157', '', 80, 'http://gudq.qiniudn.com/80%E8%AF%BE%20%E5%AE%8C%E5%96%84%E5%AE%9E%E7%8E%B0%E6%89%8B%E6%9C%BA%E7%9F%AD%E4%BF%A1%E7%99%BB%E5%BD%95%E4%B8%8E%E6%B3%A8%E5%86%8C.mp4', '', 'tp5 商城', '0.10', 0, '80课 完善实现手机短信登录与注册', 30, 82, NULL, '', 1510904142, 1532073404),
(83, '171.8.154.242', '', 79, 'http://gudq.qiniudn.com/79%E8%AF%BE%20Validate%E9%AA%8C%E8%AF%81%E5%99%A8%E9%94%99%E8%AF%AF%E6%8F%90%E7%A4%BA%E4%BF%A1%E6%81%AF%E4%BC%98%E5%8C%96.mp4', '', 'tp5 商城 验证器  Validate', '0.10', 0, '79课 validate验证器错误提示信息优化', 30, 53, NULL, '', 1510904197, 1531472628),
(84, '40.77.167.93', '', 78, 'http://gudq.qiniudn.com/78%E8%AF%BE%20Validate%E9%AA%8C%E8%AF%81%E5%99%A8%E9%AA%8C%E8%AF%81%E6%9F%90%E4%B8%AA%E5%AD%97%E6%AE%B5%E6%95%B0%E6%8D%AE%E5%BA%93%E6%98%AF%E5%90%A6%E5%AD%98%E5%9C%A8.mp4', '', 'tp5 商城 验证器  Validate', '0.10', 0, '78课 validate验证器验证某个字段数据库是否存在', 30, 64, NULL, '', 1510904243, 1532063660),
(85, '171.8.154.242', '', 77, 'http://gudq.qiniudn.com/77%E8%AF%BE%20Validate%E9%AA%8C%E8%AF%81%E5%99%A8%E7%9A%84%E5%BF%AB%E9%80%9F%E5%85%A5%E9%97%A8.mp4', '', 'tp5 商城 验证器  Validate', '0.10', 0, '77课 validate验证器的快速入门.', 30, 64, NULL, '', 1510904314, 1531472629),
(86, '113.77.211.233', '', 76, 'http://gudq.qiniudn.com/76%E8%AF%BE%20%E7%99%BB%E5%BD%95%E5%92%8C%E6%B3%A8%E5%86%8C%E6%A0%B8%E5%BF%83%E4%BB%A3%E7%A0%81%E5%AE%9E%E7%8E%B0.mp4', '76课 登录和注册核心代码实现', 'tp5 商城 登录 注册', '0.10', 0, '76课 登录和注册核心代码实现', 30, 94, NULL, '', 1510904368, 1532079087),
(87, '171.8.154.242', '', 75, 'http://gudq.qiniudn.com/75%E8%AF%BE%20%E7%99%BB%E5%BD%95%E5%92%8C%E6%B3%A8%E5%86%8C%E9%A1%B5%E9%9D%A2%E7%9A%84%E6%A8%A1%E6%9D%BF%E8%AE%BE%E7%BD%AE.mp4', '', 'tp5 商城 登录 注册 模板', '0.10', 0, '75课 登录和注册页面的模板设置', 30, 67, NULL, '', 1510904412, 1531472625),
(88, '14.153.79.145', '', 73, 'http://gudq.qiniudn.com/73%E8%AF%BE%20Sessoin%E7%9A%84%E4%BD%BF%E7%94%A8%E5%85%A5%E9%97%A8.mp4', '73课 Sessoin的使用入门', 'tp5 商城 sessoin', '0.10', 0, '73课 sessoin的使用入门', 30, 78, NULL, '', 1510904439, 1531478536),
(89, '171.8.154.242', '', 72, 'http://gudq.qiniudn.com/72%E8%AF%BE%20%E5%89%8D%E5%8F%B0%E5%A4%B4%E9%83%A8%E5%92%8C%E5%B0%BE%E9%83%A8%E6%A8%A1%E6%9D%BF%E6%96%87%E4%BB%B6%E5%88%86%E7%A6%BB%E5%85%B1%E7%94%A8.mp4', '72课 前台头部和尾部模板文件分离共用', 'tp5 商城 模板 ', '0.10', 0, '72课 前台头部和尾部模板文件分离共用', 30, 45, NULL, '', 1510905221, 1531472624),
(90, '116.7.99.4', '', 71, 'http://gudq.qiniudn.com/71%E8%AF%BE%20%E6%94%AF%E4%BB%98%E5%AE%9D%E5%AE%8C%E6%88%90%E5%AF%B9%E5%BA%94%E5%95%86%E5%93%81%E5%AF%B9%E5%BA%94%E4%BB%B7%E6%A0%BC.mp4', '71课 支付宝完成对应商品对应价格', 'tp5 商城  支付 商品 ', '0.10', 0, '71课 支付宝完成对应商品对应价格', 30, 52, NULL, '', 1510905279, 1528877426),
(91, '61.151.226.67', '', 70, 'http://gudq.qiniudn.com/70%E8%AF%BE%20%E6%94%AF%E4%BB%98%E5%AE%9D%E6%95%B4%E5%90%88tp5%E5%AE%9E%E4%BE%8B%E6%BC%94%E7%A4%BA%20%E6%95%B4%E5%90%88%E8%A6%81%E7%82%B9%E5%88%86%E4%BA%AB.mp4', '', 'tp5 商城 支付宝 ', '0.10', 0, '70课 支付宝整合tp5实例演示 整合要点分享', 30, 73, NULL, '', 1510905323, 1529226098),
(92, '14.120.117.238', '', 69, 'http://gudq.qiniudn.com/69%E8%AF%BE%20%E6%94%AF%E4%BB%98%E5%AE%9D%E6%94%AF%E4%BB%98demo%E6%8E%A5%E5%8F%A3%E9%85%8D%E7%BD%AE%E6%BC%94%E7%A4%BA.mp4', '69课 支付宝支付demo接口配置演示', 'tp5 商城 支付宝 api 接口', '0.10', 0, '69课 支付宝支付demo接口配置演示', 30, 121, NULL, '', 1510905374, 1532182261),
(93, '27.17.151.248', '', 68, 'http://gudq.qiniudn.com/68%E8%AF%BE%20%E5%89%8D%E5%8F%B0%E5%B1%95%E7%A4%BA%E6%92%AD%E6%94%BE%E4%B8%8A%E4%BC%A0%E7%9A%84%E8%A7%86%E9%A2%91.mp4', '', 'tp5 商城 前台 视频 上传', '0.10', 0, '68课 前台展示播放上传的视频', 30, 70, NULL, '', 1510905456, 1531571894),
(94, '171.8.154.242', '', 67, 'http://gudq.qiniudn.com/67%E8%AF%BE%20%E4%B8%8A%E4%BC%A0%E6%96%87%E4%BB%B6%E8%B7%AF%E5%BE%84%E5%AD%98%E5%85%A5%E6%95%B0%E6%8D%AE%E5%BA%93.mp4', '67课 上传文件路径存入数据库', 'tp5 商城 上传 数据库', '0.10', 0, '67课 上传文件路径存入数据库', 30, 64, NULL, '', 1510905501, 1531472519),
(95, '171.8.154.242', '', 66, 'http://gudq.qiniudn.com/66%E8%AF%BE%20%E4%B8%8A%E4%BC%A0%E5%8A%9F%E8%83%BD%E8%9E%8D%E5%90%88%E5%88%B0%E8%A1%A8%E5%8D%95%E9%87%8C.mp4', '66课 上传功能融合到表单里', 'tp5 商城 上传 ', '0.10', 0, '66课 上传功能融合到表单里', 30, 61, NULL, '', 1510905560, 1531472519),
(96, '66.249.64.16', '', 65, 'http://gudq.qiniudn.com/65%E8%AF%BE%20%E4%BF%AE%E6%94%B9php%E4%B8%8A%E4%BC%A02M%E7%9A%84%E9%99%90%E5%88%B6.mp4', '65课 修改php上传2M的限制', 'tp5 商城 上传 ', '0.10', 0, '65课 修改php上传2m的限制', 30, 69, NULL, '', 1510905603, 1532048796),
(97, '171.8.154.242', '', 64, 'http://gudq.qiniudn.com/64%E8%AF%BE%20%E5%95%86%E5%93%81%E7%9A%84%E5%9B%BE%E7%89%87%20%E8%A7%86%E9%A2%91%20%E7%AE%80%E5%8D%95%E5%AE%9E%E7%8E%B0%E4%B8%8A%E4%BC%A0.mp4', '64课 商品的图片 视频 简单实现上传', 'tp5 商城 视频 上传', '0.10', 0, '64课 商品的图片 视频 简单实现上传', 30, 122, NULL, '', 1510905688, 1531472518),
(98, '171.8.154.242', '', 63, 'http://gudq.qiniudn.com/63%E8%AF%BE%20%E5%95%86%E5%93%81%E5%88%A0%E9%99%A4%20%E6%A8%A1%E5%9E%8B%E5%88%A0%E9%99%A4%E6%96%B9%E6%B3%95%E8%B0%83%E7%94%A8.mp4', '63课 商品删除 模型删除方法调用', 'tp5 商城 模型 删除 model', '0.10', 0, '63课 商品删除 模型删除方法调用', 30, 51, NULL, '', 1510906079, 1531472518),
(99, '157.55.39.206', '', 62, 'http://gudq.qiniudn.com/62%E8%AF%BE%20%E5%95%86%E5%93%81%E5%88%A0%E9%99%A4%20%E6%A8%A1%E6%80%81%E6%A1%86%E5%BC%B9%E5%87%BA%E7%A1%AE%E8%AE%A4.mp4', '', 'tp5 商城 模态框 商品删除', '0.10', 0, '62课 商品删除 模态框弹出确认.', 30, 82, NULL, '', 1510906202, 1529665638),
(100, '93.158.161.62', '', 61, 'http://7o50vy.com1.z0.glb.clouddn.com/61%E8%AF%BE%20%E5%95%86%E5%93%81%E5%8F%91%E5%B8%83%E7%9A%84%E7%AE%80%E5%8D%95%E5%AE%9E%E7%8E%B0%20new.mp4', '', 'tp5 商城 商品发布', '0.10', 0, '61课 商品发布的简单实现.', 30, 86, NULL, '', 1510906240, 1532213727),
(101, '171.8.154.242', '', 60, 'http://7o50vy.com1.z0.glb.clouddn.com/60%E8%AF%BE%20%E5%95%86%E5%9F%8E%E5%90%8E%E5%8F%B0%20%20%E5%B5%8C%E5%A5%97%E4%B8%80%E4%B8%AA%E6%A8%A1%E6%9D%BF.mp4', '60课 商城后台  嵌套一个模板', 'tp5 商城 后台 模板', '0.10', 0, '60课 商城后台  嵌套一个模板', 30, 43, NULL, '', 1510906291, 1531472517),
(102, '171.8.154.242', '', 59, 'http://7o50vy.com1.z0.glb.clouddn.com/59%E8%AF%BE%20%20%20tp5%20%E7%94%A8Include%E6%8A%8A%E5%8C%85%E5%90%AB%E6%96%87%E4%BB%B6%E5%BC%95%E5%85%A5.mp4', '59课 用Include把包含文件引入', 'tp5 商城 包含文件 include', '0.10', 0, '59课 用include把包含文件引入', 30, 56, NULL, '', 1510908529, 1531472447),
(103, '171.8.154.242', '', 58, 'http://7o50vy.com1.z0.glb.clouddn.com/58%E8%AF%BE%20%20%20tp5%20%E8%B0%83%E7%94%A8CSS%E5%92%8CJS%E6%96%87%E4%BB%B6%E5%86%99%E6%B3%95.mp4', '58课 tp5调用CSS和JS文件写法', 'tp5 商城 css js 调用', '0.10', 0, '58课 tp5调用css和js文件写法', 30, 51, NULL, '', 1510908592, 1531472435),
(104, '157.55.39.141', '', 57, 'http://7o50vy.com1.z0.glb.clouddn.com/57%E8%AF%BE%20%20%20tp5%20%E5%90%8E%E5%8F%B0%E9%A6%96%E9%A1%B5%E8%AE%BE%E7%BD%AE%20%E8%B0%83%E7%94%A8%E5%9B%BE%E7%89%87%E6%96%87%E4%BB%B6%E5%86%99%E6%B3%95.mp4', '	\r\n57课 tp5 后台首页设置 调用图片文件写法.mp4', 'tp5 商城 调用图片', '0.10', 0, '57课 tp5 后台首页设置 调用图片文件写法.mp4', 30, 74, NULL, '', 1510908973, 1531801489),
(105, '113.26.222.30', '', 1008690, '', '恭喜您开通了VIP会员！ \r\n\r\n全部入门课程已帮你开通学习权限！ 可以尽情学习教程了^_^\r\n\r\n\r\nThinkPHP5 入门培训 VIP群：423922212    加群验证码是：  您手机号 + 606\r\n欢迎加入ThinkPhp5免费培训-入门，群号码：189250799\r\n\r\n我的微信号:18210787405 加我拉你进thinkphp5微信群\r\n', '群 vip', '0.10', 0, '开通VIP会员 32元/月 ', 30, 118, NULL, '购买此链接后 ，即可自动开通VIP功能！\r\n\r\n\r\n免费培训qq群:欢迎加入thinkphp5免费培训-入门，群号码：189250799\r\n\r\n\r\n任何疑问咨询我qq 250285636  ', 1511145928, 1531272927),
(213, '183.48.246.9', '', 166, '166', '', ' 安全 修改COOKIE 登录 漏洞 解决方法', '0.10', 0, '166课 安全 修改COOKIE登录网站漏洞 解决方法', 30, 36, NULL, '', 1515138246, 1531815883),
(106, '171.8.154.242', '', 33, 'http://gudq.qiniudn.com/33%E8%AF%BE%20%20%20tp5%20%20%20%E5%BE%AE%E5%8D%9A%E7%99%BB%E5%BD%95%E6%8E%A5%E5%8F%A3%E5%85%A5%E9%97%A8%E5%BC%80%E5%8F%91%E4%B8%8A%E6%89%8B%204-3%E8%8E%B7%E5%8F%96%E4%BF%A1%E6%81%AF.mp4', '	\r\n33课   tp5   微博登录接口入门开发上手 4-3获取信息.mp4', 'tp5 商城 微博 登录 接口开发 api 地方', '0.01', 0, '33课   tp5   微博登录接口入门开发上手 4-3获取信息', 30, 56, NULL, '', 1511159731, 1531469157),
(107, '183.48.246.9', '', 32, 'http://gudq.qiniudn.com/33%E8%AF%BE%20%20%20tp5%20%20%E5%BE%AE%E5%8D%9A%E7%99%BB%E5%BD%95%E6%8E%A5%E5%8F%A3%E5%85%A5%E9%97%A8%E5%BC%80%E5%8F%91%E4%B8%8A%E6%89%8B%204-0%E6%80%BB%E4%BD%93%E6%B5%81%E7%A8%8B%E4%BB%8B%E7%BB%8D.mp4', '', 'tp5 api  接口 微博 微博登录 ', '0.01', 0, '33课   tp5  微博登录接口入门开发上手 4-0总体流程介绍', 30, 92, NULL, '', 1511159844, 1531794267),
(108, '183.48.246.9', '', 33, 'http://gudq.qiniudn.com/33%E8%AF%BE%20%20%20tp5%20%E5%BE%AE%E5%8D%9A%E7%99%BB%E5%BD%95%E6%8E%A5%E5%8F%A3%E5%85%A5%E9%97%A8%E5%BC%80%E5%8F%91%E4%B8%8A%E6%89%8B%204-4%E5%86%99%E5%85%A5%E6%A8%A1%E6%9D%BF.mp4', '', 'tp5 api  接口 微博 微博登录', '0.01', 0, '33课   tp5 微博登录接口入门开发上手 4-4写入模板.mp4', 30, 70, NULL, '', 1511159918, 1531794322),
(109, '182.200.51.175', '', 34, 'http://gudq.qiniudn.com/34%E8%AF%BE%20%20%20tp5%20%20API%E6%8E%A5%E5%8F%A3%E5%BC%80%E5%8F%91%E5%BF%AB%E9%80%9F%E5%85%A5%E9%97%A8%20file_get_contents%20.mp4', '	\r\n34课   tp5  API接口开发快速入门 file_get_contents ', 'tp5 商城 api 接口  file_get_contents', '0.01', 0, '34课   tp5  api接口开发快速入门 get请求', 30, 105, NULL, '', 1511160081, 1532007237),
(110, '183.48.246.9', '', 35, 'http://gudq.qiniudn.com/35%E8%AF%BE%20%20%20tp5%20%20API%E6%8E%A5%E5%8F%A3%E5%BC%80%E5%8F%91%E5%BF%AB%E9%80%9F%E5%85%A5%E9%97%A8%20%20Curl.mp4', '', 'tp5 api  接口 curl', '0.01', 0, '35课   tp5  api接口开发快速入门  curl', 30, 76, NULL, '', 1511160283, 1531794355),
(111, '101.132.97.6', '', 36, 'http://gudq.qiniudn.com/36%E8%AF%BE%20%20%20tp5%20%20%E6%A8%A1%E5%9E%8B%E5%B7%A5%E4%BD%9C%E5%AE%89%E6%8E%92%20%E5%8E%9F%E7%90%86%E5%85%A5%E9%97%A8%E8%AE%B2%E8%A7%A3.mp4', '', 'tp5 模型 model 原理', '0.01', 0, '36课   tp5  模型工作安排 原理入门讲解', 30, 89, NULL, '', 1511160336, 1531545310),
(112, '117.158.207.228', '', 37, 'http://gudq.qiniudn.com/37%E8%AF%BE%20%20%20tp5%20%E6%A8%A1%E5%9E%8B%E6%9F%A5%E8%AF%A2%E6%95%B0%E6%8D%AE%E7%9A%84%E6%96%B9%E6%B3%95%E6%BC%94%E7%A4%BA.mp4', '', 'tp5 模型 model 查询', '0.01', 0, '37课   tp5 模型查询数据的方法演示', 30, 96, NULL, '', 1511160376, 1531968629),
(113, '171.8.154.242', '', 38, 'http://gudq.qiniudn.com/38%E8%AF%BE%20%20%20tp5%20%E6%A8%A1%E5%9E%8B%E5%A2%9E%E5%8A%A0%E6%95%B0%E6%8D%AE%E7%9A%84%E6%96%B9%E6%B3%95%E6%BC%94%E7%A4%BA.mp4', '38课   tp5 模型增加数据的方法演示.', 'tp5 模型 model 增加', '0.01', 0, '38课   tp5 模型增加数据的方法演示.', 30, 56, NULL, '', 1511160439, 1531469178),
(114, '40.77.167.93', '', 39, 'http://gudq.qiniudn.com/39%E8%AF%BE%20%20%20tp5%20%20%E6%A8%A1%E5%9E%8B%E6%9B%B4%E6%96%B0%E6%95%B0%E6%8D%AE%E7%9A%84%E6%96%B9%E6%B3%95%E6%BC%94%E7%A4%BA.mp4', '', 'tp5 模型 model 更新 update', '0.01', 0, '39课   tp5  模型更新数据的方法演示', 30, 51, NULL, '', 1511160516, 1531937063),
(115, '171.8.154.242', '', 40, 'http://gudq.qiniudn.com/40%E8%AF%BE%20%20%20tp5%20%20%E6%A8%A1%E5%9E%8B%E5%88%A0%E9%99%A4%E6%95%B0%E6%8D%AE%E7%9A%84%E6%96%B9%E6%B3%95%E6%BC%94%E7%A4%BA.mp4', '', 'tp5 模型 model 删除', '0.01', 0, '40课   tp5  模型删除数据的方法演示', 30, 54, NULL, '', 1511160567, 1531469209),
(116, '207.46.13.182', '', 41, 'http://gudq.qiniudn.com/41%E8%AF%BE%20%20%20tp5%20%20%E6%A8%A1%E5%9E%8B%E8%BD%AF%E5%88%A0%E9%99%A4%20%E9%85%8D%E7%BD%AE%E6%96%B9%E6%B3%95.mp4', '', 'tp5 模型 软删除 model', '0.01', 0, '41课   tp5  模型软删除 配置方法', 30, 61, NULL, '', 1511160621, 1531854590),
(117, '1.89.88.229', '', 42, 'http://gudq.qiniudn.com/42%E8%AF%BE%20%20%20tp5%20%20%E6%A8%A1%E5%9E%8B%E8%BD%AF%E5%88%A0%E9%99%A4%20%E4%BD%BF%E7%94%A8%E6%BC%94%E7%A4%BA.mp4', '', 'tp5 模型  model 软删除', '0.01', 0, '42课   tp5  模型软删除 使用演示', 30, 48, NULL, '', 1511160662, 1531665604),
(118, '40.77.167.93', '', 43, 'http://gudq.qiniudn.com/43%E8%AF%BE%20%20%20tp5%20%20%E6%A8%A1%E5%9E%8B%E5%B8%AE%E5%8A%A9%E5%8A%A0%E6%97%B6%E9%97%B4%E6%88%B3%E5%8A%9F%E8%83%BD.mp4', '', 'tp5 模型 model 时间戳', '0.01', 0, ' 43课   tp5  模型帮助加时间戳功能', 30, 66, NULL, '', 1511160736, 1532196037),
(119, '171.8.154.242', '', 44, 'http://gudq.qiniudn.com/44%E8%AF%BE%20%20%20tp5%20%20%E7%94%A8%E6%A8%A1%E5%9E%8B%20%E5%AE%9E%E7%8E%B0%E5%88%86%E9%A1%B5.mp4', '', 'tp5 模型 分页 model', '0.01', 0, '44课   tp5  用模型 实现分页', 30, 60, NULL, '', 1511160778, 1531472287),
(120, '171.8.154.242', '', 45, 'http://gudq.qiniudn.com/45%E8%AF%BE%20%20%20tp5%20%20%E6%A8%A1%E5%9E%8B%E7%9A%84%E5%8F%88%E4%B8%80%E4%B8%AA%E5%8A%9F%E8%83%BD.mp4', '45课   tp5  模型的又一个功能 ', 'tp5 模型 model 获取器', '0.01', 0, '45课   tp5  模型的又一个功能 获取器', 30, 52, NULL, '', 1511160869, 1531472288),
(121, '101.132.97.6', '', 46, 'http://gudq.qiniudn.com/46%E8%AF%BE%20%20%20tp5%20%20%E6%A8%A1%E5%9E%8B%E7%9A%84%E4%BF%AE%E6%94%B9%E5%99%A8.mp4', '', 'tp5 模型 model 修改器', '0.01', 0, '46课   tp5  模型的修改器', 30, 47, NULL, '', 1511160910, 1531545310),
(122, '207.46.13.44', '', 47, 'http://gudq.qiniudn.com/47%E8%AF%BE%20%20%20tp5%20%20%E6%A8%A1%E5%9E%8B%E7%9A%84%E8%87%AA%E5%8A%A8%E5%AE%8C%E6%88%90.mp4', '', 'tp5 模型 model 自动完成', '0.01', 0, '47课   tp5  模型的自动完成', 30, 47, NULL, '', 1511160964, 1531736680),
(123, '117.179.98.147', '', 48, 'http://gudq.qiniudn.com/48%E8%AF%BE%20%20%20tp5%20%20%E6%94%AF%E4%BB%98%E5%AE%9D%E6%94%AF%E4%BB%98%20%E5%BF%AB%E9%80%9F%E4%B8%8A%E6%89%8B%E8%AF%BE.mp4', '', 'tp5 支付宝 api 支付 接口', '0.01', 0, '48课   tp5  支付宝支付 快速上手课', 30, 174, NULL, '', 1511161009, 1532004009),
(124, '171.8.154.242', '', 49, 'http://gudq.qiniudn.com/49%E8%AF%BE%20%20%20tp5%20%20%E7%9F%AD%E4%BF%A1%E9%AA%8C%E8%AF%81%E7%99%BB%E5%BD%95%20%E5%BF%AB%E9%80%9F%E4%B8%8A%E6%89%8B%E8%AF%BE.mp4', '', 'tp5 短信 api 第三方', '0.01', 0, '49课   tp5  短信验证登录 快速上手课', 30, 148, NULL, '', 1511161052, 1531472346),
(125, '171.8.154.242', '', 50, 'http://gudq.qiniudn.com/50%E8%AF%BE%20%20%20tp5%20%E5%85%A5%E9%97%A8%E8%AF%BE%E5%B0%8F%E6%80%BB%E7%BB%93.mp4', '', 'tp5 总结', '0.01', 0, '50课 tp5 入门课小总结', 30, 62, NULL, '', 1511161111, 1531472351),
(126, '110.82.109.96', '', 51, 'http://gudq.qiniudn.com/51%E8%AF%BE%20%20%20tp5%20%E7%AE%80%E6%98%93%E5%95%86%E5%9F%8E%E5%88%9B%E5%BB%BA.mp4', '', 'tp5 商城 ', '0.10', 0, '51课 tp5简易商城创建', 30, 127, NULL, '', 1511161151, 1531641034),
(127, '171.8.154.242', '', 52, 'http://gudq.qiniudn.com/52%E8%AF%BE%20%20%20tp5%20URL%E4%B8%AD%E9%9A%90%E8%97%8Fpublic%E7%9B%AE%E5%BD%95.mp4', '', 'tp5 url 隐藏public public', '0.10', 0, '52课 tp5 url中隐藏public目录', 30, 119, NULL, '', 1511161204, 1531472410),
(128, '66.249.64.16', '', 53, 'http://gudq.qiniudn.com/53%E8%AF%BE%20%20%20tp5%20%E5%88%9B%E5%BB%BAshop%E8%A1%A8%20%E8%B0%83%E6%95%B4%E5%90%84%E9%A1%B5%E9%9D%A2%E8%A1%A8%E5%90%8D%E7%A7%B0%E4%B8%80%E8%87%B4.mp4', '53课 tp5 创建shop表 调整各页面表名称一致', 'tp5 商城 表', '0.10', 0, '53课 tp5 创建shop表 调整各页面表名称一致', 30, 99, NULL, '', 1511161242, 1532117974),
(129, '66.249.64.16', '', 54, 'http://gudq.qiniudn.com/54%E8%AF%BE%20%20%20tp5%20%E5%95%86%E5%9F%8E%20%E5%90%8E%E5%8F%B0%E7%AE%A1%E7%90%86%E5%91%98%E6%A8%A1%E5%9D%97%E5%88%9B%E5%BB%BA.mp4', '', 'tp5 商城 后台 管理员 模块', '0.10', 0, '54课 tp5 商城 后台管理员模块创建', 30, 96, NULL, '', 1511161281, 1532132337),
(130, '171.8.154.242', '', 55, 'http://gudq.qiniudn.com/55%E8%AF%BE%20%20%20tp5%20%E5%95%86%E5%9F%8E%E5%90%8E%E5%8F%B0%20%E5%A4%B4%E9%83%A8%E5%AF%BC%E8%88%AA%E5%88%9B%E5%BB%BA.mp4', '55课 tp5 商城后台 头部导航创建  播放地址 http://gudq.qiniudn.com/55%E8%AF%BE%20%20%20tp5%20%E5%95%86%E5%9F%8E%E5%90%8E%E5%8F%B0%20%E5%A4%B4%E9%83%A8%E5%AF%BC%E8%88%AA%E5%88%9B%E5%BB%BA.mp4', 'tp5 商城 后台  头部 ', '0.10', 0, '55课 tp5 商城后台 头部导航创建55', 30, 87, NULL, 'http://gudq.qiniudn.com/55%e8%af%be%20%20%20tp5%20%e5%95%86%e5%9f%8e%e5%90%8e%e5%8f%b0%20%e5%a4%b4%e9%83%a8%e5%af%bc%e8%88%aa%e5%88%9b%e5%bb%ba.mp4', 1511161321, 1531472426),
(131, '171.8.154.242', '', 56, 'http://7o50vy.com1.z0.glb.clouddn.com/56%E8%AF%BE%20%20%20tp5%20%20%E5%95%86%E5%9F%8E%E5%90%8E%E5%8F%B0%20%E5%B7%A6%E4%BE%A7%E8%8F%9C%E5%8D%95%E5%88%9B%E5%BB%BA.mp4', '56课 tp5 商城后台 左侧菜单创建', 'tp5 商城 后台 左侧 菜单', '0.10', 0, '56课 tp5 商城后台 左侧菜单创建', 30, 95, NULL, '', 1511161363, 1531472431),
(132, '171.8.154.242', '', 90, 'http://gudq.qiniudn.com/90%E8%AF%BE%20%E6%A0%87%E7%AD%BE%E5%B5%8C%E5%A5%97%E4%BD%BF%E7%94%A8%E7%A4%BA%E4%BE%8B%20%E8%AF%BB%E5%8F%96%E7%94%A8%E6%88%B7%E8%B4%AD%E4%B9%B0%E8%AE%B0%E5%BD%95.mp4', '', 'tp5 商城 标签', '0.10', 0, '90课 标签嵌套使用示例 读取用户购买记录', 30, 47, NULL, '', 1511161442, 1531472699),
(133, '171.8.154.242', '', 91, 'http://gudq.qiniudn.com/91%E8%AF%BE%20%E4%BF%AE%E6%94%B9%E7%9F%AD%E4%BF%A1%E9%AA%8C%E8%AF%81%20%E4%B8%8B%E4%B8%80%E9%A1%B5%20%E9%AA%8C%E8%AF%81%E7%A0%81%E6%A8%A1%E6%9D%BF%E4%B8%89%E4%B8%AAbug%E6%BC%8F%E6%B4%9E.mp4', '', 'tp5 bug 验证码 ', '0.10', 0, '91课 修改短信验证 下一页 验证码模板三个bug漏洞', 30, 60, NULL, '', 1511161842, 1531472756),
(134, '112.84.65.239', '', 1008692, '', ' ', '', '0.00', 0, '开通腾讯课堂推广权限领取一元现金奖励+推广提成50%', 30, 49, NULL, '<h1 style="font-size: 32px; font-weight: bold; border-bottom: 2px solid rgb(204, 204, 204); padding: 0px 4px 0px 0px; text-align: center; margin: 0px 0px 20px;">获取腾讯课堂推广课程权限，奖励1元现金红包+推广提成50%</h1><p><br/></p><p><br/></p><p><br/></p><h1>第一步：把需要开通权限的qq号码发给我qq 250285636，我帮您开通权限<img src="http://img.baidu.com/hi/bobo/B_0002.gif"/></h1><p><br/></p><p><br/></p><h1>第二步：&nbsp;<span style="font-family: &quot;Times New Roman&quot;; font-size: medium;">登录ke.qq.com后，在【个人中心】-【渠道销售】-【推广课程】，确认有 “郭孟涛” 字样，表示已开通权限。</span><img src="http://img.baidu.com/hi/jx2/j_0071.gif"/></h1><p><span style="font-family: &quot;Times New Roman&quot;; font-size: medium;"><br/></span></p><p><span style="font-family: &quot;Times New Roman&quot;; font-size: medium;"><img src="/ueditor/php/upload/image/20180712/1531366495115626.png" title="1531366495115626.png" alt="QQ图片20180712113424.png"/></span></p><p><span style="font-family: &quot;Times New Roman&quot;; font-size: medium;"><br/></span></p><p><span style="font-family: &quot;Times New Roman&quot;; font-size: medium;"><br/></span></p><h1><span style="font-family: &quot;Times New Roman&quot;; font-size: medium;">第三步：选择某个课程，获取推广链接。进行推广</span></h1><h1><span style="font-family: &quot;Times New Roman&quot;; font-size: medium;"><br/></span></h1><p><span style="font-family: &quot;Times New Roman&quot;; font-size: medium;"><img src="/ueditor/php/upload/image/20180712/1531366672314992.png" title="1531366672314992.png" alt="666777.png"/></span></p><p><span style="font-family: &quot;Times New Roman&quot;; font-size: medium;"><br/></span></p><p><span style="font-family: &quot;Times New Roman&quot;; font-size: medium;"><br/></span></p><h1><span style="font-family:Times New Roman;font-size:16px">例如选择第一个，第一季thinkphp5入门，点“推广销售” 四个字，如下图：</span></h1><h1><span style="font-family:Times New Roman;font-size:16px"><br/></span></h1><p><span style="font-family:Times New Roman;font-size:16px"><img src="/ueditor/php/upload/image/20180712/1531366851810718.png" title="1531366851810718.png" alt="999666.png"/></span></p><p><span style="font-family:Times New Roman;font-size:16px"><br/></span></p><p><span style="font-family:Times New Roman;font-size:16px"><br/></span></p><p><span style="font-family:Times New Roman;font-size:16px"><br/></span></p><h1><span style="font-family:Times New Roman;font-size:16px">第四步：通过分享链接 或二维码 进行 支付：</span></h1><h1><span style="font-family:Times New Roman;font-size:16px"><br/></span></h1><p><span style="font-family:Times New Roman;font-size:16px"><img src="/ueditor/php/upload/image/20180712/1531367122122838.jpg" title="1531367122122838.jpg" alt="111333.jpg"/></span></p><p><span style="font-family:Times New Roman;font-size:16px"><br/></span></p><p><strong><span style="font-family:Times New Roman;font-size:16px">第五步：截图&nbsp; &nbsp;，<span style="font-family: &quot;Times New Roman&quot;; font-size: medium;">在【个人中心】-【渠道销售】-【推广课程】。把截图发给我qq上 或我们的群里，领取<span style="font-family: &quot;Times New Roman&quot;; color: rgb(255, 0, 0); font-size: 24px;">1元</span>现金奖励+课程<span style="font-family: &quot;Times New Roman&quot;; font-size: medium; color: rgb(255, 0, 0);">50%</span>的提成。</span></span></strong></p><p><strong><span style="font-family:Times New Roman;font-size:16px"><span style="font-family: &quot;Times New Roman&quot;; font-size: medium;"><br/></span></span></strong></p><p><strong><span style="font-family:Times New Roman;font-size:16px"><span style="font-family: &quot;Times New Roman&quot;; font-size: medium;">例如：课程19.9元 提成<span style="color: rgb(51, 51, 51); font-family: arial; font-size: 26px; text-align: right; background-color: rgb(252, 253, 255);">9.95</span>元。后期推广，仍然有50%提成，多个订单，多个提成。</span></span></strong></p><p><span style="font-family:Times New Roman;font-size:16px"><span style="font-family: &quot;Times New Roman&quot;; font-size: medium;"><br/></span></span></p><p><span style="font-family:Times New Roman;font-size:16px"><span style="font-family: &quot;Times New Roman&quot;; font-size: medium;"><br/></span></span></p><p><span style="font-family:Times New Roman;font-size:16px"><br/></span></p><p><span style="font-family:Times New Roman;font-size:16px"><img src="/ueditor/php/upload/image/20180712/1531367487102751.png" title="1531367487102751.png" alt="1122336.png"/></span></p><p><span style="font-family:Times New Roman;font-size:16px"><br/></span></p><p><span style="font-family:Times New Roman;font-size:16px"><br/></span></p><p><span style="font-family:Times New Roman;font-size:16px"><br/></span></p><p><span style="font-family:Times New Roman;font-size:16px"><br/></span></p>', 1511255824, 1531756815),
(171, '117.174.95.227', '', 122, 'http://7o50vy.com1.z0.glb.clouddn.com/122%E8%AF%BE%20tp5%E4%BC%9A%E5%91%98%E9%82%80%E8%AF%B7invite%E6%B3%A8%E5%86%8C%E5%8A%9F%E8%83%BD%E7%9A%84%E5%AE%9E%E7%8E%B0%20%E9%82%80%E8%AF%B7%E9%A1%B5%E9%9D%A2.mp4', '', '邀请 注册 ', '0.10', 0, '122课 tp5会员邀请invite注册功能的实现 邀请页面', 30, 38, NULL, '', 1514359444, 1531401040),
(135, '111.206.198.43', '', 1008620, '', '恭喜您签到成功^_^', '扫码签到', '0.10', 0, '扫码签到', 30, 56, NULL, '<p>&nbsp; &nbsp; &nbsp; 连续签到会有奖励奥 &nbsp; &nbsp;</p>', 1511255828, 1532128502),
(215, '207.46.13.140', '', 168, '168', '', '支付宝扫码支付 uc浏览器 支付宝', '0.10', 0, '168课 支付宝扫码支付和uc浏览器手机上调用支付宝app 演示', 30, 35, NULL, '', 1516602355, 1529135638),
(216, '157.55.39.210', '', 169, '169', '', '169课 支付宝扫码支付和uc浏览器手机上调用支付宝app 代码讲解', '0.10', 0, '169课 支付宝扫码支付和uc浏览器手机上调用支付宝app 代码讲解', 30, 37, NULL, '', 1516602393, 1531645119),
(217, '40.77.167.194', '', 170, '170', '', 'VIP独立栏目 设置 分享', '0.10', 0, '170课 VIP独立栏目不同商品的设置 分享', 30, 35, NULL, '', 1516602841, 1528601696),
(136, '223.104.210.77', '', 1008694, '', '百度网盘下载地址：https://pan.baidu.com/s/1cHHAEy', '源文件 商城 源码 课件 手册', '0.10', 0, '【源码】tp5简易商城v2.0版源码 和 入门课1－100课所有相关源文件 及入门手册', 30, 435, NULL, 'tp5简易商城v2.0版源码 和 入门课1－100课所有相关源文件 及入门手册\r\n\r\n', 1512199565, 1527932561),
(137, '171.8.154.242', '', 92, 'http://gudq.qiniudn.com/92%E8%AF%BE%20%E8%B4%AD%E4%B9%B0%E5%90%8E%E6%98%BE%E7%A4%BA%E4%BF%A1%E6%81%AF%E7%9A%84%E8%B0%83%E6%95%B4%20%E4%BD%9C%E4%B8%9A%E9%A2%98.mp4', '', '作业 ', '0.10', 0, '92课 购买后显示信息的调整 作业题.', 30, 44, NULL, '92课 购买后显示信息的调整 作业题.', 1512224568, 1531472760),
(138, '101.242.123.50', '', 93, 'http://gudq.qiniudn.com/93%E8%AF%BE%20%E5%95%86%E5%93%81%E6%90%9C%E7%B4%A2%E5%8A%9F%E8%83%BD%E7%9A%84%E5%AE%9E%E7%8E%B0.mp4', '', 'tp5 商城 搜索 商品搜索', '0.10', 0, '93课 商品搜索功能的实现', 30, 57, NULL, '93课 商品搜索功能的实现', 1512224635, 1532070962),
(139, '101.242.123.50', '', 94, '1', '', 'tp5 商城 vip 会员', '0.10', 0, '94课 商城vip会员的功能实现', 30, 69, NULL, '', 1512224807, 1532071313),
(140, '40.77.167.93', '', 95, 'http://gudq.qiniudn.com/95%E8%AF%BE%20%E5%95%86%E5%9F%8EVIP%E4%BC%9A%E5%91%98%E7%9A%84%E8%87%AA%E5%8A%A8%E5%BC%80%E9%80%9A.mp4', '', 'tp5 商城 vip 自动开通 会员', '0.10', 0, '95课 商城vip会员的自动开通', 30, 55, NULL, '', 1512224871, 1532252714),
(141, '171.8.154.242', '', 96, 'http://7o50vy.com1.z0.glb.clouddn.com/96%E8%AF%BE%20%E5%88%86%E9%A1%B5%E4%BC%A0%E9%80%92url%E8%87%AA%E5%AE%9A%E4%B9%89%E5%8F%82%E6%95%B0.mp4', '', 'tp5 商城 分页 url 参数', '0.10', 0, '96课 分页传递url自定义参数', 30, 57, NULL, '', 1512225000, 1531472765),
(142, '101.242.123.50', '', 97, 'http://gudq.qiniudn.com/97%E8%AF%BE%20Tp5%E4%B8%8EH5%E8%A7%86%E9%A2%91VIDEO%E6%92%AD%E6%94%BE%E6%95%B0%E6%8D%AE%E7%BB%93%E5%90%88%E6%BC%94%E7%A4%BA.mp4', '', 'tp5 商城 h5 video 播放 演示', '0.10', 0, '97课 tp5与h5视频video播放数据结合演示', 30, 61, NULL, '', 1512225054, 1532071876),
(143, '171.8.154.242', '', 98, 'http://gudq.qiniudn.com/98%E8%AF%BE%20%E5%95%86%E5%9F%8E%E8%AE%A2%E5%8D%95%E4%B8%AD%E5%BF%83%E6%A0%8F%E7%9B%AE%E7%9A%84%E5%BF%AB%E9%80%9F%E5%AE%9E%E7%8E%B0.mp4', '', 'tp5 商城 订单中心 订单', '0.10', 0, '98课 商城订单中心栏目的快速实现.', 30, 63, NULL, '', 1512225108, 1531472769),
(144, '40.77.167.135', '', 99, 'http://gudq.qiniudn.com/99%E8%AF%BE%20%E5%95%86%E5%9F%8E2.0%E7%89%88%E5%AE%8C%E6%88%90%E4%B8%8A%E7%BA%BF%E6%89%93%E5%8C%85%E5%A4%87%E4%BB%BD.mp4', '', 'tp5 商城 2. 上线 备份.', '0.10', 0, '99课 商城2.0版完成上线打包备份.', 30, 88, NULL, '', 1512225177, 1532008616),
(145, '183.69.214.0', '', 100, 'http://gudq.qiniudn.com/100%E8%AF%BE%20%20%E5%95%86%E5%9F%8E%E5%85%A5%E9%97%A8%E8%AF%BE%E6%95%88%E6%9E%9C%E6%BC%94%E7%A4%BA%20%E6%80%BB%E7%BB%93.mp4', '', 'tp5 商城 演示 总结', '0.10', 0, '100课  商城入门课效果演示 总结', 30, 129, NULL, '100课  商城入门课效果演示 总结', 1512225232, 1532191710),
(146, '171.8.154.242', '', 101, 'http://gudq.qiniudn.com/101%E8%AF%BE%20%20AJAX%20%E5%85%A5%E9%97%A8%E8%AF%BE%E4%BB%8B%E7%BB%8D%20%E6%BC%94%E7%A4%BA.mp4', '', 'tp5 商城 AJAX 入门  演示', '0.10', 0, '101课  ajax 入门课介绍 演示', 30, 130, NULL, '', 1512225317, 1531472780),
(147, '110.53.16.94', '', 102, 'http://gudq.qiniudn.com/102%E8%AF%BE%20%20AJAX%20%E5%AE%9E%E7%8E%B0%E5%8E%9F%E7%90%86%20%E5%88%86%E6%9E%90.mp4', '', 'tp5 商城 AJAX 实现原理 分析', '0.10', 0, '102课  ajax 实现原理 分析', 30, 96, NULL, '', 1512225426, 1531550204),
(148, '47.100.53.146', '', 103, 'http://gudq.qiniudn.com/103%E8%AF%BE%20%20AJAX%20%20%E7%AE%80%E6%98%93ajax%E5%8A%9F%E8%83%BD%E5%AE%9E%E7%8E%B0.mp4', '', 'tp5 商城  AJAX  简易', '0.10', 0, '103课  ajax  简易ajax功能实现', 30, 57, NULL, '', 1512225480, 1531544863),
(149, '171.8.154.242', '', 104, 'http://gudq.qiniudn.com/104%E8%AF%BE%20%20AJAX%20%E7%AE%80%E6%98%93ajax%E5%8A%9F%E8%83%BD%E5%AE%9E%E7%8E%B0%20%E5%8E%9F%E7%90%86%E8%AE%B2%E8%A7%A3.mp4', '', 'tp5 商城  ajax 原理', '0.10', 0, '104课  ajax 简易ajax功能实现 原理讲解', 30, 55, NULL, '', 1512225537, 1531473107),
(150, '40.77.167.93', '', 1008693, '', '恭喜您购买成功，加我qq：250285636 或微信电话 1821078787405 联系上课', '一对一', '0.10', 0, '【约课】一对一在线课程一节', 30, 27, NULL, '&lt;h5&gt;我刚想到的授课方式^_^，新上线的授课方式。通过qq或微信一对一语音或视频讲解。课程可涉及入门100课里面的任意一课。也可咨询面试相关问题。也可以随意聊聊你关于技术学习和工作中的想法。&lt;/h5&gt;\r\n\r\n&lt;h5&gt;课时：25分钟/节&lt;/h5&gt;\r\n\r\n&lt;h5&gt;上课前如果告诉我比较具体的问题，你讲更容易得到答案。技术性问题前100课我讲过的，如果你还有疑问的，我可以再给你讲讲。其他技术问题我会的并不太多，有些会的大概可以给你讲讲思路或者实现原理，仅此而已。至于面试或职业规划，我虽然自己面试或招聘技术有许多次多年经验，但是也仅仅是我个人一点经验。总之相关问题知无不言，尽心尽力。希望可以对你一点点帮助。&lt;/h5&gt;\r\n\r\n&lt;h5&gt;上课时间：仅限法定工作日期间&lt;/h5&gt;\r\n\r\n&lt;h5&gt;有效期：1个月内&lt;/h5&gt;', 1512634144, 1532207042),
(151, '47.100.51.203', '', 105, 'http://gudq.qiniudn.com/105%E8%AF%BE%20AJAX%20%E6%9C%80%E5%B0%91%E4%BB%A3%E7%A0%814%E8%A1%8C%E5%AE%9E%E7%8E%B0%E8%AE%B2%E8%A7%A3.mp4', '', 'AJAX ', '0.10', 0, '105课 ajax 最少代码4行实现讲解', 30, 68, NULL, '', 1512856372, 1530406539),
(152, '101.132.98.159', '', 106, 'http://gudq.qiniudn.com/106%E8%AF%BE%20AJAX%E5%A2%9E%E5%8A%A0%E5%AF%B9%E4%B8%8D%E5%90%8C%E6%B5%8F%E8%A7%88%E5%99%A8%E7%9A%84%E5%88%A4%E6%96%AD.mp4', '', 'ajax', '0.10', 0, '106课 ajax增加对不同浏览器的判断', 30, 39, NULL, '', 1512856426, 1531213652),
(153, '66.249.69.21', '', 107, 'http://gudq.qiniudn.com/107%E8%AF%BE%20AJAX%20%E8%A7%A6%E5%8F%91%20onreadystatechange%20%E5%93%8D%E5%BA%94%E4%BA%8B%E4%BB%B6.mp4', '', 'ajax', '0.10', 0, '107课 ajax 触发 readystate 响应事件', 30, 70, NULL, '', 1512856475, 1530244628),
(154, '66.249.73.76', '', 108, 'http://gudq.qiniudn.com/108%E8%AF%BE%20AJAX%20%E9%A1%B5%E9%9D%A2%E8%AF%B7%E6%B1%82%E5%A4%84%E7%90%86%E4%B8%AD%E7%9A%84%E6%98%BE%E7%A4%BA%E4%BD%BF%E7%94%A8%E6%BC%94%E7%A4%BA.mp4', '', 'ajax', '0.10', 0, '108课 ajax 页面请求处理中的显示使用演示', 30, 47, NULL, '', 1512856547, 1530705904),
(155, '66.249.64.17', '', 109, 'http://gudq.qiniudn.com/109%E8%AF%BE%20AJAX%E8%BF%9E%E6%8E%A5%E6%95%B0%E6%8D%AE%E5%BA%93%E6%9F%A5%E8%AF%A2%20%E7%A4%BA%E4%BE%8B%20%E6%9F%A5%E8%AF%A2%E7%94%A8%E6%88%B7%E5%90%8D%E6%98%AF%E5%90%A6%E5%AD%98%E5%9C%A8.mp4', '', 'ajax', '0.10', 0, '109课 ajax连接数据库查询 示例 查询用户名是否存在', 30, 55, NULL, '', 1512856659, 1532147472),
(156, '183.67.63.34', '', 111, 'http://gudq.qiniudn.com/111%E8%AF%BE%20AJAX%E9%A1%B5%E9%9D%A2URL%E5%8A%A8%E6%80%81%E5%8F%98%E9%87%8F%E4%BC%A0%E5%80%BC%20%E5%89%8D%E7%AB%AF%E8%87%AA%E5%8A%A8%E8%A7%A6%E5%8F%91%20.mp4', '', 'ajax', '0.10', 0, '111课 ajax页面url动态变量传值 前端自动触发', 30, 31, NULL, '', 1512856721, 1527502449),
(157, '183.67.59.213', '', 112, 'http://gudq.qiniudn.com/112%E8%AF%BE%20AJAX%E5%8F%91%E9%80%81%E7%9F%AD%E4%BF%A1%E9%AA%8C%E8%AF%81%E7%A0%81.mp4', '', 'ajax', '0.10', 0, '112课 ajax发送短信验证码', 30, 49, NULL, '', 1512856761, 1530613657),
(158, '101.242.123.50', '', 113, 'http://gudq.qiniudn.com/113%E8%AF%BE%20AJAX%E6%97%A0%E5%88%B7%E6%96%B0%E5%88%86%E9%A1%B5%20%E5%AE%8C%E6%95%B4%E7%89%88%20%E6%BC%94%E7%A4%BA%20.mp4', '', 'ajax', '0.10', 0, '113课 ajax无刷新分页 完整版 演示', 30, 55, NULL, '', 1512856804, 1532072360),
(159, '183.67.63.34', '', 114, 'http://gudq.qiniudn.com/114%E8%AF%BE%20AJAX%E6%97%A0%E5%88%B7%E6%96%B0%E5%88%86%E9%A1%B5%20%E5%8A%A8%E6%80%81%E9%A1%B5%E7%A0%81%20.mp4', '', 'ajax', '0.10', 0, '114课 ajax无刷新分页 动态页码', 30, 35, NULL, '', 1512856845, 1527503606),
(160, '183.67.63.34', '', 115, 'http://gudq.qiniudn.com/115%E8%AF%BE%20AJAX%E6%97%A0%E5%88%B7%E6%96%B0%E5%88%86%E9%A1%B5%20%E8%B0%83%E7%94%A8%E5%88%86%E9%A1%B5%20.mp4', '', 'ajax', '0.10', 0, '115课 ajax无刷新分页 调用分页', 30, 32, NULL, '', 1512856889, 1527503907),
(161, '182.46.1.251', '', 116, 'http://gudq.qiniudn.com/115%E8%AF%BE%20AJAX%E6%97%A0%E5%88%B7%E6%96%B0%E5%88%86%E9%A1%B5%20%E8%B0%83%E7%94%A8%E5%88%86%E9%A1%B5%20.mp4', '', 'ajax', '0.10', 0, '116课 ajax无刷新分页会员列表 实例', 30, 35, NULL, '', 1512857014, 1531291199),
(162, '183.67.63.34', '', 117, 'http://gudq.qiniudn.com/117%E8%AF%BE%20AJAX%E6%97%A0%E5%88%B7%E6%96%B0%E7%82%B9%E5%87%BB%E5%8A%A0%E8%BD%BD%E5%86%85%E5%AE%B9%20%E5%AE%9E%E4%BE%8B.mp4', '', 'ajax', '0.10', 0, '117课 ajax无刷新点击加载内容 实例', 30, 29, NULL, '', 1512857064, 1527505171);
INSERT INTO `think_shop` (`id`, `name`, `lesson`, `sort`, `address`, `product`, `label`, `price`, `status`, `title`, `age`, `page_view`, `delete_time`, `content`, `create_time`, `update_time`) VALUES
(163, '183.67.62.97', '', 118, 'http://gudq.qiniudn.com/118%E8%AF%BE%20AJAX%E6%97%A0%E5%88%B7%E6%96%B0%E8%AE%B0%E5%BD%95%E8%A7%86%E9%A2%91%E6%92%AD%E6%94%BE%E8%BF%9B%E5%BA%A6%20%E5%AE%9E%E4%BE%8B.mp4', '', 'ajax', '0.10', 0, '118课 ajax无刷新记录视频播放进度 实例', 30, 40, NULL, '', 1512857101, 1527662589),
(164, '183.67.62.97', '', 119, 'http://gudq.qiniudn.com/119%E8%AF%BE%20AJAX%20%E9%9B%B6%E5%9F%BA%E7%A1%80%E5%85%A5%E9%97%A8%E8%AF%BE%20%E6%80%BB%E7%BB%93%E5%9B%9E%E9%A1%BE.mp4', '', 'ajax', '0.10', 0, '119课 ajax 零基础入门课 总结回顾', 30, 31, NULL, '', 1512857138, 1527515737),
(165, '113.195.228.17', '', 120, 'http://7o50vy.com1.z0.glb.clouddn.com/120%E8%AF%BE%20tp5%E4%BC%9A%E5%91%98%E9%82%80%E8%AF%B7invite%E6%B3%A8%E5%86%8C%E5%8A%9F%E8%83%BD%E7%9A%84%E5%AE%9E%E7%8E%B0%20%E6%B5%81%E7%A8%8B%E5%88%86%E6%9E%90.mp4', '', '', '0.10', 0, '120课 tp5会员邀请invite注册功能的实现 流程分析', 30, 35, NULL, '', 1512857566, 1531881924),
(166, '183.67.62.97', '', 121, 'http://7o50vy.com1.z0.glb.clouddn.com/121%E8%AF%BE%20tp5%E4%BC%9A%E5%91%98%E9%82%80%E8%AF%B7invite%E6%B3%A8%E5%86%8C%E5%8A%9F%E8%83%BD%E7%9A%84%E5%AE%9E%E7%8E%B0%20%E6%B3%A8%E5%86%8C%E8%AE%B0%E5%BD%95.mp4', '', '', '0.10', 0, '121课 tp5会员邀请invite注册功能的实现 注册记录', 30, 31, NULL, '', 1512857612, 1527516447),
(167, '207.46.13.172', '', 1008691, '', '&lt;h2&gt;【活动】双12邀请6个同学注册即可成为vip学员  &lt;/h2&gt;  邀请链接地址：&lt;a href=http://open.gaoxueya.com/index/member/invite&gt;【活动】双12邀请6个同学注册即可成为vip学员&lt;/a&gt;   \r\n\r\n&lt;h5&gt;成为vip有什么福利? &lt;/h5&gt;\r\n\r\n\r\n优先获得更多tp5相关视频教程\r\n加入vip会员群\r\n网站所有课程免费学习，并有学习进度提醒和分析奥\r\n', '活动vip', '0.10', 0, '【活动】双12邀请6个同学注册即可成为vip学员', 30, 26, NULL, '<p>11111111111111111788899999999999992</p><p>11111111111111111788899999999999992</p><p>《》</p>', 1513044728, 1530734059),
(168, '40.77.167.139', '', 2147483647, 'http://www.runoob.com/try/demo_source/movie.mp4', '只是测试播放视频 评论而已', '       评论       课堂笔记       留言   ', '0.10', 0, '快速体验通道', 30, 233, NULL, '<p>&nbsp; &nbsp; &nbsp; &nbsp;可以在此贴下面，任意刷帖体验了。^_^ \r\n 如果你回复 1 ，会输出 什么 ？这里其实是原来模型课设置过的 \r\n 如果你回复 http://open.gaoxueya.com/ &nbsp;可以发出来了\r\n说明：thinkphp5配置了 html过滤还已生效，感谢 “迷魂”同学 分享的 get提交造成数据<span style="color: rgb(255, 0, 0);">丢失</span>的问题 &nbsp; &nbsp;</p><pre class="brush:php;toolbar:false">//&nbsp;解析出标签内容为数组\r\n$list-&gt;label&nbsp;=&nbsp;&quot;w&nbsp;d&nbsp;&nbsp;d&nbsp;&nbsp;&nbsp;d&nbsp;&nbsp;&nbsp;&nbsp;的&nbsp;&nbsp;的&nbsp;李四&nbsp;战三&quot;;\r\n$list_label&nbsp;=&nbsp;explode(&quot;&nbsp;&quot;,&nbsp;$list-&gt;label);//&nbsp;空格拆分\r\n$list_label&nbsp;=&nbsp;array_filter($list_label);//&nbsp;删除空元素</pre><p><br/></p>', 1513326197, 1530979240),
(170, '183.67.62.97', '', 136, 'http://7o50vy.com1.z0.glb.clouddn.com/136%E8%AF%BE%20Tp5%E5%8F%91%E5%B8%83%E5%88%B0linux%20CentOS%20%E5%85%A5%E9%97%A8%E6%BC%94%E7%A4%BA%20%E4%B8%8A%E4%BC%A0%E6%96%87%E4%BB%B6.mp4', '', 'linux CentOS  发布 安装 服务器', '0.10', 0, '136课 Tp5发布到linux CentOS 入门演示 上传文件', 30, 36, NULL, '', 1514359274, 1527594411),
(169, '221.235.78.26', '', 135, 'http://7o50vy.com1.z0.glb.clouddn.com/135%E8%AF%BE%20Tp5%E5%8F%91%E5%B8%83%E5%88%B0linux%20CentOS%20%E5%85%A5%E9%97%A8%E6%BC%94%E7%A4%BA%20%E5%AE%89%E8%A3%85%E7%B3%BB%E7%BB%9F.mp4', '', 'linux CentOS  发布 安装 服务器', '0.10', 0, '135课 Tp5发布到linux CentOS 入门演示 安装系统', 30, 36, NULL, '', 1514359230, 1530418742),
(172, '125.82.18.45', '', 123, 'http://7o50vy.com1.z0.glb.clouddn.com/123%E8%AF%BE%20tp5%E4%BC%9A%E5%91%98%E9%82%80%E8%AF%B7invite%E6%B3%A8%E5%86%8C%E5%8A%9F%E8%83%BD%E7%9A%84%E5%AE%9E%E7%8E%B0%20%E8%8E%B7%E5%8F%96%E9%82%80%E8%AF%B7%E9%93%BE%E6%8E%A5.mp4', '', '会员 邀请 invite 注册 邀请链接', '0.10', 0, '123课 tp5会员邀请invite注册功能的实现 获取邀请链接', 30, 42, NULL, '', 1514359506, 1530686736),
(173, '40.77.167.182', '', 124, 'http://7o50vy.com1.z0.glb.clouddn.com/124%E8%AF%BE%20%20tp5%E4%BC%9A%E5%91%98%E9%82%80%E8%AF%B7invite%E6%B3%A8%E5%86%8C%E5%8A%9F%E8%83%BD%E7%9A%84%E5%AE%9E%E7%8E%B0%20%E7%BB%9F%E8%AE%A1%E5%88%86%E6%9E%90%20%20%E6%80%BB%E7%BB%93.mp4', '', '会员 邀请 invite 注册 统计分析 ', '0.10', 0, '124课  tp5会员邀请invite注册功能的实现 统计分析  总结', 30, 108, NULL, '', 1514359579, 1530155937),
(174, '183.67.62.20', '', 125, 'http://7o50vy.com1.z0.glb.clouddn.com/125%E8%AF%BE%20%E8%AF%84%E8%AE%BA%E5%8A%9F%E8%83%BDAJAX%E7%AE%80%E5%8D%95%E5%AE%9E%E7%8E%B0%20%E6%B5%81%E7%A8%8B%E5%88%86%E6%9E%90.mp4', '', '评论 AJAX ', '0.10', 0, '125课 评论功能AJAX简单实现 流程分析', 30, 42, NULL, '', 1514359706, 1528031836),
(175, '183.67.62.20', '', 126, 'http://7o50vy.com1.z0.glb.clouddn.com/126%E8%AF%BE%20%E8%AF%84%E8%AE%BA%E5%8A%9F%E8%83%BDAJAX%E7%AE%80%E5%8D%95%E5%AE%9E%E7%8E%B0%20ajax%E9%85%8D%E5%90%88%E4%BC%A0%E5%80%BC.mp4', '', '评论 AJA 传值', '0.10', 0, '126课 评论功能AJAX简单实现 ajax配合传值', 30, 43, NULL, '', 1514359767, 1528032757),
(176, '183.67.62.20', '', 127, 'http://7o50vy.com1.z0.glb.clouddn.com/127%E8%AF%BE%20%E8%AF%84%E8%AE%BA%E5%8A%9F%E8%83%BDAJAX%E7%AE%80%E5%8D%95%E5%AE%9E%E7%8E%B0%20%E5%AE%8C%E5%96%84%E8%AF%84%E8%AE%BA%E6%95%B0%E6%8D%AE.mp4', '', '评论  AJAX ', '0.10', 0, '127课 评论功能AJAX简单实现 完善评论数据', 30, 36, NULL, '', 1514359845, 1528033087),
(177, '101.132.177.14', '', 128, 'http://7o50vy.com1.z0.glb.clouddn.com/128%E8%AF%BE%20%E8%AF%84%E8%AE%BA%E5%8A%9F%E8%83%BDAJAX%E7%AE%80%E5%8D%95%E5%AE%9E%E7%8E%B0%20%E5%8A%A0%E8%BD%BD%E8%AF%84%E8%AE%BA.mp4', '', '评论 AJAX 加载评论', '0.10', 0, '128课 评论功能AJAX简单实现 加载评论', 30, 28, NULL, '', 1514359889, 1532233244),
(178, '115.211.55.199', '', 129, 'http://7o50vy.com1.z0.glb.clouddn.com/129%E8%AF%BE%20%E8%AF%84%E8%AE%BA%E5%8A%9F%E8%83%BDAJAX%E7%AE%80%E5%8D%95%E5%AE%9E%E7%8E%B0%20%E7%BB%BC%E5%90%88%E5%AE%8C%E5%96%84%20%E6%80%BB%E7%BB%93.mp4', '', '评论 AJAX ', '0.10', 0, '129课 评论功能AJAX简单实现 综合完善 总结', 30, 34, NULL, '', 1514359939, 1530283340),
(179, '111.194.47.79', '', 130, 'http://7o50vy.com1.z0.glb.clouddn.com/130%E8%AF%BE%20layui%EF%BC%88%E8%B0%90%E9%9F%B3%EF%BC%9A%E7%B1%BBUI%29%E4%B8%8Ethinkphp5%E6%95%B4%E5%90%88%20%E5%88%86%E4%BA%AB.mp4', '', 'layui thinkphp5 整合  ', '0.10', 0, '130课 layui与thinkphp5整合 分享', 30, 195, NULL, '', 1514359996, 1532103873),
(180, '157.55.39.17', '', 131, 'http://7o50vy.com1.z0.glb.clouddn.com/131%E8%AF%BE%20%E5%95%86%E5%9F%8E%20%E5%95%86%E5%93%81%E7%9A%84%E7%BD%AE%E9%A1%B6%E5%92%8C%E5%BE%AA%E7%8E%AF%E5%88%86%E7%B1%BB.mp4', '', '置顶 循环 分类', '0.10', 0, '131课 商城 商品的置顶和循环分类', 30, 50, NULL, '', 1514360044, 1530051718),
(181, '106.14.190.222', '', 132, 'http://7o50vy.com1.z0.glb.clouddn.com/132%E8%AF%BE%20%E5%95%86%E5%9F%8E%201%E5%88%86%E9%92%B1%E8%B4%AD%E4%B9%B0%E4%BB%BB%E6%84%8F%E5%95%86%E5%93%81BUG%E6%BC%94%E7%A4%BA.mp4', '', '商城  购买 商品 BUG 演示', '0.10', 0, '132课 商城 1分钱购买任意商品BUG演示', 30, 54, NULL, '', 1514360135, 1531374998),
(182, '183.67.62.97', '', 133, 'http://7o50vy.com1.z0.glb.clouddn.com/133%E8%AF%BE%20%E5%95%86%E5%9F%8E%201%E5%88%86%E9%92%B1%E8%B4%AD%E4%B9%B0%E4%BB%BB%E6%84%8F%E5%95%86%E5%93%81BUG%E4%BF%AE%E6%94%B9.mp4', '', '商城  购买 商品 BUG 修改', '0.10', 0, '133课 商城 1分钱购买任意商品BUG修改', 30, 43, NULL, '', 1514360191, 1527592794),
(183, '183.67.62.97', '', 134, 'http://7o50vy.com1.z0.glb.clouddn.com/134%E8%AF%BE%20%E5%95%86%E5%9F%8E%20%E6%95%B0%E6%8D%AE%E5%BA%93%E6%96%87%E4%BB%B6%E8%A2%AB%E6%94%BB%E5%87%BB%E5%88%A0%E9%99%A4%E7%9A%84%E5%AE%9E%E6%88%98%E6%BC%94%E7%A4%BA.mp4', '', '商城 数据库 攻击 删除 实战 ', '0.10', 0, '134课 商城 数据库文件被攻击删除的实战演示', 30, 51, NULL, '', 1514360346, 1527593407),
(184, '183.67.62.97', '', 137, 'http://7o50vy.com1.z0.glb.clouddn.com/137%E8%AF%BE%20AJAX%E7%9A%84post%E6%8F%90%E4%BA%A4%E6%96%B9%E5%BC%8F%E5%92%8C%E8%A1%A8%E5%8D%95%E5%AE%89%E5%85%A8%E8%BF%87%E6%BB%A4%E5%85%A5%E9%97%A8.mp4', '', ' AJAX post  表单 安全 过滤 ', '0.10', 0, '137课 AJAX的post提交方式和表单安全过滤入门', 30, 44, NULL, '', 1514360393, 1527594775),
(185, '183.48.246.9', '', 138, 'http://7o50vy.com1.z0.glb.clouddn.com/138%E8%AF%BE%20%E4%BD%BF%E7%94%A8fputcsv%E5%92%8Cfgetcsc%E7%AE%80%E5%8D%95%E5%AE%9E%E7%8E%B0%E5%AF%BC%E5%85%A5%E5%AF%BC%E5%87%BA.mp4', '', 'fputcsv fgetcsc 导入 导出', '0.10', 0, '138课 使用fputcsv和fgetcsc简单实现导入导出', 30, 53, NULL, '', 1514360443, 1531814418),
(186, '183.67.62.20', '', 139, 'http://7o50vy.com1.z0.glb.clouddn.com/139%E8%AF%BE%20%E4%BC%9A%E5%91%98%E7%A7%AF%E5%88%86%E5%92%8C%E9%87%91%E5%B8%81%E5%8A%9F%E8%83%BD%E7%9A%84%E7%AE%80%E5%8D%95%E5%AE%9E%E7%8E%B0.mp4', '	\r\n139课 会员积分和金币功能的简单实现', '会员 积分 金币', '0.10', 0, '139课 会员积分和金币功能的简单实现', 30, 35, NULL, '', 1514360496, 1528107137),
(187, '183.67.62.20', '', 140, 'http://7o50vy.com1.z0.glb.clouddn.com/140%E8%AF%BE%20%E4%BC%9A%E5%91%98%E7%A7%AF%E5%88%86%E5%92%8C%E9%87%91%E5%B8%81%20%E6%95%B0%E6%8D%AE%E8%A1%A8%E7%9A%84%E5%88%B6%E4%BD%9C%E5%92%8C%E7%AE%80%E5%8D%95%E6%9F%A5%E8%AF%A2%E7%A7%AF%E5%88%86.mp4', '', '会员 积分 金币 数据表 ', '0.10', 0, '140课 会员积分和金币 数据表的制作和简单查询积分', 30, 41, NULL, '', 1514360535, 1528107463),
(188, '66.249.69.21', '', 141, 'http://7o50vy.com1.z0.glb.clouddn.com/141%E8%AF%BE%20%E4%BC%9A%E5%91%98%E7%A7%AF%E5%88%86%E5%92%8C%E9%87%91%E5%B8%81%20%E6%A0%B8%E5%BF%83%E5%8A%9F%E8%83%BD%E5%AE%9E%E7%8E%B0.mp4', '', '会员积分 金币 ', '0.10', 0, '141课 会员积分和金币 核心功能实现', 30, 33, NULL, '', 1514360574, 1530227308),
(189, '183.67.62.20', '', 142, 'http://7o50vy.com1.z0.glb.clouddn.com/142%E8%AF%BE%20%E4%BC%9A%E5%91%98%E7%A7%AF%E5%88%86%E5%92%8C%E9%87%91%E5%B8%81%20%E5%89%8D%E7%AB%AF%E9%A1%B5%E9%9D%A2%E8%9E%8D%E5%90%88.mp4', '', '会员积分 金币  ', '0.10', 0, '142课 会员积分和金币 前端页面融合.', 30, 33, NULL, '', 1514360672, 1528108025),
(190, '27.196.9.52', '', 143, 'http://7o50vy.com1.z0.glb.clouddn.com/143%E8%AF%BE%20%E4%BC%9A%E5%91%98%E7%A7%AF%E5%88%86%E5%92%8C%E9%87%91%E5%B8%81%20%E8%8E%B7%E5%BE%97%E7%A7%AF%E5%88%86%E7%A4%BA%E4%BE%8B.mp4', '', '会员积分 金币 ', '0.10', 0, '143课 会员积分和金币 获得积分示例', 30, 41, NULL, '', 1514360707, 1531126150),
(191, '183.67.62.20', '', 144, 'http://7o50vy.com1.z0.glb.clouddn.com/144%E8%AF%BE%20%E4%BC%9A%E5%91%98%E7%A7%AF%E5%88%86%E5%92%8C%E9%87%91%E5%B8%81%20%E4%BD%BF%E7%94%A8%E7%A7%AF%E5%88%86%E7%A4%BA%E4%BE%8B.mp4', '', '会员积分 金币  示例', '0.10', 0, '144课 会员积分和金币 使用积分示例', 30, 43, NULL, '', 1514360758, 1528108633),
(192, '111.206.221.104', '', 145, 'http://7o50vy.com1.z0.glb.clouddn.com/145%E8%AF%BE%20%E4%BA%BA%E6%80%A7%E5%8C%96%E6%98%BE%E7%A4%BA%E6%97%B6%E9%97%B4%20%E5%87%A0%E5%88%86%E9%92%9F%E5%89%8D%20%E5%87%A0%E5%B0%8F%E6%97%B6%E5%89%8D%20%E5%92%8C%E5%85%AC%E5%85%B1%E5%87%BD%E6%95%B0%E4%BD%BF%E7%94%A8%E5%85%A5%E9%97%A8.mp4', '', '人性化显示时间 几分钟前 几小时前  公共函数 ', '0.10', 0, '145课 人性化显示时间 几分钟前 几小时前 和公共函数使用入门', 30, 38, NULL, '', 1514360800, 1528683515),
(193, '117.136.0.224', '', 146, 'http://7o50vy.com1.z0.glb.clouddn.com/146%E8%AF%BE%20%E4%BA%BA%E6%80%A7%E5%8C%96%E6%98%BE%E7%A4%BA%E6%97%B6%E9%97%B4%20%E9%80%9A%E8%BF%87%E4%BF%AE%E6%94%B9thinkphp5%E6%A0%B8%E5%BF%83%E6%96%87%E4%BB%B6%E7%9B%B4%E6%8E%A5%E5%AE%9E%E7%8E%B0%E5%85%A8%E5%B1%80%E4%BA%BA%E6%80%A7%E5%8C%96%E6%98%BE%E7%A4%BA%E6%97%B6%E9%97%B4.mp4', '', '人性化显示时间  核心文件 全局 ', '0.10', 0, '146课 人性化显示时间 通过修改thinkphp5核心文件直接实现全局人性化显示时间', 30, 50, NULL, '', 1514360858, 1529379257),
(194, '183.67.62.97', '', 147, 'http://7o50vy.com1.z0.glb.clouddn.com/147%E8%AF%BE%20%E8%AE%B0%E5%BD%95H5%E8%A7%86%E9%A2%91%E7%9A%84%E6%92%AD%E6%94%BE%E8%BF%9B%E5%BA%A6%E5%92%8C%E6%92%AD%E6%94%BE%E6%AC%A1%E6%95%B0%20.mp4', '', ' H5视频 播放进度  播放次数', '0.10', 0, '147课 记录H5视频的播放进度和播放次数', 30, 33, NULL, '', 1514360912, 1527661758),
(195, '113.26.222.30', '', 148, 'http://7o50vy.com1.z0.glb.clouddn.com/148%E8%AF%BE%20%E5%A5%96%E7%AB%A0%E4%BB%BB%E5%8A%A1%E7%9A%84%E7%AE%80%E5%8D%95%E5%AE%9E%E7%8E%B0.mp4', '', '奖章 任务 ', '0.10', 0, '148课 奖章任务的简单实现', 30, 44, NULL, '', 1514360948, 1531276147),
(196, '117.136.38.148', '', 149, 'http://7o50vy.com1.z0.glb.clouddn.com/149%E8%AF%BE%20%E4%BD%BF%E7%94%A8%E4%BB%96%E4%BA%BAtp%E6%BA%90%E6%96%87%E4%BB%B6%E4%B8%8E%E5%A4%87%E4%BB%BDtp5%E6%BA%90%E6%96%87%E4%BB%B6%E7%AE%80%E5%8D%95%E5%88%86%E4%BA%AB.mp4', '', '源文件 备份 ', '0.10', 0, '149课 使用他人tp源文件与备份tp5源文件简单分享', 30, 28, NULL, '', 1514360999, 1522828580),
(197, '27.46.135.32', '', 150, 'http://7o50vy.com1.z0.glb.clouddn.com/150%E8%AF%BE%20%E5%95%86%E5%9F%8Ev3%E7%89%88%20%E6%80%BB%E7%BB%93%20%E6%BC%94%E7%A4%BA%20%E5%88%86%E4%BA%AB.mp4', '', '商城v3版 总结 演示 分享', '0.10', 0, '150课 商城v3版 总结 演示 分享', 30, 34, NULL, '', 1514361045, 1524262742),
(198, '180.191.154.151', '', 151, 'http://7o50vy.com1.z0.glb.clouddn.com/151%E8%AF%BE%20%E5%95%86%E5%9F%8Ev3%E7%89%88%20%E5%AE%89%E8%A3%85%E4%BD%BF%E7%94%A8%E8%AF%B4%E6%98%8E.mp4', '', '商城v3版 安装 使用  ', '0.10', 0, '151课 商城v3版 安装使用说明', 30, 49, NULL, '', 1514361441, 1525014470),
(211, '111.206.221.69', '', 164, '2', '', '安全 修改COOKIE 登录 网站 漏洞', '0.10', 0, '164课 安全 修改COOKIE登录网站漏洞', 30, 35, NULL, '', 1515136406, 1532188162),
(199, '117.136.38.167', '', 152, '1', '', '模型关联', '0.10', 0, '152课 tp5 模型关联 快速入门', 30, 72, NULL, '', 1515046575, 1529417514),
(200, '111.206.198.82', '', 153, '153', '', '模型关联', '0.10', 0, '153课 tp5 模型关联 快速入门 巩固', 30, 75, NULL, '', 1515046746, 1532127794),
(201, '111.206.221.67', '', 154, '154', '', '模型hasOne 一对一 hasMany 一对多关联 区别', '0.10', 0, '154课 模型hasOne一对一和hasMany一对多关联的区别', 30, 85, NULL, '', 1515046780, 1532133621),
(202, '111.206.198.10', '', 155, '155', '', '模型 hasOne 一对一关联 ', '0.10', 0, '155课 模型hasOne一对一关联结合模板应用实例', 30, 52, NULL, '', 1515046819, 1532134725),
(203, '220.115.236.180', '', 156, '156', '', '模型 hasMany 一对多关联 ', '0.10', 0, '156课 模型hasMany一对多关联结合模板应用实例', 30, 53, NULL, '', 1515046854, 1528624056),
(204, '40.77.167.198', '', 157, '157', '', '模型关联 关联数据库 查询', '0.10', 0, '157课 模型关联 关联数据库里的查询示例', 30, 41, NULL, '', 1515046890, 1530291384),
(205, '110.53.18.71', '', 158, '158', '', '后台 登录页 ', '0.10', 0, '158课 tp5套用模板  后台登录页演示', 30, 50, NULL, '', 1515046923, 1527775551),
(206, '157.55.39.20', '', 159, '159', '', '套用模板  后台登录页 修改模板方法', '0.10', 0, '159课 tp5套用模板  后台登录页 修改模板方法', 30, 36, NULL, '', 1515046955, 1528554715),
(207, '207.46.13.160', '', 160, '160', '', '左右布局分布', '0.10', 0, '160课 页面左右布局分布 示例', 30, 37, NULL, '', 1515046999, 1528103628),
(208, '182.200.51.175', '', 161, '161', '', '微信打赏 支付宝打赏 ', '0.10', 0, '161课 微信和支付宝打赏 简易实现', 30, 59, NULL, '', 1515047062, 1532006767),
(209, '66.249.69.23', '', 162, '162', '', '在线打赏 支付宝接口demo', '0.10', 0, '162课 在线打赏 简易实现 支付宝接口demo', 30, 39, NULL, '', 1515047124, 1530207684),
(210, '111.206.221.26', '', 163, '163', '', 'H5播放器 播放速度 ', '0.10', 0, '163课 H5播放器播放速度的控制功能 ', 30, 42, NULL, '&lt;!--控制播放速度的下拉菜单--&gt;\r\n&lt;div class=&quot;btn-group dropup&quot;&gt;\r\n    &lt;button type=&quot;button&quot; class=&quot;btn btn-default&quot;&gt;播放速度&lt;/button&gt;\r\n    &lt;button type=&quot;button&quot; class=&quot;btn btn-default dropdown-toggle&quot; data-toggle=&quot;dropdown&quot; aria-haspopup=&quot;true&quot; aria-expanded=&quot;false&quot;&gt;\r\n        &lt;span class=&quot;caret&quot;&gt;&lt;/span&gt;\r\n        &lt;span class=&quot;sr-only&quot; onclick=&quot;setPlaySpeed(1)&quot; &gt;默认速度&lt;/span&gt;\r\n    &lt;/button&gt;\r\n    &lt;ul class=&quot;dropdown-menu&quot;&gt;\r\n        &lt;li&gt;&lt;a onclick=&quot;setPlaySpeed(2)&quot;&gt;2倍最快&lt;/a&gt;&lt;/li&gt;\r\n        &lt;li&gt;&lt;a onclick=&quot;setPlaySpeed(1.75)&quot;&gt;1.75倍&lt;/a&gt;&lt;/li&gt;\r\n        &lt;li&gt;&lt;a onclick=&quot;setPlaySpeed(1.5)&quot;&gt;1.5倍&lt;/a&gt;&lt;/li&gt;\r\n        &lt;li&gt;&lt;a onclick=&quot;setPlaySpeed(1.25)&quot;&gt;1.25倍&lt;/a&gt;&lt;/li&gt;\r\n        &lt;li&gt;&lt;a onclick=&quot;setPlaySpeed(1)&quot;&gt;1倍&lt;/a&gt;&lt;/li&gt;\r\n        &lt;li&gt;&lt;a onclick=&quot;setPlaySpeed(0.75)&quot;&gt;0.75倍&lt;/a&gt;&lt;/li&gt;\r\n        &lt;li&gt;&lt;a onclick=&quot;setPlaySpeed(0.5)&quot;&gt;0.5倍最慢&lt;/a&gt;&lt;/li&gt;\r\n        &lt;li role=&quot;separator&quot; class=&quot;divider&quot;&gt;&lt;/li&gt;\r\n        &lt;li&gt;&lt;a onclick=&quot;setPlaySpeed(1)&quot;&gt;默认速度&lt;/a&gt;&lt;/li&gt;\r\n&lt;!--         &lt;li&gt;&lt;a onclick=&quot;getPlaySpeed()&quot;&gt;当前速度&lt;/a&gt;&lt;/li&gt; --&gt;\r\n    &lt;/ul&gt;\r\n&lt;/div&gt;', 1515047200, 1531366187),
(214, '111.206.221.102', '', 167, '167课 安全 修改COOKIE登录网站漏洞 验证token', '', ' 安全 修改COOKIE   漏洞 验证token', '0.10', 0, '167课 安全 修改COOKIE登录网站漏洞 验证token', 30, 55, NULL, '', 1515138278, 1531905216),
(218, '157.55.39.184', '', 171, '171', '', 'PHP fputcsv()导出csv  解决中文乱码 ', '0.10', 0, '171课 PHP使用fputcsv()导出csv 解决中文乱码 ', 30, 33, NULL, '', 1516603671, 1526952983),
(219, '47.92.102.179', '', 172, '172', '', 'PHP  fputcsv()导出csv  实战分享', '0.10', 0, '172课 PHP使用fputcsv()导出csv 实战分享', 30, 42, NULL, '', 1516603741, 1528676346),
(220, '113.200.28.22', '', 173, '173', '', 'ThinkPHP5 增加 qq和微信二维码联系方式', '0.10', 0, '173课 ThinkPHP5 增加 qq和微信二维码联系方式', 30, 90, NULL, '', 1516603772, 1529219356),
(221, '111.206.221.32', '', 174, '174', '', 'Tp5查看服务 session文件', '0.10', 0, '174课 Tp5查看所有在服务上保存的session文件', 30, 32, NULL, '', 1516603829, 1528684940),
(222, '111.206.198.27', '', 175, '175', '', 'Tp5查看所有服务 保存session文件', '0.10', 0, '175课 消息提示音的简单实现', 30, 49, NULL, '', 1516603887, 1532184169),
(223, '111.206.221.8', '', 176, '176', '', '消息提示音的简单实现 ', '0.10', 0, '176课  消息提示音的复杂实现 ', 30, 42, NULL, '', 1516603914, 1531725192),
(224, '111.206.221.24', '', 177, '177', '', '消息提示音 在线聊天 ', '0.10', 0, '177课  消息提示音的复杂实现 简易实现在线聊天 ', 30, 45, NULL, '', 1516603965, 1531255358),
(225, '66.249.64.16', '', 178, '178', '', '聊天对话 演示', '0.10', 0, '178课 简易聊天对话框形式实现 演示', 30, 21, NULL, '', 1516603997, 1525903311),
(226, '101.132.182.68', '', 179, '179', '', '聊天对话 代码讲解', '0.10', 0, '179课 简易聊天对话框形式实现 代码讲解', 30, 31, NULL, '', 1516604027, 1528147905),
(227, '40.77.167.28', '', 180, '180', '', '聊天对话框 自动欢迎 与自动解答 演示', '0.10', 0, '180课 聊天对话框 自动欢迎 与自动解答 演示', 30, 25, NULL, '', 1516604052, 1528501309),
(228, '157.55.39.72', '', 181, '181', '', '聊天对话框 自动欢迎 与自动解答 代码讲解', '0.10', 0, '181课 聊天对话框 自动欢迎 与自动解答 代码讲解', 30, 26, NULL, '', 1516604076, 1528003253),
(229, '117.136.0.159', '', 182, '182', '', '聊天对话框 模糊对话 今天日期', '0.10', 0, '182课 聊天对话框 模糊对话 今天日期', 30, 31, NULL, '', 1516604100, 1530723728),
(230, '45.76.64.20', '', 183, '183', '', 'Tp5转移服务器演示 phpStudy绑定多个站点', '0.10', 0, '183课 Tp5转移服务器演示 phpStudy绑定多个站点', 30, 32, NULL, '', 1516604121, 1525239868),
(231, '47.92.138.160', '', 184, '184', '', '扫码签到 简易实现', '0.10', 0, '184课 扫码签到 简易实现', 30, 72, NULL, '', 1516761410, 1529723197),
(232, '117.84.80.50', '', 185, '185', '', '扫码签到 简易实现 签到代码讲解', '0.10', 0, '185课 扫码签到 简易实现 签到代码讲解', 30, 55, NULL, '', 1516761484, 1531640995),
(233, '207.46.13.3', '', 186, '186', '', '扫码签到 统计签到人数 未签到提醒', '0.10', 0, '186课 Tp5 扫码签到 统计签到人数和未签到提醒', 30, 41, NULL, '', 1516761515, 1528229807),
(234, '123.125.71.110', '', 187, '187', '', '扫码签到 签到名单展示', '0.10', 0, '187课 Tp5 扫码签到 签到名单展示 key=k ', 30, 37, NULL, '', 1516761543, 1529338248),
(235, '111.206.221.82', '', 188, '188', '', '扫码签到', '0.10', 0, '188课 Tp5 扫码签到 相关三个BUG 分析问题', 30, 39, NULL, '', 1516761565, 1531257881),
(236, '122.194.188.122', '', 189, '189', '', '未登录先付款功能 实现演示', '0.10', 0, '189课 Tp5 未登录先付款后的功能 实现演示', 30, 30, NULL, '', 1516761645, 1527878398),
(237, '122.194.188.122', '', 190, '190', '', 'Session传订单 代码讲解', '0.10', 0, '190课 Tp5 未登录先付款后的功能 Session传订单 代码讲解', 30, 35, NULL, '', 1516761674, 1527879011),
(238, '157.55.39.211', '', 191, '191', '', '又拍云视频  防盗链 ', '0.10', 0, '191课 又拍云视频防盗链方法 分享', 30, 62, NULL, '', 1516761698, 1528468640),
(239, '207.46.13.27', '', 192, '192', '', 'Bootstrap 选项卡切换卡 菜单 实现演示', '0.10', 0, '192课 Bootstrap 选项卡切换卡 菜单 实现演示', 30, 48, NULL, '', 1516761739, 1531721119),
(240, '207.46.13.214', '', 193, '193', '', '密码登录 密码找回 扫码注册 开发思路分享', '0.10', 0, '193课 密码登录 密码找回 扫码注册 开发思路分享', 30, 30, NULL, '', 1516761756, 1528553228),
(241, '183.67.62.97', '', 194, '194', '', '密码登录 密码找回 扫码注册 界面制作', '0.10', 0, '194课 密码登录 密码找回 扫码注册 界面制作', 30, 29, NULL, '', 1516761773, 1527665561),
(242, '157.55.39.220', '', 195, '195', '', '密码登录 密码找回 扫码注册 密码登录实现', '0.10', 0, '195课 密码登录 密码找回 扫码注册 密码登录实现', 30, 36, NULL, '', 1516761787, 1528032912),
(243, '42.156.138.104', '', 196, '196', '', '密码登录 密码找回 扫码注册 跳过扫码注册', '0.10', 0, '196课 密码登录 密码找回 扫码注册 跳过扫码注册', 30, 34, NULL, '', 1516761803, 1529011857),
(244, '40.77.167.194', '', 197, '197', '', '密码登录 密码找回 扫码注册 注册实现分享', '0.10', 0, '197课 密码登录 密码找回 扫码注册 注册实现分享', 30, 41, NULL, '', 1516761820, 1528600437),
(245, '47.92.115.203', '', 198, '198', '', '密码登录 密码找回 扫码注册 之密码找回', '0.10', 0, '198课 密码登录 密码找回 扫码注册 之密码找回', 30, 43, NULL, '', 1516761840, 1528768740),
(246, '66.249.79.108', '', 199, '199', '', '密码登录 密码找回 扫码注册 代码重构 ', '0.10', 0, '199课 密码登录 密码找回 扫码注册 代码重构 ', 30, 40, NULL, '', 1516761856, 1528646166),
(247, '207.46.13.172', '', 200, '200', '', 'ThinkPHP5 简易商城 v4.0课程总结', '0.10', 0, '200课 ThinkPHP5 简易商城 v4.0课程总结', 30, 64, NULL, '', 1516761873, 1530624757),
(248, '223.104.189.182', '', 1008619, '', '', '', '0.10', 0, '加油', 30, 38, NULL, '<p><img src="http://img.baidu.com/hi/jx2/j_0057.gif"/>&nbsp;加油</p>', 1519194361, 1530850456),
(355, '47.92.100.7', '', 305, '666', '', '菜单 默认 选中 高亮  一对多', '0.10', 0, '305课 tp5 菜单默认选中高亮 一对多', 30, 4, NULL, '', 1527579643, 1531791462),
(249, '157.55.39.59', '', 242, '242', '', '签到 第一名 奖励1天VIP', '0.10', 0, '242课  签到第一名 奖励1天VIP 思路分析及代码', 30, 58, NULL, '<p>以下是本课涉及的核心新增加的代码</p><pre class="brush:php;toolbar:false">//&nbsp;判断今天是否有签到记录\r\n$rand_today&nbsp;=&nbsp;Order::where(&#39;body&#39;,&nbsp;$body)\r\n&nbsp;&nbsp;&nbsp;&nbsp;-&gt;where(&#39;phone&#39;,&#39;&lt;&gt;&#39;,&nbsp;&#39;15966982315&#39;)\r\n&nbsp;&nbsp;&nbsp;&nbsp;-&gt;whereTime(&#39;create_time&#39;,&nbsp;&#39;today&#39;)\r\n&nbsp;&nbsp;&nbsp;&nbsp;-&gt;count();\r\n\r\n\r\n//&nbsp;如果第一名，执行奖励vip天数的公用功能\r\nif&nbsp;($rand_today==0)&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;add_vip_days(1,135002);\r\n}</pre><p><br/></p><p>方便大家参考</p>', 1520226337, 1530176961),
(250, '157.55.39.110', '', 243, '243', '', '截取中文 字符串 省略号', '0.10', 0, '243课  截取中文字符串并增加省略号', 30, 35, NULL, '<p>本课涉及的核心代码</p><pre class="brush:php;toolbar:false">&lt;!--截取中文字符串--&gt;\r\n{:mb_substr($user.content,0,16,&#39;utf-8&#39;);}\r\n\r\n&lt;!--判断是否加省略号--&gt;\r\n{:mb_strlen($user.content,&#39;utf-8&#39;)&nbsp;&gt;=18?&#39;...&#39;:&#39;&#39;}</pre><p><br/></p>', 1520475090, 1528912614),
(251, '207.46.13.112', '', 244, '244', '', '截取中文字符串 省略号 三元符写法', '0.10', 0, '244课  截取中文字符串并增加省略号 三元符写法', 30, 30, NULL, '<pre class="brush:php;toolbar:false">&lt;!--截取中文字符串--&gt;\r\n{:mb_substr($user.content,0,16,&#39;utf-8&#39;);}\r\n\r\n&lt;!--判断是否加省略号--&gt;\r\n{:mb_strlen($user.content,&#39;utf-8&#39;)&nbsp;&gt;=18?&#39;...&#39;:&#39;&#39;}</pre><p><br/></p>', 1520475196, 1531152084),
(252, '157.55.39.253', '', 245, '245', '', '百度Ueditor编辑器 代码高亮 手机  不换行 ', '0.10', 0, '245课 百度Ueditor编辑器代码高亮手机上不换行 ', 30, 45, NULL, '<pre class="brush:php;toolbar:false">&lt;!--是否为手机访问--&gt;\r\n\r\n{if&nbsp;condition=&quot;request()-&gt;isMobile()==false&quot;}\r\n\r\n&lt;!--Ueditor代码高亮样式&nbsp;--&gt;\r\n&lt;script&nbsp;type=&quot;text/javascript&quot;&nbsp;src=&quot;__STATIC__/ueditor/third-party/SyntaxHighlighter/shCore.js&quot;&gt;&lt;/script&gt;\r\n&lt;link&nbsp;rel=&quot;stylesheet&quot;&nbsp;type=&quot;text/css&quot;&nbsp;href=&quot;__STATIC__/ueditor/third-party/SyntaxHighlighter/shCoreDefault.css&quot;&gt;\r\n&lt;script&nbsp;type=&quot;text/javascript&quot;&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;SyntaxHighlighter.all();\r\n&lt;/script&gt;\r\n&lt;!--Ueditor代码高亮样式&nbsp;--&gt;\r\n\r\n{/if}</pre><p><br/></p>', 1520480219, 1529065852),
(253, '113.240.250.20', '', 246, '246', '', '246', '0.10', 0, '246课 手机上bootstrap按钮没有行高问题 ', 30, 41, NULL, '<pre class="brush:css;toolbar:false">.btn&nbsp;{\r\n\r\n&nbsp;&nbsp;margin-bottom:&nbsp;5px&nbsp;;\r\n}</pre><p>&nbsp;<br/></p>', 1520487009, 1531835194),
(254, '66.249.77.17', '', 247, '247', '', ' 现金红包 你学习 我送钱  功能 开发思路 ', '0.10', 0, '247课 现金红包 你学习 我送钱  功能 开发思路 ', 30, 35, NULL, '<p><br/></p><p style="margin-top: 10px;"><span style="font-size:27px"><span style=";font-family: Wingdings">u</span></span><span style="font-size:27px;font-family:微软雅黑;color:#474747">发红包：流程 </span><span style="font-size:27px;font-family:微软雅黑;color:#474747">-&gt;</span><span style="font-size:27px;font-family:微软雅黑;color:#474747">有资金</span><span style="font-size:27px;font-family:微软雅黑;color:#474747">-&gt;已学完某节课-&gt;</span><span style="font-size:27px;font-family:微软雅黑;color:#474747">满</span><span style="font-size:27px;font-family:微软雅黑;color:#474747">20</span><span style="font-size:27px;font-family:微软雅黑;color:#474747">字评论</span><span style="font-size:27px;font-family:微软雅黑;color:#474747">-&gt;</span><span style="font-size:27px;font-family:微软雅黑;color:#474747">生成随机金额红包</span></p><p style="margin-top: 10px;"><span style="font-size:27px"><span style=";font-family: Wingdings">u</span></span><span style="font-size:27px;font-family:微软雅黑;color:#474747">领红包：群里提供截图 </span><span style="font-size:27px;font-family:微软雅黑;color:#474747">-&gt;</span><span style="font-size:27px;font-family:微软雅黑;color:#474747">截图中编号</span><span style="font-size:27px;font-family:微软雅黑;color:#474747">-&gt;</span><span style="font-size:27px;font-family:微软雅黑;color:#474747">记录已发送现金</span></p><p style="margin-top: 10px;"><span style="font-size:27px"><span style=";font-family: Wingdings">u</span></span><span style="font-size:27px;font-family:微软雅黑;color:#474747">需要登记</span><span style="font-size:27px;font-family:微软雅黑;color:#474747">qq</span> <span style="font-size:27px;font-family:微软雅黑;color:#474747">已核对，后台设置已发送比较繁琐</span></p>', 1520567744, 1527709339),
(255, '66.249.64.16', '', 248, '248', '', '现金红包 你学习 我送钱  功能', '0.10', 0, '248课 现金红包 你学习 我送钱  功能 查询是否有红包', 30, 48, NULL, '<p>本节课设计核心代码</p><pre class="brush:php;toolbar:false">//&nbsp;查询总的可领取红包，根据已成交订单\r\n//&nbsp;排除红包发送的订单记录\r\n$red_packet_count&nbsp;=&nbsp;&nbsp;Order::where(&#39;body&#39;,&#39;&lt;&gt;&#39;,188666)\r\n&nbsp;&nbsp;&nbsp;&nbsp;-&gt;where(&#39;phone&#39;,&#39;=&#39;,$user)\r\n&nbsp;&nbsp;&nbsp;&nbsp;-&gt;sum(&#39;total_fee&#39;);\r\n\r\n//&nbsp;设置发放的比例\r\n$red_packet_count&nbsp;=&nbsp;$red_packet_count&nbsp;*0.8;\r\n\r\n\r\n//&nbsp;红包已发送总额\r\n$red_packet_pay&nbsp;=&nbsp;&nbsp;Order::where(&#39;body&#39;,&#39;=&#39;,188666)\r\n&nbsp;&nbsp;&nbsp;&nbsp;-&gt;where(&#39;phone&#39;,&#39;=&#39;,$user)\r\n&nbsp;&nbsp;&nbsp;&nbsp;-&gt;sum(&#39;total_fee&#39;);\r\n\r\n$red_packet_count&nbsp;=&nbsp;$red_packet_count&nbsp;-&nbsp;$red_packet_pay;\r\n\r\ndump($red_packet_count);</pre><p><br/></p>', 1520580903, 1529351124),
(256, '157.55.39.195', '', 249, '249', '', '现金红包  判断是否学完本课 评论满20字', '0.10', 0, '249课 现金红包  判断是否学完本课和评论满20字', 30, 20, NULL, '<p>本课涉及核心代码</p><pre class="brush:php;toolbar:false">//&nbsp;判断是否可以领取红包\r\nif&nbsp;($red_packet_get){\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;判断是否学习完成本课\r\n&nbsp;&nbsp;&nbsp;&nbsp;$learn_count&nbsp;&nbsp;&nbsp;&nbsp;=&nbsp;&nbsp;Video::where(&#39;phone&#39;,&nbsp;$user)\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&gt;where(&#39;shop&#39;,&#39;=&#39;,&nbsp;$id)\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&gt;where(&#39;status&#39;,&#39;&gt;=&#39;,&nbsp;1)\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&gt;value(&#39;status&#39;);\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;$list[&#39;learn_count&#39;]&nbsp;=&nbsp;$learn_count;\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;dump($learn_count);\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;判断是否评论满20个字\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;$data_len&nbsp;&nbsp;&nbsp;&nbsp;=&nbsp;&nbsp;Data::where(&#39;phone&#39;,&nbsp;$user)\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&gt;where(&#39;shop&#39;,&#39;=&#39;,&nbsp;$id)\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&gt;order(&#39;id&nbsp;desc&#39;)\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&gt;value(&#39;title&#39;);\r\n\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;判断留言是否有中文\r\n&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(preg_match(&quot;/[\\x7f-\\xff]/&quot;,&nbsp;$data_len))&nbsp;{\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;判断长度是\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$data_len&nbsp;=&nbsp;mb_strlen($data_len,&#39;utf-8&#39;)&nbsp;&gt;=20?1:0;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$list[&#39;data_len&#39;]&nbsp;=&nbsp;$data_len;\r\n&nbsp;&nbsp;&nbsp;&nbsp;}\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;dump($list[&#39;data_len&#39;]);\r\n\r\n\r\n\r\n}</pre><p><br/></p>', 1520581907, 1528924241),
(257, '207.46.13.235', '', 250, '250', '', '现金红包  生成小数随机 金额 红包订单 ', '0.10', 0, '250课 现金红包  生成小数随机金额 红包订单 ', 30, 51, NULL, '<pre class="brush:php;toolbar:false">if&nbsp;($list[&#39;learn_count&#39;]&nbsp;and&nbsp;$list[&#39;data_len&#39;]){\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;$rand&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=&nbsp;mt_rand(1,30);&nbsp;//取随机四位数字\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;$total_fee&nbsp;=&nbsp;$rand/100;&nbsp;//缩小为0.01-0.30之间的数字\r\n\r\n\r\n\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;dump(&quot;您获得：&quot;);\r\n&nbsp;&nbsp;&nbsp;&nbsp;dump($total_fee);\r\n\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;判断是否领取过本节课\r\n&nbsp;&nbsp;&nbsp;&nbsp;$red_packet_lesson&nbsp;=&nbsp;&nbsp;Order::where(&#39;body&#39;,&#39;=&#39;,$id)\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&gt;where(&#39;phone&#39;,&#39;=&#39;,$user)\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&gt;where(&#39;buyer_id&#39;,&#39;=&#39;,188666)\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&gt;count();\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;dump($red_packet_lesson);\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(!$red_packet_lesson){\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;红包订单语句\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$order&nbsp;=&nbsp;Order::create([\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#39;phone&#39;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=&gt;&nbsp;&nbsp;$user,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#39;body&#39;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=&gt;&nbsp;&nbsp;$id,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#39;rand&#39;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=&gt;&nbsp;&nbsp;188666,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#39;subject&#39;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=&gt;&nbsp;&nbsp;&quot;完成课程&quot;.$id.&quot;获得一个红包&quot;,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#39;total_fee&#39;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=&gt;&nbsp;&nbsp;$total_fee,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#39;buyer_id&#39;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=&gt;&nbsp;&nbsp;188666,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#39;buyer_email&#39;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=&gt;&nbsp;&nbsp;$user,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#39;out_trade_no&#39;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=&gt;&nbsp;&nbsp;188666,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;]);\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dump(&quot;发红包成了，请及时领取&quot;);\r\n\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;}else{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;dump(&quot;已经领取过红包&quot;);\r\n&nbsp;&nbsp;&nbsp;&nbsp;}</pre><p><br/></p>', 1520586436, 1529420164),
(258, '183.67.62.146', '', 201, '201', '', '', '0.10', 0, '201课 扫码签到 功能和页面完善  欢迎进入新的一季学习  ', 30, 21, NULL, '<p>&nbsp; &nbsp; &nbsp; &nbsp;这里写你的初始化内容\r\n &nbsp; &nbsp;</p>', 1520817900, 1527773999),
(259, '207.46.13.23', '', 202, '202', '', '', '0.10', 0, '202课 扫码签到 功能和页面完善 代码分享和2个疑问 ', 30, 14, NULL, '<p>&nbsp; &nbsp; &nbsp; &nbsp;这里写你的初始化内容\r\n &nbsp; &nbsp;</p>', 1520817961, 1528856886),
(260, '183.67.62.20', '', 203, '203', '', '', '0.10', 0, '203课 AJAX点击调用无反应的解决方法 index', 30, 21, NULL, '<p>&nbsp; &nbsp; &nbsp; &nbsp;这里写你的初始化内容\r\n &nbsp; &nbsp;</p>', 1520817999, 1528123218),
(261, '157.55.39.104', '', 204, '204', '', '', '0.10', 0, '204课 Ajax加强安全调用验证 防止恶意发送短信Api', 30, 33, NULL, '<p>&nbsp; &nbsp; &nbsp; &nbsp;这里写你的初始化内容\r\n &nbsp; &nbsp;</p>', 1520818024, 1528443897),
(262, '66.249.66.15', '', 205, '205', '', '', '0.10', 0, '205课 Ajax加强安全调用验证 防止恶意发送短信 页面流程演示', 30, 25, NULL, '<p>&nbsp; &nbsp; &nbsp; &nbsp;这里写你的初始化内容\r\n &nbsp; &nbsp;</p>', 1520818074, 1528781950),
(263, '157.55.39.237', '', 206, '206', '', '', '0.10', 0, '206课 Ajax加强安全调用验证 防止恶意发送短信 一对一实现方式代码讲解index', 30, 32, NULL, '<p>&nbsp; &nbsp; &nbsp; &nbsp;这里写你的初始化内容\r\n &nbsp; &nbsp;</p>', 1520818090, 1528966768),
(264, '207.46.13.112', '', 207, '207', '', '', '0.10', 0, '207课 Ajax加强安全调用验证 防止恶意发送短信 一对多动态调用 代码讲解.index', 30, 34, NULL, '<p>&nbsp; &nbsp; &nbsp; &nbsp;这里写你的初始化内容\r\n &nbsp; &nbsp;</p>', 1520818112, 1530908702),
(265, '66.249.64.17', '', 208, '208', '', '', '0.10', 0, '208课 在线用户 在线时间 OnlineTime 统计 实现思路 Bbs', 30, 38, NULL, '<p>&nbsp; &nbsp; &nbsp; &nbsp;这里写你的初始化内容\r\n &nbsp; &nbsp;</p>', 1520818212, 1532100544),
(266, '113.119.26.25', '', 209, '209', '', '', '0.10', 0, '209课 在线用户 在线时间 OnlineTime 统计 读取在线用户 Index', 30, 33, NULL, '<p>&nbsp; &nbsp; &nbsp; &nbsp;这里写你的初始化内容\r\n &nbsp; &nbsp;</p>', 1520818228, 1532176648),
(267, '157.55.39.81', '', 210, '210', '', '', '0.10', 0, '210课 在线用户 在线时间 OnlineTime 统计 全站统计在线时间和接收新消息提示音view', 30, 19, NULL, '<p>&nbsp; &nbsp; &nbsp; &nbsp;这里写你的初始化内容\r\n &nbsp; &nbsp;</p>', 1520818243, 1529296442),
(268, '66.249.75.26', '', 211, '211', '', '', '0.10', 0, '211课 在线即时聊天功能 首页调用 index', 30, 34, NULL, '<p>&nbsp; &nbsp; &nbsp; &nbsp;这里写你的初始化内容\r\n &nbsp; &nbsp;</p>', 1520818268, 1530432939),
(269, '183.48.245.211', '', 212, '212', '', '', '0.10', 0, '212课 在线即时聊天功能 首页 发送功能的实现 Bbs', 30, 32, NULL, '<p>&nbsp; &nbsp; &nbsp; &nbsp;这里写你的初始化内容\r\n &nbsp; &nbsp;</p>', 1520818286, 1531451454),
(270, '157.55.39.165', '', 213, '213', '', '连续签到     奖励功能', '0.10', 0, '213课 演示连续签到奖励功能', 30, 17, NULL, '<p>&nbsp; &nbsp; &nbsp; &nbsp;这里写你的初始化内容\r\n &nbsp; &nbsp;</p>', 1520818584, 1526394783),
(271, '157.55.39.109', '', 214, '214', '', '连续签到    奖励代码', '0.10', 0, '214课 连续签到奖励代码讲解分享', 30, 21, NULL, '<p>&nbsp; &nbsp; &nbsp; &nbsp;这里写你的初始化内容\r\n &nbsp; &nbsp;</p>', 1520818620, 1528922497),
(272, '207.46.13.172', '', 215, '215', '', '连续签到奖励     签到前端页面', '0.10', 0, '215课 连续签到奖励前端页面简单分享', 30, 21, NULL, '<p>&nbsp; &nbsp; &nbsp; &nbsp;这里写你的初始化内容\r\n &nbsp; &nbsp;</p>', 1520818666, 1530695404),
(273, '157.55.39.34', '', 216, '216', '', ' VIP栏目页面问题分析 游客不能看 不是vip提示不明显 支付后没有开通', '0.10', 0, '216课 VIP栏目页面问题分析 游客不能看 不是vip提示不明显 支付后没有开通', 30, 20, NULL, '<p>&nbsp; &nbsp; &nbsp; &nbsp;这里写你的初始化内容\r\n &nbsp; &nbsp;</p>', 1520818693, 1528141643),
(274, '207.46.13.104', '', 217, '217', '', 'VIP栏目页面问题分析 游客不能看 不是vip提示不明显 支付后没有开通 代码讲解', '0.10', 0, '217课 VIP栏目页面问题分析 游客不能看 不是vip提示不明显 支付后没有开通 代码讲解', 30, 19, NULL, '<p>&nbsp; &nbsp; &nbsp; &nbsp;这里写你的初始化内容\r\n &nbsp; &nbsp;</p>', 1520818729, 1529368307),
(275, '118.197.251.150', '', 218, '218', '', 'VIP会员购买后统一调用处理语句', '0.10', 0, '218课 VIP会员购买后统一调用处理语句', 30, 23, NULL, '<p>&nbsp; &nbsp; &nbsp; &nbsp;这里写你的初始化内容\r\n &nbsp; &nbsp;</p>', 1520818755, 1528283371),
(276, '40.77.167.139', '', 219, '219', '', ' 排行榜功能', '0.10', 0, '219课 排行榜功能简单实现演示', 30, 24, NULL, '<p>&nbsp; &nbsp; &nbsp; &nbsp;这里写你的初始化内容\r\n &nbsp; &nbsp;</p>', 1520818790, 1530760572),
(277, '40.77.167.93', '', 220, '220', '', '百度Ueditor编辑器', '0.10', 0, '220课 百度Ueditor编辑器与TP5 结合 简易分享', 30, 32, NULL, '<p>&nbsp; &nbsp; &nbsp; &nbsp;这里写你的初始化内容\r\n &nbsp; &nbsp;</p>', 1520818841, 1532189846),
(278, '207.46.13.184', '', 221, '221', '', '百度Ueditor编辑器源码', '0.10', 0, '221课 百度Ueditor编辑器与TP5 结合 简易分享 实现代码 源码', 30, 37, NULL, '<p>&nbsp; &nbsp; &nbsp; &nbsp;这里写你的初始化内容\r\n &nbsp; &nbsp;</p>', 1520818867, 1529149417),
(279, '40.77.167.135', '', 222, '222', '', '变量过滤 过滤百度编辑器内容', '0.10', 0, '222课 变量过滤 过滤百度编辑器内容Index', 30, 20, NULL, '<p>&nbsp; &nbsp; &nbsp; &nbsp;这里写你的初始化内容\r\n &nbsp; &nbsp;</p>', 1520818891, 1528706157),
(280, '40.77.167.93', '', 223, '223', '', '百度编辑器内容 设置单独不过滤发布内容Index', '0.10', 0, '223课 百度编辑器内容 设置单独不过滤发布内容Index', 30, 19, NULL, '<p>&nbsp; &nbsp; &nbsp; &nbsp;这里写你的初始化内容\r\n &nbsp; &nbsp;</p>', 1520819032, 1532057917),
(281, '207.46.13.172', '', 224, '224', '', '百度Ueditor编辑器 获取富文本传文本', '0.10', 0, '224课 百度Ueditor编辑器 获取富文本传文本 show', 30, 32, NULL, '<p>&nbsp; &nbsp; &nbsp; &nbsp;这里写你的初始化内容\r\n &nbsp; &nbsp;</p>', 1520819056, 1528784322),
(282, '207.46.13.172', '', 225, '225', '', '百度Ueditor编辑器 修改内容时设置update', '0.10', 0, '225课 百度Ueditor编辑器 修改内容时设置update', 30, 25, NULL, '<p>&nbsp; &nbsp; &nbsp; &nbsp;这里写你的初始化内容\r\n &nbsp; &nbsp;</p>', 1520819075, 1530964121),
(283, '47.92.74.243', '', 226, '226', '', 'Ueditor编辑器定制工具栏图标update', '0.10', 0, '226课 Ueditor编辑器定制工具栏图标 update', 30, 33, NULL, '<p>&nbsp; &nbsp; &nbsp; &nbsp;这里写你的初始化内容\r\n &nbsp; &nbsp;</p>', 1520819099, 1529361244),
(284, '40.77.167.135', '', 227, '227', '', 'Ueditor编辑器 关闭元素路径和字数统计update', '0.10', 0, '227课 Ueditor编辑器 关闭元素路径和字数统计 update', 30, 22, NULL, '<p>&nbsp; &nbsp; &nbsp; &nbsp;这里写你的初始化内容\r\n &nbsp; &nbsp;</p>', 1520819128, 1531956865),
(285, '207.46.13.188', '', 228, '228', '', 'Ueditor编辑器 编辑内容展示 代码高亮 分析 view', '0.10', 0, '228课 Ueditor编辑器 编辑内容展示 代码高亮 分析 view', 30, 21, NULL, '<p>&nbsp; &nbsp; &nbsp; &nbsp;这里写你的初始化内容\r\n &nbsp; &nbsp;</p>', 1520819148, 1532236398),
(286, '40.77.167.129', '', 229, '229', '', 'Ueditor编辑器 编辑内容展示 代码高亮 讲解 view', '0.10', 0, '229课 Ueditor编辑器 编辑内容展示 代码高亮 讲解 view', 30, 25, NULL, '<p>&nbsp; &nbsp; &nbsp; &nbsp;这里写你的初始化内容\r\n &nbsp; &nbsp;</p>', 1520819166, 1528641059),
(287, '180.169.174.134', '', 230, '230', '', '标签 关键词 实现思路分享', '0.10', 0, '230课 标签 关键词 实现思路分享', 30, 25, NULL, '<p>&nbsp; &nbsp; &nbsp; &nbsp;这里写你的初始化内容\r\n &nbsp; &nbsp;</p>', 1520819186, 1531906405),
(288, '157.55.39.195', '', 231, '231', '', ' 标签 关键词 实现思路 代码Index', '0.10', 0, '231课 标签 关键词 实现思路 代码Index', 30, 24, NULL, '<p>&nbsp; &nbsp; &nbsp; &nbsp;这里写你的初始化内容\r\n &nbsp; &nbsp;</p>', 1520819205, 1528961516),
(289, '40.77.167.161', '', 232, '232', '', '标签 关键词 在列表显示', '0.10', 0, '232课 标签 关键词 在列表显示 思路分析', 30, 22, NULL, '<p>&nbsp; &nbsp; &nbsp; &nbsp;这里写你的初始化内容\r\n &nbsp; &nbsp;</p>', 1520819235, 1529902168),
(290, '40.77.167.93', '', 233, '233', '', '标签 关键词 在列表显示 代码实现Index', '0.10', 0, '233课 标签 关键词 在列表显示 代码实现Index', 30, 24, NULL, '<p>&nbsp; &nbsp; &nbsp; &nbsp;这里写你的初始化内容\r\n &nbsp; &nbsp;</p>', 1520819254, 1531981970),
(291, '110.53.16.176', '', 234, '234', '', '每日签到10人或打赏10元 所有课程免费 思路分析', '0.10', 0, '234课 每日签到10人或打赏10元 所有课程免费 思路分析', 30, 25, NULL, '<p>&nbsp; &nbsp; &nbsp; &nbsp;这里写你的初始化内容\r\n &nbsp; &nbsp;</p>', 1520819273, 1530956635),
(292, '101.132.144.145', '', 235, '235', '', '每日签到10人或打赏10元 所有课程免费 实战分享', '0.10', 0, '235课 每日签到10人或打赏10元 所有课程免费 实战分享', 30, 23, NULL, '<p>&nbsp; &nbsp; &nbsp; &nbsp;这里写你的初始化内容\r\n &nbsp; &nbsp;</p>', 1520819294, 1530684372),
(293, '40.77.167.135', '', 236, '236', '', '每日签到10人或打赏10元 所有课程免费 代码讲解common', '0.10', 0, '236课 每日签到10人或打赏10元 所有课程免费 代码讲解common', 30, 26, NULL, '<p>&nbsp; &nbsp; &nbsp; &nbsp;这里写你的初始化内容\r\n &nbsp; &nbsp;</p>', 1520819314, 1532202803),
(294, '40.77.167.135', '', 237, '237', '', ' 签到免费学习活动提示功能index', '0.10', 0, '237课 签到免费学习活动提示功能index', 30, 28, NULL, '<p>&nbsp; &nbsp; &nbsp; &nbsp;这里写你的初始化内容\r\n &nbsp; &nbsp;</p>', 1520819332, 1531963845),
(295, '40.77.167.48', '', 238, '238', '', '每日签到10人或打赏10元 所有课程免费 页面此公共函数功能Index', '0.10', 0, '238课 每日签到10人或打赏10元 所有课程免费 页面此公共函数功能Index', 30, 28, NULL, '<p>&nbsp; &nbsp; &nbsp; &nbsp;这里写你的初始化内容\r\n &nbsp; &nbsp;</p>', 1520819355, 1528478000),
(296, '106.14.167.211', '', 239, '239', '', '标签 关键词 用模型实现', '0.10', 0, '239课 标签 关键词 用模型实现', 30, 16, NULL, '<p>&nbsp; &nbsp; &nbsp; &nbsp;这里写你的初始化内容\r\n &nbsp; &nbsp;</p>', 1520819378, 1530480421),
(297, '183.48.246.9', '', 240, '240', '', '每节课前10名会员观看直接免费 功能思路', '0.10', 0, '240课 每节课前10名会员观看直接免费 功能 思路', 30, 31, NULL, '<p>&nbsp; &nbsp; &nbsp; &nbsp;这里写你的初始化内容\r\n &nbsp; &nbsp;</p>', 1520819400, 1531816512),
(298, '183.48.246.9', '', 241, '241', '', '每节课前10名会员观看直接免费 功能 核心代码common', '0.10', 0, '241课 每节课前10名会员观看直接免费 功能 核心代码common', 30, 45, NULL, '<p>&nbsp; &nbsp; &nbsp; &nbsp;这里写你的初始化内容\r\n &nbsp; &nbsp;</p>', 1520819424, 1531816654),
(299, '112.14.72.196', '', 1008610086, '', '', 'U盘thinkphp5视频教程包邮', '0.10', 0, 'U盘版thinkphp5视频教程[包邮]', 30, 89, NULL, '<p><strong><img src="/ueditor/php/upload/image/20180705/1530723659116000.png" title="1530723659116000.png" alt="简单说明-新录制到360课左右.png"/></strong></p><p><strong>本课U盘版thinkphp5视频教程[包邮]&nbsp; 购买后Q我250285636 ，你的邮寄地址，尽快邮寄给您！</strong></p>', 1520844156, 1532062182);
INSERT INTO `think_shop` (`id`, `name`, `lesson`, `sort`, `address`, `product`, `label`, `price`, `status`, `title`, `age`, `page_view`, `delete_time`, `content`, `create_time`, `update_time`) VALUES
(300, '66.249.69.46', '', 1008610086, '', '&lt;script async src=&quot;//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js&quot;&gt;&lt;/script&gt;\r\n&lt;script&gt;\r\n     (adsbygoogle = window.adsbygoogle || []).push({\r\n          google_ad_client: &quot;ca-pub-8644709060035439&quot;,\r\n          enable_page_level_ads: true\r\n     });\r\n&lt;/script&gt;', 'google', '0.10', 0, 'google', 30, 2, NULL, '<p>&nbsp; &nbsp; &nbsp; &nbsp;这里写你的初始化内容\r\n &nbsp; &nbsp;</p><p><br/></p><p><br/></p><p><span style="font-family: Roboto, sans-serif; font-size: 0px; white-space: pre; background-color: rgb(245, 245, 245);">&lt;script async src=&quot;//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js&quot;&gt;&lt;/script&gt;\r\n&lt;script&gt;\r\n &nbsp; &nbsp; (adsbygoogle = window.adsbygoogle || []).push({\r\n &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;google_ad_client: &quot;ca-pub-8644709060035439&quot;,\r\n &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;enable_page_level_ads: true\r\n &nbsp; &nbsp; });\r\n&lt;/script&gt;</span></p><pre class="brush:html;toolbar:false">&lt;script&nbsp;async&nbsp;src=&quot;//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js&quot;&gt;&lt;/script&gt;\r\n&lt;script&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(adsbygoogle&nbsp;=&nbsp;window.adsbygoogle&nbsp;||&nbsp;[]).push({\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;google_ad_client:&nbsp;&quot;ca-pub-8644709060035439&quot;,\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;enable_page_level_ads:&nbsp;true\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;});\r\n&lt;/script&gt;</pre><p><br/></p><pre style="background-color:#2b2b2b;color:#a9b7c6;font-family:&#39;DejaVu Sans Mono&#39;;font-size:24.0pt;"><span style="color:#808080;background-color:#232525;">// </span><span style="color:#808080;background-color:#232525;font-family:&#39;SimSun&#39;;">查询页面浏览次数<br/></span><span style="color:#cc7832;background-color:#232525;font-weight:bold;">function </span><span style="color:#ffc66d;background-color:#232525;">view_count</span><span style="background-color:#232525;">(</span><span style="color:#9876aa;background-color:#232525;">$shop</span><span style="background-color:#232525;">){<br/></span><span style="background-color:#232525;"><br/></span><span style="background-color:#232525;"> &nbsp; &nbsp;</span><span style="color:#808080;background-color:#232525;">// </span><span style="color:#808080;background-color:#232525;font-family:&#39;SimSun&#39;;">查询播放记录条数<br/></span><span style="color:#808080;background-color:#232525;font-family:&#39;SimSun&#39;;"> &nbsp; &nbsp;</span><span style="color:#9876aa;background-color:#232525;">$url </span><span style="background-color:#232525;">= </span><span style="color:#6a8759;background-color:#232525;">&quot;/index/index/view/id/&quot;</span><span style="background-color:#232525;">. </span><span style="color:#9876aa;background-color:#232525;">$shop</span><span style="color:#cc7832;background-color:#232525;">;<br/></span><span style="color:#cc7832;background-color:#232525;"> &nbsp; &nbsp;</span><span style="color:#9876aa;background-color:#232525;">$view_count </span><span style="background-color:#232525;">= &nbsp;Footprint::</span><span style="color:#ffc66d;background-color:#232525;font-style:italic;">where</span><span style="background-color:#232525;">(</span><span style="color:#6a8759;background-color:#232525;">&#39;url&#39;</span><span style="color:#cc7832;background-color:#232525;">,</span><span style="color:#6a8759;background-color:#232525;">&#39;=&#39;</span><span style="color:#cc7832;background-color:#232525;">,</span><span style="color:#9876aa;background-color:#232525;">$url</span><span style="background-color:#232525;">)<br/></span><span style="background-color:#232525;"> &nbsp; &nbsp; &nbsp; &nbsp;-&gt;</span><span style="color:#ffc66d;background-color:#232525;">count</span><span style="background-color:#232525;">()</span><span style="color:#cc7832;background-color:#232525;">;<br/></span><span style="color:#cc7832;background-color:#232525;"><br/></span><span style="color:#cc7832;background-color:#232525;"> &nbsp; &nbsp;</span><span style="color:#cc7832;background-color:#232525;font-weight:bold;">return </span><span style="color:#9876aa;background-color:#232525;">$view_count</span><span style="color:#cc7832;background-color:#232525;">;<br/></span><span style="color:#cc7832;background-color:#232525;"><br/></span><span style="background-color:#232525;">}</span></pre><p><br/></p>', 1521021570, 1524086711),
(301, '157.55.39.41', '', 110, '110', '', 'AJAX URL 动态变量 传值  ', '0.10', 0, '110课 AJAX页面URL动态变量传值 入门', 30, 23, NULL, '<p>&nbsp; &nbsp; &nbsp; &nbsp;这里写你的初始化内容\r\n &nbsp; &nbsp;</p>', 1521084749, 1529638463),
(302, '66.249.79.110', '', 251, '251', '', '现金红包 Ajax  领取红包无刷新反馈', '0.10', 0, '251课 现金红包 Ajax配合领取红包无刷新反馈', 30, 24, NULL, '<pre class="brush:js;toolbar:false">&lt;script&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;获取红包的ajax\r\n&nbsp;&nbsp;&nbsp;&nbsp;function&nbsp;red_packet(id)\r\n&nbsp;&nbsp;&nbsp;&nbsp;{\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;var&nbsp;xmlhttp;\r\n\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(window.XMLHttpRequest)\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;IE7+,&nbsp;Firefox,&nbsp;Chrome,&nbsp;Opera,&nbsp;Safari&nbsp;浏览器执行代码\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;xmlhttp=new&nbsp;XMLHttpRequest();\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;else\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;IE6,&nbsp;IE5&nbsp;浏览器执行代码\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;xmlhttp=new&nbsp;ActiveXObject(&quot;Microsoft.XMLHTTP&quot;);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;xmlhttp.onreadystatechange=function()\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(xmlhttp.readyState==4&nbsp;&amp;&amp;&nbsp;xmlhttp.status==200)\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;document.getElementById(&quot;red_packet&quot;).innerHTML=xmlhttp.responseText;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;document.getElementById(&quot;red_packet&quot;).innerHTML=&#39;99&#39;;\r\n\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;xmlhttp.open(&quot;GET&quot;,&quot;/index/index/view/red_packet_get/1/id/&quot;+id,true);\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;xmlhttp.send();\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;}\r\n&lt;/script&gt;</pre><p><br/></p>', 1521094756, 1528727294),
(303, '207.46.13.214', '', 252, '252', '', '现金红包  演示', '0.10', 0, '252课 现金红包 基本完善演示', 30, 36, NULL, '<pre class="brush:html;toolbar:false">{if&nbsp;condition=&quot;$list.red_packet_count&gt;0&quot;}\r\n&lt;div&nbsp;class=&quot;alert&nbsp;alert-danger&quot;&nbsp;role=&quot;alert&quot;&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;span&nbsp;class=&quot;glyphicon&nbsp;glyphicon-flag&quot;&nbsp;aria-hidden=&quot;true&quot;&gt;&lt;/span&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;span&nbsp;class=&quot;sr-only&quot;&gt;Error:&lt;/span&gt;\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;{if&nbsp;condition=&quot;$list.red_packet_lesson&quot;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;已生成红包！&nbsp;红包(id{$list.red_packet_lesson_id})金额:{$list.red_packet_lesson}元&nbsp;请截此图到qq群189250799领取\r\n&nbsp;&nbsp;&nbsp;&nbsp;{else&nbsp;/}\r\n&nbsp;&nbsp;&nbsp;&nbsp;您有一个现金红包！\r\n\r\n\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;!--&lt;a&nbsp;&nbsp;href=&quot;__ROOT__/index/index/view/red_packet_get/1/id/{$list.id}&quot;&nbsp;id=&quot;btn&quot;&nbsp;class=&quot;btn&nbsp;btn-danger&quot;&nbsp;target=&quot;_self&quot;&nbsp;&nbsp;&gt;&lt;span&nbsp;&nbsp;&nbsp;class=&quot;glyphicon&nbsp;glyphicon-gift&quot;&nbsp;aria-hidden=&quot;true&quot;&gt;&lt;/span&gt;&nbsp;点此领取红包&lt;/a&gt;--&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;a&nbsp;&nbsp;&nbsp;onclick=&quot;red_packet({$list.id})&quot;&nbsp;id=&quot;btn&quot;&nbsp;class=&quot;btn&nbsp;btn-danger&quot;&nbsp;target=&quot;_self&quot;&nbsp;&nbsp;&gt;&lt;span&nbsp;&nbsp;&nbsp;class=&quot;glyphicon&nbsp;glyphicon-gift&quot;&nbsp;aria-hidden=&quot;true&quot;&gt;&lt;/span&gt;&nbsp;点此领取红包&lt;/a&gt;\r\n\r\n\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;span&nbsp;id=&quot;red_packet&quot;&gt;&lt;/span&gt;\r\n&nbsp;&nbsp;&nbsp;&nbsp;{/if}\r\n&lt;/div&gt;\r\n{/if}</pre><p><br/></p>', 1521094910, 1528680018),
(304, '40.77.167.109', '', 253, '253', '', '现金红包 上线 演示 ', '0.10', 0, '253课  现金红包 上线演示 完善功能  ', 30, 79, NULL, '<pre class="brush:php;toolbar:false">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if(!$list[&#39;data_len&#39;]){\r\n//&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;&quot;评论满10字本课来领取&quot;;&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}</pre><pre class="brush:php;toolbar:false">$rand&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=&nbsp;mt_rand(100,300);&nbsp;//取随机四位数字&nbsp;红包扩大10倍\r\n\r\n$total_fee&nbsp;=&nbsp;$rand/100;&nbsp;//缩小为0.01-0.30之间的数字\r\n\r\n\r\n$list[&#39;data_len&#39;]&nbsp;=&nbsp;$data_len;</pre><p><br/></p>', 1521095031, 1527947638),
(305, '207.46.13.106', '', 254, '254', '', '数据库存储过程', '0.10', 0, '254课 调用数据库存储过程 简易演示', 30, 41, NULL, '<p>5<span style="color: rgba(0, 0, 0, 0.87); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Arial, Helvetica, sans-serif; font-size: 15.96px; background-color: rgb(255, 255, 255);">.0支持存储过程，如果我们定义了一个数据库存储过程</span><code style="box-sizing: inherit; -webkit-tap-highlight-color: transparent; text-size-adjust: none; -webkit-font-smoothing: antialiased; font-family: Consolas, &quot;Liberation Mono&quot;, Menlo, Courier, monospace; font-size: 15.96px; display: inline-block; border-radius: 4px; padding: 2px 6px; background: rgb(249, 250, 250); word-break: break-all; white-space: pre; line-height: 1.3; border: 1px solid rgb(222, 217, 217); margin: 0px 5px; color: rgba(0, 0, 0, 0.87);">sp_query</code><span style="color: rgba(0, 0, 0, 0.87); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Arial, Helvetica, sans-serif; font-size: 15.96px; background-color: rgb(255, 255, 255);">，可以使用下面的方式调用：</span></p><pre class="brush:php;toolbar:false">$result&nbsp;=&nbsp;Db::query(&#39;call&nbsp;sp_query()&#39;);\r\ndump($result);\r\ndie();</pre><p><span style="color: rgba(0, 0, 0, 0.87); font-family: &quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Arial, Helvetica, sans-serif; font-size: 15.96px; background-color: rgb(255, 255, 255);"></span><br/></p>', 1521772872, 1530599682),
(306, '40.77.190.68', '', 255, '255', '', '数据库存储过程创建', '0.10', 0, '255课 数据库存储过程 简单创建 查看', 30, 26, NULL, '<p>在phpmyadmin里创建存储过程实例：</p><pre class="brush:sql;toolbar:false">&nbsp;&nbsp;&nbsp;CREATE&nbsp;PROCEDURE&nbsp;test888&nbsp;()\r\nBEGIN\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SELECT&nbsp;*&nbsp;FROM&nbsp;`think_userinfo`&nbsp;WHERE&nbsp;&nbsp;`id`&nbsp;&gt;20;\r\n\r\nEND;</pre><p><br/></p><pre style="background-color:#2b2b2b;color:#a9b7c6;font-family:&#39;DejaVu Sans Mono&#39;;font-size:24.0pt;"><span style="color:#808080;background-color:#232525;">// &nbsp; &nbsp; </span><span style="color:#808080;background-color:#232525;font-family:&#39;SimSun&#39;;">运行：<br/></span><span style="color:#808080;background-color:#232525;font-family:&#39;SimSun&#39;;"><br/></span><span style="color:#808080;background-color:#232525;font-family:&#39;SimSun&#39;;"> &nbsp; &nbsp; &nbsp;</span><span style="color:#9876aa;background-color:#232525;font-style:italic;">call </span><span style="background-color:#232525;">test()<br/></span><span style="color:#808080;background-color:#232525;">// &nbsp; &nbsp; </span><span style="color:#808080;background-color:#232525;font-family:&#39;SimSun&#39;;">删除：<br/></span><span style="color:#808080;background-color:#232525;font-family:&#39;SimSun&#39;;"><br/></span><span style="color:#808080;background-color:#232525;font-family:&#39;SimSun&#39;;"> &nbsp; &nbsp; &nbsp; &nbsp;</span><span style="color:#9876aa;background-color:#232525;font-style:italic;">Drop procedure test555<br/></span><span style="color:#9876aa;background-color:#232525;font-style:italic;"><br/></span><span style="color:#808080;background-color:#232525;">//DROP EVENT test555;<br/></span><span style="color:#808080;background-color:#232525;"><br/></span><span style="color:#808080;background-color:#232525;">// &nbsp; &nbsp; &nbsp;</span><span style="color:#808080;background-color:#232525;font-family:&#39;SimSun&#39;;">查看所有存储过程<br/></span><span style="color:#808080;background-color:#232525;font-family:&#39;SimSun&#39;;"><br/></span><span style="color:#808080;background-color:#232525;font-family:&#39;SimSun&#39;;"> &nbsp; &nbsp; &nbsp;</span><span style="color:#9876aa;background-color:#232525;font-style:italic;">show procedure status</span><span style="color:#cc7832;background-color:#232525;">;<br/></span><span style="color:#cc7832;background-color:#232525;"><br/></span><span style="color:#cc7832;background-color:#232525;"><br/></span><span style="color:#808080;background-color:#232525;">// &nbsp; &nbsp; &nbsp;</span><span style="color:#808080;background-color:#232525;font-family:&#39;SimSun&#39;;">查看存储过程或函数的创建代码<br/></span><span style="color:#808080;background-color:#232525;font-family:&#39;SimSun&#39;;"><br/></span><span style="color:#808080;background-color:#232525;font-family:&#39;SimSun&#39;;"> &nbsp; &nbsp; &nbsp; &nbsp;</span><span style="color:#9876aa;background-color:#232525;font-style:italic;">show create procedure test</span><span style="color:#cc7832;background-color:#232525;">;<br/></span><span style="color:#808080;background-color:#232525;">// &nbsp; &nbsp; &nbsp; &nbsp;show create procedure gogo;<br/></span><span style="color:#808080;background-color:#232525;"><br/></span><span style="color:#808080;background-color:#232525;"><br/></span><span style="color:#808080;background-color:#232525;">// &nbsp; &nbsp; </span><span style="color:#808080;background-color:#232525;font-family:&#39;SimSun&#39;;">修改方法：<br/></span><span style="color:#808080;background-color:#232525;">// &nbsp; &nbsp; &nbsp; &nbsp;</span><span style="color:#808080;background-color:#232525;font-family:&#39;SimSun&#39;;">删除后重新加</span></pre><p><br/></p>', 1521774682, 1530993663),
(307, '157.55.39.104', '', 256, '256', '', '数据库存储过程 查看详情', '0.10', 0, '256课 数据库存储过程 查看详情', 30, 17, NULL, '<pre style="background-color:#2b2b2b;color:#a9b7c6;font-family:&#39;DejaVu Sans Mono&#39;;font-size:24.0pt;"><span style="font-size: 16px;"><span style="color: rgb(128, 128, 128); background-color: rgb(35, 37, 37);">// &nbsp; &nbsp; &nbsp;</span><span style="color: rgb(128, 128, 128); background-color: rgb(35, 37, 37); font-family: SimSun;">查看所有存储过程<br/><br/> &nbsp; &nbsp; &nbsp;</span><span style="color: rgb(152, 118, 170); background-color: rgb(35, 37, 37); font-style: italic;">show procedure status</span><span style="color: rgb(204, 120, 50); background-color: rgb(35, 37, 37);">;<br/><br/><br/></span><span style="color: rgb(128, 128, 128); background-color: rgb(35, 37, 37);">// &nbsp; &nbsp; &nbsp;</span><span style="color: rgb(128, 128, 128); background-color: rgb(35, 37, 37); font-family: SimSun;">查看存储过程或函数的创建代码<br/><br/> &nbsp; &nbsp; &nbsp; &nbsp;</span><span style="color: rgb(152, 118, 170); background-color: rgb(35, 37, 37); font-style: italic;">show create procedure test</span><span style="color: rgb(204, 120, 50); background-color: rgb(35, 37, 37);">;<br/></span><span style="color: rgb(128, 128, 128); background-color: rgb(35, 37, 37);">// &nbsp; &nbsp; &nbsp; &nbsp;show create procedure gogo;<br/></span></span></pre><p><br/></p>', 1521775788, 1528418706),
(308, '207.46.13.48', '', 257, '257', '', '数据库 存储过程 删除', '0.10', 0, '257课 数据库存储过程 删除存储过程', 30, 23, NULL, '', 1521776424, 1531320780),
(309, '5.255.250.138', '', 258, '258', '', 'mysql 定时器  定时 存储过程', '0.10', 0, '258课 mysql定时器 定时执行 存储过程 任务 演示 ', 30, 28, NULL, '<p>&nbsp;</p><pre style="background-color:#2b2b2b;color:#a9b7c6;font-family:&#39;DejaVu Sans Mono&#39;;font-size:24.0pt;"><span style="color:#9876aa;background-color:#232525;font-style:italic;">create event </span><span style="color:#cc7832;background-color:#232525;font-weight:bold;">if </span><span style="color:#9876aa;background-color:#232525;font-style:italic;">not exists tom<br/></span><span style="color:#9876aa;background-color:#232525;font-style:italic;">on schedule every </span><span style="color:#6897bb;background-color:#232525;">1 </span><span style="color:#9876aa;background-color:#232525;font-style:italic;">second<br/></span><span style="color:#9876aa;background-color:#232525;font-style:italic;">on completion PRESERVE<br/></span><span style="color:#cc7832;background-color:#232525;font-weight:bold;">do </span><span style="color:#9876aa;background-color:#232525;font-style:italic;">call </span><span style="background-color:#232525;">gogo()</span><span style="color:#cc7832;background-color:#232525;">;<br/></span><span style="color:#cc7832;background-color:#232525;"><br/></span><span style="color:#808080;background-color:#232525;">// &nbsp; &nbsp; &nbsp; &nbsp;</span><span style="color:#808080;background-color:#232525;font-family:&#39;SimSun&#39;;">紧接着还要开启事件：<br/></span><span style="color:#808080;background-color:#232525;font-family:&#39;SimSun&#39;;"> <br/></span><span style="color:#808080;background-color:#232525;">// &nbsp; &nbsp; &nbsp; &nbsp;ALTER EVENT &nbsp;eventJob DISABLE;<br/></span><span style="color:#808080;background-color:#232525;">// &nbsp; &nbsp; &nbsp; &nbsp;ALTER EVENT eventJob ENABLE;<br/></span><span style="color:#808080;background-color:#232525;"> &nbsp; &nbsp; &nbsp; &nbsp;</span><span style="color:#9876aa;background-color:#232525;font-style:italic;">SHOW VARIABLES LIKE </span><span style="color:#6a8759;background-color:#232525;">&#39;%sche%&#39;</span><span style="color:#cc7832;background-color:#232525;">; </span><span style="background-color:#232525;">-- </span><span style="color:#9876aa;background-color:#232525;font-style:italic;font-family:&#39;SimSun&#39;;">查看定时器状态<br/></span><span style="color:#9876aa;background-color:#232525;font-style:italic;font-family:&#39;SimSun&#39;;"> &nbsp; &nbsp; &nbsp; &nbsp;</span><span style="color:#9876aa;background-color:#232525;font-style:italic;">select </span><span style="background-color:#232525;">* </span><span style="color:#9876aa;background-color:#232525;font-style:italic;">from mysql</span><span style="background-color:#232525;">.</span><span style="color:#9876aa;background-color:#232525;font-style:italic;">event &nbsp;</span><span style="color:#9876aa;background-color:#232525;font-style:italic;font-family:&#39;SimSun&#39;;">查询和修改所有定时任务<br/></span><span style="color:#9876aa;background-color:#232525;font-style:italic;font-family:&#39;SimSun&#39;;"><br/></span><span style="color:#808080;background-color:#232525;">// &nbsp; &nbsp; &nbsp; &nbsp;set global event_scheduler=1<br/></span><span style="color:#808080;background-color:#232525;"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span><span style="color:#9876aa;background-color:#232525;font-style:italic;">set </span><span style="color:#cc7832;background-color:#232525;font-weight:bold;">global </span><span style="color:#9876aa;background-color:#232525;font-style:italic;">event_scheduler</span><span style="background-color:#232525;">=</span><span style="color:#6897bb;background-color:#232525;">0 </span><span style="color:#9876aa;background-color:#232525;font-style:italic;font-family:&#39;SimSun&#39;;">关闭事件<br/></span><span style="color:#9876aa;background-color:#232525;font-style:italic;font-family:&#39;SimSun&#39;;"><br/></span><span style="color:#808080;background-color:#232525;">// &nbsp; &nbsp; &nbsp; &nbsp;</span><span style="color:#808080;background-color:#232525;font-family:&#39;SimSun&#39;;">在</span><span style="color:#808080;background-color:#232525;">my.cnf</span><span style="color:#808080;background-color:#232525;font-family:&#39;SimSun&#39;;">中的</span><span style="color:#808080;background-color:#232525;">[mysqld]</span><span style="color:#808080;background-color:#232525;font-family:&#39;SimSun&#39;;">部分添加</span><span style="color:#808080;background-color:#232525;"> event_scheduler=ON </span><span style="color:#808080;background-color:#232525;font-family:&#39;SimSun&#39;;">然后重启</span><span style="color:#808080;background-color:#232525;">mysql</span></pre><p><br/></p>', 1521776549, 1527878953),
(310, '66.249.64.16', '', 259, '259', '', 'mysql 定时器 定时 存储过程 可视化 ', '0.10', 0, '259课 mysql定时器 定时执行 存储过程 任务 可视化创建方法 ', 30, 17, NULL, '', 1521776637, 1532125236),
(311, '40.77.167.67', '', 260, '260', '', 'mysql 定时器 定时  存储过程 命令行 ', '0.10', 0, '260课 mysql定时器 定时执行 存储过程 任务 命令行创建方法 ', 30, 17, NULL, '<p>&nbsp; &nbsp; &nbsp;</p><pre style="background-color:#2b2b2b;color:#a9b7c6;font-family:&#39;DejaVu Sans Mono&#39;;font-size:24.0pt;"><span style="background-color:#232525;"> </span><span style="color:#9876aa;background-color:#232525;font-style:italic;">create event </span><span style="color:#cc7832;background-color:#232525;font-weight:bold;">if </span><span style="color:#9876aa;background-color:#232525;font-style:italic;">not exists tom<br/></span><span style="color:#9876aa;background-color:#232525;font-style:italic;">on schedule every </span><span style="color:#6897bb;background-color:#232525;">1 </span><span style="color:#9876aa;background-color:#232525;font-style:italic;">second<br/></span><span style="color:#9876aa;background-color:#232525;font-style:italic;">on completion PRESERVE<br/></span><span style="color:#cc7832;background-color:#232525;font-weight:bold;">do </span><span style="color:#9876aa;background-color:#232525;font-style:italic;">call </span><span style="background-color:#232525;">gogo()</span><span style="color:#cc7832;background-color:#232525;">;<br/></span><span style="color:#cc7832;background-color:#232525;"><br/></span><span style="color:#808080;background-color:#232525;">// &nbsp; &nbsp; &nbsp; &nbsp;</span><span style="color:#808080;background-color:#232525;font-family:&#39;SimSun&#39;;">紧接着还要开启事件：<br/></span><span style="color:#808080;background-color:#232525;font-family:&#39;SimSun&#39;;"><br/></span><span style="color:#808080;background-color:#232525;">// &nbsp; &nbsp; &nbsp; &nbsp;ALTER EVENT &nbsp;eventJob DISABLE;<br/></span><span style="color:#808080;background-color:#232525;">// &nbsp; &nbsp; &nbsp; &nbsp;ALTER EVENT eventJob ENABLE;<br/></span><span style="color:#808080;background-color:#232525;"> &nbsp; &nbsp; &nbsp; &nbsp;</span><span style="color:#9876aa;background-color:#232525;font-style:italic;">SHOW VARIABLES LIKE </span><span style="color:#6a8759;background-color:#232525;">&#39;%sche%&#39;</span><span style="color:#cc7832;background-color:#232525;">; </span><span style="background-color:#232525;">-- </span><span style="color:#9876aa;background-color:#232525;font-style:italic;font-family:&#39;SimSun&#39;;">查看定时器状态<br/></span><span style="color:#9876aa;background-color:#232525;font-style:italic;font-family:&#39;SimSun&#39;;"> &nbsp; &nbsp; &nbsp; &nbsp;</span><span style="color:#9876aa;background-color:#232525;font-style:italic;">select </span><span style="background-color:#232525;">* </span><span style="color:#9876aa;background-color:#232525;font-style:italic;">from mysql</span><span style="background-color:#232525;">.</span><span style="color:#9876aa;background-color:#232525;font-style:italic;">event &nbsp;</span><span style="color:#9876aa;background-color:#232525;font-style:italic;font-family:&#39;SimSun&#39;;">查询和修改所有定时任务<br/></span><span style="color:#9876aa;background-color:#232525;font-style:italic;font-family:&#39;SimSun&#39;;"><br/></span><span style="color:#808080;background-color:#232525;">// &nbsp; &nbsp; &nbsp; &nbsp;set global event_scheduler=1<br/></span><span style="color:#808080;background-color:#232525;"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span><span style="color:#9876aa;background-color:#232525;font-style:italic;">set </span><span style="color:#cc7832;background-color:#232525;font-weight:bold;">global </span><span style="color:#9876aa;background-color:#232525;font-style:italic;">event_scheduler</span><span style="background-color:#232525;">=</span><span style="color:#6897bb;background-color:#232525;">0 </span><span style="color:#9876aa;background-color:#232525;font-style:italic;font-family:&#39;SimSun&#39;;">关闭事件<br/></span><span style="color:#9876aa;background-color:#232525;font-style:italic;font-family:&#39;SimSun&#39;;"><br/></span><span style="color:#808080;background-color:#232525;">// &nbsp; &nbsp; &nbsp; &nbsp;</span><span style="color:#808080;background-color:#232525;font-family:&#39;SimSun&#39;;">在</span><span style="color:#808080;background-color:#232525;">my.cnf</span><span style="color:#808080;background-color:#232525;font-family:&#39;SimSun&#39;;">中的</span><span style="color:#808080;background-color:#232525;">[mysqld]</span><span style="color:#808080;background-color:#232525;font-family:&#39;SimSun&#39;;">部分添加</span><span style="color:#808080;background-color:#232525;"> event_scheduler=ON </span><span style="color:#808080;background-color:#232525;font-family:&#39;SimSun&#39;;">然后重启</span><span style="color:#808080;background-color:#232525;">mysql<br/></span><span style="color:#808080;background-color:#232525;"><br/></span><span style="color:#808080;background-color:#232525;">// &nbsp; &nbsp; &nbsp; &nbsp;event</span><span style="color:#808080;background-color:#232525;font-family:&#39;SimSun&#39;;">的时间设置</span></pre><p><br/></p>', 1521776721, 1531147577),
(312, '211.142.96.60', '', 261, '261', '', 'mysql 定时器  定时 执行 存储过程  定时任务', '0.10', 0, '261课 mysql定时器 定时执行 存储过程 任务 小总结 ', 30, 20, NULL, '', 1521776890, 1524821464),
(313, '207.46.13.174', '', 262, '262', '', ' 访问次数  ', '0.10', 0, '262课 页面访问次数功能实现 思路分析', 30, 36, NULL, '', 1521776950, 1531472607),
(314, '207.46.13.172', '', 263, '263', '', '访问次数 foreach ', '0.10', 0, '263课 页面访问次数功能实现 foreach方式实现', 30, 59, NULL, '', 1521776982, 1530998807),
(315, '66.249.64.16', '', 264, '264', '', '智能 热门推荐  ', '0.10', 0, '264课 智能热门推荐 思路分析', 30, 25, NULL, '', 1522724053, 1532105877),
(316, '47.98.62.203', '', 265, '265', '', '智能 热门推荐 ', '0.10', 0, '265课 智能热门推荐 隐藏已经学习过的课', 30, 7, NULL, '', 1522724110, 1528865635),
(317, '207.46.13.30', '', 267, '267', '', '智能 热门推荐 二维数组排序', '0.10', 0, '267课 智能热门推荐 小例子二维数组排序实现原理', 30, 6, NULL, '', 1522724219, 1529446122),
(318, '207.46.13.34', '', 268, '268', '', '智能 热门推荐 二维数组 排序', '0.10', 0, '268课 智能热门推荐 二维数组排序外部的二维数组', 30, 10, NULL, '', 1522724327, 1525455856),
(319, '207.46.13.216', '', 269, '269', '', '智能 热门推荐 二维数组排序   ', '0.10', 0, '269课 智能热门推荐 二维数组排序对列的复杂实现', 30, 4, NULL, '', 1522724377, 1529305321),
(320, '157.55.39.134', '', 270, '270', '', '智能 热门推荐 数组删除 ', '0.10', 0, '270课 智能热门推荐 数组删除指定内容', 30, 12, NULL, '<p>&nbsp; &nbsp; &nbsp; &nbsp;这里写你的初始化内容\r\n &nbsp; &nbsp;</p>', 1522724441, 1527511897),
(321, '207.46.13.132', '', 271, '271', '', '查找 网站很慢 问题 ', '0.10', 0, '271课 查找一个网站很慢的问题 讲解', 30, 4, NULL, '', 1523088805, 1531937380),
(351, '40.77.167.107', '', 301, '666', '', 'Tp5 生成真实 静态html 文件  html ', '0.10', 0, '301课 Tp5简单快速生成真实静态html文件 演示', 30, 19, NULL, '', 1524029132, 1531807123),
(356, '180.160.2.190', '', 306, '666', '', '抢购 秒杀 ', '0.10', 0, '306课 Tp5 简易抢购秒杀功能实现', 30, 2, NULL, '', 1527579671, 1530708680),
(354, '47.98.62.203', '', 304, '666', '', ' 菜单 默认 选中 高亮', '0.10', 0, '304课 tp5 设置当前菜单默认选中高亮', 30, 4, NULL, '', 1527579613, 1531880087),
(345, '40.77.167.140', '', 295, '666', '', '双语 多语言 ', '0.10', 0, '295课 双语 多语言 增加多种语言流程', 30, 7, NULL, '', 1523240679, 1531762959),
(375, '117.136.38.131', '', 10086163, '666', '', '', '0.10', 0, '网易云课堂上传课程步骤', 30, 41, NULL, '<h1 style="font-size: 32px; font-weight: bold; border-bottom: 2px solid rgb(204, 204, 204); padding: 0px 4px 0px 0px; text-align: left; margin: 0px 0px 10px;"><strong>第一步：提供一个在网易云课堂 绑定的手机号&nbsp;</strong><a href="http://cp.study.163.com"><strong>http://cp.study.163.com</strong></a><strong>&nbsp;私聊发qq250285636 给我，我帮您开通发布权限</strong></h1><p><br/></p><p><br/></p><h1 style="font-size: 32px; font-weight: bold; border-bottom: 2px solid rgb(204, 204, 204); padding: 0px 4px 0px 0px; text-align: left; margin: 0px 0px 10px;">第二步：打开<a href="http://cp.study.163.com/400000000336019#/content/courseList">http://cp.study.163.com/400000000336019#/content/courseList</a>&nbsp;，确认你可以有发布的权限了。</h1><p><br/></p><p><br/></p><h1 style="font-size: 32px; font-weight: bold; border-bottom: 2px solid rgb(204, 204, 204); padding: 0px 4px 0px 0px; text-align: left; margin: 0px 0px 10px;">第三步：点击 “创建课程” 开始发布</h1><p><br/></p><p><img src="/ueditor/php/upload/image/20180610/1528617572225400.jpg" title="1528617572225400.jpg" alt="QQ图片20180610155404.jpg"/></p><p><br/></p><p><br/></p><h1 style="font-size: 32px; font-weight: bold; border-bottom: 2px solid rgb(204, 204, 204); padding: 0px 4px 0px 0px; text-align: left; margin: 0px 0px 10px;">打开后界面：</h1><p><br/></p><p><img src="/ueditor/php/upload/image/20180610/1528617335427090.png" title="1528617335427090.png"/></p><p><br/></p><h1 style="font-size: 32px; font-weight: bold; border-bottom: 2px solid rgb(204, 204, 204); padding: 0px 4px 0px 0px; text-align: left; margin: 0px 0px 10px;">填写的内容：课程名称 可以复制原来的。</h1><p><br/></p><p><img src="/ueditor/php/upload/image/20180610/1528617336111766.png" title="1528617336111766.png"/></p><p><br/></p><h1 style="font-size: 32px; font-weight: bold; border-bottom: 2px solid rgb(204, 204, 204); padding: 0px 4px 0px 0px; text-align: left; margin: 0px 0px 10px;">课程图片可以选择原来的课程里的 ，另存为一个</h1><p><br/></p><p><br/></p><p><img src="/ueditor/php/upload/image/20180610/1528617336140227.png" title="1528617336140227.png"/></p><p><br/></p><p><br/></p><p><br/></p><p><img src="/ueditor/php/upload/image/20180610/1528617337110096.png" title="1528617337110096.png"/></p><p><img src="/ueditor/php/upload/image/20180610/1528617337117050.png" title="1528617337117050.png"/></p><p><br/></p><p><img src="/ueditor/php/upload/image/20180610/1528617338157969.png" title="1528617338157969.png"/></p><p><br/></p><p><br/></p><h1 style="font-size: 32px; font-weight: bold; border-bottom: 2px solid rgb(204, 204, 204); padding: 0px 4px 0px 0px; text-align: left; margin: 0px 0px 10px;">课程讲师 这里直接跳过</h1><p><br/></p><p><img src="http://open.gaoxueya.com/ueditor/php/upload/image/20180610/1528617336236631.png" title="1528617336236631.png"/></p><p><br/></p><h1 style="font-size: 32px; font-weight: bold; border-bottom: 2px solid rgb(204, 204, 204); padding: 0px 4px 0px 0px; text-align: left; margin: 0px 0px 10px;">章节这里开始发布视频，主要注意章节就写一个，其他的50个都是小节</h1><p><br/></p><h1 style="font-size: 32px; font-weight: bold; border-bottom: 2px solid rgb(204, 204, 204); padding: 0px 4px 0px 0px; text-align: left; margin: 0px 0px 10px;"><img src="/ueditor/php/upload/image/20180610/1528617338761791.png" title="1528617338761791.png"/></h1><h1>最后 保存 提交审核即可 发布成功<img src="http://img.baidu.com/hi/jx2/j_0071.gif"/></h1>', 1528617393, 1531297518),
(322, '157.55.39.94', '', 272, '272', '', '查找 网站很慢 实例', '0.10', 0, '272课 查找一个网站很慢的语句的 实例', 30, 2, NULL, '', 1523088833, 1529194718),
(323, '157.55.39.211', '', 273, '273', '', 'Trace跟踪调试 SQL调试 ', '0.10', 0, '273课 Trace跟踪调试和SQL调试 实例', 30, 6, NULL, '', 1523089139, 1531312186),
(324, '157.55.39.210', '', 274, '274', '', 'Trace调试SQL调试跟踪调试', '0.10', 0, '274课 Trace跟踪调试和SQL调试 开启方法', 30, 1, NULL, '', 1523089268, 1531572923),
(325, '157.55.39.109', '', 275, '275', '', 'SQl语句很慢', '0.10', 0, '275课 SQl语句执行很慢 解决方法 思路分析', 30, 10, NULL, '', 1523089333, 1528907645),
(326, '40.77.167.198', '', 277, '277', '', 'SQl语句 执行很慢  ', '0.10', 0, '277课 SQl语句执行很慢 解决方法 加一个字段汇总', 30, 2, NULL, '', 1523089445, 1530302078),
(327, '120.79.184.41', '', 276, '276', '', '页面定时统计 访问量 ', '0.10', 0, '276课 页面定时统计访问量 思路', 30, 2, NULL, '<p>&nbsp; &nbsp; &nbsp; &nbsp;这里写你的初始化内容\r\n &nbsp; &nbsp;</p>', 1523089480, 1528579036),
(328, '47.92.99.247', '', 278, '666', '', 'ajax 延迟调用 ', '0.10', 0, '278课 ajax设置延迟调用流程', 30, 3, NULL, '', 1523198682, 1528770256),
(329, '157.55.39.250', '', 279, '666', '', 'sql语句 count ', '0.10', 0, '279课 sql语句的count汇总的实现', 30, 2, NULL, '', 1523198754, 1528994611),
(330, '40.77.167.143', '', 280, '666', '', '排查 页面很慢 ', '0.10', 0, '280课 排查页面很慢问题  课程小结', 30, 4, NULL, '', 1523198836, 1529690839),
(331, '157.55.39.110', '', 281, '666', '', '瀑布流 加载数据 ', '0.10', 0, '281课 瀑布流加载数据 实战分享', 30, 5, NULL, '', 1523198870, 1528939630),
(332, '40.77.167.139', '', 282, '666', '', '分类组合搜索', '0.10', 0, '282课 分类组合搜索 实现思路分享', 30, 27, NULL, '<pre class="brush:php;toolbar:false">//&nbsp;设置默认查询参数，没有用户查到用户就不查询\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$phone&nbsp;=&nbsp;0;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$eq&nbsp;=&nbsp;&quot;&lt;&gt;&quot;;\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;$phone&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=&nbsp;input(&#39;phone&#39;);\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;通过用户id查询出来手机号，如果有user_id字段这个地方就可以省略了\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;code...\r\n\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;$phone&nbsp;=&nbsp;&quot;18210787405&quot;;\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;($phone)&nbsp;{\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#&nbsp;设置打开单用户搜索功能\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$eq&nbsp;=&nbsp;&quot;=&quot;;\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n\r\n\r\n//&nbsp;$parValue=&quot;%E9%AA%8C%E8%AF%81token&quot;;\r\n//&nbsp;echo&nbsp;urldecode($parValue);\r\n//&nbsp;die();\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;&nbsp;在线时间排名\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$online_time&nbsp;&nbsp;=&nbsp;User::where(&#39;phone&#39;,&#39;&lt;&gt;&#39;,&#39;15966982315&#39;)\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&gt;where(&#39;phone&#39;,&#39;=&#39;,$phone)\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&gt;order(&#39;online_time&nbsp;desc&#39;)\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&gt;where(&#39;phone&#39;,$eq,$phone)\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&gt;limit(10)\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&gt;select();\r\n&nbsp;\r\n\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//&nbsp;&nbsp;学习最新动态&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;$leraning_time&nbsp;&nbsp;=&nbsp;Video::order(&#39;update_time&nbsp;desc&#39;)\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&gt;where(&#39;phone&#39;,$eq,$phone)\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&gt;limit(10)\r\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&gt;select();</pre><p><br/></p>', 1523235052, 1531175396),
(333, '40.77.167.67', '', 283, '666', '', 'CURL 模拟登录网站 智能操作网站 ', '0.10', 0, '283课 CURL模拟登录网站 智能操作网站 思路', 30, 19, NULL, '', 1523235099, 1531043045),
(334, '157.55.39.111', '', 284, '666', '', 'CURL 模拟登录网站 智能操作网站  ', '0.10', 0, '284课 CURL模拟登录网站 智能操作网站 简单修改一个信息', 30, 3, NULL, '', 1523235137, 1528893029),
(335, '207.46.13.155', '', 285, '666', '', 'CURL 模拟登录网站 采集页面信息', '0.10', 0, '285课 CURL模拟登录网站 采集页面信息', 30, 6, NULL, '', 1523235165, 1529844972),
(336, '121.35.184.97', '', 286, '666', '', 'Composer  windows  win7', '0.10', 0, '286课 Composer 零基础windows系统上快速入门 简介 ', 30, 33, NULL, '', 1523235416, 1531726580),
(337, '40.77.167.135', '', 287, '666', '', 'Composer 下载 安装 ', '0.10', 0, '287课 Composer 下载与安装 ', 30, 11, NULL, '', 1523235442, 1531199274),
(338, '40.77.167.93', '', 288, '666', '', 'Composer 安装  类库 ', '0.10', 0, '288课 Composer 安装  类库演示', 30, 9, NULL, '', 1523235467, 1531876911),
(339, '121.35.184.97', '', 289, '666', '', 'Composer 安装 图像处理类库 ', '0.10', 0, '289课 Composer 安装 图像处理类库 实例 ', 30, 5, NULL, '', 1523235493, 1531729949),
(340, '121.35.184.97', '', 290, '666', '', 'Composer 图像处理类库 ', '0.10', 0, '290课 Composer 测试体验 图像处理类库 实例 ', 30, 3, NULL, '', 1523235519, 1531730029),
(341, '101.132.97.6', '', 291, '666', '', 'Composer json ', '0.10', 0, '291课 Composer json文件使用说明', 30, 9, NULL, '', 1523235556, 1531521557),
(342, '101.132.107.246', '', 292, '666', '', ' 双语 多语言 ', '0.10', 0, '292课 双语 多语言 功能实现 演示', 30, 25, NULL, '', 1523240012, 1529263741),
(343, '207.46.13.224', '', 293, '666', '', '双语 多语言 开启多语言 语言包路径 配置文件', '0.10', 0, '293课 双语 多语言 开启多语言支持和语言包路径', 30, 3, NULL, '', 1523240108, 1531932760),
(344, '207.46.13.30', '', 294, '666', '', ' 双语 多语言 模板调用 ', '0.10', 0, '294课 双语 多语言 功能实现 模板调用写法', 30, 9, NULL, '', 1523240122, 1529454055),
(346, '207.46.13.112', '', 296, '666', '', '双语 多语言 点击切换语言 ', '0.10', 0, '296课 双语 多语言 点击切换语言功能', 30, 11, NULL, '', 1523240703, 1531083730),
(347, '218.79.6.160', '', 297, '666', '', '用户日志 访问记录 用户行为 简易实现 思路', '0.10', 0, '297课 用户日志 访问记录 用户行为 简易实现 思路', 30, 17, NULL, '', 1523610420, 1525676633),
(348, '66.249.73.76', '', 298, '666', '', '用户日志 访问记录 用户行为 简易实现 核心实现', '0.10', 0, '298课 用户日志 访问记录 用户行为 简易实现 核心实现', 30, 10, NULL, '', 1523610582, 1530838577),
(349, '101.132.97.53', '', 299, '666', '', '用户日志 访问记录 用户行为 简易实现 数据库字段', '0.10', 0, '299课 用户日志 访问记录 用户行为 简易实现 数据库字段', 30, 11, NULL, '', 1523610600, 1530910666),
(350, '66.249.73.74', '', 300, '666', '', '用户日志 访问记录 用户行为 简易实现 核心实现', '0.10', 0, '300课 用户日志 访问记录 用户行为 简易实现 核心实现', 30, 12, NULL, '', 1523610616, 1530863637),
(353, '111.187.80.41', '', 303, '666', '', '生成真实 静态html文件 ajax定时生成html', '0.10', 0, '303课 Tp5简单快速生成真实静态html文件 ajax定时生成html', 30, 44, NULL, '', 1524029292, 1530793601),
(352, '223.73.84.213', '', 302, '666', '', ' 生成真实 静态html 文件 ', '0.10', 0, '302课 Tp5简单快速生成真实静态html文件 核心代码', 30, 18, NULL, '', 1524029241, 1530866251),
(357, '101.132.188.111', '', 307, '666', '', '抢购 秒杀 js倒计时 ', '0.10', 0, '307课 Tp5 简易抢购秒杀功能实现 js倒计时实现', 30, 2, NULL, '', 1527579695, 1531618774),
(358, '101.132.97.6', '', 308, '666', '', '商品价格 字段类型  decimal  float 区别', '0.10', 0, '308课 商品价格字段类型用decimal与 float的区别', 30, 1, NULL, '', 1527579721, 1531884045),
(359, '101.132.107.246', '', 309, '666', '', '签到 2.0  ajax 签到 ', '0.10', 0, '309课  签到2.0版 点击直接ajax实现签到 分析', 30, 0, NULL, '', 1527579745, 1531631716),
(360, '39.107.121.196', '', 310, '666', '', '签到 ajax实现 ', '0.10', 0, '310课  签到2.0版 点击直接ajax实现签到 打通ajax调用', 30, 1, NULL, '', 1527579780, 1531793284),
(361, '113.26.222.30', '', 311, '666', '', '签到 ajax实现 弹出通知', '0.10', 0, '311课  签到2.0版 点击直接ajax实现签到 调用弹出通知', 30, 2, NULL, '', 1527579802, 1531274651),
(362, '180.160.2.190', '', 312, '666', '', '签到 ajax签到 通知信息', '0.10', 0, '312课  签到2.0版 点击直接ajax实现签到 打通通知信息', 30, 1, NULL, '', 1527579830, 1530706518),
(363, '180.160.2.190', '', 313, '666', '', '签到ajax', '0.10', 0, '313课  签到2.0版 点击直接ajax实现签到 整合入库', 30, 3, NULL, '', 1527579852, 1530706525),
(364, '180.160.2.190', '', 314, '666', '', '签到 2.0版ajax签到 演示', '0.10', 0, '314课  签到2.0版 点击直接ajax实现签到 完成演示', 30, 3, NULL, '', 1527579875, 1530706517),
(365, '101.132.131.7', '', 315, '666', '', '弹出div层 js出错提示 ', '0.10', 0, '315课  弹出div层调用 及 js出错提示功能', 30, 0, NULL, '', 1527579903, 1529809057),
(366, '113.77.211.233', '', 316, '666', '', '路由 零基础 入门', '0.10', 0, '316课 tp5 路由 零基础入门 演示 解读', 30, 7, NULL, '', 1527579928, 1532079051),
(367, '222.211.253.108', '', 317, '666', '', 'Composercreate-project快速下载框架', '0.10', 0, '317课 Composer create-project快速下载框架', 30, 2, NULL, '', 1527579952, 1532090375),
(368, '47.100.51.203', '', 318, '666', '', 'url路由 路由', '0.10', 0, '318课 Tp5 调用不同模板及url路由地址在模板使用', 30, 1, NULL, '', 1527580041, 1531356776),
(369, '101.132.69.5', '', 319, '666', '', 'VIP登录 自动签到 ', '0.10', 0, '319课 Tp5 设置VIP登录自动签到功能', 30, 1, NULL, '', 1527580069, 1530926801),
(370, '113.92.153.210', '', 320, '666', '', '签到', '0.10', 0, '320课 Tp5 设置VIP登录自动签到后加提示', 30, 1, NULL, '', 1527580101, 1531886205),
(371, '171.126.152.72', '', 321, '666', '', 'div加透明  过渡动画', '0.10', 0, '321课 Tp5 提示div加透明 和过渡动画', 30, 4, NULL, '', 1527580120, 1531807958),
(372, '180.160.2.190', '', 322, '666', '', '聊天表情 ', '0.10', 0, '322课 Tp5 简易实现聊天表情的发布 核心实现', 30, 3, NULL, '', 1527580144, 1530706549),
(373, '112.14.72.196', '', 323, '666', '', '聊天表情 回复', '0.10', 0, '323课 Tp5 简易实现聊天表情的发布 展示和回复时显示', 30, 9, NULL, '', 1527580168, 1532062232),
(374, '113.195.228.17', '', 324, '666', '', 'qq登录 放置 QQ登录 图标', '0.10', 0, '324课 Tp5 开发qq登录 第一课 放置QQ登录图标', 30, 27, NULL, '', 1527580196, 1532052123);

-- --------------------------------------------------------

--
-- 表的结构 `think_sms`
--

CREATE TABLE IF NOT EXISTS `think_sms` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '名称',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `phone` bigint(13) NOT NULL,
  `age` int(11) NOT NULL,
  `delete_time` int(11) DEFAULT NULL,
  `rand` int(11) NOT NULL,
  `ip` text NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=749 ;

-- --------------------------------------------------------

--
-- 表的结构 `think_user`
--

CREATE TABLE IF NOT EXISTS `think_user` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '名称',
  `password` text,
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `phone` bigint(11) NOT NULL,
  `age` int(11) NOT NULL,
  `invite` int(11) DEFAULT NULL,
  `token` varchar(200) DEFAULT NULL,
  `online_time` int(11) DEFAULT NULL,
  `start_time` int(11) DEFAULT NULL,
  `expiration_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  `rand` int(11) DEFAULT '0',
  `ip` text NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  KEY `phone_2` (`phone`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=395 ;

--
-- 转存表中的数据 `think_user`
--

INSERT INTO `think_user` (`id`, `name`, `password`, `status`, `phone`, `age`, `invite`, `token`, `online_time`, `start_time`, `expiration_time`, `delete_time`, `rand`, `ip`, `create_time`, `update_time`) VALUES
(393, '', 'e10adc3949ba59abbe56e057f20f883e', 0, 18210787405, 0, NULL, '07490ac61585fce5fdced600b3f78cd4', NULL, 1532316133, 1534908133, NULL, 1, '', 1532316133, 1532316133),
(394, '127.0.0.1', 'e10adc3949ba59abbe56e057f20f883e', 0, 18210787406, 0, NULL, '829fba1be9ca4a31f5952fe20dccd5d0', 45, NULL, NULL, NULL, 0, '', 1532316699, 1532325309);

-- --------------------------------------------------------

--
-- 表的结构 `think_userinfo`
--

CREATE TABLE IF NOT EXISTS `think_userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=17998 ;

-- --------------------------------------------------------

--
-- 表的结构 `think_user_qq`
--

CREATE TABLE IF NOT EXISTS `think_user_qq` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `nickname` varchar(255) DEFAULT NULL COMMENT '名称',
  `openid` text,
  `figureurl_qq_2` text COMMENT '状态',
  `phone` bigint(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `invite` int(11) DEFAULT NULL,
  `gender` text,
  `start_time` int(11) DEFAULT NULL,
  `figureurl_qq_1` text,
  `delete_time` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ip` text,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  KEY `phone_2` (`phone`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

-- --------------------------------------------------------

--
-- 表的结构 `think_video`
--

CREATE TABLE IF NOT EXISTS `think_video` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `phone` bigint(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '名称',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `title` varchar(255) NOT NULL,
  `age` float NOT NULL,
  `delete_time` int(11) DEFAULT NULL,
  `content` text,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `shop` int(11) DEFAULT NULL,
  `ip` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1566 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
