<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<%
	String strDanNum = request.getParameter("danNum");
	int danNum = Integer.parseInt(strDanNum);
	
	String strDanIdx = request.getParameter("danIdx");
	int danIdx = Integer.parseInt(strDanIdx);
	
	int danVal = danNum * danIdx;
	
	System.out.println(danNum + "<---danNum");
	System.out.println(danIdx + "<---danIdx");
	System.out.println(danVal + "<---danVal");

	// gugudan �����ͺ��̽��� dan ���̺� �Է�
	// insert into ���̺��̸�(�÷��̸�, �÷��̸�, �÷��̸�) values(��,��,��)
	
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
				"jdbc:mariadb://127.0.0.1:3306/gugudan",
				"root",
				"java1004");
	String sql = "insert into dan(dan_num,dan_idx,dan_val) values(?,?,?)";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setInt(1,danNum);
	stmt.setInt(2,danIdx);
	stmt.setInt(3,danVal);
	System.out.println(stmt + "<-stmt");
	
	stmt.executeUpdate();
	
	response.sendRedirect("./danList.jsp"); //�۾��� ������ danList.jsp ��ġ�� �̵�(danList.jsp ���û)
%>
