<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.Blob"%>
<%@ page import="com.bean.*"%>
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
	if (top.location != self.location) {
		top.location = "diary.jsp";
	}
</script>

</head>
<body>

	<jsp:include page="navi.jsp" />
	<article>
	<div class="l_box f_l">
		<!-- banner代码 结束 -->
		<div class="topnews">


			<div>

				<ul>
					<font size="5"><a href="#">${p.placeName}</a>
					</font>
					<br />
					<br />
					<p>${p.placeInfo}</p>
					</br>
					<figure> <img src="${p.placeImage }" width="520"
						height="340"></figure>
					<p class="autor">
						<span class="lm f_l"><a href="/">个人游记</a> 作者 </span><span
							class="dtime f_l">11</span><span class="viewnum f_r">浏览（<a
							href="#">11</a>） </span>
						<!--  <span class="pingl f_r">评论（<a href="/">30</a>） </span>-->
					</p>
				</ul>
			</div>

			<c:if test="${searchResultRandom!=null}">
				<div class="tuwen">
					<h3>为您推荐</h3>

					<table cellspacing="20%" cellpadding="30">


						<tr>
							<c:forEach items="${searchResultRandom}" var="place"
								varStatus="s" begin="0" end="3">
								<td><a href="servlet/ShowPlaceAction?id=${place.placeId}"><img
										width="150px" height="100px" src="${place.placeImage}"><b>${place.placeName}</b>
								</a></td>
							</c:forEach>
						</tr>

						<tr>
							<c:forEach items="${searchResultRandom}" var="place"
								varStatus="s" begin="4" end="7">
								<td><a href='servlet/ShowPlaceAction?id=${place.placeId}'><img
										width="150px" height="100px" src='${place.placeImage}'><b>${place.placeName}</b>
								</a></td>
							</c:forEach>
						</tr>
					</table>
				</div>
			</c:if>

		</div>
	</div>
	<div class="r_box f_r">
		<div class="tit01">
			<jsp:include page="login.jsp"></jsp:include>
		</div>
		<!--tit01 end-->
		<div class="ad300x100">
			<img src="images/ad300x100.jpg">
		</div>
		<div class="moreSelect" id="lp_right_select">
			<div class="ms-top">
				<ul class="hd" id="tab">
					<li class="cur"><a href="/">点击排行</a></li>
					<li><a href="/">最新文章</a></li>
					<li><a href="/">站长推荐</a></li>
				</ul>
			</div>
			<div class="ms-main" id="ms-main">
				<div style="display: block;" class="bd bd-news">
					<ul>
						<li><a href="/" target="_blank">住在手机里的朋友</a></li>
						<li><a href="/" target="_blank">教你怎样用欠费手机拨打电话</a></li>
						<li><a href="/" target="_blank">原来以为，一个人的勇敢是，删掉他的手机号码...</a>
						</li>
						<li><a href="/" target="_blank">手机的16个惊人小秘密，据说99.999%的人都不知</a>
						</li>
						<li><a href="/" target="_blank">你面对的是生活而不是手机</a></li>
						<li><a href="/" target="_blank">豪雅手机正式发布! 在法国全手工打造的奢侈品</a></li>
					</ul>
				</div>
				<div class="bd bd-news">
					<ul>
						<li><a href="/" target="_blank">原来以为，一个人的勇敢是，删掉他的手机号码...</a>
						</li>
						<li><a href="/" target="_blank">手机的16个惊人小秘密，据说99.999%的人都不知</a>
						</li>
						<li><a href="/" target="_blank">住在手机里的朋友</a></li>
						<li><a href="/" target="_blank">教你怎样用欠费手机拨打电话</a></li>
						<li><a href="/" target="_blank">你面对的是生活而不是手机</a></li>
						<li><a href="/" target="_blank">豪雅手机正式发布! 在法国全手工打造的奢侈品</a></li>
					</ul>
				</div>
				<div class="bd bd-news">
					<ul>
						<li><a href="/" target="_blank">手机的16个惊人小秘密，据说99.999%的人都不知</a>
						</li>
						<li><a href="/" target="_blank">你面对的是生活而不是手机</a></li>
						<li><a href="/" target="_blank">住在手机里的朋友</a></li>
						<li><a href="/" target="_blank">豪雅手机正式发布! 在法国全手工打造的奢侈品</a></li>
						<li><a href="/" target="_blank">教你怎样用欠费手机拨打电话</a></li>
						<li><a href="/" target="_blank">原来以为，一个人的勇敢是，删掉他的手机号码...</a>
						</li>
					</ul>
				</div>
			</div>
			<!--ms-main end -->
		</div>
		<!--切换卡 moreSelect end -->

		<div class="cloud">
			<h3>标签云</h3>
			<ul>
				<li><a href="/">个人博客</a></li>
				<li><a href="/">web开发</a></li>
				<li><a href="/">前端设计</a></li>
				<li><a href="/">Html</a></li>
				<li><a href="/">CSS3</a></li>
				<li><a href="/">Html5+css3</a></li>
				<li><a href="/">百度</a></li>
				<li><a href="/">Javasript</a></li>
				<li><a href="/">web开发</a></li>
				<li><a href="/">前端设计</a></li>
				<li><a href="/">Html</a></li>
				<li><a href="/">CSS3</a></li>
				<li><a href="/">Html5+css3</a></li>
				<li><a href="/">百度</a></li>
			</ul>
		</div>
		<div class="tuwen">
			<h3>图文推荐</h3>
			<ul>
				<li><a href="/"><img src="images/01.jpg"><b>住在手机里的朋友</b>
				</a>
					<p>
						<span class="tulanmu"><a href="/">手机配件</a> </span><span
							class="tutime">2015-02-15</span>
					</p></li>
				<li><a href="/"><img src="images/02.jpg"><b>教你怎样用欠费手机拨打电话</b>
				</a>
					<p>
						<span class="tulanmu"><a href="/">手机配件</a> </span><span
							class="tutime">2015-02-15</span>
					</p></li>
				<li><a href="/" title="手机的16个惊人小秘密，据说99.999%的人都不知"><img
						src="images/03.jpg"><b>手机的16个惊人小秘密，据说...</b> </a>
					<p>
						<span class="tulanmu"><a href="/">手机配件</a> </span><span
							class="tutime">2015-02-15</span>
					</p></li>
				<li><a href="/"><img src="images/06.jpg"><b>住在手机里的朋友</b>
				</a>
					<p>
						<span class="tulanmu"><a href="/">手机配件</a> </span><span
							class="tutime">2015-02-15</span>
					</p></li>
				<li><a href="/"><img src="images/04.jpg"><b>教你怎样用欠费手机拨打电话</b>
				</a>
					<p>
						<span class="tulanmu"><a href="/">手机配件</a> </span><span
							class="tutime">2015-02-15</span>
					</p></li>
			</ul>
		</div>
		<div class="ad">
			<img src="images/03.jpg">
		</div>
		<div class="links">
			<h3>
				<span>[<a href="/">申请友情链接</a>] </span>友情链接
			</h3>
			<ul>
				<li><a href="/">杨青个人博客</a></li>
				<li><a href="/">web开发</a></li>
				<li><a href="/">前端设计</a></li>
				<li><a href="/">Html</a></li>
				<li><a href="/">CSS3</a></li>
				<li><a href="/">Html5+css3</a></li>
				<li><a href="/">百度</a></li>
			</ul>
		</div>
	</div>
	<!--r_box end --> </article>
	<footer>
	<p class="ft-copyright">兔小白博客 Design by DanceSmile 蜀ICP备11002373号-1</p>
	<div id="tbox">
		<a id="togbook" href="/"></a> <a id="gotop" href="javascript:void(0)"></a>
	</div>
	</footer>
</body>
</html>