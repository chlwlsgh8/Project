<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/vue"></script>
<script
  src="https://code.jquery.com/jquery-3.2.1.js"
  integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
  crossorigin="anonymous"></script>

</head>
<body>

	<h1>restaurent page</h1>

		<input type="hidden" name="Restaurant_ID" id="id" value= ${contentsVO.ID } />
		<!-- ��ũ�� ��ư -->
		<button id="scrapBttn" value="1" >��ũ��</button>

	<span>ContentsID : ${contentsVO.ID }</span><br>
	<span>ContentsTitle : ${contentsVO.title}</span>
	
	<script>
		$(document).ready(function (){
			
			var scrapbt = $("#scrapBttn");
			// contents id �� ����
			var id = $('#id').val();

			// ��ũ�� ��ư Ŭ����
			scrapbt.on('click',function(){
				
				if(scrapbt.attr('value')==1){

					scrapbt.attr('value',0);
					// ��ũ�� �߰� ajax
					$.ajax({
						type : 'post',
						// '/scrap/'+id ���� 
						url : '/scrap/'+id,
						headers : {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override" : "POST"
						},
						dataType : 'text',
						data : JSON.stringify({
							
						}),
						success : function(result){
							// ������  (String)success ����
							if(result == 'success') {
								alert("success");
							}
						}
					});
					
				}else{
					
					scrapbt.attr('value',1);
					// ��ũ�� ���� ajax
					$.ajax({
						type : 'post',
						// '/scrapremove/'+id ���� 
						url : '/scrapremove/'+id,
						headers : {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override" : "POST"
						},
						dataType : 'text',
						data : JSON.stringify({
							
						}),
						success : function(result){
							// ������  (String)remove ����
							if(result == 'remove') {
								alert('remove');
							}
						}
					});
					
				}

			});

		});
	</script>
	
</body>
</html>
