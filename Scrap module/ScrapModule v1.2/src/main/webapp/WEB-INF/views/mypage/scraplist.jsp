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
	
	<input type="hidden" name="scrapID" value="${scrapVO.scrapID}" />
	
	<!-- model�� �޾ƿ� ����Ʈ ��ü�� ȭ�鿡 forEach ������ �ѷ��ֱ� -->
	<c:forEach items="${list}" var="scrapVO">
	<tr>
		<!-- ������ ��ũ�� -->
		<td>��ũ�� ��ȣ : ${scrapVO.scrapID}</td><br>
		<td><a href=''>��ũ�� ����: ${scrapVO.contentsTitle}</a></td>
		<!-- ���� ��ư ���� -->
		<form action='' method="post">
		<input type="hidden" name="scrapID" value="${scrapVO.scrapID}" />
		<button type="submit">����</button>
		</form>
	</tr><br>
	</c:forEach>
	
	
</body>
</html>
