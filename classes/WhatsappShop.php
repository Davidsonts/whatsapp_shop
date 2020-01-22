<?php

use PrestaShop\PrestaShop\Adapter\ServiceLocator;
use PrestaShop\PrestaShop\Core\Product\ProductInterface;

class WhatsappShop extends ObjectModel
{
    public static function selectNumero(){
        $sql = 'SELECT * FROM '._DB_PREFIX_.'whatsapp_shop';

        return Db::getInstance()->executeS($sql);
    }

    public static function buscarNumeroLang($iso_code){

        $iso_code = strtoupper($iso_code);//die($iso_code);
        $sql = 'SELECT * FROM '._DB_PREFIX_.'whatsapp_shop WHERE iso_code="'.$iso_code.'"';

        return Db::getInstance()->executeS($sql);
    }
    
    public static function addNumero($nome, $numero, $tipo, $iso_code, $ordem){
 
        $sql = 'INSERT INTO `'._DB_PREFIX_.'whatsapp_shop` (`nome`, `numero`, `tipo`, `iso_code`, `ordem`) 
        VALUES ("'.$nome.'", "'.$numero.'", "'.$tipo.'", "'.$iso_code.'", "'.$ordem.'");';

        if (!Db::getInstance()->execute($sql))
            die('Error add.');
        
    }

    public static function updateNumero($id, $nome, $numero, $tipo, $iso_code, $ordem){
    
        $sql = 'UPDATE `'._DB_PREFIX_.'whatsapp_shop`
            SET `nome`="'.$nome.'",  `numero`="'.$numero.'", `tipo`="'.$tipo.'", `iso_code`="'.$iso_code.'", `ordem`="'.$ordem.'" WHERE id="'.$id.'";';

        if (!Db::getInstance()->execute($sql))
            die('Error update.');
    }    
 
    public static function deletarNumero($id){
       //die($id);
        $sql = 'DELETE FROM `'._DB_PREFIX_.'whatsapp_shop` WHERE  id='.$id.';';

        if (!Db::getInstance()->execute($sql))
            die('Error Delete.');
    }   
    

}    