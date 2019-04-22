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
<title>Find...</title>
</head>
<body>
 <%
 	request.setCharacterEncoding("euc-kr");

 	String name = request.getParameter("userNM");
 	String email = request.getParameter("userEM");
 	
 %>
 <script>
 <%
 	int i=0;
 	String[][] arr = new String[100][3];
 
 	try{
 		
 						
 		String query = "SELECT p_name, email, id FROM login";
 						
 		Statement st = conn.createStatement();

 		ResultSet rs = st.executeQuery(query);
 						
 		if(rs.next()) {
 			do {
 				arr[i][0] = rs.getString("p_name");
 				arr[i][1] = rs.getString("email");
 				arr[i][2] = rs.getString("id");
 				i++;
 			} while(rs.next());
 		}
 						
 	} catch(Exception e) {
 		e.printStackTrace();
 	}
 %>
 </script>
 
 <script type="text/javascript">
 <%
 	i = 0;
 	boolean check = false;
 	while((i < arr.length) && arr[i][0] != null) {
 		if((arr[i][0].equals(name)) && (arr[i][1].equals(email))) {
 			%>
 			alert("ID : "+"<%=arr[i][2]%>");
 			<%
 			check = true;
 			break;
 		}
 		i++;
 	}
 	if(!check) out.println("alert('회원 정보를 찾을 수 없습니다.')");
 %>	
 location.href = 'findIDPW.jsp'</script>
</body>
</html>