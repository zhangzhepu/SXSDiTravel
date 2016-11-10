<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>写游记</title>
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
	
	function myvalidate(){/*验证是否为空*/	
		    var mail=document.getElementById("title");
		    var pwd=document.getElementById("doc");
		    var rpwd=document.getElementById("content");
		   	var infomail=document.getElementById("info1");
		   	var infopwd=document.getElementById("inf2");
		   	
			var title = mail.value.trim();
			
			if(title.length==0){
				alert("没有标题");
				return false;
			}
			var contents = rpwd.value.trim();
			
			var pic = pwd.value.trim();
			if(pic.length==0){
				alert("没有图片，将采用默认图片");
			}
			
			
			
		}
</script>
</head>

<body>
	<c:if test="${ sessionScope.user==null}">
		<div id="center">
			<h3>
				<a href="login1.jsp">请登录</a>
			</h3>
		</div>
	</c:if>
	<c:if test="${sessionScope.user!=null}">
		<div id="center">
			<form id="detailForm" method="post" enctype="multipart/form-data"
				action="servlet/SaveDiaryAction" onsubmit="return myvalidate();">
				标题: <input type="text" name="title"
					style="margin:0 0 20 0px;width:60%;" id="title" style="float:right"><span
					id="info"></span> <br />
				<table>
					<tr>
						<td valign="top">图片：<input type="file" name="file" id="doc"
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
				<span id="info1"></span> <input type="submit" value="保存"
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
										breakBeforeOpen : false, //<p>之前不加换行
										breakAfterOpen : false, //<p>之后不加换行
										breakBeforeClose : false, //</p>之前不加换行
										breakAfterClose : false
									//</p>之后不加换行7
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
