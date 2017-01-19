

import java.io.IOException;
import java.util.*;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @throws ClassNotFoundException 
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#getServletConfig()
	 */
	public ServletConfig getServletConfig() {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * @see Servlet#getServletInfo()
	 */
	public String getServletInfo() {
		// TODO Auto-generated method stub
		return null; 
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String URL = "jdbc:mysql://localhost:3306/wingman_db";
        String JDBC_DRIVER = "com.mysql.jdbc.Driver";
        String USER = "root";
        String PASS = "";
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
        
		String fname=request.getParameter("firstname");
		String lname=request.getParameter("lastname");
		String email=request.getParameter("email");
		int age=Integer.parseInt(request.getParameter("age"));
		String phone=request.getParameter("phone");
		String dob=request.getParameter("dob");
		String address=request.getParameter("add");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		boolean flag = false;
		try{
    	Statement s = conn.createStatement();
    	String sql = "select username from Customer_Details";
    	ResultSet rs = s.executeQuery(sql);
    	while(rs.next()){
    		if(rs.getString("username") == username)
    			flag = false;}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		if(!flag)	{
    		String sql1 = "INSERT INTO  `wingman_db`.`Customer_Details` (`FirstName`,`LastName`,`Age`,`Email`,`Phone`,`DOB`,`Address`,`Username`,`Password`)VALUES (?,?,?,?,?,?,?,?,?)";
    		PreparedStatement p;
			try {
				p = conn.prepareStatement(sql1);
    		p.setString(1, fname);
    		p.setString(2, lname);
    		p.setInt(3, age);
    		p.setString(4, email);
    		p.setString(5, phone);
    		p.setString(6, dob);
    		p.setString(7, address);
    		p.setString(8, username);
    		p.setString(9, password);
    		p.executeUpdate();}
			catch(Exception e)
			{
				e.printStackTrace();
			}
    	}
		response.sendRedirect("homepage.jsp");

			}

}
