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
<title>Processing...</title>
</head>
<body>
<%
 	request.setCharacterEncoding("euc-kr");
 	
 	String id = request.getParameter("userID");
 	String pw = request.getParameter("userPW");
 	String name = request.getParameter("userNM");
 	String email = request.getParameter("userEM");
 %>
 
 <script type="text/javascript">
 
 <%
 	boolean check = false;
 
	try{
		String query = "INSERT INTO login VALUES('"+id+"', '"+pw+"', '"+name+"', '"+email+"')";
						
		Statement st = conn.createStatement();
		st.executeUpdate(query);
		
		st.close();
							
	} catch(Exception e) {
		out.println("alert('다른 아이디를 사용해 주세요.')");
		out.println("location.href = 'signup.jsp'");
		check = true;
		e.printStackTrace();
	}
%>

if(<%=!check%>){
	 alert("회원가입 완료.");	
	 location.href = 'login.jsp'
}
</script>
</body>
</html>