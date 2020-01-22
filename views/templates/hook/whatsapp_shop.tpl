<link rel="stylesheet" type="text/css" href="{_MODULE_DIR_}/whatsapp_shop/assets/css/style.css">

{if $config==1}
    {$visual="style_one"}
{/if}

{if $config==2}
    {$visual="style_two"}   
{/if}

{if $config==3}
    {$visual="style_three"}
{/if}

{if $config==4}
    {$visual="style_four"}   
{/if}

{if $config==5}
    {$visual="style_five"}   
{/if}

{if $config_lado==1}
    {$lado="left"}
{/if}

{if $config_lado==2}
    {$lado="right"}
{/if}

{$array_links_m = ["#","https://api.whatsapp.com/send?phone=","mailto:","tel:"]}
{$array_links = ["#","https://web.whatsapp.com/send?phone=+","mailto:","tel:"]}
{$array_links_icons = ["#","whats.png","email.png","fone.png"]}

{if count($whatsapps) == 1}
        <a href="{$array_links_m[$whatsapps[0]['tipo']]}{$whatsapps[0]['numero']}" target="_blank" id="contact-float-1" > 
             <button class="bt_contact-float {$lado} {$visual}" id="contact-float-1"> </button> 
        </a>

        <a href="{$array_links[$whatsapps[0]['tipo']]}{$whatsapps[0]['numero']}" target="_blank" id="contact-float-2"> 
            <button class="bt_contact-float {$lado} {$visual}" id="contact-float-2"> </button> 
        </a>
{/if}   

{if count($whatsapps) > 1}
        <link rel="stylesheet" type="text/css" href="{_MODULE_DIR_}/whatsapp_shop/assets/css/style_screean.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

        <a id="screan_a">
            <button class="bt_contact-float {$lado} {$visual}" id="app_screan"> </button> 
        </a>
        <ul class="app_screan_s desat {$lado} {$visual}" id="box-contacts">
            {foreach from=$whatsapps item=w}
                <li class="{$visual}" id="media_a{$w.id}"><a href="{$array_links[$w.tipo]}{$w.numero}" id="screan_a_link" target="_blank"><img src="{_MODULE_DIR_}/whatsapp_shop/img/icons/{$array_links_icons[$w.tipo]}" style="float:left;width:16px;padding:4px;">{$w.nome}</a></li>
                <li class="{$visual}" id="media_m{$w.id}"><a href="{$array_links_m[$w.tipo]}{$w.numero}" id="screan_a_link" target="_blank"><img src="{_MODULE_DIR_}/whatsapp_shop/img/icons/{$array_links_icons[$w.tipo]}" style="float:left;width:16px;padding:4px;">{$w.nome}</a></li>
         
                <script>
                    $(document).ready(function(){
                            // This will fire when document is ready:
                        $(window).resize(function() {
                            // This will fire each time the window is resized:
                            if($(window).width() >= 900) {
                                // if larger or equal
                                $("#media_m{$w.id}").addClass("desat");  
                               // $("#media_m{$w.tipo}").toggleId('#media_m{$w.tipo}').toggleId('desat');                            
                            } else {
                                $("#media_a{$w.id}").addClass("desat");
                               /// $("#media_a{$w.tipo}").toggleId('#media_a{$w.tipo}').toggleId('desat');  
                            }
                        }).resize(); // This will simulate a resize to trigger the initial run.               
                    });
                </script>

           {/foreach}
        </ul>
       
 
         <script>
        
            $(document).ready(function(){
                    // This will fire when document is ready:
                $(window).resize(function() {
                    // This will fire each time the window is resized:
                    if($(window).width() >= 900) {
                        // if larger or equal
                        //$('.element').show();
                        $("#screan_a").attr("id","contact-float-2");
                        $("#app_screan").attr("id","contact-float-2");
                        $(".app_screan_s").addClass("contact-float-s2");
                        $("#screan_a_link").attr("id","contact-float-2");
                        //$("#media_m{$w.tipo}").addClass("desat");
                        
                    } else {
                        // if smaller
                        //$('.element').hide();
                        $("#app_screan").attr("id","contact-float-1");
                        $(".app_screan_s").addClass("contact-float-s1");
                        $("#screan_a").attr("id","contact-float-1");
                        $("#screan_a_link").attr("id","contact-float-1");
                       // $("#media_a{$w.tipo}").addClass("desat");
                    }
                }).resize(); // This will simulate a resize to trigger the initial run.

                $("#contact-float-1").click(function(){
                    $(".contact-float-s1").toggleClass('desat').toggleClass('ativ');
                    //$("#media_a{$w.tipo}").toggleClass('desat').toggleClass('ativ');
                    // $("ul.contact-float-s1 li a").attr("href", "{$array_links_m[$w.tipo]}{$w.numero}");
                    // $(".ativ").fadeIn(3000);
                    // $(".desat").fadeOut(3000);
                });

                $("#contact-float-2").click(function(){
                    $(".contact-float-s2").toggleClass('desat').toggleClass('ativ'); 
                    //$("#media_m{$w.tipo}").toggleClass('desat').toggleClass('ativ');
                    //$("ul.contact-float-s2 li a").attr("href", "{$array_links[$w.tipo]}{$w.numero}");
                    // $(".ativ").fadeIn(3000);
                    // $(".desat").fadeOut(3000);                                    
                });                
            });
        </script>


{/if}    