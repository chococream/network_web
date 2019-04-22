package jsp.db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

/**
 * Servlet implementation class DataManager
 */
@WebServlet("/DataManager")
public class DataManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    
	public static String[][] CafeData() {
		return Cafe.ReturnData();
	}
	
	public static String[][] CafeteriaData() {
		return Cafeteria.ReturnData();
	}
}
