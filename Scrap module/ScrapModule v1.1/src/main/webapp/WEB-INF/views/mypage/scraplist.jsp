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
</head>
<body>

	<c:forEach items="${list}" var="scrapVO">
	<tr>
		<td>스크랩 번호 : ${scrapVO.scrapID}</td><br>
		<td><a href=''>스크랩 가기: ${scrapVO.contentsTitle}</a></td>
	</tr><br>

	</c:forEach>
	
	
</body>
</html>
