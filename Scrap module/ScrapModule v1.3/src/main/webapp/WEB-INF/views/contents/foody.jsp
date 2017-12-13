<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/vue"></script>
<script  src="http://code.jquery.com/jquery-3.1.1.js"></script>
</head>
<body>

	<h1>restaurent page</h1>

		<input type="hidden" name="Restaurant_ID" id="id" value= ${contentsVO.ID } />
		<form action="" method="post">
			<button type="submit" id="scrap" >½ºÅ©·¦</button>
		</form>
		
		<button id="scrapBttn">½ºÅ©·¦ Å×½ºÆ®</button>

	<span>ContentsID : ${contentsVO.ID }</span><br>
	<span>ContentsTitle : ${contentsVO.title}</span>
	
	<script>
		$("#scrapBttn").on("click",function(){
			var id = $("#id").val();
			$.ajax({
				type : 'post',
				url : '/test/scrap/'+id,
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					
				}),
				success : function(result){
					if(result == 'SUCCESS') {
						alert('½ºÅ©·¦¿Ï·á');
					}
				}
			});
		});
	</script>

</body>
</html>
