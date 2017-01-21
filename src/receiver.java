

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
 * Servlet implementation class receiver
 */
@WebServlet("/receiver")
public class receiver extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public receiver() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String URL = "jdbc:mysql://localhost:3306/wingman_db";
        String JDBC_DRIVER = "com.mysql.jdbc.Driver";
        String USER = "root";
        String PASS = "3070";
		Connection conn=null;
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
        
		String name=request.getParameter("name");
		String date=request.getParameter("ddate");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String fno=request.getParameter("fno");
		int weight=Integer.parseInt(request.getParameter("weight"));
		
    		String sql1 = "INSERT INTO  `wingman_db`.`receiver_details` (`Name`,`Ddate`,`Email`,`Phone`,`Flightno`,`Weight`)VALUES (?,?,?,?,?,?)";
    		PreparedStatement p;
			try {
				p = conn.prepareStatement(sql1);
    		p.setString(1, name);
    		p.setString(2, date);
    		p.setString(3, email);
    		p.setString(4, phone);
    		p.setString(5, fno);
    		p.setInt(6, weight);
    		p.executeUpdate();}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			response.sendRedirect("homepage.jsp");
    	}
	}

