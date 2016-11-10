<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/base.css" rel="stylesheet">
<link href="css/index.css" rel="stylesheet">




<style type="text/css">
td {
	text-align: center;
}
</style>
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
</head>
<body>
	<jsp:include page="navi.jsp" />
	<article>
	<div class="l_box f_l">

		<form action="servlet/SearchAction" method="post">
			<input type="text" style="height:30px;width:520px" name="wd"
				value="${wd}"> <input type="submit" value="景点搜索"
				style="height:30px;width:120px;margin:0 0 0 20px;font-size:15px">
		</form>
		<!-- banner代码 结束 -->
		<div class="topnews">
			<h2>
				<b>搜索结果</b>
			</h2>
			<c:if test="${searchResult==null}">
				<font size="6px"><b>无搜索结果</b>
				</font>
			</c:if>
			<c:if test="${searchResult!=null}">
				<c:forEach items="${searchResult}" var="place" varStatus="s"
					begin="0" end="6">
					<div class="blogs">
						<figure> <a
							href="servlet/ShowPlaceAction?id=<c:out value="${place.placeId}"/>"><img
							src='<c:out value="${place.placeImage}"/>'>
						</a></figure>

						<ul>
							<h3>
								<a
									href="servlet/ShowPlaceAction?id=<c:out value="${place.placeId}"/>"><c:out
										value="${place.placeName}"></c:out> </a>
							</h3>
							<p>
								<c:out value="${place.placeInfo}" />
							</p>
							<p class="autor">
								<span class="lm f_l"><a href="#">景点介绍</a> </span><span
									class="dtime f_l">2014-02-19</span><span class="viewnum f_r">浏览（<a
									href="#"><c:out value="${place.placeHot}" />
								</a>） </span><span class="pingl f_r">评论（<a href="#">1371</a>） </span>
							</p>
						</ul>

					</div>
				</c:forEach>
			</c:if>
		</div>


		<c:if test="${searchResultRandom!=null}">
			<div class="tuwen">
				<h3>为您推荐</h3>

				<table cellspacing="20%" cellpadding="30">


					<tr>
						<c:forEach items="${searchResultRandom}" var="place" varStatus="s"
							begin="0" end="3">
							<td><a href="servlet/ShowPlaceAction?id=${place.placeId}"><img
									width="150px" height="100px" src="${place.placeImage}"><b>${place.placeName}</b>
							</a></td>
						</c:forEach>
					</tr>

					<tr>
						<c:forEach items="${searchResultRandom}" var="place" varStatus="s"
							begin="4" end="7">
							<td><a href='servlet/ShowPlaceAction?id=${place.placeId}'><img
									width="150px" height="100px" src='${place.placeImage}'><b>${place.placeName}</b>
							</a></td>
						</c:forEach>
					</tr>
				</table>
			</div>
		</c:if>


		<c:if test="${searchResultTop!=null}">
			<div class="tuwen">
				<h3>热门推荐</h3>

				<table cellspacing="20%" cellpadding="30">


					<tr>
						<c:forEach items="${searchResultTop}" var="place" varStatus="s"
							begin="0" end="3">
							<td><a href="servlet/ShowPlaceAction?id=${place.placeId}"><img
									width="150px" height="100px" src="${place.placeImage}"><b>${place.placeName}</b>
							</a></td>
						</c:forEach>
					</tr>

					<tr>
						<c:forEach items="${searchResultTop}" var="place" varStatus="s"
							begin="4" end="7">
							<td><a href='servlet/ShowPlaceAction?id=${place.placeId}'><img
									width="150px" height="100px" src='${place.placeImage}'><b>${place.placeName}</b>
							</a></td>
						</c:forEach>
					</tr>
				</table>
			</div>
		</c:if>
	</div>
	<div class="r_box f_r">
		<div class="tit01">
			<jsp:include page="login.jsp"></jsp:include>
		</div>
		<!--tit01 end-->
		<div class="ad300x100">
			<img src="images/snnu.jpg">
		</div>
		<div class="moreSelect" id="lp_right_select">
			<script>
				window.onload = function() {
					var oLi = document.getElementById("tab")
							.getElementsByTagName("li");
					var oUl = document.getElementById("ms-main")
							.getElementsByTagName("div");

					for ( var i = 0; i < oLi.length; i++) {
						oLi[i].index = i;
						oLi[i].onmouseover = function() {
							for ( var n = 0; n < oLi.length; n++)
								oLi[n].className = "";
							this.className = "cur";
							for ( var n = 0; n < oUl.length; n++)
								oUl[n].style.display = "none";
							oUl[this.index].style.display = "block"
						}
					}
				}
			</script>
			<div class="ms-top">
				<ul class="hd" id="tab">
					<li class="cur"><a href="/">搜索排行</a>
					</li>
					<li><a href="/">离您最近</a>
					</li>
					<li><a href="/">相关游记</a>
					</li>
				</ul>
			</div>
			<div class="ms-main" id="ms-main">
				<div style="display: block;" class="bd bd-news">
					<ul>
						<li><a href="/" target="_blank">秦始皇兵马俑</a>
						</li>
						<li><a href="/" target="_blank">大雁塔</a>
						</li>
						<li><a href="/" target="_blank">华山</a>
						</li>
						<li><a href="/" target="_blank">钟楼</a>
						</li>
						<li><a href="/" target="_blank">回民街</a>
						</li>
						<li><a href="/" target="_blank">西安城墙</a>
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
	<footer>
	<p class="ft-copyright">爱驴网 Design by SNNU</p>
	<div id="tbox">
		<a id="togbook" href="/"></a> <a id="gotop" href="javascript:void(0)"></a>
	</div>
	</footer>
</body>
</html>