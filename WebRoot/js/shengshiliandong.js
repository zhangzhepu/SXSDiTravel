var request;
    	function test(){
    	
    	 	<%--AJAX判断浏览器的类型--%>
    		if(window.XMLHttpRequest){
    			request = new XMLHttpRequest();
    		}else if(window.ActiveXObject){
    			request = new ActiveXObject("Microsoft.XMLHTTP");
    		}
    		<%--设置回调函数--%>
    		request.onreadystatechange = callback;
    		<%--得到select的值--%>
    		var s1 = document.getElementById("s1").value;
    		var url = "index2.jsp?p_id=" + s1;
    		<%--转到其他页面index2.jsp去处理--%>
    		request.open("get",url,true);
    		request.send(null);	
    	}
    	
    	
    	function callback(){
    		 <%--如果成功返回--%>
    		if(request.readyState==4){
    			if(200 == request.status){
    				<%--得到返回的xml文件--%>
    				var dom = request.responseXML;
    				var provinceEle = dom.getElementsByTagName("city");
    				<%--调用innerContent函数把根节点传进去--%>
    				innerContent(provinceEle);
    			}
    		}
    	} 	
    	<%--清空select2里面的值--%>
    	function clearCity(){
    		var s2 = document.getElementById("s2")
    		s2.length = 0;
    	}
    	<%--清空select3里面的值--%>
    	function clearDistrict(){
    		var s3 = document.getElementById("s3")
    		s3.length = 0;
    	}
    	
    	
    	function innerContent(provinceEle){
    		clearCity();
    		clearDistrict();  	
    		<%--用循环得到xml字节点的值--%>
    		for(i = 0; i < provinceEle.length;i++){
    				var c_idEle = provinceEle[i].getElementsByTagName("c_id");
    				var c_id = c_idEle[0].firstChild.data;
    				var c_nameEle =  provinceEle[i].getElementsByTagName("c_name");
         			var c_name = c_nameEle[0].firstChild.data;
         			var s2 = document.getElementById("s2");
         			<%--并添加到select2里面--%>
         			s2[i] = new Option(c_name,c_id);					
    			}
    			<%--如果select2里面只有一个值就不能onchange的时候这时自动
    			调用test1方法去直接获取select3的值--%>
    			test1();			
    	}
    	
    	function test1(){
    		if(window.XMLHttpRequest){
    			request = new XMLHttpRequest();
    		}else if(window.ActiveXObject){
    			request = new ActiveXObject("Microsoft.XMLHTTP");
    		}
    		request.onreadystatechange = callback1;
    		var s2 = document.getElementById("s2").value;
    		var url1 = "index3.jsp?c_id=" + s2;
    	    <%--转到其他页面index3.jsp去处理--%>
    		request.open("get",url1,true);
    		request.send(null);	
    	}
    	
    	function callback1(){
    		if(request.readyState==4){
    			if(200 == request.status){
    				var dom1 = request.responseXML;
    				var citeEle = dom1.getElementsByTagName("district");
    				innerContent1(citeEle);
    			}
    		}
    	} 
    	
    	
    	
    	function innerContent1(citeEle){
    		clearDistrict();		
    			for(i = 0; i < citeEle.length;i++){
    				var d_idEle = citeEle[i].getElementsByTagName("d_id");
    				var d_id = d_idEle[0].firstChild.data;
    				var d_nameEle =  citeEle[i].getElementsByTagName("d_name");
         			var d_name = d_nameEle[0].firstChild.data;
         			var s3 = document.getElementById("s3");
         			s3[i] = new Option(d_name,d_id);        		
    			} 		
    	}