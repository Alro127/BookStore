<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="beans.bookBean"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%
// Lấy danh sách sách từ request attribute
	List<bookBean> books = new ArrayList<>();
	books.add(new bookBean("B001", "Java Programming", 25.5f, 1));
	books.add(new bookBean("B002", "Web Development", 30.0f, 1));
	books.add(new bookBean("B003", "Database Systems", 45.75f, 1));
	books.add(new bookBean("B004", "Networking Basics", 15.99f, 1));
	
    session.setAttribute("books", books);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Store</title>
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
	<table border="1">
		<tr>
			<th>ID</th>
			<th>Tên sách</th>
			<th>Giá</th>
			<th>Hành động</th>
		</tr>
		<%
		if (books != null && !books.isEmpty()) {
			for (bookBean book : books) {
		%>
		<tr>
			<td><%=book.getId()%></td>
			<td><%=book.getName()%></td>
			<td>$<%=book.getPrice()%></td>
			<td>
				<form action="servlet_Books" method="post">
					<input type="hidden" name="bookId" value="<%=book.getId()%>">
					<button type="submit">Add to Cart</button>
				</form>
			</td>
		</tr>
		<%
		}
		} else {
		%>
		<tr>
			<td colspan="4">Không có sách nào có sẵn</td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>
