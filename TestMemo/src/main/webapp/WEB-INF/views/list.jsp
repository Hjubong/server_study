<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
<style>
	#list{
		display: grid;
		grid-template-columns: repeat(3, 1fr);
		gap: 10px;
	}
	#list .item{
		border: 1px solid #CCC;
		cursor: pointer;
	}
	#list .item div{
		padding: 5px;
	}
	#list .item div:nth-child(2){
		height: 50px;
	}
	#list .item div:nth-child(odd){
		background-color: #EEE;
	}
</style>
</head>
<body>
	<!-- list.jsp -->

	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>
	
	<div id="list">
		<c:forEach items="${list}" var="dto">
		<div class="item" onclick="location.href='/testmemo/view.do?seq=${dto.seq}';">
			<div>${dto.seq}. ${dto.name}</div>
			<div>${dto.memo}</div>
			<div>${dto.regdate}</div>
		</div>
		</c:forEach>
	</div>
	
	<div>
		<input type="button" value="쓰기" onclick="location.href='/testmemo/add.do';">
	</div>
	
	<hr>
	
	<div id="result"></div>
	<div>
		<input type="button" value="클릭" id="btn1">
	</div>
	
	
	<script>
	
	</script>
</body>
</html>