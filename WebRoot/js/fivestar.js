$(function() {

		//初始化静态星星控件
		$("div[showStart]").each(function(i) {
			var startScore = $(this).find(".startScore").text();
			//alert(startScore);
			startScore = Math.round(startScore) * 2;
			var str = '';
			//左半部分
			for ( var i = 0; i < startScore; i++) {
				if (i % 2 == 0) {
					str += '<i class="level_entity_left" cjmark=""></i>';
				} else {
					str += '<i class="level_entity_right" cjmark=""></i>';
				}
			}
			//右半部分
			for ( var j = startScore; j < 10; j++) {
				if (j % 2 == 0) {
					str += '<i class="level_hollow_left" cjmark=""></i>';
				} else {
					str += '<i class="level_hollow_right" cjmark=""></i>';
				}
			}

			$(this).find(".showStartScore").append(str);

		});

	});