<div class="row">
    <div class="col-md-3">
        <form action="#" method="post">
            {* <input type="hidden" name="base_name_adm" value="{basename(_PS_ADMIN_DIR_)}" />   *}
            
            <input type="hidden" name="token" value="{$token}" />  
            <input type="text" name="nome" placeholder="Nome" /> 
            <br>
            <input type="text" name="numero" placeholder="Número" />  
            <br>                     
            <select name="tipo">
                <option value="1">Tipo WhatsApp</option>
                <option value="2">Tipo E-mail</option>
                <option value="3">Tipo Telefone</option>
            </select>  
            <br>
            <select name="iso_code">
                {foreach from=$countries item=p}
                    <option value="{$p.iso_code}">{$p.iso_code}</option>
                {/foreach}
            </select>
            <br>
            <input type="hidden" name="ordem" value="1"/>  
  
            <button type="submit" name="wp-add" class="btn btn-success"> Salvar </button>
        </form> 
    </div>
</div>

<hr />

<div class="col-md-5">
    <table class="table table-striped">
        <thead> 
            <tr>
                <td>Nome</td>
                <td>Número</td>
                <td>Tipo</td>
                <td>País</td>
                <td>Ações</td>
            </tr>
        </thead>
        <tbody>
            {foreach from=$whatsapps item=w}
                <tr>
                    <form action="#" method="post">
                        <input type="hidden" name="token" value="{$token}" />  
                        <input type="hidden" name="ordem" value="1"/>  
                        <input type="hidden" name="id" value="{$w.id}"/> 
                        <td><input type="text" name="nome" placeholder="Nome" value="{$w.nome}"/> </td>

                        <td><input type="text" name="numero" placeholder="Número" value="{$w.numero}"/> </td>
                        <td>
                            <select name="tipo">
                                <option value="1" {if 1 == $w.tipo} selected {/if}>Tipo WhatsApp</option>
                                <option value="2" {if 2 == $w.tipo} selected {/if}>Tipo E-mail</option>
                                <option value="3" {if 3 == $w.tipo} selected {/if}>Tipo Telefone</option>
                            </select>
                        </td>
                        <td>
                            <select name="iso_code">
                                {foreach from=$countries item=p}
                                    <option value="{$p.iso_code}" {if $p.iso_code == $w.iso_code} selected {/if}>{$p.iso_code}</option>
                                {/foreach}
                            </select>
                        </td>
                        <td>
                        
                            <button type="submit" name="wp-update" class="btn btn-success" style="float:left;"> Alterar </button>
                    </form> 



                    <!-- Trigger the modal with a button -->
                    {* <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button> *}

                    <!-- Modal -->
                    <div id="myModal{$w.id}" class="modal fade" role="dialog">
                    <div class="modal-dialog">

                        <!-- Modal content-->
                        <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Deletar</h4>
                        </div>
                        <div class="modal-body">
                            <p>Tem certeza que quer deletar o Número?</p>

                            <form action="#" method="post">
                                <input type="hidden" name="id" value="{$w.id}"/>
                                <button type="submit" name="wp-delete" class="btn btn-danger" style="float:left;"> Deletar </button>
                            </form> 
                            <button type="button" class="btn btn-default" data-dismiss="modal" style="margin-left:5px;">Fechar</button>

                        </div>
                        {* <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div> *}
                        </div>

                    </div>
                    </div>

                        <a class="btn btn-danger" data-toggle="modal" data-target="#myModal{$w.id}" style="margin-left:5px;float:left;"> 
                            Deletar
                        </a>
                    </td>
                </tr>
            {/foreach}
        </tbody>
    </table>
</div>

<div class="row">
    <div class="col-md-12">
        <div class="col-md-12">
         <br> <br>
        <b>Layout</b> <br><br>
            <form action="#" method="post">
                {* <input type="hidden" name="base_name_adm" value="{basename(_PS_ADMIN_DIR_)}" />   *}
                <input type="hidden" name="token" value="{$token}" />  
                <input type="radio" name="conf" value="1" {if $config==1} checked {/if} /> <img src="{_MODULE_DIR_}/whatsapp_shop/img/img1.png" >
                <input type="radio" name="conf" value="2"{if $config==2} checked {/if}/> <img src="{_MODULE_DIR_}/whatsapp_shop/img/img3.jpg" >
                <input type="radio" name="conf" value="3"{if $config==3} checked {/if}/> <img style="width:50px;" src="{_MODULE_DIR_}/whatsapp_shop/img/gmail-icon.png">
                <input type="radio" name="conf" value="4"{if $config==4} checked {/if}/> <img style="width:50px;" src="{_MODULE_DIR_}/whatsapp_shop/img/email-whats-icon.png" >
                <input type="radio" name="conf" value="5"{if $config==5} checked {/if}/> <img style="width:50px;" src="{_MODULE_DIR_}/whatsapp_shop/img/phone.png" >
                <br><br>
                <button type="submit" name="wp-config" class="btn btn-success"> Salvar </button>
            </form> 
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <div class="col-md-3">
         <br> <br>
        <b>Lado</b> <br><br>
            <form action="#" method="post">
                {* <input type="hidden" name="base_name_adm" value="{basename(_PS_ADMIN_DIR_)}" />   *}
                <input type="hidden" name="token" value="{$token}" />  
                <input type="radio" name="conf" value="1" {if $config_lado==1} checked {/if}/> Esquerda
                <input type="radio" name="conf" value="2"{if $config_lado==2} checked {/if}/> Direita
                <br><br>
                <button type="submit" name="wp-config-lado" class="btn btn-success"> Salvar </button>
            </form> 
        </div>
    </div>
</div>