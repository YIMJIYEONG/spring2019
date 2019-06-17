<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script>
function product_update() {
	var product_name = document.form1.product_name.value;
	var price = document.form1.price.value;
	var description = document.form1.description.value;
	
	if(product_name == "") {
		alert("상품명을 입력하세요.");
		document.form1.product_name.focus();
		return;
	}
	if(price == "") {
		alert("가격을 입력하세요.");
		document.form1.price.focus();
		return;
	}
	if(description == "") {
		alert("상품설명을 입력하세요.");
		document.form1.description.focus();
		return;
	}
	document.form1.action = "${path}/shop/product/update.do";
	document.form1.submit();
}
function product_delete() {
	if(confirm("삭제하시겠습니까?")) {
		document.form1.action = "${path}/shop/product/delete.do";
		document.form1.submit();
	}
}
</script>
</head>
<body>
<%@ include file="../include/admin_menu.jsp" %>
<h2>상품 정보 편집</h2>
<form id="form1" name="form1" method="post" enctype="multipart/form-data">
<table border="1">
	<tr>
		<td>상품명</td>
		<td><input name="product_name" value="${dto.product_name}"></td>
	</tr>
	<tr>
		<td>가격</td>
		<td><input name="price" type="number" value="${dto.price}"></td>
	</tr>
	<tr>
		<td>상품설명</td>
		<td><textarea rows="5" cols="20" name="description" id="description">${dto.description}</textarea></td>
	</tr>
	<tr>
		<td>상품 이미지</td>
		<td>
			<img src="${path}/images/${dto.picture_url}" width="300px" height="300px">
			<br>
			<input type="file" name="file1">
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="hidden" name="product_id" value="${dto.product_id}">
			<input type="button" value="수정" onclick="product_update()">
			<input type="button" value="삭제" onclick="product_delete()">
			<input type="button" value="목록" onclick="location.href='${path}/shop/product/list.do'">
		</td>
	</tr>
	
</table>
</form>
</body>
</html>