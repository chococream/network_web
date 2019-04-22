<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
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

  <div class="container" style="margin_top:100px">
  	<div class="col-lg-4">
  		<div class="jumbotron" style="padding-top: 20px">
  			<form method="get" action="loginAction.jsp">
  				<h3 style="text-align: center">로그인 화면</h3>
  				<div class="form-group">
  					<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20" required>
  				</div>
  				<div class="form-group">
  					<input type="password" class="form-control" placeholder="비밀번호" name="userPW" maxlength="20" required>
  				</div>
  				<input type="submit" class="btn btn-primary form-control" value="로그인">
  			</form>
  		</div>
  	</div>
  </div>
</body>
</html>