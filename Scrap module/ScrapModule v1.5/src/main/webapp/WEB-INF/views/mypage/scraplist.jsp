<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.2.1.js"
  integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
  crossorigin="anonymous"></script>
</head>
<body>
	
	<input type="hidden" id="memberID" value="${id}" />

	<div id="list">
	
	</div>
	
	<script>
			$(document).ready(function (){
				/* 
				<input type="hidden" id="scrapID" value="${scrapVO.scrapID}" />
					<button id="scrapRemove">삭제</button> */
				
				var memberID = $('#memberID').val();

				var getAllList = function(){
					
					$.getJSON('/scraplist/'+memberID,function(data){
						
						var str = "";
						$(data).each(function(i,list){
							str += "<li>"+i+".이름:<a href=''>"+list.contentsTitle+"</a>,내용:"
									+list.contentsPhoto+
									"<input type='hidden' id='scrapID' value="+list.scrapID+" />"+
									"<button id="+'scrapRemove'+list.scrapID+">삭제</button></li>";
									
						});
						
						$('#list').html(str);
						
					});
				};
				
				getAllList();

				// 삭제 기능 안먹힘
				$("#scrapRemove").on('click',function(){
						
					
					alert("click");
					
					var scrapID = $('#scrapID').val();
					
					$.post('/scrapIDremove/'+scrapID,function(data){
						alert(data);
						getAllList();
					});
				});
				/* $('#scrapRemove').on('click',function(){
					
					$.ajax({
						type : 'post',
						// '/scrapIDremove/'+scrapID 맵핑 
						url : '/scrapIDremove/'+scrapID,
						headers : {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override" : "POST"
						},
						dataType : 'text',
						data : JSON.stringify({
							
						}),
						success : function(result){
							// 성공시  (String)success 전송
							if(result == 'scrapIDRemove') {
								alert("scrapIDRemove");
							}
						}
					});
					
				});	 */
				
				
			})
		</script>
	
	
</body>
</html>
