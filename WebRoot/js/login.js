$(document).ready(function() {
	
	$("#login").click(function(){
		$.XYTipsWindow({
			___title:"登录",
			___content:"iframe:login1.jsp",
			___width:"460",
			___height:"150",
			___showbg:true,
			___drag:"___boxTitle"

		});
	});
	
	$("#reg").click(function(){
		$.XYTipsWindow({
			___title:"注册",
			___content:"iframe:reg.jsp",
			___width:"465",
			___height:"420",
			___showbg:true,
			___drag:"___boxTitle"
		});
	});
	


 })