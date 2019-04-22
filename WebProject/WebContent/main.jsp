<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<%@ page import="jsp.db.DataManager" %>
    
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

	String[][] cafeteria_arr = new String[100][2];
	String[][] cafe_arr = new String[100][2];
	int i=0;
	
	try {
		cafeteria_arr = DataManager.CafeteriaData();
		//cafe_arr = DataManager.CafeData();
	} catch(Exception e) {
		e.printStackTrace();
	}
	
%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인</title>
	<link rel="stylesheet"
	  href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=32b8201ca9c8b9a5b881a501b9077222&libraries=services,clusterer,drawing"></script>
		
	<link rel="https://api.w.org/" href="https://mlgblockchain.com/wp-json/">
	
	<style>
		#imgIcon {
			width:50px;
			height:50px;			
		}
		
		#info-window-style {
			font-size:12px;
			padding:10px;
			margin:10px;
			
			width:250px;
			heigh:100px;
		}
		
		#rank-board-style {
			width:300px; 
			height:500px; 
			
			margin-left:50px; 
			margin-right:100px;
			margin-top:50px;
			
			float:right;
		}
		
		#button-style {
			margin:50px;
		}
	</style>
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

<div>
	<button type="button" class="btn btn-danger" id="button-style" onclick="cafeteria_click();">
		<img id="imgIcon" src="http://download.seaicons.com/icons/icons8/windows-8/512/Food-Restaurant-2-icon.png"> 식당
	</button>
	<button style="color:white" type="button" class="btn btn-warning" id="button-style" onclick="cafe_click();">
		<img id="imgIcon" src="https://static.thenounproject.com/png/207093-200.png"> 편의점
	</button>
</div>

<div>
	<div id=map style="width:500px; height:400px; float:left; margin-left:50px;">
		<script>
			
			// School Marker and default setting
		
			var school_Lat=35.143115, school_Lng=126.799974;
			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			var options = { //지도를 생성할 때 필요한 기본 옵션
					center: new daum.maps.LatLng(school_Lat, school_Lng), //지도의 중심좌표.
					level: 3 //지도의 레벨(확대, 축소 정도)
				};

			var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
			
			var school_marker = new daum.maps.Marker({				//지도 마커
			    map: map,
			    position: new daum.maps.LatLng(school_Lat, school_Lng)
			});
			
			
			var cafeteria_markers = [];
			var cafe_markers = [];
			
			// Geocoder
			
			var geocoder = new daum.maps.services.Geocoder();
			
			var cafeteria_callback = function(result, status) {
    		if (status === daum.maps.services.Status.OK) {
    			
    			var marker = new daum.maps.Marker({
    				position: new daum.maps.LatLng(result[0].y, result[0].x),
    				image: new daum.maps.MarkerImage(cafeteria_imageSrc, cafeteria_imageSize, cafeteria_imageOption),
    				clickable: true
    			})
    			
    			cafeteria_markers.push(marker);
    			
    			var infowindow = new daum.maps.InfoWindow({
    				content: '<div id="info-window-style"><%=cafeteria_arr[i][0]%></br><%=cafeteria_arr[i][1]%></div>',
    				removable: true
    			});
    			
    			daum.maps.event.addListener(marker, 'click', function () {
    				infowindow.open(map, marker);
    			});
    			
    			}
			};
			
			var cafe_callback = function(result, status) {
	    		if (status === daum.maps.services.Status.OK) {
	    			
	    			var marker = new daum.maps.Marker({
	    				position: new daum.maps.LatLng(result[0].y, result[0].x),
	    				image: new daum.maps.MarkerImage(cafe_imageSrc, cafe_imageSize, cafe_imageOption),
	    				clickable: true
	    			})
	    			
	    			cafe_markers.push(marker);
	    			
	    			var infowindow = new daum.maps.InfoWindow({
	    				content: '<div id="info-window-style">CU 광주 송정점</br>광주 광산구 상무대로 305</div>',
	    				removable: true
	    			});
	    			
	    			daum.maps.event.addListener(marker, 'click', function () {
	    				infowindow.open(map, marker);
	    			});
	    			
	    			}
				};
			
			
			// Cafeteria or Cafe Marker
			
			
			
			var cafeteria_imageSrc = 'https://cdn.discordapp.com/attachments/296492552624930819/519033711988310016/redMaker.png',
				cafeteria_imageSize = new daum.maps.Size(64, 69),
				cafeteria_imageOption = {offset: new daum.maps.Point(27, 69)}
			
			var cafe_imageSrc = 'https://cdn.discordapp.com/attachments/296492552624930819/519033714471337984/ylwMaker.png',
				cafe_imageSize = new daum.maps.Size(64, 69),
				cafe_imageOption = {offset: new daum.maps.Point(27, 69)}
			
			<%
				i = 0;
				while((i < cafeteria_arr.length) && cafeteria_arr[i][0] != null) {
					%>
					geocoder.addressSearch("<%=cafeteria_arr[i][1]%>", cafeteria_callback);
					<%
					i++;
				}
			%>
			
			geocoder.addressSearch("광주 광산구 상무대로 305", cafe_callback);
			
			<%--
				i = 0;
				while((i < cafeteria_arr.length) && cafeteria_arr[i][0] != null) {
					%>
					geocoder.addressSearch("<%=cafe_arr[i][1]%>", cafe_callback);
					<%
					i++;
				}
			--%>
			
			var cafe_check = false;
			var cafeteria_check = false;			
			
			// Function
			
			function cafeteria_click() {
				if(cafeteria_check == false) {
					set_cafeteria_Markers(map); // 마커 보여주기
				}
				else {
					set_cafeteria_Markers(null); // 마커 숨기기
				}
				cafeteria_check = !cafeteria_check;
			}
			
			function cafe_click() {
				if(cafe_check == false) {
					set_cafe_Markers(map); // 마커 보여주기
				}
				else {
					set_cafe_Markers(null); // 마커 숨기기
				}
				cafe_check = !cafe_check;
			}
			
			function set_cafe_Markers(maps) {
			    for (var i = 0; i < cafe_markers.length; i++) {
			        cafe_markers[i].setMap(maps);
			    }            
			}
			
			function set_cafeteria_Markers(maps) {
			    for (var i = 0; i < cafeteria_markers.length; i++) {
			        cafeteria_markers[i].setMap(maps);
			    }            
			}
			
		</script>
	</div>
	
	<div id="rank-board-style">
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
 			<thead>
 				<tr>
 					<th style="background-color: #eeeeee; text-align: center;">랭킹</th>
 					<th style="background-color: #eeeeee; text-align: center;">이름</th>
 					<th style="background-color: #eeeeee; text-align: center;">평점</th>
 				</tr>
 			</thead>
 			<tbody>
 				<script>
 					<%
 					try{
 						
 						i=1;
 						
 						String query = "SELECT * FROM board ORDER BY score DESC, b_subject ASC LIMIT 5";
 						
 						Statement st = conn.createStatement();

 						ResultSet rs = st.executeQuery(query);
 						
 						if(rs.next()) {
 							do {
 								%>
 								document.write('<tr>');
 								document.write('<td>'+"<%=i%>"+'</td>');
 								document.write('<td>'+"<%=rs.getString("b_subject")%>"+'</td>');
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
	</div>
</div>

</body>
</html>