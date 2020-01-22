<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
{* <a href="https://wa.me/{NUMERO}?text=I'm%20interested%20in%20your%20car%20for%20sale" class="wfloat" id="whatsapp_shop1" target="_blank"> *}


{* {foreach from=$whatsapps item=w}
    P: {$w.numero} - {$w.iso_code}
{/foreach} *}
{* <p>DDDD: {$whatsapps[0]['numero']|print_r}</p> *}

{if $config==1} 
	{if count($whatsapps) == 1}
		<a href="https://api.whatsapp.com/send?phone={$whatsapps[0]['numero']}" class="wfloat" id="whatsapp_shop1" target="_blank">
			<i class="fa fa-whatsapp w-float"></i>
		</a>

		<a href="https://web.whatsapp.com/send?phone=+{$whatsapps[0]['numero']}" class="wfloat" id="whatsapp_shop2" target="_blank">
			<i class="fa fa-whatsapp w-float"></i>
		</a>

		<style>
		.wfloat{
			position:fixed;
			width:60px;
			height:60px;
			bottom:40px;
			left:40px;
			background-color:#25d366;
			color:#FFF;
			border-radius:50px;
			text-align:center;
			font-size:30px;
			box-shadow: 2px 2px 3px #999;
			z-index:100;
			border: 0px !important;
			cursor: pointer;
		}

		.w-float{
			margin-top: 16px;
		}

		@media (min-width: 900px) {
			#whatsapp_shop1{
				display: none;
			}
			#whatsapp_shop2{
				display: block;
			}  
			.caixa-lista{
				color: #7a7a7a;
				position: fixed;
				z-index: 666;
				width: 200px;
				bottom: 170px;
				left: 40px;
			}
		
		}
		@media (max-width: 900px) {
			#whatsapp_shop1{
				display: block;
			}
			#whatsapp_shop2{
				display: none;
			}  
			.wfloat{
				bottom:20px;
				left:30px;
			}
			.back-top {
				bottom: 100px;
			}
		}
		</style>		
	{/if} 

	{if count($whatsapps) > 1}
		<div class="dropdown caixa-lista">
			<button class="wfloat" id="whatsapp_shop1 btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" data-hover="dropdown">
				<i class="fa fa-whatsapp w-float"></i>
			</button>
			<ul class="dropdown-menu">
				{foreach from=$whatsapps item=w}
					<li><a href="https://api.whatsapp.com/send?phone={$w.numero}" class="wfloat2" id="whatsapp_shop1" target="_blank">{$w.nome}</a></li>
				{/foreach}
			</ul>
		</div>

		<div class="dropdown caixa-lista">
			<button class="wfloat" id="whatsapp_shop2 btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" data-hover="dropdown">
				<i class="fa fa-whatsapp w-float"></i>
			</button>
			<ul class="dropdown-menu">
				{foreach from=$whatsapps item=w}
					<li><a href="https://web.whatsapp.com/send?phone=+{$w.numero}" class="wfloat2" id="whatsapp_shop2" target="_blank">{$w.nome}</a></li>
				{/foreach}
			</ul>
		</div>

		<style>
		.wfloat{
			position:fixed;
			width:60px;
			height:60px;
			bottom:40px;
			left:40px;
			background-color:#25d366;
			color:#FFF;
			border-radius:50px;
			text-align:center;
			font-size:30px;
			box-shadow: 2px 2px 3px #999;
			z-index:100;
			border: 0px !important;
			cursor: pointer;
		}

		.w-float{
			margin-top: 4px;
		}

		@media (min-width: 900px) {
			#whatsapp_shop1{
				display: none;
			}
			#whatsapp_shop2{
				display: block;
			}  
			.caixa-lista{
				color: #7a7a7a;
				position: fixed;
				z-index: 666;
				width: 200px;
				bottom: 170px;
				left: 40px;
			}
		
		}
		@media (max-width: 900px) {
			#whatsapp_shop1{
				display: block;
			}
			#whatsapp_shop2{
				display: none;
			}  
			.wfloat{
				bottom:20px;
				left:30px;
			}
			.back-top {
				bottom: 100px;
			}
		}
		</style>
	{/if}

{/if}
{if $config==2}
	{if count($whatsapps) == 1}
		<div class="footer asagiSabit whatsappBlock" id="whatsapp_shop2">

				<img src="{__PS_BASE_URI__}/modules/whatsapp_shop/whataspp_icon.png" 
					alt="Whataspp" width="24px" height="24px"> {l s='Whataspp Live Chat' mod='whatsapp'}

		</div>

		<script>
			$( "#whatsapp_shop1" ).click(function() {
				var url = "https://api.whatsapp.com/send?phone={$whatsapps[0]['numero']}";
				window.open(url,'_blank');
			});

			$( "#whatsapp_shop2" ).click(function() {
				var url = "https://web.whatsapp.com/send?phone=+{$whatsapps[0]['numero']}";
				window.open(url,'_blank');
			});
		</script>

		<style>
			.asagiSabit{
				position:fixed;bottom:5px;z-index:999;cursor:pointer;
			}
			.whatsappBlock a {
				display:inline-block;height:30px;background:#65BC54;outline: 3px solid #fff;padding:5px 10px;color:#fff !important;font-weight:bold; margin-right: 22px;margin-bottom: 5px;
			}
			.whatsappBlock a img {
				height:100%;width:auto
			}
			.whatsappBlock {
				display:inline-block;height:30px;background:#65BC54;outline: 3px solid #fff;padding:5px 10px;color:#fff !important;font-weight:bold; margin-right: 22px;margin-bottom: 5px;
			}
			.whatsappBlock img {
				height:100%;width:auto
			}		
		</style>
	{/if}

	{if count($whatsapps) > 1}
		<div class="dropdown caixa-lista">
			<button class="wfloat" id="whatsapp_shop1 btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" data-hover="dropdown">
				<div class="footer asagiSabit whatsappBlock">
					<img src="{__PS_BASE_URI__}/modules/whatsapp_shop/whataspp_icon.png" 
						alt="Whataspp" width="24px" height="24px"> {l s='Whataspp Live Chat' mod='whatsapp'}
				</div>
			</button>

			<ul class="dropdown-menu">
				{foreach from=$whatsapps item=w}
					<li><a href="https://api.whatsapp.com/send?phone={$w.numero}" class="wfloat" id="whatsapp_shop2" target="_blank">{$w.nome}</a></li>
				{/foreach}
			</ul>
		</div>

		<div class="dropdown caixa-lista">
			<button class="wfloat" id="whatsapp_shop2 btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" data-hover="dropdown">
				<div class="footer asagiSabit whatsappBlock">
					<img src="{__PS_BASE_URI__}/modules/whatsapp_shop/whataspp_icon.png" 
						alt="Whataspp" width="24px" height="24px"> {l s='Whataspp Live Chat' mod='whatsapp'}
				</div>
			</button>

			<ul class="dropdown-menu">
				{foreach from=$whatsapps item=w}
					<li><a href="https://web.whatsapp.com/send?phone=+{$w.numero}" class="wfloat" id="whatsapp_shop2" target="_blank">{$w.nome}</a></li>
				{/foreach}
			</ul>
		</div>

		<style>
			.wfloat{
				border: 0px !important;
				cursor: pointer;
			}

		@media (min-width: 900px) {
			#whatsapp_shop1{
				display: none;
			}
			#whatsapp_shop2{
				display: block;
			}  
			.caixa-lista{
				color: #7a7a7a;
				position: fixed;
				z-index: 666;
				width: 200px;
				bottom: 111px;
				right: 10px;
			}
		}

		@media (max-width: 900px) {
			#whatsapp_shop1{
				display: block;
			}
			#whatsapp_shop2{
				display: none;
			}  
			.wfloat{
				bottom:20px;
				left:30px;
			}
			.back-top {
				bottom: 100px;
			}
		}

		.asagiSabit{
			position:fixed;bottom:5px;z-index:999;cursor:pointer;
		}
		.whatsappBlock a {
			display:inline-block;height:30px;background:#65BC54;outline: 3px solid #fff;padding:5px 10px;color:#fff !important;font-weight:bold; margin-right: 22px;margin-bottom: 5px;
		}
		.whatsappBlock a img {
			height:100%;width:auto
		}
		.whatsappBlock {
			display:inline-block;height:30px;background:#65BC54;outline: 3px solid #fff;padding:5px 10px;color:#fff !important;font-weight:bold; margin-right: 22px;margin-bottom: 5px;
		}
		.whatsappBlock img {
			height:100%;width:auto
		}

		</style>
	{/if}

{/if}

{if $config_lado==1}
	<style>
	/** LEFT **/
		.asagiSabit{
			left: 20px !important;
		}
		.wfloat{
			left: 40px !important;
		}
	</style>
{/if}

{if $config_lado==2}
	<style>
	/** RIGHT **/
		.asagiSabit{
			right: 5px !important;
		}
		.wfloat{
			right: 40px !important;
		}
	</style>
{/if}