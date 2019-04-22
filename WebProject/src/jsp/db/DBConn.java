package jsp.db;

import java.sql.*;

public class DBConn {
	
	public static Connection getMySqlConnection() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String url="jdbc:mysql://localhost:3306/net?"
					+ "characterEncoding=UTF-8&serverTimezone=UTC"
					+ "&verifyServerCertificate=false&useSSL=true";
	        String user = "root";
	        String pw="rnwkgus123";
	        
	        conn = DriverManager.getConnection(url, user, pw);
	        
	        System.out.println("¿¬°á ‰ç´Ù");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
}
