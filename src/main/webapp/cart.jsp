<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="beans.bookBean"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giỏ hàng</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f0f0f0;
	padding: 20px;
}

h1 {
	color: #333;
	text-align: center;
}

table {
	width: 80%;
	margin: 20px auto;
	border-collapse: collapse;
	box-shadow: 0 2px 15px rgba(0, 0, 0, 0.2);
	background-color: #fff;
}

table th, table td {
	padding: 12px;
	text-align: center;
}

table thead {
	background-color: #f4f4f4;
	border-bottom: 2px solid #ddd;
}

table th {
	font-size: 18px;
	color: #333;
}

table tr {
	border-bottom: 1px solid #ddd;
}

table tr:nth-child(even) {
	background-color: #f9f9f9;
}

table tr:hover {
	background-color: #f1f1f1;
}

table td {
	font-size: 16px;
	color: #555;
}

button {
	background-color: #4CAF50;
	color: white;
	border: none;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
	border-radius: 4px;
}

button:hover {
	background-color: #45a049;
}
</style>
</head>
<body>
	<h1>Giỏ hàng</h1>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>Tên sách</th>
			<th>Giá</th>
			<th>Số lượng</th>
		</tr>
		<%
            List<bookBean> cart = (List<bookBean>) session.getAttribute("cart");
            if (cart != null) {
                for (bookBean book : cart) {
        %>
		<tr>
			<td><%= book.getId() %></td>
			<td><%= book.getName() %></td>
			<td>$<%= book.getPrice() %></td>
			<td><%= book.getQuantity() %></td>
		</tr>
		<% }} %>
	</table>
	<h3>
		Tổng cộng: $<%= request.getAttribute("total") %></h3>
	<form action="servlet_Cart" method="post">
		<button type="submit" name="action" value="checkout">Thanh
			toán</button>
		<button type="submit" name="action" value="continue">Quay lại</button>
	</form>
</body>
</html>
