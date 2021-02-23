import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class settings
 */
@WebServlet("/settings")
public class settings extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		HttpSession ses=request.getSession();
		String number=String.valueOf(ses.getAttribute("pno"));
		PrintWriter pw=response.getWriter();
		String fname,lname,pass,gender,email,phone,aadhar,location,locationtext;
		fname=request.getParameter("fname");
		lname=request.getParameter("lname");
		pass=request.getParameter("fpass");
		email=request.getParameter("email");
		//phone=request.getParameter("txtEmpPhone");
		aadhar=request.getParameter("txtEmpAadhar");
		location=request.getParameter("location");
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/farmerzone", "Bootathon","6383411123");
			PreparedStatement stmt=con.prepareStatement("update farmerregister SET Firstname=?,Lastname=?,Password=?,Email=?,Aadharnumber=?,Locationtext=? where Phonenumber=?");  
				 stmt.setString(1,fname); 
				 stmt.setString(2,lname); 
				 stmt.setString(3,pass);
				 stmt.setString(4,email);
				
				 stmt.setString(5,aadhar);
				 stmt.setString(6,location);
				 stmt.setString(7, number);
				
				 int up=stmt.executeUpdate();
				 if(up>0)
				 {
					 //response.sendRedirect("http://localhost:8088/FarmerZone/Login.jsp");
					 request.setAttribute("upmessage","Updated Successfully");
					 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Settings.jsp");
					 dispatcher.forward(request, response);
				 }
			 
			
			 
			con.close();
		}
		catch(Exception ec)
		{
			System.out.print(ec);
		}
	}

}