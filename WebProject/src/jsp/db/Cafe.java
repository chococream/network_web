package jsp.db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

/**
 * Servlet implementation class DataManager
 */
@WebServlet("/Cafe")
public class Cafe extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */

public static String[][] ReturnData() {

	try{
		String[][] cafe = new String[100][2];
		Connection conn = DBConn.getMySqlConnection();
	
		int i=0;
	
		String query = "SELECT * FROM convenience";
	
		Statement st = conn.createStatement();

		ResultSet rs = st.executeQuery(query);
	
		if(rs.next()) {
			do {
				cafe[i][0] = rs.getString("c_name");
				cafe[i][1] = rs.getString("locate");
				i++;
			} while(rs.next());
		}
	
		st.close();
	
		return cafe;
	
	} catch(Exception e) {
		return null;
	}
}
}
