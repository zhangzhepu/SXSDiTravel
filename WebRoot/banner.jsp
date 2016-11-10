<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="banner">
	<div id="slide-holder">
		<div id="slide-runner">
			<a href="/" target="_blank"><img id="slide-img-1"
				src="images/fuck1.jpg" alt="" /> </a> <a href="/" target="_blank"><img
				id="slide-img-2" src="images/fuck2.jpeg" alt="" /> </a> <a href="/"
				target="_blank"><img id="slide-img-3" src="images/fuck3.jpeg"
				alt="" /> </a> <a href="/" target="_blank"><img id="slide-img-4"
				src="images/fuck4.jpeg" alt="" /> </a>
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
			"client" : "兵马俑",
			"desc" : "世界第八大奇迹兵马俑" //这里修改描述
		}, {
			"id" : "slide-img-2",
			"client" : "华山",
			"desc" : "奇险！天下第一山"
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