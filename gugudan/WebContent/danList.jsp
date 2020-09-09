<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>구구단 리스트</title>
</head>
<body>
	<h1>구구단 리스트</h1>
	<%
		Class.forName("org.mariadb.jdbc.Driver");
		
		Connection conn = DriverManager.getConnection(
					"jdbc:mariadb://127.0.0.1:3306/gugudan",
					"root",
					"java1004");
		System.out.println("conn");
		/* 오름차순 정렬
			select dan_num,dan_idx,dan_val
			from dan
			order by dan_num asc, dan_idx asc
		*/
		
		String sql = "select dan_num,dan_idx,dan_val from dan";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
	%>
	<div>
		<a href ="./index.jsp">구구단 홈으로</a>
		<a href="./danInsertForm.jsp">구구단 입력하기</a>
	</div>
	
	<table border = "1">
		<thead>
			<tr>
				<th>dan_num</th>
				<th>dan_idx</th>
				<th>dan_val</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<%
				while(rs.next()){
			%>
				<tr>
					<td><%=rs.getInt("dan_num") %></td>
					<td><%=rs.getInt("dan_idx") %></td>
					<td><%=rs.getInt("dan_val") %></td>
					<td><a href = './danDeleteAction.jsp?danNum=<%=rs.getInt("dan_num")%>&danIdx=<%=rs.getInt("dan_idx")%>'>삭제</a></td>
				</tr>
			<%
				}
			%>
		</tbody>
	</table>
</body>
</html>