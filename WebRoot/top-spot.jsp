
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.service.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script src="js/fivestar.js" type="text/javascript"></script>

<div class="topnews">
	<h2>
		<b>热门</b>景点
	</h2>
	<%
		request.setAttribute("searchResultHot",
				new PlacesService().getHotPlaces());
	%>
	<c:if test="${searchResultHot!=null}">

		<c:forEach items="${searchResultHot}" var="place" varStatus="s"
			begin="0" end="7">

			<div class="blogs">
				<figure> <img src="${place.placeImage }"></figure>
				<ul>
					<h3>




						<table cellspacing="5%" cellpadding="30">
							<tr>
								<td><a href="servlet/ShowPlaceAction?id=${place.placeId}">${place.placeName
										} 
								</td>
								<td>
									<div class="revinp" showStart="">
										<span class="showStartScore"></span> <span class="startScore">${place.placeRate
											}</span>分
									</div>
								</td>

							</tr>
						</table>
						</a>

					</h3>
					<p>${place.placeInfo }</p>
					<p class="autor">
						<span class="lm f_l"><a href="/">景点介绍</a> </span><span
							class="viewnum f_r">点击量（${place.placeHot }） </span>
					</p>
				</ul>
			</div>
		</c:forEach>
	</c:if>

</div>