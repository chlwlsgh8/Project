<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>restaurent page</h1>
	<!-- contents id를 post 방식으로 전송  -->
	<form action="" method="post">
	<input type="hidden" name="Restaurant_ID" value=${contentsVO.ID } />
	<button type="submit">스크랩</button>
	</form>
	
	<span>ContentsID : ${contentsVO.ID }</span><br>
	<span>ContentsTitle : ${contentsVO.title}</span>
	
</body>
</html>
