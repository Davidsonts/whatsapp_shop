<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
{* <a href="https://wa.me/{$whatsapp_shop}?text=I'm%20interested%20in%20your%20car%20for%20sale" class="wfloat" id="whatsapp_shop1" target="_blank"> *}
<a href="https://api.whatsapp.com/send?phone={$whatsapp_shop}" class="wfloat" id="whatsapp_shop1" target="_blank">
	<i class="fa fa-whatsapp w-float"></i>
</a>

<a href="https://web.whatsapp.com/send?phone=+{$whatsapp_shop}" class="wfloat" id="whatsapp_shop2" target="_blank">
	<i class="fa fa-whatsapp w-float"></i>
</a>

<style>
.wfloat{
	position:fixed;
	width:60px;
	height:60px;
	bottom:40px;
	/*right:40px;*/
	left:40px;
	background-color:#25d366;
	color:#FFF;
	border-radius:50px;
	text-align:center;
  	font-size:30px;
	box-shadow: 2px 2px 3px #999;
  	z-index:100;
}

.w-float{
	margin-top:16px;
}

@media (min-width: 900px) {
  #whatsapp_shop1{
	  display: none;
  }
  #whatsapp_shop2{
	  display: block;
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