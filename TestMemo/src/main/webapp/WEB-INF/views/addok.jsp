<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
<style>
</style>
</head>
<body>
	<!-- addok.jsp -->

	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>


	<script>
		<c:if test="${result ==1}">
		location.href = '/memo/list.do';
		</c:if>

		<c:if test="${result ==0}">
		alert('실패');
		//location.href = '/memo/add.do'; > 페이지 새로 요청
		history.back(); //페이지 새로요청(X) > 이전 상태로 되돌리기
		</c:if>
	</script>
</body>
</html>