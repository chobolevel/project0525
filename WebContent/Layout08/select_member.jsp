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
<h2>회원 목록 조회 / 수정</h2>
<table border = "1" id = "tab2">
<tr>
	<th>회원번호</th>
	<th>회원성명</th>
	<th>전화번호</th>
	<th>주소</th>
	<th>가입일자</th>
	<th>고객등급</th>
	<th>거주지역</th>
</tr>
<%
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select * from member0525";
	try {
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			String custno = rs.getString(1);
			String custname = rs.getString(2);
			String phone = rs.getString(3);
			String address = rs.getString(4);
			String joindate = rs.getString(5);
			String grade = rs.getString(6);
			if(grade.equals("A")) {
				grade = "VIP";
			}
			else if(grade.equals("B")) {
				grade = "일반";
			}
			else if(grade.equals("C")) {
				grade = "직원";
			}
			else {
				grade = "등급없음";
			}
			String city = rs.getString(7);
			%>
			<tr>
				<td><a href = "update_member.jsp?custno=<%=custno %>"><%=custno %></a></td>
				<td><%=custname %></td>
				<td><%=phone %></td>
				<td><%=address %></td>
				<td><%=joindate %></td>
				<td><%=grade %></td>
				<td><%=city %></td>
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