<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.bean.Diary1"%>
<%@ page import="com.dao.impl.*"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/base.css" rel="stylesheet">
<link href="css/index.css" rel="stylesheet">
<link href="css/login.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/sliders.js"></script>
<!--[if lt IE 9]>
<script src="js/modernizr.js"></script>
<![endif]-->
<!-- 返回顶部调用 begin -->
<script type="text/javascript" src="js/up/jquery.js"></script>
<script type="text/javascript" src="js/up/js.js"></script>
<!-- 返回顶部调用 end-->
<title>Insert title here</title>

<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="js/jquery.XYTipsWindow.min.2.8.js"></script>

<script type="text/javascript" src="js/login.js">
	
</script>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="ckfinder/ckfinder.js"></script>
<script type="text/javascript">
	window.onload = function() {
		var oDiv = document.getElementById('ms-top');
		var aBtn = oDiv.getElementsByTagName('input');
		var aDiv = oDiv.getElementsByTagName('div');
		var i = 0;

		for (i = 0; i < aBtn.length; i++) {
			aBtn[i].index = i;
			aBtn[i].onclick = function() {
				for (i = 0; i < aBtn.length; i++) {
					aBtn[i].className = '';
					aDiv[i].style.display = 'none';
				}
				this.className = 'active';
				aDiv[this.index].style.display = 'block';
			};
		}
	};
</script>

<script type="text/javascript">
	if (top.location != self.location) {
		top.location = "diary.jsp";
	}
</script>

</head>
<body>
	<%
		List<Diary1> diaryLists = new DiaryDaoImpl().getAllDiaryByTime();
	%>
	<c:set var="diaryList" value="<%= diaryLists%>"></c:set>
	<jsp:include page="navi.jsp" />
	<article>
	<div class="l_box f_l">

		<!-- banner代码 结束 -->
		<div class="topnews">
			<h2>
				<b>游记列表</b>
			</h2>
			<c:forEach items="${diaryList}" var="diary">
				<div class="blogs">
					<figure> <a
						href="servlet/ShowDiaryAction?diaryId=${diary.diaryId}"><img
						src="${diary.diaryImage}"> </a></figure>
					<ul>
						<h3>
							<a href="servlet/ShowDiaryAction?diaryId=${diary.diaryId}">${diary.diaryTitle}</a>
						</h3>
						<p>${fn:substring(fn:replace(diary.diaryContent, "<img", "
							图片"), 0, 150)}</p>
						<p class="autor">
							<span class="lm f_l"><a href="#">作者</a>&nbsp;
								${diary.userName} </span><span class="dtime f_l">${diary.diaryTime}</span><span
								class="viewnum f_r">浏览（<a href="/">${diary.readTimes}</a>）
							</span>
							<!--  <span class="pingl f_r">评论（<a href="servlet/ShowDiaryAction">30</a>） </span>-->
						</p>
					</ul>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="r_box f_r">
		<div class="tit01">
			<jsp:include page="login.jsp"></jsp:include>
		</div>
		<!--tit01 end-->
		<div class="ad300x100">
			<img src="images/mxp.jpg">
		</div>
		<div class="moreSelect" id="lp_right_select">
			<div class="ms-top">
				<ul class="hd" id="tab">
					<li class="cur"><a href="/">点击排行</a>
					</li>
					<li><a href="/">最新文章</a>
					</li>
					<li><a href="/">站长推荐</a>
					</li>
				</ul>
			</div>
			<div class="ms-main" id="ms-main">
				<div style="display: block;" class="bd bd-news">
					<ul>
						<li><a href="/" target="_blank">穷游品味古城历史</a>
						</li>
						<li><a href="/" target="_blank">古城西安市 梦回长安城</a>
						</li>
						<li><a href="/" target="_blank">参观世界第八大奇迹</a></li>
						<li><a href="/" target="_blank">一路向西: 西安/青海/甘南</a></li>
						<li><a href="/" target="_blank">你面对的是生活而不是手机</a>
						</li>
						<li><a href="/" target="_blank">四天玩转了西安五千年</a>
						</li>
					</ul>
				</div>
				<div class="bd bd-news">
					<ul>
						<li><a href="/" target="_blank">原来以为，一个人的勇敢是，删掉他的手机号码...</a>
						</li>
						<li><a href="/" target="_blank">手机的16个惊人小秘密，据说99.999%的人都不知</a>
						</li>
						<li><a href="/" target="_blank">住在手机里的朋友</a>
						</li>
						<li><a href="/" target="_blank">教你怎样用欠费手机拨打电话</a>
						</li>
						<li><a href="/" target="_blank">你面对的是生活而不是手机</a>
						</li>
						<li><a href="/" target="_blank">豪雅手机正式发布! 在法国全手工打造的奢侈品</a>
						</li>
					</ul>
				</div>
				<div class="bd bd-news">
					<ul>
						<li><a href="/" target="_blank">手机的16个惊人小秘密，据说99.999%的人都不知</a>
						</li>
						<li><a href="/" target="_blank">你面对的是生活而不是手机</a>
						</li>
						<li><a href="/" target="_blank">住在手机里的朋友</a>
						</li>
						<li><a href="/" target="_blank">豪雅手机正式发布! 在法国全手工打造的奢侈品</a>
						</li>
						<li><a href="/" target="_blank">教你怎样用欠费手机拨打电话</a>
						</li>
						<li><a href="/" target="_blank">原来以为，一个人的勇敢是，删掉他的手机号码...</a>
						</li>
					</ul>
				</div>
			</div>
			<!--ms-main end -->
		</div>
		<!--切换卡 moreSelect end -->

		<jsp:include page="cloud.jsp" />
		<jsp:include page="tuwen.jsp" />
		<div class="ad">
			<img src="images/03.jpg">
		</div>
		<jsp:include page="links.jsp" />
	</div>
	<!--r_box end --> </article>
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>