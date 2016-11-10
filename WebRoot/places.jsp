<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/base.css" rel="stylesheet">
<link href="css/index.css" rel="stylesheet">
<link href="css/login.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/sliders.js"></script>

<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<link href="css/starSelect.css" rel="stylesheet">

<!--[if lt IE 9]>
<script src="js/modernizr.js"></script>
<![endif]-->
<!-- 返回顶部调用 begin -->
<script type="text/javascript" src="js/up/jquery.js"></script>
<script type="text/javascript" src="js/up/js.js"></script>
<!-- 返回顶部调用 end-->
<title>景点</title>

<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="js/jquery.XYTipsWindow.min.2.8.js"></script>
<style type="text/css">
.test ul {
	list-style: none;
}
</style>
<script type="text/javascript" src="js/login.js">
	
</script>

<script type="text/javascript">
	if (top.location != self.location) {
		top.location = "places.jsp;
	}
</script>
</head>
<body>
	<jsp:include page="navi.jsp" />
	<article>
	<div class="l_box f_l">

		<!-- banner代码 结束 -->
		<jsp:include page="top-spot.jsp" />
	</div>
	<div class="r_box f_r">
		<div class="tit01">
			<jsp:include page="login.jsp"></jsp:include>
		</div>
		<!--tit01 end-->
		<div class="ad300x100">
			<img src="images/ad.jpg">
		</div>
		<div class="moreSelect" id="lp_right_select">
			<div class="ms-top">
				<ul class="hd" id="tab">
					<li><a href="#">点击排行</a></li>
					<li class="cur"><a href="#">最新游记</a></li>
					<li><a href="#">站长推荐</a></li>
				</ul>
			</div>
			<div class="ms-main" id="ms-main">
				<div style="display: block;" class="bd bd-news">
					<ul>
						<li><a href="#" target="_blank">一朝一夕带你看尽长安城 </a></li>
						<li><a href="#" target="_blank">长相思，在长安，漫游西安五日。</a></li>
						<li><a href="#" target="_blank">一个人游长安，行在在美食与历史之间...</a></li>
						<li><a href="#" target="_blank">炎炎夏日晋陕川十日游</a></li>
						<li><a href="#" target="_blank">重回延安革命圣地，感受黄土高原风情</a></li>
						<li><a href="#" target="_blank">舌尖上的西安</a></li>
					</ul>
				</div>
				<div class="bd bd-news">
					<ul>
						<li><a href="#" target="_blank">12323423412341234</a>
						</li>
						<li><a href="#" target="_blank">手机的16个惊人小秘密，据说99.999%的人都不知</a>
						</li>
						<li><a href="#" target="_blank">住在手机里的朋友</a></li>
						<li><a href="#" target="_blank">教你怎样用欠费手机拨打电话</a></li>
						<li><a href="#" target="_blank">你面对的是生活而不是手机</a></li>
						<li><a href="#" target="_blank">豪雅手机正式发布! 在法国全手工打造的奢侈品</a></li>
					</ul>
				</div>
				<div class="bd bd-news">
					<ul>
						<li><a href="#" target="_blank">fffffffffffffffff</a>
						</li>
						<li><a href="#" target="_blank">你面对的是生活而不是手机</a></li>
						<li><a href="#" target="_blank">住在手机里的朋友</a></li>
						<li><a href="#" target="_blank">豪雅手机正式发布! 在法国全手工打造的奢侈品</a></li>
						<li><a href="#" target="_blank">教你怎样用欠费手机拨打电话</a></li>
						<li><a href="#" target="_blank">原来以为，一个人的勇敢是，删掉他的手机号码...</a>
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
	<!-- 脚注 -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>