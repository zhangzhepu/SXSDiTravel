<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:directive.page import="java.sql.Connection" />
<jsp:directive.page import="java.sql.DriverManager" />
<jsp:directive.page import="java.sql.PreparedStatement" />
<jsp:directive.page import="java.sql.ResultSet" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>添加景点</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<style>
#center {
	MARGIN-TOP: 50px;
	MARGIN-RIGHT: auto;
	MARGIN-LEFT: auto;
	width: 60%;
}
</style>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
*{margin:0;padding:0;list-style-type:none;}
a,img{border:0;}
p{margin:20px 0 10px 0;}
</style>

<script src="js/jquery-1.5.1.js" type="text/javascript"></script>
<script src="js/jquery.raty.js" type="text/javascript"></script>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="ckfinder/ckfinder.js"></script>
<script type="text/javascript">
	//下面用于图片上传预览功能
	function setImagePreview(avalue) {
		var docObj = document.getElementById("doc");
		var fileName = docObj.value;
		var s = fileName.toLowerCase();
		if (s == "") {
			alert("请上传图片");
			return false;
		} else {
			if (!/\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(s)) {
				alert("图片类型必须是.gif,jpeg,jpg,png中的一种")
				return false;
			}
		}

		var imgObjPreview = document.getElementById("preview");
		if (docObj.files && docObj.files[0]) {
			//火狐下，直接设img属性
			imgObjPreview.style.display = 'block';
			imgObjPreview.style.width = '150px';
			imgObjPreview.style.height = '150px';
			//imgObjPreview.src = docObj.files[0].getAsDataURL();

			//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
			imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
		} else {
			//IE下，使用滤镜
			docObj.select();
			var imgSrc = document.selection.createRange().text;
			var localImagId = document.getElementById("localImag");
			//必须设置初始大小
			localImagId.style.width = "185px";
			localImagId.style.height = "151px";
			//图片异常的捕捉，防止用户修改后缀来伪造图片
			try {
				localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
				localImagId.filters
						.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
			} catch (e) {
				alert("您上传的图片格式不正确，请重新选择!");
				return false;
			}
			imgObjPreview.style.display = 'none';
			document.selection.empty();
		}
		return true;
	}
	
	
</script>

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
</head>

<body>
		<div id="center">
			<form id="detailForm" method="post" enctype="multipart/form-data"
				action="servlet/AddPlaceAction">
				景点名称: <input type="text" name="name"
					style="margin:0 0 20 0px;width:60%;" id="title" style="float:right"><span
					id="info"></span> <br />
				<table>
					<tr>
						<td valign="top">景点图片：<input type="file" name="image" id="doc"
							style="width:100%;" onchange="javascript:setImagePreview();">
						</td>
						<td><div id="localImag">
								<img id="preview" src="images/moren.png" width="185px"
									height="151px">
							</div>
						</td>
					</tr>
				</table>
				景点类型: <select name="type" style="margin:0 0 20 0px;width:20%;">
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
				</select> <br /> <span class="title">所在位置：</span> <select id="s1" name="s1"
					onchange="test()" style="margin:0 0 20 0px;">
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
				</select> <select id="s3" name="s3">
					<option selected="selected">--请选择--</option>
				</select> <br /> 坐标（经纬度）：<input type="text" name="x"> <input
					type="text" name="y"> <br /> 
					<br/>
				景点描述：<textarea name="info" rows="10" cols="100"></textarea><br/><br/>
				
				平均评分：<input type="text" name="rate"/><br/><br/>
				平均价格：<input type="text" name="cost"/><br/><br/>
				流行度：<input type="text" name="hot"/><br/><br/>
				<input type="submit" value="提交">
				

			</form>
		</div>

</body>
</html>
