

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
        String username=request.getParameter("username");
		//String password=request.getParameter("password");
		try{
	    	Statement s = conn.createStatement();
	    	String sql = "select username from Customer_Details";
	    	ResultSet rs = s.executeQuery(sql);
	    	while(rs.next()){
	    		if(rs.getString("Username").equals(username)){
	    			//if(rs.getString("Password").equals(password))
	    				String id=(String) request.getSession().getAttribute(request.getSession().getId());
	    				String sql2 = "SELECT sessionid from `login_session` WHERE username='"+username+"'";
	    		    	ResultSet r = s.executeQuery(sql2);
	    		    	if(rs.getString("sessionid")==id)
	    		    	{
	    		    		response.sendRedirect("homepage.jsp");
	    		    		}
	    				return;
	    			}	
	    	}
		}catch(Exception e){
			e.printStackTrace();
		}
		String name=request.getParameter("name");
		String date=request.getParameter("ddate");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String fno=request.getParameter("fno");
		System.out.println("Name: " + name);
		//int weight=Integer.parseInt(request.getParameter("weight"));
		String weight = request.getParameter("weight");
    		String sql1 = "INSERT INTO  `wingman_db`.`receiver_details` (`Name`,`Ddate`,`Email`,`Phone`,`Flightno`,`Weight`)VALUES (?,?,?,?,?,?)";
    		PreparedStatement p;
			try {
				p = conn.prepareStatement(sql1);
    		p.setString(1,name);
    		p.setString(2,date);
    		p.setString(3,email);
    		p.setString(4,phone);
    		p.setString(5,fno);
    		p.setString(6,weight);
    		p.executeUpdate();}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			response.sendRedirect("homepage.jsp");
    	}
	}

