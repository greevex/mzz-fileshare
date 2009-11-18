-- phpMyAdmin SQL Dump
-- version 3.2.2-rc1
-- http://www.phpmyadmin.net
--
-- ����: localhost
-- ����� ��������: ��� 18 2009 �., 17:41
-- ������ �������: 5.1.30
-- ������ PHP: 5.2.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- ���� ������: `dobrin`
--

-- --------------------------------------------------------

--
-- ��������� ������� `comments_comments`
--

DROP TABLE IF EXISTS `comments_comments`;
CREATE TABLE IF NOT EXISTS `comments_comments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `obj_id` int(11) unsigned DEFAULT NULL,
  `text` text,
  `user_id` int(11) unsigned DEFAULT NULL,
  `created` int(11) unsigned DEFAULT NULL,
  `folder_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `folder_id` (`folder_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- ���� ������ ������� `comments_comments`
--

INSERT INTO `comments_comments` (`id`, `obj_id`, `text`, `user_id`, `created`, `folder_id`) VALUES
(1, NULL, 'test', 1, 1248950392, 1);

-- --------------------------------------------------------

--
-- ��������� ������� `comments_commentsfolder`
--

DROP TABLE IF EXISTS `comments_commentsfolder`;
CREATE TABLE IF NOT EXISTS `comments_commentsfolder` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) unsigned DEFAULT NULL,
  `module` char(50) NOT NULL DEFAULT '',
  `type` char(50) DEFAULT NULL,
  `by_field` char(50) NOT NULL DEFAULT '',
  `comments_count` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `parent_id_2` (`parent_id`,`type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=4 ;

--
-- ���� ������ ������� `comments_commentsfolder`
--

INSERT INTO `comments_commentsfolder` (`id`, `parent_id`, `module`, `type`, `by_field`, `comments_count`) VALUES
(1, 9, 'page', 'page', 'obj_id', 1),
(2, 1, 'page', 'page', 'id', 0),
(3, 169, 'news', 'news', 'id', 0);

-- --------------------------------------------------------

--
-- ��������� ������� `comments_comments_tree`
--

DROP TABLE IF EXISTS `comments_comments_tree`;
CREATE TABLE IF NOT EXISTS `comments_comments_tree` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `foreign_key` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `path` text,
  PRIMARY KEY (`id`),
  KEY `foreign_key` (`foreign_key`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- ���� ������ ������� `comments_comments_tree`
--

INSERT INTO `comments_comments_tree` (`id`, `foreign_key`, `parent_id`, `level`, `path`) VALUES
(1, 1, 0, 1, '1/');

-- --------------------------------------------------------

--
-- ��������� ������� `filemanager_file`
--

DROP TABLE IF EXISTS `filemanager_file`;
CREATE TABLE IF NOT EXISTS `filemanager_file` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `realname` varchar(255) DEFAULT '��� � �� � �������� �� �������',
  `name` varchar(255) DEFAULT '��� � ������� ���� ����� ���������� �������',
  `ext` varchar(20) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `modified` int(11) DEFAULT NULL,
  `downloads` int(11) DEFAULT '0',
  `right_header` tinyint(4) DEFAULT NULL,
  `direct_link` int(11) DEFAULT '0',
  `about` text,
  `folder_id` int(11) unsigned DEFAULT NULL,
  `obj_id` int(11) unsigned DEFAULT NULL,
  `storage_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `realname` (`realname`),
  KEY `folder_id` (`folder_id`,`name`,`ext`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- ���� ������ ������� `filemanager_file`
--

INSERT INTO `filemanager_file` (`id`, `realname`, `name`, `ext`, `size`, `modified`, `downloads`, `right_header`, `direct_link`, `about`, `folder_id`, `obj_id`, `storage_id`) VALUES
(1, '06a33b6070bc009ed0542bc484cacaea.JPG', '9.JPG', 'JPG', 134600, NULL, 0, NULL, 0, NULL, 3, NULL, 1),
(2, '0b9b4648f5f2206cf18ff5972fcc4391.jpg', 'x_dddba888.jpg', 'jpg', 22488, NULL, 0, NULL, 0, NULL, 3, NULL, 1),
(3, 'bec8a6c078c6854817dcbeed8655a5e7.JPG', 'IMAG0841.JPG', 'JPG', 589144, NULL, 0, NULL, 0, NULL, 3, NULL, 1),
(4, 'ba2d2acc0d6fb907118364abd5c80f3b.JPG', 'IMAG0844.JPG', 'JPG', 706153, NULL, 0, NULL, 0, NULL, 3, NULL, 1),
(5, 'ee27dd6b95dba5469f5bb02be8420dfd.jpg', 'DSCN4676.jpg', 'jpg', 3866086, NULL, 0, NULL, 0, NULL, 3, NULL, 1),
(6, 'd6ad6970d49e5d216ca1a92656bbf14d.jpg', 'Shot00013.jpg', 'jpg', 174937, NULL, 0, NULL, 0, NULL, 3, NULL, 1),
(7, '683724fcd52b3471eec939fd3f5c6ec4.jpg', '������ �� ������ ���.jpg', 'jpg', 39515, NULL, 0, NULL, 0, NULL, 3, NULL, 1),
(8, '45a6cfd820b777abbf8bfd8e044916f9.jpg', '111.jpg', 'jpg', 66658, NULL, 0, NULL, 0, NULL, 3, NULL, 1),
(9, '054fd8f2aed7a576f3b340d5e7d496a2.jpeg', '1.jpeg', 'jpeg', 22723, NULL, 0, NULL, 0, NULL, 3, NULL, 1);

-- --------------------------------------------------------

--
-- ��������� ������� `filemanager_folder`
--

DROP TABLE IF EXISTS `filemanager_folder`;
CREATE TABLE IF NOT EXISTS `filemanager_folder` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(255) DEFAULT NULL,
  `title` char(255) DEFAULT NULL,
  `filesize` int(11) unsigned DEFAULT NULL,
  `exts` char(255) DEFAULT NULL,
  `storage_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=4 ;

--
-- ���� ������ ������� `filemanager_folder`
--

INSERT INTO `filemanager_folder` (`id`, `name`, `title`, `filesize`, `exts`, `storage_id`) VALUES
(1, 'root', 'root', NULL, NULL, 1),
(2, 'test', 'test', 0, '', 1),
(3, 'gallery', '�������', 0, '', 1);

-- --------------------------------------------------------

--
-- ��������� ������� `filemanager_folder_tree`
--

DROP TABLE IF EXISTS `filemanager_folder_tree`;
CREATE TABLE IF NOT EXISTS `filemanager_folder_tree` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `path` text,
  `foreign_key` int(11) DEFAULT NULL,
  `level` int(11) unsigned DEFAULT NULL,
  `spath` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- ���� ������ ������� `filemanager_folder_tree`
--

INSERT INTO `filemanager_folder_tree` (`id`, `path`, `foreign_key`, `level`, `spath`) VALUES
(1, 'root/', 1, 1, '1/'),
(2, 'root/test/', 2, 2, '1/2/'),
(3, 'root/gallery/', 3, 2, '1/3/');

-- --------------------------------------------------------

--
-- ��������� ������� `filemanager_storage`
--

DROP TABLE IF EXISTS `filemanager_storage`;
CREATE TABLE IF NOT EXISTS `filemanager_storage` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(255) DEFAULT NULL,
  `path` char(255) DEFAULT NULL,
  `web_path` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=3 ;

--
-- ���� ������ ������� `filemanager_storage`
--

INSERT INTO `filemanager_storage` (`id`, `name`, `path`, `web_path`) VALUES
(1, 'local', '../files/', '/');

-- --------------------------------------------------------

--
-- ��������� ������� `gallery_categories`
--

DROP TABLE IF EXISTS `gallery_categories`;
CREATE TABLE IF NOT EXISTS `gallery_categories` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `string_id` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- ���� ������ ������� `gallery_categories`
--

INSERT INTO `gallery_categories` (`id`, `string_id`, `name`, `description`, `active`) VALUES
(1, 'graphic', '�������', '������ � ��������', 1),
(2, 'design', '������', '������ � ��������', 1);

-- --------------------------------------------------------

--
-- ��������� ������� `gallery_photos`
--

DROP TABLE IF EXISTS `gallery_photos`;
CREATE TABLE IF NOT EXISTS `gallery_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photo_id` int(16) NOT NULL,
  `category` int(3) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `active` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- ���� ������ ������� `gallery_photos`
--

INSERT INTO `gallery_photos` (`id`, `photo_id`, `category`, `title`, `description`, `active`) VALUES
(1, 1, 2, '���������', '������', 1),
(2, 2, 2, '���������', '������', 1),
(3, 3, 2, '������', '��������������������', 1),
(4, 4, 2, '�������', '���������������������������', 1),
(5, 5, 2, '���������������', '��������������', 1),
(6, 6, 1, '��� ���������', '��������������', 1),
(7, 7, 1, '����� ��� ���', '����� ��� �������� ��� �������� ��� ���', 1),
(8, 8, 1, '����� ���� �����', '^^', 1),
(9, 9, 1, '������� �� ������', '�������', 1);

-- --------------------------------------------------------

--
-- ��������� ������� `headloader_loader`
--

DROP TABLE IF EXISTS `headloader_loader`;
CREATE TABLE IF NOT EXISTS `headloader_loader` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(16) NOT NULL DEFAULT 'js',
  `file` varchar(255) NOT NULL,
  `active` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- ���� ������ ������� `headloader_loader`
--


-- --------------------------------------------------------

--
-- ��������� ������� `menu_menu`
--

DROP TABLE IF EXISTS `menu_menu`;
CREATE TABLE IF NOT EXISTS `menu_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `obj_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- ���� ������ ������� `menu_menu`
--

INSERT INTO `menu_menu` (`id`, `name`, `obj_id`) VALUES
(6, 'hmenu', 1185);

-- --------------------------------------------------------

--
-- ��������� ������� `menu_menuitem`
--

DROP TABLE IF EXISTS `menu_menuitem`;
CREATE TABLE IF NOT EXISTS `menu_menuitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(10) unsigned NOT NULL DEFAULT '1',
  `menu_id` int(10) unsigned NOT NULL DEFAULT '0',
  `order` int(10) unsigned NOT NULL DEFAULT '0',
  `args` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_id` (`menu_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- ���� ������ ������� `menu_menuitem`
--

INSERT INTO `menu_menuitem` (`id`, `type_id`, `menu_id`, `order`, `args`) VALUES
(1, 3, 6, 1, 'a:1:{s:3:"url";s:16:"http://dobrin.ru";}'),
(2, 3, 6, 2, 'a:1:{s:3:"url";s:20:"http://bio.dobrin.ru";}'),
(3, 1, 6, 3, 'a:1:{s:3:"url";s:0:"";}'),
(4, 1, 6, 4, 'a:1:{s:3:"url";s:7:"gallery";}'),
(5, 1, 6, 5, 'a:1:{s:3:"url";s:14:"gallery/upload";}'),
(6, 1, 6, 6, 'a:1:{s:3:"url";s:5:"admin";}');

-- --------------------------------------------------------

--
-- ��������� ������� `menu_menuitem_lang`
--

DROP TABLE IF EXISTS `menu_menuitem_lang`;
CREATE TABLE IF NOT EXISTS `menu_menuitem_lang` (
  `id` int(11) NOT NULL DEFAULT '0',
  `lang_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- ���� ������ ������� `menu_menuitem_lang`
--

INSERT INTO `menu_menuitem_lang` (`id`, `lang_id`, `title`) VALUES
(1, 1, '�������'),
(2, 1, '���������'),
(3, 1, '�����'),
(4, 1, '�������'),
(5, 1, '��������� ����'),
(6, 1, '��');

-- --------------------------------------------------------

--
-- ��������� ������� `menu_menuitem_tree`
--

DROP TABLE IF EXISTS `menu_menuitem_tree`;
CREATE TABLE IF NOT EXISTS `menu_menuitem_tree` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `foreign_key` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `path` text,
  PRIMARY KEY (`id`),
  KEY `foreign_key` (`foreign_key`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- ���� ������ ������� `menu_menuitem_tree`
--

INSERT INTO `menu_menuitem_tree` (`id`, `foreign_key`, `parent_id`, `level`, `path`) VALUES
(1, 1, 0, 1, '1/'),
(2, 2, 0, 1, '2/'),
(3, 3, 0, 1, '3/'),
(4, 4, 0, 1, '4/'),
(5, 5, 0, 1, '5/'),
(6, 6, 0, 1, '6/');

-- --------------------------------------------------------

--
-- ��������� ������� `news_news`
--

DROP TABLE IF EXISTS `news_news`;
CREATE TABLE IF NOT EXISTS `news_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `obj_id` int(11) DEFAULT NULL,
  `editor` int(11) NOT NULL DEFAULT '0',
  `folder_id` int(11) DEFAULT NULL,
  `created` int(11) DEFAULT NULL,
  `updated` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `folder_id` (`folder_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=170 ;

--
-- ���� ������ ������� `news_news`
--

INSERT INTO `news_news` (`id`, `obj_id`, `editor`, `folder_id`, `created`, `updated`) VALUES
(169, 1457, 2, 2, 1233907447, 1243927140);

-- --------------------------------------------------------

--
-- ��������� ������� `news_newsfolder`
--

DROP TABLE IF EXISTS `news_newsfolder`;
CREATE TABLE IF NOT EXISTS `news_newsfolder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(255) DEFAULT NULL,
  `parent` int(11) DEFAULT '0',
  `path` char(255) DEFAULT NULL,
  `title` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `parent` (`parent`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=32 ;

--
-- ���� ������ ������� `news_newsfolder`
--

INSERT INTO `news_newsfolder` (`id`, `name`, `parent`, `path`, `title`) VALUES
(2, 'root', 1, 'root', 'root'),
(18, 'main', 17, 'root/main', 'main');

-- --------------------------------------------------------

--
-- ��������� ������� `news_newsfolder_lang`
--

DROP TABLE IF EXISTS `news_newsfolder_lang`;
CREATE TABLE IF NOT EXISTS `news_newsfolder_lang` (
  `id` int(11) NOT NULL DEFAULT '0',
  `lang_id` int(11) NOT NULL DEFAULT '0',
  `title` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`lang_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

--
-- ���� ������ ������� `news_newsfolder_lang`
--

INSERT INTO `news_newsfolder_lang` (`id`, `lang_id`, `title`) VALUES
(2, 1, '�������'),
(2, 2, 'News'),
(18, 1, '�������'),
(18, 2, 'Main');

-- --------------------------------------------------------

--
-- ��������� ������� `news_newsfolder_tree`
--

DROP TABLE IF EXISTS `news_newsfolder_tree`;
CREATE TABLE IF NOT EXISTS `news_newsfolder_tree` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `path` text,
  `foreign_key` int(11) DEFAULT NULL,
  `level` int(11) unsigned DEFAULT NULL,
  `spath` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- ���� ������ ������� `news_newsfolder_tree`
--

INSERT INTO `news_newsfolder_tree` (`id`, `path`, `foreign_key`, `level`, `spath`) VALUES
(1, 'root/', 2, 1, '1/'),
(2, 'root/main/', 18, 2, '1/2/');

-- --------------------------------------------------------

--
-- ��������� ������� `news_news_lang`
--

DROP TABLE IF EXISTS `news_news_lang`;
CREATE TABLE IF NOT EXISTS `news_news_lang` (
  `id` int(11) NOT NULL DEFAULT '0',
  `lang_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `annotation` text,
  `text` text,
  PRIMARY KEY (`id`,`lang_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- ���� ������ ������� `news_news_lang`
--

INSERT INTO `news_news_lang` (`id`, `lang_id`, `title`, `annotation`, `text`) VALUES
(169, 1, '�������� ������� ���� ������� ������', '������ ��� ����� �������� ������� ������� ������� ������ Samsung, Sony � Nokia. �� ��������� ����� Panasonic, � �� ����� - Toyota. ����� ���������� ���� ������������ �������� Online Market Intelligence. � ��������� ������� ���������� ������� ����� Nissan, Reebok � Honda, �� �������� � ������������ �������.', '������ ��� ����� �������� ������� ������� ������� ������ Samsung, Sony � Nokia. ����� ���������� ���� ������������, ����������� ��������� Online Market Intelligence.\n\n����� �������, � ������ ������� ��������� �� �� ������, ��� � � 2008 ����, �� Samsung �������� �� ������ ����� �� �������, � Sony �������� ���� �������. �� ��������� ����� Panasonic, � �� ����� - Toyota. � ������� ���� ����� ����� ������� Adidas, ������������ �� ������ �������.\n\n������� ����� ����� � �������� ������ BMW (��������� � �������� ����� �� �������������) � Mercedes (� �������� �� �������������). ����� ���, � ��������� ������� ������� ������ Nissan, Reebok � Honda, �� �������� � ������� 2008 ����.\n\n��������� ������ ������� ������� �������� ��������� �������:\n\n   1. Samsung\n   2. Sony\n   3. Nokia\n   4. Panasonic\n   5. Toyota\n   6. Adidas\n   7. Canon\n   8. Bosch\n   9. Asus\n  10. Philips\n  11. HP\n  12. Sony Ericsson\n  13. Nike\n  14. LG\n  15. Nissan\n  16. Coca-Cola\n  17. Reebok\n  18. Mercedes\n  19. BMW\n  20. Honda \n\n� ������ �������� ����� ���� ����������� ������ ����� �� ������ ����� ������������, ��������� ���� �� ���� �����. ���������� �����, ��� ������ �������� � ����������� ������������ � ������������� ��������� ����� ����������� � ������������� "��������". ');

-- --------------------------------------------------------

--
-- ��������� ������� `page_page`
--

DROP TABLE IF EXISTS `page_page`;
CREATE TABLE IF NOT EXISTS `page_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `obj_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `folder_id` int(11) unsigned DEFAULT NULL,
  `allow_comment` tinyint(4) DEFAULT '1',
  `compiled` int(11) DEFAULT NULL,
  `keywords_reset` tinyint(1) DEFAULT '0',
  `description_reset` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- ���� ������ ������� `page_page`
--

INSERT INTO `page_page` (`id`, `obj_id`, `name`, `folder_id`, `allow_comment`, `compiled`, `keywords_reset`, `description_reset`) VALUES
(1, 9, 'main', 2, 0, 1, 0, 0),
(2, 10, '404', 2, 1, NULL, 0, 0),
(4, 57, '403', 2, 1, NULL, 0, 0),
(12, 1464, 'uslugi', 2, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- ��������� ������� `page_pagefolder`
--

DROP TABLE IF EXISTS `page_pagefolder`;
CREATE TABLE IF NOT EXISTS `page_pagefolder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `obj_id` int(11) unsigned NOT NULL DEFAULT '0',
  `name` char(255) DEFAULT NULL,
  `title` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=5 ;

--
-- ���� ������ ������� `page_pagefolder`
--

INSERT INTO `page_pagefolder` (`id`, `obj_id`, `name`, `title`) VALUES
(2, 161, 'root', '/');

-- --------------------------------------------------------

--
-- ��������� ������� `page_pagefolder_tree`
--

DROP TABLE IF EXISTS `page_pagefolder_tree`;
CREATE TABLE IF NOT EXISTS `page_pagefolder_tree` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `path` text,
  `foreign_key` int(11) DEFAULT NULL,
  `level` int(11) unsigned DEFAULT NULL,
  `spath` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- ���� ������ ������� `page_pagefolder_tree`
--

INSERT INTO `page_pagefolder_tree` (`id`, `path`, `foreign_key`, `level`, `spath`) VALUES
(1, 'root/', 2, 1, '1/');

-- --------------------------------------------------------

--
-- ��������� ������� `page_page_lang`
--

DROP TABLE IF EXISTS `page_page_lang`;
CREATE TABLE IF NOT EXISTS `page_page_lang` (
  `id` int(11) NOT NULL DEFAULT '0',
  `lang_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`lang_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- ���� ������ ������� `page_page_lang`
--

INSERT INTO `page_page_lang` (`id`, `lang_id`, `title`, `content`, `keywords`, `description`) VALUES
(1, 1, '����� ����������!', '<p><span style="font-size: x-large;"><strong><span style="font-size: large;"><span style="color: #ff9900;">����� ���������� � ���-������ ������� �������!</span></span></strong></span></p>', '', ''),
(1, 2, 'About us', '<strong>mzz</strong> - is a php5 framework for web-applications.', NULL, NULL),
(2, 1, '404 Not Found', '������������� �������� �� �������!', NULL, NULL),
(2, 2, '404 Not Found', 'Page doesn''t exist', NULL, NULL),
(4, 1, '������ ��������', '������ ��������', NULL, NULL),
(4, 2, 'Access not allowed.', 'Access not allowed. Try to login or register.', NULL, NULL),
(12, 1, '������ � ����', '<h1 style="text-align: center;">����� �� ��</h1>\n<h1 style="text-align: center;"></h1>\n<h1 style="text-align: center;"><img title="�����" src="../../../templates/js/tiny_mce/plugins/emotions/img/smiley-cool.gif" border="0" alt="�����" /></h1>\n<h1 style="text-align: center;"></h1>\n<h1 style="text-align: center;">��� ��� ��� :</h1>\n<ol>\n<li>���������� �</li>\n<li>�������������� �</li>\n<li>��������������</li>\n<li>����������������</li>\n<li>����������� �</li>\n<li>�������� </li>\n<li></li>\n</ol>', '', '������ �� ���� ����');

-- --------------------------------------------------------

--
-- ��������� ������� `sys_access`
--

DROP TABLE IF EXISTS `sys_access`;
CREATE TABLE IF NOT EXISTS `sys_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_id` int(11) unsigned DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `obj_id` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `gid` int(11) DEFAULT NULL,
  `allow` tinyint(1) unsigned DEFAULT '0',
  `deny` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `class_action_id` (`class_id`,`obj_id`,`uid`,`gid`),
  KEY `obj_id_gid` (`obj_id`,`gid`),
  KEY `obj_id_uid` (`obj_id`,`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=9100 ;

--
-- ���� ������ ������� `sys_access`
--

INSERT INTO `sys_access` (`id`, `action_id`, `class_id`, `obj_id`, `uid`, `gid`, `allow`, `deny`) VALUES
(9079, 3, 1, 0, NULL, 1, 1, 0),
(9080, 3, 1, 0, NULL, 2, 1, 0),
(9081, 3, 1, 0, NULL, 4, 1, 0),
(9082, 1, 1, 0, NULL, 4, 1, 0),
(9083, 29, 1, 0, NULL, 4, 1, 0),
(9084, 2, 1, 0, NULL, 4, 1, 0),
(9085, 5, 2, 0, NULL, 1, 1, 0),
(9086, 5, 2, 0, NULL, 2, 1, 0),
(9087, 4, 2, 0, NULL, 4, 1, 0),
(9088, 5, 2, 0, NULL, 4, 1, 0),
(9089, 6, 2, 0, NULL, 4, 1, 0),
(9090, 7, 2, 0, NULL, 4, 1, 0),
(9091, 30, 2, 0, NULL, 4, 1, 0),
(9092, 8, 2, 0, NULL, 4, 1, 0),
(9093, 3, 6, 9, NULL, 1, 1, 0),
(9094, 3, 6, 9, NULL, 2, 1, 0),
(9095, 3, 6, 10, NULL, 1, 1, 0),
(9096, 3, 6, 10, NULL, 2, 1, 0),
(9098, 5, 50, 0, 5, NULL, 1, 0),
(9099, 69, 50, 0, NULL, 1, 1, 0);

-- --------------------------------------------------------

--
-- ��������� ������� `sys_access_registry`
--

DROP TABLE IF EXISTS `sys_access_registry`;
CREATE TABLE IF NOT EXISTS `sys_access_registry` (
  `obj_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `class_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`obj_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=1465 ;

--
-- ���� ������ ������� `sys_access_registry`
--

INSERT INTO `sys_access_registry` (`obj_id`, `class_id`) VALUES
(9, 6),
(10, 6),
(57, 6),
(1443, 9),
(1444, 7),
(1445, 7),
(1446, 7),
(1447, 7),
(1448, 7),
(1449, 7),
(1450, 7),
(1451, 7),
(1452, 7),
(1453, 7),
(1454, 50),
(1455, 52),
(1456, 3),
(1457, 1),
(1458, 11),
(1459, 11),
(1460, 7),
(1461, 10),
(1462, 7),
(1463, 7),
(1464, 6);

-- --------------------------------------------------------

--
-- ��������� ������� `sys_actions`
--

DROP TABLE IF EXISTS `sys_actions`;
CREATE TABLE IF NOT EXISTS `sys_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=140 ;

--
-- ���� ������ ������� `sys_actions`
--

INSERT INTO `sys_actions` (`id`, `name`) VALUES
(1, 'edit'),
(2, 'delete'),
(3, 'view'),
(4, 'create'),
(5, 'list'),
(6, 'createFolder'),
(7, 'editFolder'),
(8, 'deleteFolder'),
(9, 'editACL'),
(10, 'login'),
(11, 'exit'),
(12, 'memberOf'),
(13, 'groupDelete'),
(14, 'groupsList'),
(15, 'groupEdit'),
(16, 'membersList'),
(17, 'addToGroup'),
(18, 'editDefault'),
(19, 'post'),
(20, 'admin'),
(21, 'devToolbar'),
(27, 'upload'),
(28, 'get'),
(29, 'move'),
(30, 'moveFolder'),
(51, 'groupCreate'),
(52, 'viewGallery'),
(53, 'createAlbum'),
(54, 'editAlbum'),
(55, 'viewAlbum'),
(57, 'viewThumbnail'),
(59, 'viewPhoto'),
(60, 'editPhoto'),
(61, 'save'),
(62, 'deletemenu'),
(63, 'addmenu'),
(64, 'editmenu'),
(65, 'additem'),
(66, 'last'),
(67, 'moveUp'),
(68, 'moveDown'),
(69, 'register'),
(70, 'results'),
(71, 'send'),
(72, 'addCategory'),
(73, 'deleteCategory'),
(74, 'editCategory'),
(75, 'viewActual'),
(76, 'deleteAlbum'),
(77, 'deletecat'),
(78, 'createcat'),
(79, 'editcat'),
(80, 'forum'),
(81, 'thread'),
(82, 'newThread'),
(83, 'createCategory'),
(84, 'createForum'),
(85, 'editForum'),
(86, 'goto'),
(87, 'editThread'),
(88, 'moveThread'),
(89, 'up'),
(90, 'down'),
(91, 'createRoot'),
(92, 'browse'),
(93, 'new'),
(94, 'editTags'),
(95, 'tagsCloud'),
(96, 'itemsTagsCloud'),
(97, 'searchByTag'),
(98, 'profile'),
(99, 'groupAdmin'),
(100, 'editProfile'),
(101, 'massAction'),
(102, 'translate'),
(103, 'configuration'),
(104, 'adminTypes'),
(105, 'adminProperties'),
(106, 'add'),
(107, 'menu'),
(108, 'configure'),
(109, 'addClass'),
(110, 'editClass'),
(111, 'deleteClass'),
(112, 'addModule'),
(113, 'editModule'),
(114, 'deleteModule'),
(115, 'listActions'),
(116, 'addAction'),
(117, 'editAction'),
(118, 'deleteAction'),
(119, 'addObjToRegistry'),
(120, 'editSections'),
(121, 'map'),
(122, 'dashboard'),
(123, 'admin_access'),
(124, 'addUser'),
(125, 'editUser'),
(126, 'editGroup'),
(127, 'addGroup'),
(128, 'deleteGroup'),
(129, 'deleteUser'),
(130, 'addGroupDefault'),
(131, 'editGroupDefault'),
(132, 'deleteGroupDefault'),
(133, 'addUserDefault'),
(134, 'editUserDefault'),
(135, 'deleteUserDefault'),
(136, 'editOwner'),
(137, 'categoryList'),
(138, 'load'),
(139, 'getThumb');

-- --------------------------------------------------------

--
-- ��������� ������� `sys_classes`
--

DROP TABLE IF EXISTS `sys_classes`;
CREATE TABLE IF NOT EXISTS `sys_classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(255) DEFAULT NULL,
  `module_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=64 ;

--
-- ���� ������ ������� `sys_classes`
--

INSERT INTO `sys_classes` (`id`, `name`, `module_id`) VALUES
(1, 'news', 1),
(2, 'newsFolder', 1),
(3, 'user', 2),
(4, 'group', 2),
(6, 'page', 4),
(7, 'access', 5),
(8, 'userGroup', 2),
(9, 'admin', 6),
(10, 'comments', 8),
(11, 'commentsFolder', 8),
(12, 'userAuth', 2),
(13, 'pageFolder', 4),
(24, 'menuItem', 12),
(25, 'menu', 12),
(26, 'menuFolder', 12),
(27, 'userOnline', 2),
(32, 'message', 14),
(33, 'messageCategory', 14),
(47, 'captcha', 18),
(48, 'profile', 15),
(50, 'userFolder', 2),
(52, 'groupFolder', 2),
(55, 'configOption', 22),
(56, 'configFolder', 22),
(58, 'file', 25),
(59, 'folder', 25),
(60, 'storage', 25),
(61, 'galleryPhotos', 26),
(62, 'galleryCategories', 26),
(63, 'loader', 27);

-- --------------------------------------------------------

--
-- ��������� ������� `sys_classes_actions`
--

DROP TABLE IF EXISTS `sys_classes_actions`;
CREATE TABLE IF NOT EXISTS `sys_classes_actions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `class_id` int(11) unsigned DEFAULT NULL,
  `action_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `class_id` (`class_id`,`action_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=361 ;

--
-- ���� ������ ������� `sys_classes_actions`
--

INSERT INTO `sys_classes_actions` (`id`, `class_id`, `action_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(5, 2, 4),
(6, 2, 5),
(7, 2, 6),
(8, 2, 7),
(9, 2, 8),
(11, 3, 10),
(12, 3, 11),
(13, 3, 5),
(14, 3, 1),
(15, 3, 12),
(16, 3, 2),
(17, 4, 13),
(19, 4, 15),
(20, 4, 16),
(21, 4, 17),
(24, 6, 3),
(28, 6, 1),
(29, 6, 2),
(31, 7, 18),
(37, 10, 2),
(47, 13, 7),
(48, 13, 6),
(49, 13, 4),
(50, 13, 5),
(51, 9, 21),
(70, 1, 29),
(76, 2, 30),
(91, 13, 8),
(92, 13, 30),
(114, 7, 20),
(116, 6, 29),
(158, 26, 20),
(160, 26, 63),
(161, 25, 64),
(181, 33, 5),
(182, 32, 3),
(185, 33, 71),
(186, 32, 2),
(253, 1, 97),
(259, 48, 98),
(266, 50, 69),
(270, 50, 4),
(279, 52, 51),
(280, 52, 14),
(281, 48, 100),
(295, 10, 1),
(296, 55, 2),
(300, 56, 108),
(301, 58, 20),
(302, 58, 2),
(303, 58, 1),
(304, 58, 28),
(305, 58, 29),
(306, 59, 92),
(307, 59, 6),
(308, 59, 8),
(309, 59, 7),
(310, 59, 5),
(311, 59, 30),
(312, 59, 27),
(313, 9, 20),
(314, 9, 107),
(315, 9, 102),
(316, 9, 109),
(317, 9, 110),
(318, 9, 111),
(319, 9, 112),
(320, 9, 113),
(321, 9, 114),
(322, 9, 115),
(323, 9, 116),
(324, 9, 117),
(325, 9, 118),
(326, 9, 119),
(327, 9, 120),
(328, 9, 121),
(329, 9, 122),
(330, 6, 9),
(331, 25, 3),
(332, 25, 91),
(333, 25, 62),
(334, 25, 29),
(335, 24, 4),
(336, 24, 1),
(337, 24, 2),
(338, 7, 9),
(339, 50, 5),
(340, 7, 123),
(341, 7, 124),
(342, 7, 125),
(343, 7, 126),
(344, 7, 127),
(345, 7, 128),
(346, 7, 129),
(347, 7, 130),
(348, 7, 131),
(349, 7, 132),
(350, 7, 133),
(351, 7, 134),
(352, 7, 135),
(353, 7, 136),
(354, 62, 5),
(355, 62, 27),
(356, 62, 137),
(357, 63, 138),
(358, 1, 20),
(359, 1, 66),
(360, 62, 139);

-- --------------------------------------------------------

--
-- ��������� ������� `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE IF NOT EXISTS `sys_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `type_id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL DEFAULT '',
  `args` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `module_name` (`module_name`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- ���� ������ ������� `sys_config`
--

INSERT INTO `sys_config` (`id`, `module_name`, `name`, `title`, `type_id`, `value`, `args`) VALUES
(3, 'news', 'items_per_page', '���������� ��������� �� ��������', 1, '20', ''),
(4, 'fileManager', 'public_path', '���� �� ������ �����', 2, '', '');

-- --------------------------------------------------------

--
-- ��������� ������� `sys_lang`
--

DROP TABLE IF EXISTS `sys_lang`;
CREATE TABLE IF NOT EXISTS `sys_lang` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(20) DEFAULT NULL,
  `title` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=3 ;

--
-- ���� ������ ������� `sys_lang`
--

INSERT INTO `sys_lang` (`id`, `name`, `title`) VALUES
(1, 'ru', '��'),
(2, 'en', 'en');

-- --------------------------------------------------------

--
-- ��������� ������� `sys_lang_lang`
--

DROP TABLE IF EXISTS `sys_lang_lang`;
CREATE TABLE IF NOT EXISTS `sys_lang_lang` (
  `id` int(11) unsigned NOT NULL,
  `lang_id` int(11) unsigned NOT NULL,
  `name` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`,`lang_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

--
-- ���� ������ ������� `sys_lang_lang`
--

INSERT INTO `sys_lang_lang` (`id`, `lang_id`, `name`) VALUES
(1, 1, '�������'),
(1, 2, 'russian'),
(2, 1, '����������'),
(2, 2, 'english');

-- --------------------------------------------------------

--
-- ��������� ������� `sys_modules`
--

DROP TABLE IF EXISTS `sys_modules`;
CREATE TABLE IF NOT EXISTS `sys_modules` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(255) DEFAULT NULL,
  `title` char(255) DEFAULT NULL,
  `icon` char(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=28 ;

--
-- ���� ������ ������� `sys_modules`
--

INSERT INTO `sys_modules` (`id`, `name`, `title`, `icon`, `order`) VALUES
(1, 'news', '�������', 'mzz-icon mzz-icon-block', 10),
(2, 'user', '������������', 'users.gif', 90),
(4, 'page', '��������', 'pages.gif', 20),
(5, 'access', '����� �������', 'access.gif', 10),
(6, 'admin', '�����������������', 'mzz-icon mzz-icon-wrench-cross', 0),
(8, 'comments', '�����������', 'comments.gif', 40),
(12, 'menu', '����', 'pages.gif', 90),
(18, 'captcha', 'Captcha', '', 0),
(19, 'pager', '�������', NULL, NULL),
(20, 'simple', 'simple', NULL, NULL),
(22, 'config', '������������', 'config.gif', 0),
(25, 'fileManager', 'file manager', '', 0),
(26, 'gallery', '�������', NULL, 0),
(27, 'headloader', '��������� js � css', '', 0);

-- --------------------------------------------------------

--
-- ��������� ������� `sys_obj_id`
--

DROP TABLE IF EXISTS `sys_obj_id`;
CREATE TABLE IF NOT EXISTS `sys_obj_id` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=1465 ;

--
-- ���� ������ ������� `sys_obj_id`
--

INSERT INTO `sys_obj_id` (`id`) VALUES
(1443),
(1444),
(1445),
(1446),
(1447),
(1448),
(1449),
(1450),
(1451),
(1452),
(1453),
(1454),
(1455),
(1456),
(1457),
(1458),
(1459),
(1460),
(1461),
(1462),
(1463),
(1464);

-- --------------------------------------------------------

--
-- ��������� ������� `sys_obj_id_named`
--

DROP TABLE IF EXISTS `sys_obj_id_named`;
CREATE TABLE IF NOT EXISTS `sys_obj_id_named` (
  `obj_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(255) DEFAULT NULL,
  PRIMARY KEY (`obj_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=1464 ;

--
-- ���� ������ ������� `sys_obj_id_named`
--

INSERT INTO `sys_obj_id_named` (`obj_id`, `name`) VALUES
(1443, 'access_admin'),
(1444, 'access_access'),
(1445, 'access_captcha'),
(1446, 'access_comments'),
(1447, 'access_config'),
(1448, 'access_menu'),
(1449, 'access_news'),
(1450, 'access_page'),
(1451, 'access_pager'),
(1452, 'access_simple'),
(1453, 'access_user'),
(1454, 'userFolder'),
(1455, 'groupFolder'),
(1460, 'access_fileManager'),
(1462, 'access_gallery'),
(1463, 'access_headloader');

-- --------------------------------------------------------

--
-- ��������� ������� `sys_sessions`
--

DROP TABLE IF EXISTS `sys_sessions`;
CREATE TABLE IF NOT EXISTS `sys_sessions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sid` varchar(50) NOT NULL DEFAULT '',
  `ts` int(11) unsigned NOT NULL DEFAULT '0',
  `valid` enum('yes','no') NOT NULL DEFAULT 'yes',
  `data` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sid` (`sid`),
  KEY `valid` (`valid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- ���� ������ ������� `sys_sessions`
--


-- --------------------------------------------------------

--
-- ��������� ������� `sys_skins`
--

DROP TABLE IF EXISTS `sys_skins`;
CREATE TABLE IF NOT EXISTS `sys_skins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(32) DEFAULT NULL,
  `title` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=3 ;

--
-- ���� ������ ������� `sys_skins`
--

INSERT INTO `sys_skins` (`id`, `name`, `title`) VALUES
(1, 'default', 'default'),
(2, 'light', 'light');

-- --------------------------------------------------------

--
-- ��������� ������� `user_group`
--

DROP TABLE IF EXISTS `user_group`;
CREATE TABLE IF NOT EXISTS `user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(255) DEFAULT NULL,
  `is_default` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=5 ;

--
-- ���� ������ ������� `user_group`
--

INSERT INTO `user_group` (`id`, `name`, `is_default`) VALUES
(1, 'unauth', NULL),
(2, 'auth', 1),
(3, 'root', 0),
(4, 'moderators', 0);

-- --------------------------------------------------------

--
-- ��������� ������� `user_user`
--

DROP TABLE IF EXISTS `user_user`;
CREATE TABLE IF NOT EXISTS `user_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `created` int(11) DEFAULT NULL,
  `confirmed` varchar(32) DEFAULT NULL,
  `last_login` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `timezone` int(11) DEFAULT '3',
  `skin` int(11) unsigned DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `login` (`login`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- ���� ������ ������� `user_user`
--

INSERT INTO `user_user` (`id`, `login`, `email`, `password`, `created`, `confirmed`, `last_login`, `language_id`, `timezone`, `skin`) VALUES
(1, 'guest', '', '', NULL, NULL, 1225005849, NULL, 3, 1),
(2, 'admin', '', '098f6bcd4621d373cade4e832627b4f6', NULL, NULL, 1257208114, 1, 3, 1),
(3, 'moderator', '', '098f6bcd4621d373cade4e832627b4f6', 1188187851, NULL, 1203767664, 1, 3, 1),
(4, 'user', '', '098f6bcd4621d373cade4e832627b4f6', 1243925700, NULL, NULL, NULL, 3, 1),
(5, 'qwe', '', '202cb962ac59075b964b07152d234b70', 1249521132, NULL, NULL, 1, 3, 1);

-- --------------------------------------------------------

--
-- ��������� ������� `user_userauth`
--

DROP TABLE IF EXISTS `user_userauth`;
CREATE TABLE IF NOT EXISTS `user_userauth` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL,
  `ip` char(15) DEFAULT NULL,
  `hash` char(32) DEFAULT NULL,
  `obj_id` int(11) unsigned DEFAULT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=144 ;

--
-- ���� ������ ������� `user_userauth`
--

INSERT INTO `user_userauth` (`id`, `user_id`, `ip`, `hash`, `obj_id`, `time`) VALUES
(120, 2, '10.30.35.150', '0e92bb89eee69e7b2d0fabf722f6dd6b', NULL, NULL),
(121, 2, '127.0.0.1', 'e6554e265eb42296f32e6ebb6ae555af', NULL, NULL),
(122, 2, '127.0.0.1', '41c1f3d65189710fd9a0326716b7d643', NULL, NULL),
(123, 2, '127.0.0.1', 'e87b231c137decdd917559c2d8121d4b', NULL, NULL),
(124, 2, '127.0.0.1', '508472f0463a79bc906538de5f39dfb6', NULL, NULL),
(125, 2, '127.0.0.1', '0e8f35e187247098b098204613bd9b27', NULL, NULL),
(126, 2, '127.0.0.1', '956eb3fa26b9b78b82c96d9f098d8a06', NULL, NULL),
(128, 2, '10.30.35.9', '639eb7566aaf6b368863cfb4ba8afd1e', NULL, NULL),
(132, 2, '10.30.35.150', 'c54fbf06a0f11f5a10f4822e493a82bd', NULL, NULL),
(133, 2, '127.0.0.1', '021d2bab67d5c4d478dd39d7cfaca0b2', NULL, NULL),
(134, 2, '127.0.0.1', '254be4b2e6328875e8dfe2291eead872', NULL, NULL),
(135, 2, '127.0.0.1', 'f028a4c7dd2cfce774e71b1d86cba0a4', NULL, NULL),
(136, 5, '10.30.35.150', 'b77e872c8cdbe566085756413d0beef1', NULL, NULL),
(138, 2, '87.255.12.59', 'e3d38b93d2f429c02bb3f7e22518d6f5', NULL, 1255514552),
(139, 2, '80.237.112.245', '2955f8488e5990b16aabaad661ecd578', NULL, 1255649083),
(140, 2, '87.255.12.59', '420b90207a5c98f734d299cbfd79c2fc', NULL, 1255886937),
(141, 2, '87.255.12.59', '8ee63a6003416757fc7601988351dfd6', NULL, 1256062177),
(142, 2, '87.255.12.59', '75fb454048ef455684949f69dadc747d', NULL, 1256089042),
(143, 2, '213.85.32.23', '48845ed5a2926561a9b7c1fb7652d100', NULL, 1257158369);

-- --------------------------------------------------------

--
-- ��������� ������� `user_usergroup_rel`
--

DROP TABLE IF EXISTS `user_usergroup_rel`;
CREATE TABLE IF NOT EXISTS `user_usergroup_rel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=34 ;

--
-- ���� ������ ������� `user_usergroup_rel`
--

INSERT INTO `user_usergroup_rel` (`id`, `group_id`, `user_id`) VALUES
(1, 1, 1),
(23, 2, 2),
(24, 3, 2),
(30, 2, 3),
(31, 2, 4),
(32, 4, 3),
(33, 2, 5);

-- --------------------------------------------------------

--
-- ��������� ������� `user_useronline`
--

DROP TABLE IF EXISTS `user_useronline`;
CREATE TABLE IF NOT EXISTS `user_useronline` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `session` char(32) DEFAULT NULL,
  `last_activity` int(11) DEFAULT NULL,
  `url` char(255) DEFAULT NULL,
  `ip` char(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`session`),
  KEY `last_activity` (`last_activity`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED AUTO_INCREMENT=330 ;

--
-- ���� ������ ������� `user_useronline`
--

INSERT INTO `user_useronline` (`id`, `user_id`, `session`, `last_activity`, `url`, `ip`) VALUES
(329, 2, 'e068f18f7ca743008ebe3fea63ced400', 1233982270, 'http://mzz/ru/admin/devToolbar', '127.0.0.1');
