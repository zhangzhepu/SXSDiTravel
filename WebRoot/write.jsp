<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>д�μ�</title>
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
	
	function myvalidate(){/*��֤�Ƿ�Ϊ��*/	
		    var mail=document.getElementById("title");
		    var pwd=document.getElementById("doc");
		    var rpwd=document.getElementById("content");
		   	var infomail=document.getElementById("info1");
		   	var infopwd=document.getElementById("inf2");
		   	
			var title = mail.value.trim();
			
			if(title.length==0){
				alert("û�б���");
				return false;
			}
			var contents = rpwd.value.trim();
			
			var pic = pwd.value.trim();
			if(pic.length==0){
				alert("û��ͼƬ��������Ĭ��ͼƬ");
			}
			
			
			
		}
</script>
</head>

<body>
	<c:if test="${ sessionScope.user==null}">
		<div id="center">
			<h3>
				<a href="login1.jsp">���¼</a>
			</h3>
		</div>
	</c:if>
	<c:if test="${sessionScope.user!=null}">
		<div id="center">
			<form id="detailForm" method="post" enctype="multipart/form-data"
				action="servlet/SaveDiaryAction" onsubmit="return myvalidate();">
				����: <input type="text" name="title"
					style="margin:0 0 20 0px;width:60%;" id="title" style="float:right"><span
					id="info"></span> <br />
				<table>
					<tr>
						<td valign="top">ͼƬ��<input type="file" name="file" id="doc"
							style="width:100%;" onchange="javascript:setImagePreview();">
						</td>
						<td><div id="localImag">
								<img id="preview" src="images/moren.png" width="185px"
									height="151px">
							</div>
						</td>
					</tr>
				</table>
				<textarea id="content" name="content"></textarea>
				<span id="info1"></span> <input type="submit" value="����"
					style="margin-top:20px" /> <input type="hidden" name="userId"
					value='<c:out value="${sessionScope.user.userId}"></c:out>'
					style="margin-top:20px" />
				<script type="text/javascript">
					var editor = null;
					window.onload = function() {
						editor = CKEDITOR.replace('content', {
							customConfig : 'ckeditor/config.js',
							on : {
								instanceReady : function(ev) {
									this.dataProcessor.writer.setRules('p', {
										indent : false,
										breakBeforeOpen : false, //<p>֮ǰ���ӻ���
										breakAfterOpen : false, //<p>֮�󲻼ӻ���
										breakBeforeClose : false, //</p>֮ǰ���ӻ���
										breakAfterClose : false
									//</p>֮�󲻼ӻ���7
									});
								}
							}
						});
						CKFinder.setupCKEditor(editor, 'ckfinder/');
					};
				</script>
			</form>
		</div>
	</c:if>

</body>
</html>
