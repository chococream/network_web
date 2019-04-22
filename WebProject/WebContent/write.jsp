<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	Connection conn = null;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
	
		String url="jdbc:mysql://localhost:3306/net?"
				+ "characterEncoding=UTF-8&serverTimezone=UTC"
				+ "&verifyServerCertificate=false&useSSL=true";
    	String user = "root";
    	String pw="rnwkgus123";
    
    	conn = DriverManager.getConnection(url, user, pw);
    
    	System.out.println("연결 됬다");
	} catch (ClassNotFoundException | SQLException e) {
		e.printStackTrace();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Boarding...</title>
</head>
<body>
<%
 	request.setCharacterEncoding("euc-kr");
 	
 	String title = request.getParameter("title");
 	String addr = request.getParameter("addr");
 	String type = request.getParameter("type");
 	String word = request.getParameter("word");
 	String score = request.getParameter("score");
 	
 	if(title==""||addr==""||word==""||score=="") {
 		out.println("<script> alert('게시글을 끝까지 입력 해주시기 바랍니다.')");
 		out.println("location.href = 'writeBoard.jsp' </script>");
 	}
 %>
</body>
<script type="text/javascript">
 
 <%
 	boolean check = false;
 
	try{
		String query = "INSERT INTO board VALUES(null, '"+title+"', 0, "+score+", '"+word+"')";
		Statement st = conn.createStatement();
		st.executeUpdate(query);
		
		if(type.equals("식당")){
			query = "INSERT INTO restaurant VALUES(null, '"+title+"', '"+addr+"')";
		} else {
			query = "INSERT INTO convenience VALUES(null, '"+title+"', '"+addr+"')";	
		}
		st.executeUpdate(query);
		
		st.close();
							
	} catch(Exception e) {
		out.println("alert('ERROR.')");
		out.println("location.href = 'writeBoard.jsp'");
		check = true;
		e.printStackTrace();
	}
%>

if(<%=!check%>){
	 alert("게시글 작성 완료.");	
	 location.href = 'board.jsp'
}
</script>
</html>