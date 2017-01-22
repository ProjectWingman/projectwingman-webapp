
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String URL;
	String JDBC_DRIVER;
	String USER;
	String PASS;
	Connection conn;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		// TODO Auto-generated constructor stub
		URL = "jdbc:mysql://localhost:3306/wingman_db";
		JDBC_DRIVER = "com.mysql.jdbc.Driver";
		USER = "root";
		PASS = "3070";
		conn = null;
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(URL, USER, PASS);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		try {
			Statement s = conn.createStatement();
			String sql = "select username, password from Customer_Details";
			ResultSet rs = s.executeQuery(sql);
			while (rs.next()) {
				if (rs.getString("Username").equals(username)) {
					if (rs.getString("Password").equals(password)) {
						request.getSession().setAttribute("sessionId", request.getSession().getId());
						String sql2 = "INSERT INTO `login_session` (`username`, `sessionid`) VALUES (?, ?)";
						java.sql.PreparedStatement ps = conn.prepareStatement(sql2);
						ps.setString(1, username);
						ps.setString(2, request.getSession().getId());
						ps.executeUpdate();
						response.sendRedirect("homepage.jsp");
						return;
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("login.jsp?status=1");
	}
}
