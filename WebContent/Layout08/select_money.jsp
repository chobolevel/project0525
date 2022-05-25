<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file = "DBConn.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<header>
<%@include file = "header.jsp" %>
</header>

<nav>
<%@include file = "nav.jsp" %>
</nav>

<section>
<h2>회원매출조회</h2>
<table border = "1" id = "tab3">
<tr>
	<th>회원번호</th>
	<th>회원성명</th>
	<th>고객등급</th>
	<th>매출</th>
</tr>
<%
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select a.custno, a.custname, a.grade, sum(b.price) from member0525 a, money0525 b where a.custno = b.custid group by a.custno, a.custname, a.grade order by sum(b.price) desc";
	try {
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			String custno = rs.getString(1);
			String custname = rs.getString(2);
			String grade = rs.getString(3);
			if(grade.equals("A")) {
				grade = "VIP";
			}
			else if(grade.equals("B")) {
				grade = "일반";
			}
			else if(grade.equals("c")) {
				grade = "직원";
			}
			else {
				grade = "등급없음";
			}
			String price = rs.getString(4);
			%>
			<tr>
				<td><%=custno %></td>
				<td><%=custname %></td>
				<td><%=grade %></td>
				<td><%=price %></td>
			</tr>
			<%
		}
	}
	catch (SQLException e) {
		e.printStackTrace();
	}
%>

</table>
</section>

<footer>
<%@include file = "footer.jsp" %>
</footer>

</body>
</html>