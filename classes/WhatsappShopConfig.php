<?php

use PrestaShop\PrestaShop\Adapter\ServiceLocator;
use PrestaShop\PrestaShop\Core\Product\ProductInterface;

class WhatsappShopConfig extends ObjectModel
{
    public static function selectConfig(){
        $sql = 'SELECT conf FROM '._DB_PREFIX_.'whatsapp_shop_config WHERE id=1';

        return Db::getInstance()->getValue($sql);
    }

    public static function selectConfigLado(){
        $sql = 'SELECT conf FROM '._DB_PREFIX_.'whatsapp_shop_config WHERE id=2';

        return Db::getInstance()->getValue($sql);
    }
    // public static function buscarConfigLang($iso_code){

    //     $iso_code = strtoupper($iso_code);//die($iso_code);
    //     $sql = 'SELECT * FROM '._DB_PREFIX_.'whatsapp_shop_config WHERE iso_code="'.$iso_code.'"';

    //     return Db::getInstance()->executeS($sql);
    // }
    
    // public static function addConfig($numero, $iso_code, $ordem){
 
    //     $sql = 'INSERT INTO `'._DB_PREFIX_.'whatsapp_shop_config` (`numero`, `iso_code`, `ordem`) 
    //     VALUES ("'.$numero.'", "'.$iso_code.'", "'.$ordem.'");';

    //     if (!Db::getInstance()->execute($sql))
    //         die('Error add.');
        
    // }

    public static function updateConfig($conf){
        $id = 1;
        $sql = 'UPDATE `'._DB_PREFIX_.'whatsapp_shop_config`
            SET `conf`="'.$conf.'" WHERE id="'.$id.'";';

        if (!Db::getInstance()->execute($sql))
            die('Error update.');
    }    
 
    public static function updateConfigLado($conf){
        $id = 2;
        $sql = 'UPDATE `'._DB_PREFIX_.'whatsapp_shop_config`
            SET `conf`="'.$conf.'" WHERE id="'.$id.'";';

        if (!Db::getInstance()->execute($sql))
            die('Error update.');
    } 
    // public static function deletarConfig($id){
    //     $sql = 'DELETE FROM `'._DB_PREFIX_.'whatsapp_shop_config` WHERE  id='.$id.';';

    //     if (!Db::getInstance()->execute($sql))
    //         die('Error add.');
    // }   
    

}    