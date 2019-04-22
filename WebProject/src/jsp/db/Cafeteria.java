package jsp.db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

/**
 * Servlet implementation class DataManager
 */
@WebServlet("/Cafeteria")
public class Cafeteria extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    
public static String[][] ReturnData() {
		
		try{
			String[][] cafeteria = new String[100][2];
	 		Connection conn = DBConn.getMySqlConnection();
			
			int i=0;
			
			String query = "SELECT * FROM restaurant";
	    	
	    	Statement st = conn.createStatement();

			ResultSet rs = st.executeQuery(query);
			
			if(rs.next()) {
				do {
					cafeteria[i][0] = rs.getString("r_name");
					cafeteria[i][1] = rs.getString("locate");
					i++;
				} while(rs.next());
			}
			st.close();
			
			return cafeteria;
			
		} catch(Exception e) {
			return null;
		}
	}
}
