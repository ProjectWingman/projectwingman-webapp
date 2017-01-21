

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LogoutServlet
 */
@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String URL;
	String JDBC_DRIVER;
	String USER;
	String PASS;
	Connection conn;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutServlet() {
        super();
        // TODO Auto-generated constructor stub
        URL = "jdbc:mysql://localhost:3306/wingman_db";
        JDBC_DRIVER = "com.mysql.jdbc.Driver";
        USER = "root";
        PASS = "3070";
		conn = null;
        try {
        	Class.forName(JDBC_DRIVER);
    		conn = DriverManager.getConnection(URL,USER,PASS);
    	} catch (SQLException e) {
    		// TODO Auto-generated catch block
    		e.printStackTrace();
    	} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String ss = (String) request.getSession().getAttribute("sessionId");
		if(ss != null && !ss.isEmpty()){
			try {
				PreparedStatement ps = conn.prepareStatement("DELETE from login_session where sessionid = ?");
				ps.setString(1, ss);
				ps.executeUpdate();
				request.getSession().removeAttribute("sessionId");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		response.sendRedirect("index.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
