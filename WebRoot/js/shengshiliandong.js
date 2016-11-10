var request;
    	function test(){
    	
    	 	<%--AJAX�ж������������--%>
    		if(window.XMLHttpRequest){
    			request = new XMLHttpRequest();
    		}else if(window.ActiveXObject){
    			request = new ActiveXObject("Microsoft.XMLHTTP");
    		}
    		<%--���ûص�����--%>
    		request.onreadystatechange = callback;
    		<%--�õ�select��ֵ--%>
    		var s1 = document.getElementById("s1").value;
    		var url = "index2.jsp?p_id=" + s1;
    		<%--ת������ҳ��index2.jspȥ����--%>
    		request.open("get",url,true);
    		request.send(null);	
    	}
    	
    	
    	function callback(){
    		 <%--����ɹ�����--%>
    		if(request.readyState==4){
    			if(200 == request.status){
    				<%--�õ����ص�xml�ļ�--%>
    				var dom = request.responseXML;
    				var provinceEle = dom.getElementsByTagName("city");
    				<%--����innerContent�����Ѹ��ڵ㴫��ȥ--%>
    				innerContent(provinceEle);
    			}
    		}
    	} 	
    	<%--���select2�����ֵ--%>
    	function clearCity(){
    		var s2 = document.getElementById("s2")
    		s2.length = 0;
    	}
    	<%--���select3�����ֵ--%>
    	function clearDistrict(){
    		var s3 = document.getElementById("s3")
    		s3.length = 0;
    	}
    	
    	
    	function innerContent(provinceEle){
    		clearCity();
    		clearDistrict();  	
    		<%--��ѭ���õ�xml�ֽڵ��ֵ--%>
    		for(i = 0; i < provinceEle.length;i++){
    				var c_idEle = provinceEle[i].getElementsByTagName("c_id");
    				var c_id = c_idEle[0].firstChild.data;
    				var c_nameEle =  provinceEle[i].getElementsByTagName("c_name");
         			var c_name = c_nameEle[0].firstChild.data;
         			var s2 = document.getElementById("s2");
         			<%--����ӵ�select2����--%>
         			s2[i] = new Option(c_name,c_id);					
    			}
    			<%--���select2����ֻ��һ��ֵ�Ͳ���onchange��ʱ����ʱ�Զ�
    			����test1����ȥֱ�ӻ�ȡselect3��ֵ--%>
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
    	    <%--ת������ҳ��index3.jspȥ����--%>
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