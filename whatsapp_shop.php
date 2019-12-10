<?php

if (!defined('_PS_VERSION_'))
    exit();

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
        if (Shop::isFeatureActive())
            Shop::setContext(Shop::CONTEXT_ALL);
        
        $whatsapp_db = _DB_PREFIX_."whatsapp_shop";
        
        return parent::install() &&
            $this->registerHook('displayFooter') && Configuration::updateValue($whatsapp_db, '#####');
    }
    
    public function uninstall()
    {
        if (!parent::uninstall() || !Configuration::deleteByName(_DB_PREFIX_.'whatsapp_shop'))
            return false;
        return true;
    }

    public function hookdisplayFooter($params)
    {
        $whatsapp_db = _DB_PREFIX_."whatsapp_shop";
        // < assign variables to template >
        $this->context->smarty->assign(
            array('whatsapp_shop' => Configuration::get($whatsapp_db))
        );

        return $this->display(__FILE__, 'whatsapp_shop.tpl');
    }

    

    public function displayForm()
    {
        //die(_DB_PREFIX_);
        // < init fields for form array >
        $fields_form[0]['form'] = array(
            'legend' => array(
                'title' => $this->l('Whatsapp Shop Module'),
            ),
            'input' => array(
                array(
                    'type' => 'text',
                    'label' => $this->l('Whatsapp'),
                    'name' => _DB_PREFIX_.'whatsapp_shop',
                    //'lang' => true,  
                    'size' => 20,
                    'required' => true
                ),
            ),
            'submit' => array(
                'title' => $this->l('Save'),
                'class' => 'btn btn-default pull-right'
            )
        );
    
        // < load helperForm >
        $helper = new HelperForm();
    
        // < module, token and currentIndex >
        $helper->module = $this;
        $helper->name_controller = $this->name;
        $helper->token = Tools::getAdminTokenLite('AdminModules');
        $helper->currentIndex = AdminController::$currentIndex.'&configure='.$this->name;
    
        // < title and toolbar >
        $helper->title = $this->displayName;
        $helper->show_toolbar = true;        // false -> remove toolbar
        $helper->toolbar_scroll = true;      // yes - > Toolbar is always visible on the top of the screen.
        $helper->submit_action = 'submit'.$this->name;
        $helper->toolbar_btn = array(
            'save' =>
                array(
                    'desc' => $this->l('Save'),
                    'href' => AdminController::$currentIndex.'&configure='.$this->name.'&save'.$this->name.
                        '&token='.Tools::getAdminTokenLite('AdminModules'),
                ),
            'back' => array(
                'href' => AdminController::$currentIndex.'&token='.Tools::getAdminTokenLite('AdminModules'),
                'desc' => $this->l('Back to list')
            )
        );
    
        // < load current value >
        $helper->fields_value[_DB_PREFIX_.'whatsapp_shop'] = Configuration::get(_DB_PREFIX_.'whatsapp_shop');
    
        return $helper->generateForm($fields_form);
    } 
    
    public function getContent()
    {
        $output = null;
    
    
        // < here we check if the form is submited for this module >
        if (Tools::isSubmit('submit'.$this->name)) {
            $whatsapp_shop = strval(Tools::getValue(_DB_PREFIX_.'whatsapp_shop'));
           // die($whatsapp_shop);
            // < make some validation, check if we have something in the input >
            if (!isset($whatsapp_shop))
                $output .= $this->displayError($this->l('Please insert something in this field.'));
            else
            {
                $whatsapp_db = _DB_PREFIX_.'whatsapp_shop';
                // < this will update the value of the Configuration variable >
                Configuration::updateValue($whatsapp_db, $whatsapp_shop);
    
    
                // < this will display the confirmation message >
                $output .= $this->displayConfirmation($this->l('Whatsapp updated!'));
            }
        }
        return $output.$this->displayForm();
    }
        
}    