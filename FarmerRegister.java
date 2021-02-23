

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/FarmerRegister")
public class FarmerRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		String fname,lname,pass,gender,email,phone,aadhar,location,locationtext;
		fname=request.getParameter("fname");
		lname=request.getParameter("lname");
		pass=request.getParameter("fpass");
		gender=request.getParameter("gender");
		email=request.getParameter("email");
		phone=request.getParameter("txtEmpPhone");
		aadhar=request.getParameter("txtEmpAadhar");
		location=request.getParameter("location");
		locationtext=request.getParameter("locationtext");
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/farmerzone", "Bootathon","6383411123");
			PreparedStatement st=con.prepareStatement("SELECT * from farmerregister where Phonenumber=?");
			 st.setString(1,phone);
			 ResultSet r1=st.executeQuery();
			 if(r1.next()) {
			  // pw.println("<script>alert('Phone number already registered')</script>");
			   request.setAttribute("message", "Sorry Phone number already taken!!");
				 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Register.jsp");
				 dispatcher.forward(request, response);
			 }
			 else
			 {
				 PreparedStatement stmt=con.prepareStatement("insert into farmerregister values(?,?,?,?,?,?,?,?,?)");  
				 stmt.setString(1,fname); 
				 stmt.setString(2,lname); 
				 stmt.setString(3,pass);
				 stmt.setString(4,gender);
				 stmt.setString(5,email);
				 stmt.setString(6,phone);
				 stmt.setString(7,aadhar);
				 stmt.setString(8,location);
				 stmt.setString(9, locationtext);
				 int up=stmt.executeUpdate();
				 if(up>0)
				 {
					 //response.sendRedirect("http://localhost:8088/FarmerZone/Login.jsp");
					 request.setAttribute("Loginmessage", "Register Successfully as Farmer");
					 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Login.jsp");
					 dispatcher.forward(request, response);
				 }
			 }
			
			 
			con.close();
		}
		catch(Exception ec)
		{
			System.out.print(ec);
		}
	}

}
