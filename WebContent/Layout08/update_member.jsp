<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file = "DBConn.jsp" %>

<%@page import = "java.time.*" %>

<%
	String custno = request.getParameter("custno");
	String custname = "";
	String phone = "";
	String address = "";
	String[] joindate = new String[10];
	String grade = "";
	String city = "";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select custno, custname, phone, address, to_char(joindate, 'YYYY-MM-DD'), grade, city from member0525 where custno = ?";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, custno);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			custname = rs.getString(2);
			phone = rs.getString(3);
			address = rs.getString(4);
			joindate = rs.getString(5).split("-");
			grade = rs.getString(6);
			city = rs.getString(7);
		}
	}
	catch (SQLException e) {
		e.printStackTrace();
	}
%>
    
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
<h2>홈쇼핑 회원 등록</h2>
<form name = "form" method = "post" action = "update_memberProcess.jsp">
<table border = "1" id = "tab1">
	<tr>
		<th>회원번호</th>
		<td><input type = "text" name = "custno" value = "<%=custno %>"></td>
	</tr>
	<tr>
		<th>회원성명</th>
		<td><input type = "text" name = "custname" value = "<%=custname %>"></td>
	</tr>
	<tr>
		<th>회원전화</th>
		<td><input type = "text" name = "phone" value = "<%=phone %>"></td>
	</tr>
	<tr>
		<th>회원주소</th>
		<td><input type = "text" name = "address" value = "<%=address %>"></td>
	</tr>
	<tr>
		<th>가입일자</th>
		<td><input type = "text" name = "joindate" value = "<%=joindate[0] + joindate[1] + joindate[2] %>"></td>
	</tr>
	<tr>
		<th>고객등급[A:VIP, B:일반, C:직원]</th>
		<td><input type = "text" name = "grade" value = "<%=grade %>"></td>
	</tr>
	<tr>
		<th>도시코드</th>
		<td><input type = "text" name = "city" value = "<%=city %>"></td>
	</tr>
	<tr>
		<td colspan = "2" align = "center">
			<input type = "button" value = "수정" onclick = "check()">
			<input type = "button" value = "조회" onclick = "move()">
		</td>
	</tr>
</table>
</form>
</section>

<footer>
<%@include file = "footer.jsp" %>
</footer>
<script>
function move() {
	location.href = "select_member.jsp";
}
function check() {
	if(!document.form.custname.value || document.form.custname.value == "") {
		alert("회원성명이 입력되지 않았습니다.");
		document.form.custname.focus();
	}
	else if(!document.form.phone.value || document.form.phone.value == "") {
		alert("회원전화가 입력되지 않았습니다.");
		document.form.phone.focus();
	}
	else if(!document.form.address.value || document.form.address.value == "") {
		alert("회원주소가 입력되지 않았습니다.");
		document.form.address.focus();
	}
	else if(!document.form.grade.value || document.form.grade.value == "") {
		alert("고객등급이 입력되지 않았습니다.");
		document.form.grade.focus();
	}
	else if(!document.form.city.value || document.form.city.value == "") {
		alert("도시코드가 입력되지 않았습니다.");
		document.form.city.focus();
	}
	else {
		document.form.submit();
	}
}
</script>
</body>
</html>