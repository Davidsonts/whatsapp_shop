<?php

use PrestaShop\PrestaShop\Adapter\ServiceLocator;
use PrestaShop\PrestaShop\Core\Product\ProductInterface;

class WhatsappShop extends ObjectModel
{
    public function selectNumero(){
        $sql = 'SELECT numero FROM '._DB_PREFIX_.'whatsapp_shop WHERE id = 1';
        $numero = Db::getInstance()->getValue($sql);
        return $numero;
    }

    public function updateNumero($numero){
    
        $sql = 'UPDATE `'._DB_PREFIX_.'whatsapp_shop`
            SET `numero`="'.$numero.'";';

        if (!Db::getInstance()->execute($sql))
            die('Error update.');
    }    
    
}    