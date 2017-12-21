<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>user plan list</title>
	<script
	  src="https://code.jquery.com/jquery-3.2.1.js"
	  integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
	  crossorigin="anonymous">
	</script>
</head>
<body>

<h1>user plan</h1>

<input type="hidden" id="planID" value=${plan.planID } />
<input type="hidden" id="userID" value=${user } />
<input type="hidden" id="memberID" value=${plan.memberID } />

<h2>${plan.planTitle }</h2>
<button id="like" value=${likeCheck }>���ƿ�</button>
<button id="follow" value=${followCheck }>���� follow</button>

<script>
$(document).ready(function(){
	
	// ���� �ø� ȸ��
	var memberID = $('#memberID').val();
	// �������� ����
	var user = $('#userID').val();
	// �Խñ� ID
	var planID = $('#planID').val();
	
	// ���� ���ƿ� ���
	$('#follow').on('click',function(){

		var followcheck = $('#follow');
		alert(followcheck.val());
		
		if(followcheck.val() == 1){
			
			alert('follow �߰�');
			followcheck.attr('value',0);
			
			 $.post('/memberFollow/'+memberID+'/'+user,function(result){
				alert(result);
			});
			
		}else{
			
			alert('follow ���')
			followcheck.attr('value',1);
			$.post('/memberFollowDelete/'+memberID+'/'+user,function(result){
				alert(result);
			});

		}

	});
	
	// �Խñ� ���ƿ�
	$('#like').on('click',function(){
	
		var check = $('#like');
		
		// ���ƿ� üũ �� �߰�
		if(check.val() == 1){
			
			alert("���ƿ� �߰�");
			
			check.attr('value',0);
			// ���ƿ� �߰�
			$.ajax({
				type : 'POST',
				url : '/like',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					planID : planID,
					memberID : memberID
				}),
				success : function(result) {
					alert(result);
				}
			});
			
		}else{
			
			alert("���ƿ� ����");
			check.attr('value',1);
			// ���ƿ� ����
			$.post('/likeDelete/'+planID,function(result){
				alert(result);
			})	
		}
	})
	
})
</script>
</body>
</html>