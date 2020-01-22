<?php
/**
* 2007-2017 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author    PrestaShop SA <contact@prestashop.com>
*  @copyright 2007-2017 PrestaShop SA
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*/

$sql = array();

$sql = 'CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'whatsapp_shop` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `nome` varchar(255),
	`numero` varchar(255),
    `tipo` int(11),
    `iso_code` varchar(2),
    `ordem` int(11),
    PRIMARY KEY  (`id`)
) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=utf8;';

$conf = 1;

$sql2 = 'CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'whatsapp_shop_config` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
	`conf` varchar(255),
    PRIMARY KEY  (`id`)
) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=utf8;';

$sql3 = 'INSERT INTO `'._DB_PREFIX_.'whatsapp_shop_config` (`conf`) VALUES ("'.$conf.'");';

Db::getInstance()->execute($sql);

Db::getInstance()->execute($sql2);

Db::getInstance()->execute($sql3);

Db::getInstance()->execute($sql3);