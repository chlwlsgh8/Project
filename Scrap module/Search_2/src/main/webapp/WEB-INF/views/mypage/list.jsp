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
	
	<button id="scrapList">��ũ�� ����Ʈ</button>	
	<div class="scrapList">
	</div>
	
<!-- 	<button id="likeList">���ƿ��� ���� ����Ʈ</button>
	<div class="likeList">
	</div>
	
	<button id="followList">follow list</button>
	<div class="followList">
	</div>
	
	<button id="followingList">following list</button>
	<div class="followingList">
	</div> -->
	
	<form id="form" method="post">
	</form>
	
	<!-- ��ũ�� ����Ʈ ��ȸ -->
	<script>
			$(document).ready(function (){
				
				// ��ü ��ũ�� ����Ʈ ��ȸ �Լ�
				var getAllList = function(){

					$.getJSON('/scraplist',function(data){
						
						var str = "";
						
						$(data).each(function(i,list){
							str += "<li>"+i+".�̸�:<div class='contentsID' value="+list.contentsID+">"
									+list.contentsTitle+"</div>,"+
									"����:"+list.contentsPhoto+
									"<button class='scrapRemove' value="+list.scrapID+">����</button></li>";
						});
						
						$('.scrapList').html(str);
						
					});
				};
				
				// ��ũ�� ����Ʈ ��ư�� ������� ��ũ�� ����Ʈ ��ȸ
				$('#scrapList').on('click',function(){
					getAllList();
				})
				
				// ��ũ�� ����
				$('.scrapList').on('click','.scrapRemove',function () {
					
					var scrapID = $(this).val();
					
					$.post('/scrapIDremove/'+scrapID,function(data){
						alert(data);
						getAllList();
					});

				});
				
				// ��ũ���� ������ ��ȸ
				$('.scrapList').on('click','.contentsID',function(){
					
					var contentsID = $(this).attr("value");
					$('#form').attr("action","/planDetail/"+contentsID);
					$('#form').attr("method","get");
					$('#form').submit();
					
				});
				
			})
	</script>
	
	<!-- ���ƿ� ��������Ʈ ��ȸ -->
	<script>
	$(document).ready(function (){
		
		//�������� ���� ���̵� ����
		var memberID = $('#memberID').val();
		
		// ��ü ����Ʈ ��ȸ �Լ�
		var getAllList = function(){

			$.getJSON('/userLikeList/'+memberID,function(data){
				
				var str = "";
				
				$(data).each(function(i,list){
					str += "<li>"+i+".�̸�:<div>"+list.planTitle+
							"</div class='planID' value="+list.planID+">"+
							"<button class='likeDelete' value="+list.planID+">����</button></li>";
				});
				
				$('.likeList').html(str);
				
			});
		};
		
		$('#likeList').on('click',function(){
			getAllList();
		})
		
	})
	</script>
	
	<!-- �ȷο� ����Ʈ ��ȸ -->
	<script>
	$(document).ready(function (){
		
		//�������� ���� ���̵� ����
		var memberID = $('#memberID').val();
		
		// ��ü ����Ʈ ��ȸ �Լ�
		var getAllList = function(){

			$.getJSON('/userFollowList/'+memberID,function(data){
				
				var str = "";
				
				$(data).each(function(i,list){
					str += "<li>"+i+".�̸�:<div>"+list.memberName+
							"</div class='memberID' value="+list.memberID+">"+
							"<button class='memberDelete' value="+list.memberID+">����</button></li>";
				});
				
				$('.followList').html(str);
				
			});
		};
		
		$('#followList').on('click',function(){
			getAllList();
		})
		
	})
	</script>
	
	<!-- �ȷ��� ����Ʈ ��ȸ -->
	<script>
	$(document).ready(function (){
		
		//�������� ���� ���̵� ����
		var memberID = $('#memberID').val();
		
		// ��ü ����Ʈ ��ȸ �Լ�
		var getAllList = function(){

			$.getJSON('/userFollowingList/'+memberID,function(data){
				
				var str = "";
				
				$(data).each(function(i,list){
					str += "<li>"+i+".�̸�:<div>"+list.memberName+
							"</div class='memberID' value="+list.memberID+">"+
							"<button class='memberDelete' value="+list.memberID+">����</button></li>";
				});
				
				$('.followingList').html(str);
				
			});
		};
		
		$('#followingList').on('click',function(){
			getAllList();
		})
		
	})
	</script>
	
	
</body>
</html>
