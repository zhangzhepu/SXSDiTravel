<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${ sessionScope.user==null}">
	<h3>请登录</h3>
	<div class="gzwm">
		<ul>
			<li><a class="login" id="login" href="#">登录</a>
			</li>
			<li><a class="reg" id="reg" href="#">注册</a>
			</li>

		</ul>

	</div>
</c:if>
<c:if test="${sessionScope.user!=null}" >
	<h3>欢迎 <c:out value="${ sessionScope.user.userName}"></c:out> 登录</h3>
	<div class="gzwm">
		<ul>
			<li><a class="xlwb" href="http://www.snnu.edu.cn/default.php" target="_blank">陕西师大</a>
			</li>
			<li><a class="txwb" href="#" target="_blank">关注我们</a>
			</li>
			<li><a class="rss" href="write.jsp" target="_blank">写游记</a></li>
			<li><a class="logout" href="logout.jsp">退出</a>
			</li>
		</ul>
	</div>
</c:if>

