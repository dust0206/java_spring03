<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function() {
		$("#btnUpdate").click(function() {
			document.form1.action="/spring03/update/${dto.idx}";
			document.form1.submit();
		});
		
		$("#btnDelete").click(function() {
			document.form1.action="/spring03/delete/${dto.idx}";
			document.form1.submit();
		});
	});
</script>
	</head>
<body>
	<h2>메모 보기</h2>
	<form method="post" name="form1">
		<table border="1" width="500px">
			<tr>
				<td>번호</td>
				<td>${dto.idx }</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input name="writer" value="${dto.writer }"></td>
			</tr>
			<tr>
				<td>메모</td>
				<td><input name="memo" value="${dto.memo }" size="50"></td>
			</tr>
			<tr align="center">
				<td colspan="2">
					<input type="hidden" name="idx" value="${dto.idx }">
					<button type="button" id="btnUpdate">수정</button>
					<button type="button" id="btnDelete">삭제</button>
					
				</td>
			</tr>
		</table>
	</form>
</body>
</html>

