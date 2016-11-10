<%@ page language="java" pageEncoding="UTF-8"%>
<jsp:directive.page import="java.sql.Connection" />
<jsp:directive.page import="java.sql.DriverManager" />
<jsp:directive.page import="java.sql.PreparedStatement" />
<jsp:directive.page import="java.sql.ResultSet" />
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>注册</title>
<style type="text/css">
body,h1,h2,h3,h4,h5,h6,hr,p,blockquote,dl,dt,dd,ul,ol,li,pre,form,fieldset,legend,button,input,textarea,th,td
	{
	margin: 0;
	padding: 0
}

body,button,input,select,textarea {
	font: 12px/1.5 tahoma, arial, \5b8b\4f53, sans-serif;
	text-align: justify;
	text-justify: inter-ideograph;
	word-break: break-all;
	word-wrap: break-word
}

h1,h2,h3,h4,h5,h6 {
	font-size: 100%
}

address,cite,dfn,em,var,i,u {
	font-style: normal
}

code,kbd,pre,samp {
	font-family: courier new, courier, monospace
}

small {
	font-size: 12px
}

ul,ol {
	list-style: none
}

sup {
	vertical-align: text-top
}

sub {
	vertical-align: text-bottom
}

legend {
	color: #000
}

fieldset,img {
	border: 0
}

button,input,select,textarea {
	font-size: 100%;
	padding: 0;
	margin: 0
}

table {
	border-collapse: collapse;
	border-spacing: 0
}

caption,th {
	text-align: left
}

.ovh {
	overflow: hidden
}

.l {
	float: left
}

.r {
	float: right
}

.cur {
	cursor: pointer
}

.c_b {
	content: ".";
	display: block;
	height: 0;
	clear: both;
	visibility: hidden;
	zoom: 1;
	font-size: 0px;
	overflow: hidden;
	visibility: hidden
}

.c_b2 {
	clear: both
}

.dn {
	display: none
}

.dis {
	display: block
}

.b {
	font-weight: bold
}

body {
	behavior: url("css/hover_htc.htc");
	font-family: "Microsoft YaHei", 宋体;
	color: #333;
} /*hover*/

/*会员注册*/
.login ul { /*background:url(../images/line.png) repeat-x;*/
	padding-top: 10px;
	border-top: 1px solid #fff
}

.login ul a {
	color: #005cb1
}

.login .id input,.login .pw input,.in_id,.in_mo,.reg_input,.reg_input_pic
	{
	background-color: #FFF;
	border: 1px solid #d5cfc2;
	font-size: 14px;
	font-weight: bold;
	vertical-align: middle
}

.login .id input,.login .pw input {
	width: 170px;
	height: 30px;
	margin: 0 5px 5px 0;
	line-height: 30px;
	padding: 0 5px;
}

.login .id input:hover,.login .pw input:hover,.in_id:hover,.in_mo:hover,.reg_input:hover,.reg_input_pic:hover
	{
	border: 1px solid #005cb1;
	background-color: #F2FAFF;
}

.l_button,.r_button {
	background: url(images/login_button.png) no-repeat;
	width: 118px;
	height: 39px;
	border: none;
	cursor: pointer;
	display: block;
	float: left;
	text-indent: -9000px
}

.l_button {
	background-position: 0 -60px;
}

.r_button {
	background-position: -138px -60px;
	margin-right: 4px
}

.l_button:hover {
	background-position: 0 0;
}

.r_button:hover {
	background-position: -138px 0;
}

.f_reg_but {
	margin: 10px 0 0 115px
}

.reg {
	width: 460px;
	font-size: 14px;
	line-height: 25px;
	overflow: hidden;
}

.reg dl {
	padding-left: 10px;
	font-size: 14px;
}

.reg dl dt {
	margin-top: 15px
}

.reg dl dd {
	padding: 3px 0
}

.reg .title {
	width: 100px;
	display: inline-block;
	text-align: right;
	padding-right: 10px
}

.reg_input_pic {
	width: 80px;
}

.in_pic_s {
	margin-left: 83px
}

.reg .img {
	position: absolute
}

.onShow,.onFocus,.onError,.onCorrect,.onLoad {
	background: url(images/reg_bg.png) no-repeat 3000px 3000px;
	padding-left: 30px;
	font-size: 12px;
	height: 25px;
	width: 124px;
	display: inline-block;
	line-height: 25px;
	vertical-align: middle;
	overflow: hidden;
	margin-left: 6px
}

.onShow {
	color: #999;
	padding-left: 0px
}

.onFocus {
	background-position: 0px -30px;
	color: #333
}

.onError {
	background-position: 0px -60px;
	color: #333
}

.onCorrect {
	background-position: 0px 0;
	text-indent: -9000px
}

.onLoad {
	background-position: 0px 0
}

.reg_m {
	margin-left: 90px
}

.clew_txt {
	display: inline-block;
	padding: 7px 0 0 15px;
	font-size: 12px;
}

.id input,.pw input,.in_id,.in_mo,.reg_input,.reg_input_pic {
	_behavior: url(js/Round_htc.htc);
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	border-radius: 4px;
	height: 25px;
}

.user_button a,.pay_but {
	_behavior: url(js/Round_htc.htc);
	-moz-border-radius: 100px;
	-webkit-border-radius: 100px;
	border-radius: 100px;
}

#one1,#one2 {
	display: block;
	background-color: #e9eed8;
	padding: 5px 0;
	text-align: center;
	clear: both;
	cursor: pointer
}

#one2 {
	margin-top: 15px
}

#one1:hover,#one2:hover {
	background-color: #d4dfb0
}

#one1 span,#one2 span {
	color: #F00
}
</style>

<script src="js/jquery-1.2.6.min.js" type=text/javascript></script>
<script src="js/formValidator_min.js" type="text/javascript"
	charset="UTF-8"></script>
<script src="js/formValidatorRegex.js" type="text/javascript"
	charset="UTF-8"></script>
<script type="text/javascript">
var request;
function test(){

 	<%--AJAX判断浏览器的类型--%>
	if(window.XMLHttpRequest){
		request = new XMLHttpRequest();
	}else if(window.ActiveXObject){
		request = new ActiveXObject("Microsoft.XMLHTTP");
	}
	<%--设置回调函数--%>
	request.onreadystatechange = callback;
	<%--得到select的值--%>
	var s1 = document.getElementById("s1").value;
	var url = "index2.jsp?p_id=" + s1;
	<%--转到其他页面index2.jsp去处理--%>
	request.open("get",url,true);
	request.send(null);	
}


function callback(){
	 <%--如果成功返回--%>
	if(request.readyState==4){
		if(200 == request.status){
			<%--得到返回的xml文件--%>
			var dom = request.responseXML;
			var provinceEle = dom.getElementsByTagName("city");
			<%--调用innerContent函数把根节点传进去--%>
			innerContent(provinceEle);
		}
	}
} 	
<%--清空select2里面的值--%>
function clearCity(){
	var s2 = document.getElementById("s2")
	s2.length = 0;
}
<%--清空select3里面的值--%>
function clearDistrict(){
	var s3 = document.getElementById("s3")
	s3.length = 0;
}


function innerContent(provinceEle){
	clearCity();
	clearDistrict();  	
	<%--用循环得到xml字节点的值--%>
	for(i = 0; i < provinceEle.length;i++){
			var c_idEle = provinceEle[i].getElementsByTagName("c_id");
			var c_id = c_idEle[0].firstChild.data;
			var c_nameEle =  provinceEle[i].getElementsByTagName("c_name");
 			var c_name = c_nameEle[0].firstChild.data;
 			var s2 = document.getElementById("s2");
 			<%--并添加到select2里面--%>
 			s2[i] = new Option(c_name,c_id);					
		}
		<%--如果select2里面只有一个值就不能onchange的时候这时自动
		调用test1方法去直接获取select3的值--%>
		test1();			
}

function test1(){
	if(window.XMLHttpRequest){
		request = new XMLHttpRequest();
	}else if(window.ActiveXObject){
		request = new ActiveXObject("Microsoft.XMLHTTP");
	}
	request.onreadystatechange = callback1;
	var s2 = document.getElementById("s2").value;
	var url1 = "index3.jsp?c_id=" + s2;
    <%--转到其他页面index3.jsp去处理--%>
	request.open("get",url1,true);
	request.send(null);	
}

function callback1(){
	if(request.readyState==4){
		if(200 == request.status){
			var dom1 = request.responseXML;
			var citeEle = dom1.getElementsByTagName("district");
			innerContent1(citeEle);
		}
	}
} 



function innerContent1(citeEle){
	clearDistrict();		
		for(i = 0; i < citeEle.length;i++){
			var d_idEle = citeEle[i].getElementsByTagName("d_id");
			var d_id = d_idEle[0].firstChild.data;
			var d_nameEle =  citeEle[i].getElementsByTagName("d_name");
 			var d_name = d_nameEle[0].firstChild.data;
 			var s3 = document.getElementById("s3");
 			s3[i] = new Option(d_name,d_id);        		
		} 		
}
</script>
<script type="text/javascript">
		var mailzh =/^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$/;
		if(!mailzh.test(f.stu_mail.value))
		var xmlHttp;    
		//创建XMLHttpRequest对象   
		function createXmlHttp() {   
		//根据window.XMLHttpRequest对象是否存在使用不同的创建方式   
			if (window.XMLHttpRequest) {   
			//FireFox、Opera等浏览器支持的创建方式   
				xmlHttp = new XMLHttpRequest();    
			} else {   
			//IE浏览器支持的创建方式   
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");   
			}   
		}
      
    	function checkUid(){/*验证用户名*/	
		    var msg=document.getElementById("stu_mail");
		   	var infomail=document.getElementById("infomail");
		   	var infopwd=document.getElementById("infopwd");
			var stu_mail = msg.value.trim();
			if(stu_mail.length==0){
				infopwd.innerHTML= '';
				infomail.innerHTML= '<font color="red"> ! 您还未输入邮箱</font>';
				document.form1.stu_mail.focus();
				return false;
			}else if(!mailzh.test(stu_mail)){
				infomail.innerHTML= '<font color="red"> ! 邮箱格式不正确</font>';
				document.form1.stu_mail.focus();
				return false;
			}else{
				infomail.innerHTML="Loading......";
				createXmlHttp();
				xmlHttp.onreadystatechange = _handle; 
				url = "servlet/ValidateAction?stu_mail=" +encodeURI(encodeURI(stu_mail));
				xmlHttp.open("POST",url,true);	
				xmlHttp.send(null);
    		}
    
		}
		function _handle(){   
      		if(xmlHttp.readyState==4){   
         		if(xmlHttp.status==200){
         			var str = xmlHttp.responseText;
         			if(str==1){
         				
         				infomail.innerHTML ='<font color="green"> √ 该邮箱可以使用</font>'

         			}else{
         				infomail.innerHTML ='<font color="red"> ! 该邮箱已被注册</font>'
         				document.form1.stu_mail.focus();
						return false;
         			}
            	 }
			}
		}
		
		function myvalidate(){/*验证是否为空*/	
		    var mail=document.getElementById("stu_mail");
		    var pwd=document.getElementById("stu_pwd");
		    var rpwd=document.getElementById("stu_rpwd");
		    var name=document.getElementById("stu_name");
		    
		    var home=document.getElementById("s1");
		   
		    
		   	var infomail=document.getElementById("infomail");
		   	var infopwd=document.getElementById("infopwd");
		   	var inforpwd=document.getElementById("inforpwd");
		   	var infoname=document.getElementById("infoname");
		   	var infohome=document.getElementById("infohome");
		   	
			var stu_mail = mail.value.trim();
			var stu_pwd = pwd.value.trim();
			var stu_rpwd = rpwd.value.trim();
			var stu_name = name.value.trim();
			
			var stu_home = home.value.trim();
			
			if(stu_mail.length==0){
				infomail.innerHTML= '<font color="red"> ! 您还未输入邮箱</font>';
				document.form1.stu_mail.focus();
				return false;
			}else if(stu_pwd.length==0){
				
				infopwd.innerHTML= '<font color="red"> 您还未输入密码</font>';
				
				return false;
				
			}else if(stu_pwd.length<4||stu_pwd.length>20){
				
				infopwd.innerHTML= '<font color="red"> 长度须在5到20之间</font>';
				
				return false;
				
			}else if(stu_rpwd!=stu_pwd){
				infopwd.innerHTML= '';
				inforpwd.innerHTML= '<font color="red"> 两次密码不一致</font>';
				
				return false;
				
			}else if(stu_name.length==0){
				infopwd.innerHTML= '';
				inforpwd.innerHTML= '';
				infoname.innerHTML= '<font color="red"> 您还没有输入姓名</font>';
				
				return false;
				
			}else if(stu_home=="--请选择--"){
				infohome.innerHTML= '';
				infohome.innerHTML= '<font color="red"> 请选择</font>';
				return false;
				
			}
    
		}

</script>
<script type="text/javascript">
 
$(document).ready(function(){
 var $day1 = $("#day1");   
 var $month1 = $("#month1");   
 var $year1 = $("#year1");   
 <!--出始化年-->
 var dDate = new Date();
 var dCurYear = dDate.getFullYear();
 var str="";
 //控制年分，从现在都过去多少年
 for(var i=dCurYear-50;i<dCurYear+1;i++)
 {
    if(i==dCurYear){
   str="<option value="+i+" selected=true>"+i+"</option>";
    }else{
   str="<option value="+i+">"+i+"</option>";
    }
    $year1.append(str);
 }

 <!--出始化月-->
 for(var i=1;i<=12;i++){
  
  if(i==(dDate.getMonth()+1))
  {
    str="<option value="+i+" selected=true>"+i+"</option>";
  }else{
    str="<option value="+i+">"+i+"</option>";
  }
  $month1.append(str);
 }
  <!--调用函数出始化日-->
  TUpdateCal($("#year1").val(),$("#month1").val());
 });

 <!--根据年月获取当月最大天数-->
 function TGetDaysInMonth(iMonth, iYear) {
  var dPrevDate = new Date(iYear, iMonth, 0);
  return dPrevDate.getDate();
 }

 function TUpdateCal(iYear, iMonth) {
  var dDate=new Date();
  daysInMonth = TGetDaysInMonth(iMonth, iYear);
  $("#day1").empty(); 
  for (d = 1; d <= parseInt(daysInMonth); d++) {

  if(d==dDate.getDate()){
   str="<option value="+d+" selected=true>"+d+"</option>";
  }else{
     str="<option value="+d+">"+d+"</option>";
  }
  $("#day1").append(str);
 }
}

</script>

<script src="jquery.js" type="text/javascript"></script>


</head>

<body>

	<!--注册开始-->
	<div class="reg">
		<form action="servlet/RegAction" method="post" name="form1" id="form1"
			onsubmit="return myvalidate();">
			<dl>
				<dt class="f14 b">帐户登录信息</dt>
				<dd>
					<span class="title">登录邮箱：</span><input class="reg_input"
						type="text" id="stu_mail" name="stu_mail" onblur="checkUid()" /><span
						id="infomail"></span>
				</dd>
				<dd>
					<span class="title">登录密码：</span><input class="reg_input"
						type="password" id="stu_pwd" name="stu_pwd" /><span id="infopwd"></span>
				</dd>
				<dd>
					<span class="title">确认登录密码：</span><input class="reg_input"
						type="password" id="stu_rpwd" name="stu_rpwd" /><span
						id="inforpwd"></span>
				</dd>
			</dl>
			<dl>
				<dt class="f14 b">帐户基本信息</dt>
				<dd>
					<span class="title">昵称：</span><input class="reg_input"
						name="stu_name" id="stu_name" type="text" /><span id="infoname"></span>
				</dd>

				<dd>
					<span class="title">性别：</span><input type="radio" id="Sex_Man"
						name="user_sex" name="rb_Sex" value="男" checked="checked" /><label
						for="Sex_Man"> 帅哥</label> <input type="radio" name="user_sex"
						id="Sex_Woman" name="rb_Sex" value="女" /><label for="Sex_Woman">
						美女</label>
				</dd>
				<dd>
					<span class="title">出生日期：</span> <select id="year1" name="year"
						onchange="TUpdateCal(ymd.year1.value,ymd.month1.value)">
					</select>年 <select id="month1" name="month"
						onchange="TUpdateCal(ymd.year1.value,ymd.month1.value)">
					</select>月 <select id="day1" name="day">
					</select>
				</dd>
				<dd>
					<span class="title">故乡：</span> <select id="s1" name="s1"
						onchange="test()">
						<%
							//链接数据库
							Class.forName("com.mysql.jdbc.Driver");
							Connection con = DriverManager.getConnection(
									"jdbc:mysql://localhost/lovo", "root", "root");
							String sql = "select * from province";
							PreparedStatement pstmt = con.prepareStatement(sql);
							ResultSet rs = pstmt.executeQuery();
							//得到数据库里面表province的所有值
							while (rs.next()) {
								int p_id = rs.getInt(1);
								String p_name = rs.getString(2);
						%>
						<option value="<%=p_id%>"><%=p_name%></option>
						<%
							}
						%>
						<option selected="selected">--请选择--</option>
					</select> <select id="s2" name="s2" onchange="test1()">
						<option selected="selected">--请选择--</option>
					</select> <select id="s3" name="s3" style="display:none">
						<option selected="selected">--请选择--</option>
					</select> <span id="infohome"> </span>
				</dd>
				
				<dd>
					<span class="title">喜欢的景点：</span> <select name="type" >
					<option selected="selected" lang="10">--请选择--</option>
					<option value="名胜山水">名胜山水</option>
					<option value="公园游乐园">公园游乐园</option>
					<option value="海滨海岛">海滨海岛</option>
					<option value="古镇民俗">古镇民俗</option>
					<option value="江河湖泊">江河湖泊</option>
					<option value="宗教圣地">宗教场所</option>
					<option value="购物娱乐">购物娱乐</option>
					<option value="革命圣地">革命圣地</option>
					<option value="历史遗迹">历史遗迹</option>
					<option value="展馆纪念馆">展馆纪念馆</option>
				</select>
				<select id="s2" name="s2" onchange="test1()" style="display:none">
						<option selected="selected">--请选择--</option>
					</select> <select id="s3" name="s3" style="display:none">
						<option selected="selected">--请选择--</option>
					</select> <span id="infohome"> </span>
				</dd>
			<p />
			<div class="f_reg_but">
				<input id="button" name="button" type="submit" value="注册"
					class="r_button" />
			</div>
		</form>
	</div>
	<!--注册结束-->
</body>
</html>
