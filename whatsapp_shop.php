<?php

if (!defined('_PS_VERSION_'))
    exit();

include_once(_PS_MODULE_DIR_ . 'whatsapp_shop/classes/WhatsappShop.php');
include_once(_PS_MODULE_DIR_ . 'whatsapp_shop/classes/WhatsappShopConfig.php');

class Whatsapp_Shop extends Module
{
    public function __construct()
    {
        $this->name = 'whatsapp_shop';
        $this->tab = 'front_office_features';
        $this->version = '1.0.0';
        $this->author = 'Davidson Santos';
        $this->need_instance = 1;
        $this->ps_versions_compliancy = array('min' => '1.7.1.0', 'max' => _PS_VERSION_);
        $this->bootstrap = true;

        parent::__construct();

        $this->displayName = $this->l('Whatsapp Shop', 'whatsapp_shop');
        $this->description = $this->l('This module is developed to display an Whatsapp.', 'whatsapp_shop');

        $this->confirmUninstall = $this->l('Are you sure you want to uninstall?', 'whatsapp_shop');
    }

    public function install()
    {
        include(dirname(__FILE__).'/sql/install.php');
        
        return parent::install() &&
            $this->registerHook('displayFooter');
    }
    
    public function uninstall()
    {
        include(dirname(__FILE__).'/sql/uninstall.php');
		return parent::uninstall();
    }

    public function hookdisplayFooter($params)
    {
        $lang_iso_code = Context::getContext()->language->iso_code;
        $whatsapps = WhatsappShop::buscarNumeroLang($lang_iso_code);
        $config = WhatsappShopConfig::selectConfig();//die($config );
        $config_lado = WhatsappShopConfig::selectConfigLado();

        ## $whatsapps = WhatsappShop::selectNumero();
        // < assign variables to template >
        $this->context->smarty->assign('whatsapps', $whatsapps);
        $this->context->smarty->assign('config', $config);
        $this->context->smarty->assign('config_lado', $config_lado);
        

        return $this->display(__FILE__, 'whatsapp_shop.tpl');
    }

    public function getContent()
    {
        $output = null;
        // print_r("TESTE");die();
        // < here we check if the form is submited for this module >
        if (Tools::isSubmit('wp-add')) {
            $nome = strval(Tools::getValue('nome'));
            $numero = strval(Tools::getValue('numero'));
            $tipo = strval(Tools::getValue('tipo'));
            $iso_code  = strval(Tools::getValue('iso_code'));
            $ordem  = strval(Tools::getValue('ordem'));
           // die($whatsapp_shop);
            // < make some validation, check if we have something in the input >
            if (!isset($numero))
                $output .= $this->displayError($this->l('Please insert something in this field.'));
            else
            {
                //die("TESTE");
                $whatsapp_db = _DB_PREFIX_.'whatsapp_shop';
                // < this will update the value of the Configuration variable >
                WhatsappShop::addNumero($nome, $numero, $tipo, $iso_code, $ordem);
                // WhatsappShop::updateNumero($numero, $ordem);
                // < this will display the confirmation message >
                $output .= $this->displayConfirmation($this->l('Whatsapp updated!'));
            }
        }

        if (Tools::isSubmit('wp-update')) {
            $id = strval(Tools::getValue('id'));
            $nome = strval(Tools::getValue('nome'));
            $numero = strval(Tools::getValue('numero'));
            $tipo = strval(Tools::getValue('tipo'));
            $iso_code  = strval(Tools::getValue('iso_code'));
            $ordem  = strval(Tools::getValue('ordem'));
           // die($whatsapp_shop);
            // < make some validation, check if we have something in the input >
            if (!isset($numero))
                $output .= $this->displayError($this->l('Please insert something in this field.'));
            else
            {
                // die("TESTE wp-update");
                $whatsapp_db = _DB_PREFIX_.'whatsapp_shop';
                // < this will update the value of the Configuration variable >
                WhatsappShop::updateNumero($id, $nome, $numero, $tipo, $iso_code, $ordem);
                // WhatsappShop::updateNumero($numero, $ordem);
                // < this will display the confirmation message >
                $output .= $this->displayConfirmation($this->l('Whatsapp updated!'));
            }
        }
      
        if (Tools::isSubmit('wp-delete')) {
            $id = strval(Tools::getValue('id'));
           // die($whatsapp_shop);
            // < make some validation, check if we have something in the input >
            if (!isset($id))
                $output .= $this->displayError($this->l('Please insert something in this field.'));
            else
            {
                // die("TESTE wp-update");
                // < this will update the value of the Configuration variable >
                WhatsappShop::deletarNumero($id);
                // WhatsappShop::updateNumero($numero, $ordem);
                // < this will display the confirmation message >
                $output .= $this->displayConfirmation($this->l('Whatsapp updated!'));
            }
        }

        if (Tools::isSubmit('wp-config')) {
            $conf = strval(Tools::getValue('conf'));
           // die($whatsapp_shop);
            // < make some validation, check if we have something in the input >
            if (!isset($conf))
                $output .= $this->displayError($this->l('Please insert something in this field.'));
            else
            {
                // die("TESTE wp-update");
                // < this will update the value of the Configuration variable >
                WhatsappShopConfig::updateConfig($conf);
                // < this will display the confirmation message >
                $output .= $this->displayConfirmation($this->l('Whatsapp updated!'));
            }
        }

        if (Tools::isSubmit('wp-config-lado')) {
            $conf = strval(Tools::getValue('conf'));
           // die($whatsapp_shop);
            // < make some validation, check if we have something in the input >
            if (!isset($conf))
                $output .= $this->displayError($this->l('Please insert something in this field.'));
            else
            {
                // die("TESTE wp-update");
                // < this will update the value of the Configuration variable >
                WhatsappShopConfig::updateConfigLado($conf);
                // < this will display the confirmation message >
                $output .= $this->displayConfirmation($this->l('Whatsapp updated!'));
            }
        }
        

        ///return $helper->generateForm($fields_form);
        $countries = Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS('SELECT * FROM `'._DB_PREFIX_.'country` WHERE `active` = 1 ORDER BY `iso_code` ASC');
        
        $whatsapps = WhatsappShop::selectNumero();
        $config = WhatsappShopConfig::selectConfig();
        $config_lado = WhatsappShopConfig::selectConfigLado();

        $this->context->smarty->assign('countries', $countries);
        
        $this->context->smarty->assign('whatsapps', $whatsapps);
        
        $this->context->smarty->assign('config', $config);
        
        $this->context->smarty->assign('config_lado', $config_lado);

        return $this->context->smarty->fetch($this->local_path.'views/templates/admin/configure.tpl');

    }
        
}    