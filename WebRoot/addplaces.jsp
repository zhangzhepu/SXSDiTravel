<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:directive.page import="java.sql.Connection" />
<jsp:directive.page import="java.sql.DriverManager" />
<jsp:directive.page import="java.sql.PreparedStatement" />
<jsp:directive.page import="java.sql.ResultSet" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>��Ӿ���</title>
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
	//��������ͼƬ�ϴ�Ԥ������
	function setImagePreview(avalue) {
		var docObj = document.getElementById("doc");
		var fileName = docObj.value;
		var s = fileName.toLowerCase();
		if (s == "") {
			alert("���ϴ�ͼƬ");
			return false;
		} else {
			if (!/\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(s)) {
				alert("ͼƬ���ͱ�����.gif,jpeg,jpg,png�е�һ��")
				return false;
			}
		}

		var imgObjPreview = document.getElementById("preview");
		if (docObj.files && docObj.files[0]) {
			//����£�ֱ����img����
			imgObjPreview.style.display = 'block';
			imgObjPreview.style.width = '150px';
			imgObjPreview.style.height = '150px';
			//imgObjPreview.src = docObj.files[0].getAsDataURL();

			//���7���ϰ汾�����������getAsDataURL()��ʽ��ȡ����Ҫһ�·�ʽ
			imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
		} else {
			//IE�£�ʹ���˾�
			docObj.select();
			var imgSrc = document.selection.createRange().text;
			var localImagId = document.getElementById("localImag");
			//�������ó�ʼ��С
			localImagId.style.width = "185px";
			localImagId.style.height = "151px";
			//ͼƬ�쳣�Ĳ�׽����ֹ�û��޸ĺ�׺��α��ͼƬ
			try {
				localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
				localImagId.filters
						.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
			} catch (e) {
				alert("���ϴ���ͼƬ��ʽ����ȷ��������ѡ��!");
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

 	<%--AJAX�ж������������--%>
	if(window.XMLHttpRequest){
		request = new XMLHttpRequest();
	}else if(window.ActiveXObject){
		request = new ActiveXObject("Microsoft.XMLHTTP");
	}
	<%--���ûص�����--%>
	request.onreadystatechange = callback;
	<%--�õ�select��ֵ--%>
	var s1 = document.getElementById("s1").value;
	var url = "index2.jsp?p_id=" + s1;
	<%--ת������ҳ��index2.jspȥ����--%>
	request.open("get",url,true);
	request.send(null);	
}


function callback(){
	 <%--����ɹ�����--%>
	if(request.readyState==4){
		if(200 == request.status){
			<%--�õ����ص�xml�ļ�--%>
			var dom = request.responseXML;
			var provinceEle = dom.getElementsByTagName("city");
			<%--����innerContent�����Ѹ��ڵ㴫��ȥ--%>
			innerContent(provinceEle);
		}
	}
} 	
<%--���select2�����ֵ--%>
function clearCity(){
	var s2 = document.getElementById("s2")
	s2.length = 0;
}
<%--���select3�����ֵ--%>
function clearDistrict(){
	var s3 = document.getElementById("s3")
	s3.length = 0;
}


function innerContent(provinceEle){
	clearCity();
	clearDistrict();  	
	<%--��ѭ���õ�xml�ֽڵ��ֵ--%>
	for(i = 0; i < provinceEle.length;i++){
			var c_idEle = provinceEle[i].getElementsByTagName("c_id");
			var c_id = c_idEle[0].firstChild.data;
			var c_nameEle =  provinceEle[i].getElementsByTagName("c_name");
 			var c_name = c_nameEle[0].firstChild.data;
 			var s2 = document.getElementById("s2");
 			<%--����ӵ�select2����--%>
 			s2[i] = new Option(c_name,c_id);					
		}
		<%--���select2����ֻ��һ��ֵ�Ͳ���onchange��ʱ����ʱ�Զ�
		����test1����ȥֱ�ӻ�ȡselect3��ֵ--%>
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
    <%--ת������ҳ��index3.jspȥ����--%>
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
				��������: <input type="text" name="name"
					style="margin:0 0 20 0px;width:60%;" id="title" style="float:right"><span
					id="info"></span> <br />
				<table>
					<tr>
						<td valign="top">����ͼƬ��<input type="file" name="image" id="doc"
							style="width:100%;" onchange="javascript:setImagePreview();">
						</td>
						<td><div id="localImag">
								<img id="preview" src="images/moren.png" width="185px"
									height="151px">
							</div>
						</td>
					</tr>
				</table>
				��������: <select name="type" style="margin:0 0 20 0px;width:20%;">
					<option selected="selected" lang="10">--��ѡ��--</option>
					<option value="��ʤɽˮ">��ʤɽˮ</option>
					<option value="��԰����԰">��԰����԰</option>
					<option value="��������">��������</option>
					<option value="��������">��������</option>
					<option value="���Ӻ���">���Ӻ���</option>
					<option value="�ڽ�ʥ��">�ڽ̳���</option>
					<option value="��������">��������</option>
					<option value="����ʥ��">����ʥ��</option>
					<option value="��ʷ�ż�">��ʷ�ż�</option>
					<option value="չ�ݼ����">չ�ݼ����</option>
				</select> <br /> <span class="title">����λ�ã�</span> <select id="s1" name="s1"
					onchange="test()" style="margin:0 0 20 0px;">
					<%
						//�������ݿ�
							Class.forName("com.mysql.jdbc.Driver");
							Connection con = DriverManager.getConnection(
									"jdbc:mysql://localhost/lovo", "root", "root");
							String sql = "select * from province";
							PreparedStatement pstmt = con.prepareStatement(sql);
							ResultSet rs = pstmt.executeQuery();
							//�õ����ݿ������province������ֵ
							while (rs.next()) {
								int p_id = rs.getInt(1);
								String p_name = rs.getString(2);
					%>
					<option value="<%=p_id%>"><%=p_name%></option>
					<%
						}
					%>
					<option selected="selected">--��ѡ��--</option>
				</select> <select id="s2" name="s2" onchange="test1()">
					<option selected="selected">--��ѡ��--</option>
				</select> <select id="s3" name="s3">
					<option selected="selected">--��ѡ��--</option>
				</select> <br /> ���꣨��γ�ȣ���<input type="text" name="x"> <input
					type="text" name="y"> <br /> 
					<br/>
				����������<textarea name="info" rows="10" cols="100"></textarea><br/><br/>
				
				ƽ�����֣�<input type="text" name="rate"/><br/><br/>
				ƽ���۸�<input type="text" name="cost"/><br/><br/>
				���жȣ�<input type="text" name="hot"/><br/><br/>
				<input type="submit" value="�ύ">
				

			</form>
		</div>

</body>
</html>
