<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert title here</title>
<script>
	function memo_view(idx) {
		location.href="/spring03/view/" + idx;
	}
</script>	
	</head>
<body>
<h2>hhh</h2>
	<form method="post" action="/spring03/insert.do">
		이름: <input name="writer" size="10">
		메모 : <input name="memo" size="40">
		<input type="submit" value="확인">
	</form>
	
	<table border="1" style="width:500px;">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>메모</th>
			<th>날자</th>
		</tr>
		
		<!-- 
			items : 집합
			var : 개별값
		 -->
		<c:forEach var="row" items="${list }">
		<tr>
			<td>${row.idx }</td>
			<td>${row.writer }</td>
			<td><a href="#" onclick="memo_view('${row.idx}')" > ${row.memo }</a>
			<td><fmt:formatDate value="${row.post_date}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>