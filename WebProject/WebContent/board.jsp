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
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
	<link rel="stylesheet"
	  href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="main.jsp">우선 밥먼저 먹고!</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="main.jsp">Home<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="board.jsp">Board</a>
      </li>
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          	Connect
        </a>
        	<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          		<a class="dropdown-item" href="login.jsp">Login</a>
          		<a class="dropdown-item" href="signup.jsp">Sign up</a>
          		<div class="dropdown-divider"></div>
          		<a class="dropdown-item" href="findIDPW.jsp">Forgot ID PW</a>
			</div>
      	</li>
    </ul>
  </div>
</nav>

<div class="container" style="margin-top:50px;">
	<div class="row">
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
 			<thead>
 				<tr>
 					<th style="background-color: #eeeeee; text-align: center;">번호</th>
 					<th style="background-color: #eeeeee; text-align: center;">식당 이름</th>
 					<th style="background-color: #eeeeee; text-align: center;">작성자</th>
 					<th style="background-color: #eeeeee; text-align: center;">평점</th>
 				</tr>
 			</thead>
 			<tbody>
 				<tr>
 					<td>-</td>
 					<td><a href="notice.html" style="color:red">[공지] 게시판 작성 규칙</a></td>
 					<td>ADMIN</td>
 					<td>-</td>
 				</tr>
 				<script>
 					<%
 					try{
 						
 						int i=1;
 						
 						String query = "SELECT * FROM board";
 						
 						Statement st = conn.createStatement();

 						ResultSet rs = st.executeQuery(query);
 						
 						if(rs.next()) {
 							do {
 								%>
 								document.write('<tr>');
 								document.write('<td>'+"<%=i%>"+'</td>');
 								document.write('<td>'+"<%=rs.getString("b_subject")%>"+'</td>');
 								document.write('<td> - </td>');
 								document.write('<td>'+"<%=rs.getString("score")%>"+'</td>');
 								document.write('</tr>');
 								<%
 								i++;
 							} while(rs.next());
 						}
 						
 					} catch(Exception e) {
 						e.printStackTrace();
 					}
 					%>
 				</script>
 			</tbody>
 		</table>
 		<a href="writeBoard.jsp" class="btn btn-primary pull right">글쓰기</a>
 	</div>
</div>
</body>
</html>