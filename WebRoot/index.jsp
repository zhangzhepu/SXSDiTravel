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

<script type="text/javascript">
	if (top.location != self.location) {
		top.location = "index.jsp";
	}
</script>



</form>
</head>
<body>

	<jsp:include page="navi.jsp" />
	<article>
	<div class="l_box f_l">
		<div class="banner">
			<div id="slide-holder">
				<div id="slide-runner">
					<a href="/" target="_blank"><img id="slide-img-1"
						src="images/a1.jpg" alt="" /> </a> <a href="/" target="_blank"><img
						id="slide-img-2" src="images/a2.jpg" alt="" /> </a> <a href="/"
						target="_blank"><img id="slide-img-3" src="images/a3.jpg"
						alt="" /> </a> <a href="/" target="_blank"><img id="slide-img-4"
						src="images/a4.jpg" alt="" /> </a>
					<div id="slide-controls">
						<p id="slide-client" class="text">
							<strong></strong><span></span>
						</p>
						<p id="slide-desc" class="text"></p>
						<p id="slide-nav"></p>
					</div>
				</div>
			</div>
			<script>
				if (!window.slider) {
					var slider = {};
				}

				slider.data = [ {
					"id" : "slide-img-1", // 与slide-runner中的img标签id对应
					"client" : "标题1",
					"desc" : "这里修改描述" //这里修改描述
				}, {
					"id" : "slide-img-2",
					"client" : "标题2",
					"desc" : "add your description here"
				}, {
					"id" : "slide-img-3",
					"client" : "标题3",
					"desc" : "add your description here"
				}, {
					"id" : "slide-img-4",
					"client" : "标题4",
					"desc" : "add your description here"
				} ];
			</script>
		</div>
		<!-- banner代码 结束 -->
		<div class="topnews">
			<div class="l_box f_l">

				<!-- banner代码 结束 -->
				<jsp:include page="top-spot.jsp" />
			</div>
		</div>
	</div>
	<div class="r_box f_r">
		<div class="tit01">
			<jsp:include page="login.jsp"></jsp:include>
		</div>
		<!--tit01 end-->
		<jsp:include page="qiehuanka.jsp" />
		
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