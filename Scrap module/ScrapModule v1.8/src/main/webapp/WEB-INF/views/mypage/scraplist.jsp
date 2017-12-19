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
	
	<!-- ��Ʈ�ѷ����� memberID�� �޾ƿ�  -->
	<input type="hidden" id="memberID" value="${memberID}" />
	<div id="test">
	</div>
	<script>
			$(document).ready(function(){
				var val = $('#memberID').val();
				$('#test').html(val);
			});
	</script>

	<div class="list">
		
	
	</div>
	
	<form id="form" method="post">
	
	</form>
	
	<script>
			$(document).ready(function (){

				var memberID = $('#memberID').val();
				// ��ü ����Ʈ ��ȸ �Լ�
				var getAllList = function(){

					$.getJSON('/scraplist/'+memberID,function(data){
						
						var str = "";
						
						$(data).each(function(i,list){
							str += "<li>"+i+".�̸�:<div class='contentsID' value="+list.contentsID+">"
									+list.contentsTitle+"</div>,"+
									"����:"+list.contentsPhoto+
									"<button class='scrapRemove' value="+list.scrapID+">����</button></li>";
						});
						
						$('.list').html(str);
						
					});
				};
				
				// ������ ���ð�� ��ü����Ʈ ��ȸ
				getAllList();
				
				// ��ũ�� ����
				$('.list').on('click','.scrapRemove',function () {
					
					var scrapID = $(this).val();
					$.post('/scrapIDremove/'+scrapID,function(data){
						alert(data);
						getAllList();
					});

				});
				
				// ��ũ�� ��ȸ
				$('.list').on('click','.contentsID',function(){
					
					var contentsID = $(this).attr("value");
					$('#form').attr("action","/contentsPage/contents/"+contentsID);
					$('#form').attr("method","get");
					$('#form').submit();
					
				});
				
			})
		</script>
	
	
</body>
</html>
